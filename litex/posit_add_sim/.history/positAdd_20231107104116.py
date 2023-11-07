from migen import *

from litex.soc.integration.common import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.integration.soc import *

from litex.soc.cores.dma import WishboneDMAReader

class PositAdd(Module, AutoCSR): 

    def __init__(self):
        self.clock = ClockSignal()
        self.reset = ResetSignal()
        
        self._n1 = CSRStorage(32)
        self._n2 = CSRStorage(32)
        self._sub = CSRStorage(32)
    WishboneDMAReader
        self._isZero = CSRStatus(reset = 0)
        self._isNaR = CSRStatus(reset = 0)
        self.out = Signal(32)

        self.sync += [
            self._isZero.status.eq(self.out),
            self._isNaR.status.eq(self.out)
        ]

        self.specials += Instance("PositAdd" , 
                i_clock = self.clock,
                i_reset = self.reset,
                
                i_io_num1 = self._n1.storage,
                i_io_num2 = self._n2.storage,
                i_io_sub = self._sub.storage,
                
                o_io_isZero = self._isZero.status,
                o_io_isNaR = self._isNaR.status,
                o_io_out = self.out)

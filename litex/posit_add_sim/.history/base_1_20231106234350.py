import sys

from migen import *

from litex.soc.integration.common import *
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.integration.soc import *

from litex.tools import litex_sim

def extend_target(target):
    """
    :param: target: Refers to a target from litex_boards
    """
    def custom_target(customize_fn):
        target(customize_fn)

    return custom_target

@extend_target(litex_sim.main)
def MasterTarget(soc):
    from positAdd import PositAdd
    # bus = wishbone.Interface(data_width=soc.bus.data_width, adr_width=soc.bus.get_address_width(standard="wishbone"))
    soc.submodules.positAdd = PositAdd(bus)
    soc.bus.add_master("positAdd", master = bus)
    soc.platform.add_source_dir("./src/main/verilog/positAdd.v")


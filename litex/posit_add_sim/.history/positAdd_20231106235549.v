module PositAddCore(
  input         clock,
  input         reset,
  input         io_num1_sign, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input  [5:0]  io_num1_exponent, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input  [13:0] io_num1_fraction, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input         io_num1_isZero, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input         io_num1_isNaR, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input         io_num2_sign, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input  [5:0]  io_num2_exponent, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input  [13:0] io_num2_fraction, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input         io_num2_isZero, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input         io_num2_isNaR, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  input         io_sub, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  output [1:0]  io_trailingBits, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  output        io_stickyBit, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  output        io_out_sign, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  output [5:0]  io_out_exponent, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  output [13:0] io_out_fraction, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  output        io_out_isZero, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
  output        io_out_isNaR // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 8:14]
);
  wire  _num1magGt_T_2 = io_num1_fraction > io_num2_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 26:22]
  wire  _num1magGt_T_3 = $signed(io_num1_exponent) == $signed(io_num2_exponent) & _num1magGt_T_2; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 25:39]
  wire  num1magGt = $signed(io_num1_exponent) > $signed(io_num2_exponent) | _num1magGt_T_3; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 24:37]
  wire  num2AdjSign = io_num2_sign ^ io_sub; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 27:31]
  wire  largeSign = num1magGt ? io_num1_sign : num2AdjSign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 29:22]
  wire [5:0] largeExp = num1magGt ? $signed(io_num1_exponent) : $signed(io_num2_exponent); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 30:22]
  wire [13:0] _largeFrac_T = num1magGt ? io_num1_fraction : io_num2_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 32:12]
  wire [16:0] largeFrac = {_largeFrac_T,3'h0}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 32:8]
  wire  smallSign = num1magGt ? num2AdjSign : io_num1_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 34:22]
  wire [5:0] smallExp = num1magGt ? $signed(io_num2_exponent) : $signed(io_num1_exponent); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 35:22]
  wire [13:0] _smallFrac_T = num1magGt ? io_num2_fraction : io_num1_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 37:12]
  wire [16:0] smallFrac = {_smallFrac_T,3'h0}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 37:8]
  wire  _T_4 = ~reset; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 40:11]
  wire  _T_6 = ~num1magGt; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 42:8]
  wire [5:0] expDiff = $signed(largeExp) - $signed(smallExp); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 46:39]
  wire [16:0] _shiftedSmallFrac_T_1 = smallFrac >> expDiff; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 49:58]
  wire [16:0] shiftedSmallFrac = expDiff < 6'h11 ? _shiftedSmallFrac_T_1 : 17'h0; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 49:7]
  wire  _T_13 = expDiff == 6'h0; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 51:16]
  wire  _T_18 = expDiff == 6'h11; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 54:16]
  wire  isAddition = ~(largeSign ^ smallSign); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 62:20]
  wire  _T_23 = ~isAddition; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 64:8]
  wire [16:0] _signedSmallerFrac_T = ~shiftedSmallFrac; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 69:39]
  wire [16:0] _signedSmallerFrac_T_2 = _signedSmallerFrac_T + 17'h1; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 69:57]
  wire [16:0] signedSmallerFrac = isAddition ? shiftedSmallFrac : _signedSmallerFrac_T_2; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 69:8]
  wire [17:0] adderFrac = largeFrac + signedSmallerFrac; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 71:68]
  wire  sumOverflow = isAddition & adderFrac[17]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 73:32]
  wire  _T_30 = ~sumOverflow; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 76:12]
  wire  _adjAdderExp_T = isAddition & adderFrac[17]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 81:44]
  wire [5:0] _GEN_0 = {6{_adjAdderExp_T}}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 81:30]
  wire [5:0] adjAdderExp = $signed(largeExp) - $signed(_GEN_0); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 81:30]
  wire [16:0] adjAdderFrac = sumOverflow ? adderFrac[17:1] : adderFrac[16:0]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 86:8]
  wire  sumStickyBit = sumOverflow & adderFrac[0]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 95:34]
  wire [4:0] _normalizationFactor_T_17 = adjAdderFrac[1] ? 5'hf : 5'h10; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_18 = adjAdderFrac[2] ? 5'he : _normalizationFactor_T_17; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_19 = adjAdderFrac[3] ? 5'hd : _normalizationFactor_T_18; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_20 = adjAdderFrac[4] ? 5'hc : _normalizationFactor_T_19; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_21 = adjAdderFrac[5] ? 5'hb : _normalizationFactor_T_20; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_22 = adjAdderFrac[6] ? 5'ha : _normalizationFactor_T_21; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_23 = adjAdderFrac[7] ? 5'h9 : _normalizationFactor_T_22; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_24 = adjAdderFrac[8] ? 5'h8 : _normalizationFactor_T_23; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_25 = adjAdderFrac[9] ? 5'h7 : _normalizationFactor_T_24; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_26 = adjAdderFrac[10] ? 5'h6 : _normalizationFactor_T_25; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_27 = adjAdderFrac[11] ? 5'h5 : _normalizationFactor_T_26; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_28 = adjAdderFrac[12] ? 5'h4 : _normalizationFactor_T_27; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_29 = adjAdderFrac[13] ? 5'h3 : _normalizationFactor_T_28; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_30 = adjAdderFrac[14] ? 5'h2 : _normalizationFactor_T_29; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normalizationFactor_T_31 = adjAdderFrac[15] ? 5'h1 : _normalizationFactor_T_30; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] normalizationFactor = adjAdderFrac[16] ? 5'h0 : _normalizationFactor_T_31; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [4:0] _normExponent_T = adjAdderFrac[16] ? 5'h0 : _normalizationFactor_T_31; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 106:56]
  wire [5:0] _GEN_1 = {{1{_normExponent_T[4]}},_normExponent_T}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 106:34]
  wire [47:0] _GEN_3 = {{31'd0}, adjAdderFrac}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 110:35]
  wire [47:0] normFraction = _GEN_3 << normalizationFactor; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 110:35]
  wire  _GEN_14 = _T_23 & _T_4; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 65:11]
  assign io_trailingBits = normFraction[2:1]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 118:34]
  assign io_stickyBit = sumStickyBit | |normFraction[0]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 119:35]
  assign io_out_sign = num1magGt ? io_num1_sign : num2AdjSign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 29:22]
  assign io_out_exponent = $signed(adjAdderExp) - $signed(_GEN_1); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 106:34]
  assign io_out_fraction = normFraction[16:3]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 116:34]
  assign io_out_isZero = io_num1_isZero & io_num2_isZero | adderFrac == 18'h0; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 113:51]
  assign io_out_isNaR = io_num1_isNaR | io_num2_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 112:33]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (num1magGt & ~reset & ~(largeSign == io_num1_sign & smallSign == num2AdjSign)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at PositAdd.scala:40 assert((largeSign === num1.sign) & (smallSign === num2AdjSign))\n"
            ); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 40:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (num1magGt & ~reset & ~(largeSign == io_num1_sign & smallSign == num2AdjSign)) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 40:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & _T_4 & ~(largeSign == num2AdjSign & smallSign == io_num1_sign)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at PositAdd.scala:43 assert((largeSign === num2AdjSign) & (smallSign === num1.sign))\n"
            ); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 43:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_6 & _T_4 & ~(largeSign == num2AdjSign & smallSign == io_num1_sign)) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 43:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13 & _T_4 & ~(shiftedSmallFrac == smallFrac)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositAdd.scala:52 assert(shiftedSmallFrac === smallFrac)\n"); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 52:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_13 & _T_4 & ~(shiftedSmallFrac == smallFrac)) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 52:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_18 & _T_4 & ~(shiftedSmallFrac == 17'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositAdd.scala:55 assert(shiftedSmallFrac === 0.U)\n"); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 55:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_18 & _T_4 & ~(shiftedSmallFrac == 17'h0)) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 55:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_23 & _T_4 & ~(io_sub ^ io_num1_sign ^ io_num2_sign)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositAdd.scala:65 assert(io.sub ^ num1.sign ^ num2.sign)\n"); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 65:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_23 & _T_4 & ~(io_sub ^ io_num1_sign ^ io_num2_sign)) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 65:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_14 & ~(~sumOverflow)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositAdd.scala:76 assert(!sumOverflow)\n"); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 76:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_14 & ~(~sumOverflow)) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 76:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (sumOverflow & _T_4 & ~(adjAdderFrac == adderFrac[17:1])) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at PositAdd.scala:90 assert(adjAdderFrac === (adderFrac >> 1))  //\n"); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 90:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (sumOverflow & _T_4 & ~(adjAdderFrac == adderFrac[17:1])) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 90:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_30 & _T_4 & ~(~sumStickyBit)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositAdd.scala:98 assert(!sumStickyBit)\n"); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 98:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_30 & _T_4 & ~(~sumStickyBit)) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 98:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module PositExtractor(
  input         clock,
  input         reset,
  input  [15:0] io_in, // @[src/main/scala/PositExtractor.scala 7:14]
  output        io_out_sign, // @[src/main/scala/PositExtractor.scala 7:14]
  output [5:0]  io_out_exponent, // @[src/main/scala/PositExtractor.scala 7:14]
  output [13:0] io_out_fraction, // @[src/main/scala/PositExtractor.scala 7:14]
  output        io_out_isZero, // @[src/main/scala/PositExtractor.scala 7:14]
  output        io_out_isNaR // @[src/main/scala/PositExtractor.scala 7:14]
);
  wire  sign = io_in[15]; // @[src/main/scala/PositExtractor.scala 12:21]
  wire [15:0] _absIn_T = ~io_in; // @[src/main/scala/PositExtractor.scala 14:27]
  wire [15:0] _absIn_T_2 = _absIn_T + 16'h1; // @[src/main/scala/PositExtractor.scala 14:42]
  wire [15:0] absIn = sign ? _absIn_T_2 : io_in; // @[src/main/scala/PositExtractor.scala 14:19]
  wire  negExp = ~absIn[14]; // @[src/main/scala/PositExtractor.scala 15:16]
  wire [14:0] regExpFrac = absIn[14:0]; // @[src/main/scala/PositExtractor.scala 17:26]
  wire [14:0] _zerosRegime_T_1 = ~regExpFrac; // @[src/main/scala/PositExtractor.scala 18:52]
  wire [14:0] zerosRegime = negExp ? regExpFrac : _zerosRegime_T_1; // @[src/main/scala/PositExtractor.scala 18:24]
  wire  _regimeCount_T_1 = ~(|zerosRegime); // @[src/main/scala/common.scala 61:33]
  wire [3:0] _regimeCount_T_17 = zerosRegime[1] ? 4'hd : 4'he; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_18 = zerosRegime[2] ? 4'hc : _regimeCount_T_17; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_19 = zerosRegime[3] ? 4'hb : _regimeCount_T_18; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_20 = zerosRegime[4] ? 4'ha : _regimeCount_T_19; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_21 = zerosRegime[5] ? 4'h9 : _regimeCount_T_20; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_22 = zerosRegime[6] ? 4'h8 : _regimeCount_T_21; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_23 = zerosRegime[7] ? 4'h7 : _regimeCount_T_22; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_24 = zerosRegime[8] ? 4'h6 : _regimeCount_T_23; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_25 = zerosRegime[9] ? 4'h5 : _regimeCount_T_24; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_26 = zerosRegime[10] ? 4'h4 : _regimeCount_T_25; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_27 = zerosRegime[11] ? 4'h3 : _regimeCount_T_26; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_28 = zerosRegime[12] ? 4'h2 : _regimeCount_T_27; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_29 = zerosRegime[13] ? 4'h1 : _regimeCount_T_28; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_30 = zerosRegime[14] ? 4'h0 : _regimeCount_T_29; // @[src/main/scala/chisel3/util/Mux.scala 50:70]
  wire [3:0] _regimeCount_T_31 = _regimeCount_T_1 ? 4'hf : _regimeCount_T_30; // @[src/main/scala/PositExtractor.scala 22:10]
  wire [4:0] regimeCount = {1'h0,_regimeCount_T_31}; // @[src/main/scala/PositExtractor.scala 21:8]
  wire [4:0] _T_1 = 5'h10 - 5'h1; // @[src/main/scala/PositExtractor.scala 25:40]
  wire  _T_6 = ~reset; // @[src/main/scala/PositExtractor.scala 25:9]
  wire [4:0] _regime_T_1 = ~regimeCount; // @[src/main/scala/PositExtractor.scala 27:36]
  wire [4:0] _regime_T_3 = _regime_T_1 + 5'h1; // @[src/main/scala/PositExtractor.scala 27:57]
  wire [4:0] _regime_T_5 = regimeCount - 5'h1; // @[src/main/scala/PositExtractor.scala 27:76]
  wire [4:0] regime = negExp ? _regime_T_3 : _regime_T_5; // @[src/main/scala/PositExtractor.scala 27:19]
  wire [4:0] _regime_range_T_1 = 5'h10 - 5'h2; // @[src/main/scala/PositExtractor.scala 31:39]
  wire [32:0] regime_range = 33'h2 << _regime_range_T_1; // @[src/main/scala/PositExtractor.scala 31:27]
  wire [32:0] _GEN_0 = {{28'd0}, regime}; // @[src/main/scala/PositExtractor.scala 32:17]
  wire [4:0] _expFrac_T_1 = regimeCount + 5'h2; // @[src/main/scala/PositExtractor.scala 35:39]
  wire [46:0] _GEN_1 = {{31'd0}, absIn}; // @[src/main/scala/PositExtractor.scala 35:23]
  wire [46:0] expFrac = _GEN_1 << _expFrac_T_1; // @[src/main/scala/PositExtractor.scala 35:23]
  wire [12:0] frac = expFrac[15:3]; // @[src/main/scala/PositExtractor.scala 45:21]
  wire [5:0] _T_23 = {{1'd0}, regimeCount}; // @[src/main/scala/PositExtractor.scala 48:14]
  wire  _T_27 = _T_23[4:0] == _T_1; // @[src/main/scala/PositExtractor.scala 48:29]
  wire [4:0] _io_out_exponent_T = negExp ? _regime_T_3 : _regime_T_5; // @[src/main/scala/PositExtractor.scala 70:5]
  assign io_out_sign = io_in[15]; // @[src/main/scala/PositExtractor.scala 12:21]
  assign io_out_exponent = {{1{_io_out_exponent_T[4]}},_io_out_exponent_T}; // @[src/main/scala/PositExtractor.scala 67:19]
  assign io_out_fraction = {1'h1,frac}; // @[src/main/scala/PositExtractor.scala 72:25]
  assign io_out_isZero = ~(|io_in); // @[src/main/scala/common.scala 61:33]
  assign io_out_isNaR = sign & ~(|io_in[14:0]); // @[src/main/scala/common.scala 27:51]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(regimeCount <= _T_1 & regimeCount >= 5'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at PositExtractor.scala:25 assert((regimeCount <= (nbits.asUInt - 1.U))  & (regimeCount >= 1.U))\n"
            ); // @[src/main/scala/PositExtractor.scala 25:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(regimeCount <= _T_1 & regimeCount >= 5'h1)) begin
          $fatal; // @[src/main/scala/PositExtractor.scala 25:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_6 & ~(_GEN_0 < regime_range)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositExtractor.scala:32 assert(regime < regime_range)\n"); // @[src/main/scala/PositExtractor.scala 32:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_6 & ~(_GEN_0 < regime_range)) begin
          $fatal; // @[src/main/scala/PositExtractor.scala 32:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_27 & _T_6 & ~(frac == 13'h0)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositExtractor.scala:49 assert(frac === 0.U)\n"); // @[src/main/scala/PositExtractor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_27 & _T_6 & ~(frac == 13'h0)) begin
          $fatal; // @[src/main/scala/PositExtractor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_out_isNaR & _T_6 & ~(~io_out_isZero)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositExtractor.scala:56 assert(!io.out.isZero)\n"); // @[src/main/scala/PositExtractor.scala 56:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_out_isNaR & _T_6 & ~(~io_out_isZero)) begin
          $fatal; // @[src/main/scala/PositExtractor.scala 56:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_out_isZero & _T_6 & ~(~io_out_isNaR)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositExtractor.scala:59 assert(!io.out.isNaR)\n"); // @[src/main/scala/PositExtractor.scala 59:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_out_isZero & _T_6 & ~(~io_out_isNaR)) begin
          $fatal; // @[src/main/scala/PositExtractor.scala 59:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module PositGenerator(
  input         clock,
  input         reset,
  input         io_in_sign, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 8:14]
  input  [5:0]  io_in_exponent, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 8:14]
  input  [13:0] io_in_fraction, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 8:14]
  input         io_in_isZero, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 8:14]
  input         io_in_isNaR, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 8:14]
  input  [1:0]  io_trailingBits, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 8:14]
  input         io_stickyBit, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 8:14]
  output [15:0] io_out // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 8:14]
);
  wire [12:0] fraction = io_in_fraction[12:0]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 15:32]
  wire  negExp = $signed(io_in_exponent) < 6'sh0; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 16:31]
  wire [5:0] _regime_T_2 = 6'h0 - io_in_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 18:17]
  wire [5:0] regime = negExp ? _regime_T_2 : io_in_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 18:8]
  wire  _offset_T_1 = negExp & regime != 6'hf; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 21:22]
  wire [5:0] _GEN_0 = {{5'd0}, _offset_T_1}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 21:12]
  wire [5:0] offset = regime - _GEN_0; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 21:12]
  wire [1:0] _expFrac_T = negExp ? 2'h1 : 2'h2; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 29:14]
  wire [16:0] expFrac = {_expFrac_T,fraction,io_trailingBits}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 29:71]
  wire [16:0] uT_uS_posit = $signed(expFrac) >>> offset; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 32:40]
  wire [14:0] uR_uS_posit = uT_uS_posit[16:2]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 33:32]
  wire [63:0] _stickyBitMask_T = 64'h1 << offset; // @[src/main/scala/chisel3/util/OneHot.scala 58:35]
  wire [63:0] _stickyBitMask_T_2 = _stickyBitMask_T - 64'h1; // @[src/main/scala/common.scala 23:44]
  wire [13:0] stickyBitMask = _stickyBitMask_T_2[13:0]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 35:43]
  wire [1:0] gr = uT_uS_posit[1:0]; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 37:16]
  wire [16:0] _stickyBit_T = {_expFrac_T,fraction,io_trailingBits}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 39:29]
  wire [16:0] _GEN_1 = {{3'd0}, stickyBitMask}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 39:36]
  wire [16:0] _stickyBit_T_1 = _stickyBit_T & _GEN_1; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 39:36]
  wire  stickyBit = io_stickyBit | |_stickyBit_T_1; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 39:18]
  wire  _roundingBit_T_12 = gr[1] & ~(~uR_uS_posit[0] & gr[1] & ~gr[0] & ~stickyBit); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 45:13]
  wire  roundingBit = &uR_uS_posit ? 1'h0 : _roundingBit_T_12; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 44:8]
  wire [14:0] _GEN_2 = {{14'd0}, roundingBit}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 46:32]
  wire [14:0] R_uS_posit = uR_uS_posit + _GEN_2; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 46:32]
  wire  _uFC_R_uS_posit_T_1 = ~(|R_uS_posit); // @[src/main/scala/common.scala 61:33]
  wire [14:0] _GEN_3 = {{14'd0}, _uFC_R_uS_posit_T_1}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 50:30]
  wire [14:0] _uFC_R_uS_posit_T_2 = R_uS_posit | _GEN_3; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 50:30]
  wire [15:0] uFC_R_uS_posit = {1'h0,_uFC_R_uS_posit_T_2}; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 50:8]
  wire [15:0] _R_S_posit_T = ~uFC_R_uS_posit; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 53:21]
  wire [15:0] _R_S_posit_T_2 = _R_S_posit_T + 16'h1; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 53:37]
  wire [15:0] R_S_posit = io_in_sign ? _R_S_posit_T_2 : uFC_R_uS_posit; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 53:8]
  wire [15:0] _io_out_T_3 = io_in_fraction == 14'h0 | io_in_isZero ? 16'h0 : R_S_posit; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 56:8]
  assign io_out = io_in_isNaR ? 16'h8000 : _io_out_T_3; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 55:16]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(offset <= regime)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PositGenerator.scala:22 assert(offset <= regime)\n"); // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 22:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(offset <= regime)) begin
          $fatal; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositGenerator.scala 22:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module PositAdd(
  input         clock,
  input         reset,
  input  [15:0] io_num1, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 128:14]
  input  [15:0] io_num2, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 128:14]
  input         io_sub, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 128:14]
  output        io_isZero, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 128:14]
  output        io_isNaR, // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 128:14]
  output [15:0] io_out // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 128:14]
);
  wire  positAddCore_clock; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_reset; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_num1_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire [5:0] positAddCore_io_num1_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire [13:0] positAddCore_io_num1_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_num1_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_num1_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_num2_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire [5:0] positAddCore_io_num2_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire [13:0] positAddCore_io_num2_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_num2_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_num2_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_sub; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire [1:0] positAddCore_io_trailingBits; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_stickyBit; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_out_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire [5:0] positAddCore_io_out_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire [13:0] positAddCore_io_out_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_out_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  positAddCore_io_out_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
  wire  num1Extractor_clock; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
  wire  num1Extractor_reset; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
  wire [15:0] num1Extractor_io_in; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
  wire  num1Extractor_io_out_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
  wire [5:0] num1Extractor_io_out_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
  wire [13:0] num1Extractor_io_out_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
  wire  num1Extractor_io_out_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
  wire  num1Extractor_io_out_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
  wire  num2Extractor_clock; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
  wire  num2Extractor_reset; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
  wire [15:0] num2Extractor_io_in; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
  wire  num2Extractor_io_out_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
  wire [5:0] num2Extractor_io_out_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
  wire [13:0] num2Extractor_io_out_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
  wire  num2Extractor_io_out_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
  wire  num2Extractor_io_out_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
  wire  positGenerator_clock; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire  positGenerator_reset; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire  positGenerator_io_in_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire [5:0] positGenerator_io_in_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire [13:0] positGenerator_io_in_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire  positGenerator_io_in_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire  positGenerator_io_in_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire [1:0] positGenerator_io_trailingBits; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire  positGenerator_io_stickyBit; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire [15:0] positGenerator_io_out; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
  wire  _io_isZero_T_1 = ~(|positGenerator_io_out); // @[src/main/scala/common.scala 61:33]
  wire  _io_isNaR_T_4 = positGenerator_io_out[15] & ~(|positGenerator_io_out[14:0]); // @[src/main/scala/common.scala 27:51]
  PositAddCore positAddCore ( // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 138:28]
    .clock(positAddCore_clock),
    .reset(positAddCore_reset),
    .io_num1_sign(positAddCore_io_num1_sign),
    .io_num1_exponent(positAddCore_io_num1_exponent),
    .io_num1_fraction(positAddCore_io_num1_fraction),
    .io_num1_isZero(positAddCore_io_num1_isZero),
    .io_num1_isNaR(positAddCore_io_num1_isNaR),
    .io_num2_sign(positAddCore_io_num2_sign),
    .io_num2_exponent(positAddCore_io_num2_exponent),
    .io_num2_fraction(positAddCore_io_num2_fraction),
    .io_num2_isZero(positAddCore_io_num2_isZero),
    .io_num2_isNaR(positAddCore_io_num2_isNaR),
    .io_sub(positAddCore_io_sub),
    .io_trailingBits(positAddCore_io_trailingBits),
    .io_stickyBit(positAddCore_io_stickyBit),
    .io_out_sign(positAddCore_io_out_sign),
    .io_out_exponent(positAddCore_io_out_exponent),
    .io_out_fraction(positAddCore_io_out_fraction),
    .io_out_isZero(positAddCore_io_out_isZero),
    .io_out_isNaR(positAddCore_io_out_isNaR)
  );
  PositExtractor num1Extractor ( // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 140:29]
    .clock(num1Extractor_clock),
    .reset(num1Extractor_reset),
    .io_in(num1Extractor_io_in),
    .io_out_sign(num1Extractor_io_out_sign),
    .io_out_exponent(num1Extractor_io_out_exponent),
    .io_out_fraction(num1Extractor_io_out_fraction),
    .io_out_isZero(num1Extractor_io_out_isZero),
    .io_out_isNaR(num1Extractor_io_out_isNaR)
  );
  PositExtractor num2Extractor ( // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 141:29]
    .clock(num2Extractor_clock),
    .reset(num2Extractor_reset),
    .io_in(num2Extractor_io_in),
    .io_out_sign(num2Extractor_io_out_sign),
    .io_out_exponent(num2Extractor_io_out_exponent),
    .io_out_fraction(num2Extractor_io_out_fraction),
    .io_out_isZero(num2Extractor_io_out_isZero),
    .io_out_isNaR(num2Extractor_io_out_isNaR)
  );
  PositGenerator positGenerator ( // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 149:38]
    .clock(positGenerator_clock),
    .reset(positGenerator_reset),
    .io_in_sign(positGenerator_io_in_sign),
    .io_in_exponent(positGenerator_io_in_exponent),
    .io_in_fraction(positGenerator_io_in_fraction),
    .io_in_isZero(positGenerator_io_in_isZero),
    .io_in_isNaR(positGenerator_io_in_isNaR),
    .io_trailingBits(positGenerator_io_trailingBits),
    .io_stickyBit(positGenerator_io_stickyBit),
    .io_out(positGenerator_io_out)
  );
  assign io_isZero = positAddCore_io_out_isZero | _io_isZero_T_1; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 154:43]
  assign io_isNaR = positAddCore_io_out_isNaR | _io_isNaR_T_4; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 155:43]
  assign io_out = positGenerator_io_out; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 156:13]
  assign positAddCore_clock = clock;
  assign positAddCore_reset = reset;
  assign positAddCore_io_num1_sign = num1Extractor_io_out_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 145:24]
  assign positAddCore_io_num1_exponent = num1Extractor_io_out_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 145:24]
  assign positAddCore_io_num1_fraction = num1Extractor_io_out_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 145:24]
  assign positAddCore_io_num1_isZero = num1Extractor_io_out_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 145:24]
  assign positAddCore_io_num1_isNaR = num1Extractor_io_out_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 145:24]
  assign positAddCore_io_num2_sign = num2Extractor_io_out_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 146:24]
  assign positAddCore_io_num2_exponent = num2Extractor_io_out_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 146:24]
  assign positAddCore_io_num2_fraction = num2Extractor_io_out_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 146:24]
  assign positAddCore_io_num2_isZero = num2Extractor_io_out_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 146:24]
  assign positAddCore_io_num2_isNaR = num2Extractor_io_out_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 146:24]
  assign positAddCore_io_sub = io_sub; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 147:24]
  assign num1Extractor_clock = clock;
  assign num1Extractor_reset = reset;
  assign num1Extractor_io_in = io_num1; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 142:23]
  assign num2Extractor_clock = clock;
  assign num2Extractor_reset = reset;
  assign num2Extractor_io_in = io_num2; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 143:23]
  assign positGenerator_clock = clock;
  assign positGenerator_reset = reset;
  assign positGenerator_io_in_sign = positAddCore_io_out_sign; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 150:34]
  assign positGenerator_io_in_exponent = positAddCore_io_out_exponent; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 150:34]
  assign positGenerator_io_in_fraction = positAddCore_io_out_fraction; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 150:34]
  assign positGenerator_io_in_isZero = positAddCore_io_out_isZero; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 150:34]
  assign positGenerator_io_in_isNaR = positAddCore_io_out_isNaR; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 150:34]
  assign positGenerator_io_trailingBits = positAddCore_io_trailingBits; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 151:34]
  assign positGenerator_io_stickyBit = positAddCore_io_stickyBit; // @[Users/swethaaa/Documents/e4r/formal_verification/posit/hardposit-chisel3/src/main/scala/PositAdd.scala 152:34]
endmodule

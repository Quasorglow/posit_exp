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

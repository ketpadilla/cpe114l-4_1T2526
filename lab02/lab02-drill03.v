//copied from lab01-drill.v

//behavioural Verilog code for a simple 1-bit full subtracter.
module full_subtract(diff, borrowOut, a, b, borrowIn);
  output diff;
  output borrowOut;
  input a, b, borrowIn;
  assign {borrowOut, diff} = a - b - borrowIn;
  //result of subtraction is two bits; the MSB is borrowOut and the LSB
  //is diff.
endmodule
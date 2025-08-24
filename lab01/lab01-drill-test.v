module testingFS();
  reg a, b,borrowIn;
  wire diff, borrowOut;
  full_subtract fs(diff, borrowOut, a, b, borrowIn);
  initial begin
    $display(" a b borrowIn difference borrowOut time");
    $monitor(" %b %b %b %b %b %b ", a, b, borrowIn, diff, borrowOut, $time);
    $dumpfile("dump.vcd"); $dumpvars;
    a=1'b1; b=1'b1; borrowIn=1'b0;
    #10 a=1'b1;
    #10 a=1'b0; b=1'b1;
    #10 a=1'b1; b=1'b0;
    #10 borrowIn=1'b1;
    #10 $finish;
  end
endmodule
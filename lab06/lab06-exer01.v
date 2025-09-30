module shift_regis (
  input clk,
  input reset,
  input load,
  input shift,
  input [3:0] in,
  output reg [3:0] out 
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      out <= 4'b0000;
    else if (load && !shift)
      out <= in;
    else if (shift)
      out <= {out[2:0], 1'b0};
    else
      out = out;
  end
endmodule

module testShift;
  reg clk, reset, load, shift;
  reg [3:0] in;
  wire [3:0] out;

  shift_regis uut(.clk(clk), .reset(reset), .load(load), .shift(shift), .in(in), .out(out));

  always #5 clk = ~clk;

  initial begin
    $dumpfile("./out/lab06-exer01.vcd");
    $dumpvars(0, testShift);

    $display("time clk reset load shift in out");
    $monitor("%4t    %b %b %b %b %b    %b", $time, clk, reset, load, shift, in, out);

    clk = 0;
    reset = 1;
    load = 0;
    shift = 0;
    in = 4'b0000;

    #10 reset = 0;

    in = 4'b1011;
    load = 1;
    shift = 0;
    #10 load = 0;

    shift = 1;
    #30 shift = 0;

    #10;
    $finish;
  end
endmodule
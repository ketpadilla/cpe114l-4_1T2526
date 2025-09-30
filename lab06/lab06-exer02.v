module mod16Countdown (
  input clk,
  input reset,
  output reg [3:0] count,
  output reg [6:0] seg_units,
  output reg [6:0] seg_tens
);

  always @(posedge clk or posedge reset) begin
    if (reset)
      count <= 4'b1111;
    else if (count == 4'b0000)
      count <= 4'b1111;
    else 
      count <= count - 1;
  end

  wire [3:0] ones;
  wire [3:0] tens;
  assign tens = count / 10;
  assign ones = count % 10;

  function [6:0] segDecode;
    input [3:0] num;
    begin
      case (num)
        4'd0: segDecode = 7'b1111110;
        4'd1: segDecode = 7'b0110000;
        4'd2: segDecode = 7'b1101101;
        4'd3: segDecode = 7'b1111001;
        4'd4: segDecode = 7'b0110011;
        4'd5: segDecode = 7'b1011011;
        4'd6: segDecode = 7'b1011111;
        4'd7: segDecode = 7'b1110000;
        4'd8: segDecode = 7'b1111111;
        4'd9: segDecode = 7'b1111011;
        default: segDecode = 7'b0000000;
      endcase
    end
  endfunction

  always @(*) begin
    seg_units = segDecode(ones);
    seg_tens = segDecode(tens);
  end
endmodule

module testModCount;
  reg clk, reset;
  wire [3:0] count, tens, ones;
  wire [6:0] seg_units, seg_tens;

  mod16Countdown uut (.clk(clk), .reset(reset), .count(count), .seg_units(seg_units), .seg_tens(seg_tens));

  assign tens = count / 10;
  assign ones = count % 10;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("./out/lab06-exer02.vcd");
    $dumpvars(0, testModCount);

    $display("time clk reset count tens ones ");
    $monitor("%4t    %b %b %b %b %b", $time, clk, reset, count, tens, ones);

    reset = 1;
    #10 reset = 0;

    #100 reset = 1;
    #20 reset = 0;

    #50 reset = 1;
    #10 $finish;
  end
endmodule
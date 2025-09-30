/*
  Construct a JK flip-flop from a D flip-flop and gates, and use the circuit to design the Verilog program. Use behavioural model for the D flip-flop and dataflow model for the JK flip-flop. Save the file as drill6_3.vl
*/

module JK_flipflop(output A, input J, K, clk, reset);
  wire AofJK;

  assign AofJK=(J&~A)|(~K&A);
  D_flipflop JKf(A,AofJK,clk, reset);
endmodule

module D_flipflop(output reg B, input D, clk, reset);
  always@(posedge clk, negedge reset)

  begin
    if(~reset)
    B<=1'b0;
    else
    B<=D;
  end
endmodule

module TestFlipFlop;
  reg J, K, clk, reset;
  wire Q;

  always #1 clk=~clk;
  JK_flipflop JKF(Q,J,K,clk,reset);

  initial clk=0;
  initial reset=0;
  initial J=0;
  initial K=0;
  initial $monitor("clk=%b reset=%b, J=%b, K=%b, Q=%b",clk,reset,J,K,Q);
  
  initial begin
    $dumpfile("./out/lab05-drill03.vcd");
    $dumpvars(0, TestFlipFlop);
  end

  initial fork
    #28 $finish;
    #2 reset=1;
    #4 J=1;
    #8 K=1;
    #12 J=0;
    #16 K=0;
    #20 J=1;
    #24 J=0;
  join
endmodule
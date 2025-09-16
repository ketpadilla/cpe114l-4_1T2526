/*
  Design a 4-bit Adder/Subtractor like the figure seen below. You are to design the adders using user-defined primitives while the rest of the components are using structural modeling. The S input switches between the adder and subtractor; if S = 1, then the circuit is a subtractor else it will function as an adder

  Use the following values for the test bench:

  S	A3	A2	A1	A0	B3	B2	B1	B0
  0	0	1	0	1	0	1	0	1
  0	0	0	1	1	1	0	0	0
  0	1	1	1	0	0	1	1	0
  0	1	0	0	0	1	0	1	1
  1	0	1	0	1	0	1	0	1
  1	0	0	1	1	1	0	0	0
  1	1	1	1	0	0	1	1	0
  1	1	0	0	0	1	0	1	1
*/

primitive sum(SUM, A, B, CIN);
  output SUM;
  input A, B, CIN;

  table
    //A B CIN; SUM
    0 0 0 : 0;
    0 0 1 : 1;
    0 1 0 : 1;
    0 1 1 : 0;
    1 0 0 : 1;
    1 0 1 : 0;
    1 1 0 : 0;
    1 1 1 : 1;

    x ? ? : x;
    ? x ? : x;
    ? ? x : x;
  endtable
endprimitive

primitive cout(COUT, A, B, CIN);
  output COUT;
  input A, B, CIN;

  table
    //A B CIN; COUT
    0 0 0 : 0;
    0 0 1 : 0;
    0 1 0 : 0;
    0 1 1 : 1;
    1 0 0 : 0;
    1 0 1 : 1;
    1 1 0 : 1;
    1 1 1 : 1;

    x ? ? : x;
    ? x ? : x;
    ? ? x : x;
  endtable
endprimitive 


module circuit(
  output [3:0] Y,
  output COUT,
  input [3:0] A,
  input [3:0] B,
  input S
);

  // second number
  wire b0, b1, b2, b3;
  xor (b0, B[0], S);
  xor (b1, B[1], S);
  xor (b2, B[2], S);
  xor (b3, B[3], S);

  // carry
  wire c1, c2, c3;

  // bit 0
  sum sum0(Y[0], A[0], b0, S);
  cout cout0(c1, A[0], b0, S);

  // bit 1
  sum sum1(Y[1], A[1], b1, c1);
  cout cout1(c2, A[1], b1, c1);

  // bit 2
  sum sum2(Y[2], A[2], b2, c2);
  cout cout2(c3, A[2], b2, c2);

  // bit 3
  sum sum3(Y[3], A[3], b3, c3);
  cout cout3(COUT, A[3], b3, c3);

endmodule

module circuitTEST;
  reg S;
  reg [3:0] A, B;
  wire [3:0] Y;
  wire COUT;

  circuit dut(.Y(Y), .COUT(COUT), .A(A), .B(B), .S(S));

  task apply(input s, input [3:0] a, input [3:0] b);
    begin
      S=s; A=a; B=b; #10;
      $display("t%0t S=%b A=%b B=%b | Y=%b COUT=%b", $time, S, A, B, Y, COUT);
    end
  endtask

  initial begin
    $dumpfile("./out/wave.vcd");
    $dumpvars(0, circuitTEST);

    $display("t   S   A[3:0] B[3:0] | Y[3:0] COUT");
    apply(0, 4'b0101, 4'b0101);
    apply(0, 4'b0011, 4'b1000);
    apply(0, 4'b1110, 4'b0110);
    apply(0, 4'b1000, 4'b1011);

    apply(1, 4'b0101, 4'b0101);
    apply(1, 4'b0011, 4'b1000);
    apply(1, 4'b1110, 4'b0110);
    apply(1, 4'b1000, 4'b1011);

    #10 $finish;
  end
endmodule
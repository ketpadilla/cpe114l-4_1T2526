// Write the Verilog code for the circuit found in the image below. Create a test bench for it to determine the outputs of the circuit. Run and simulate the program. Use Y[0:7] to store the values of the output.

module circuit(Y, E, A);
  output [0:7] Y;
  input E;
  input [0:2] A;
  wire [0:2] notA;

  not NOT1(notA[0], A[0]);
  not NOT2(notA[1], A[1]);
  not NOT3(notA[2], A[2]);

  assign Y[0] = E & notA[0] & notA[1] & notA[2];
  assign Y[1] = E & notA[0] & notA[1] & A[2];
  assign Y[2] = E & notA[0] & A[1] & notA[2];
  assign Y[3] = E & notA[0] & A[1] & A[2];
  assign Y[4] = E & A[0] & notA[1] & notA[2];
  assign Y[5] = E & A[0] & notA[1] & A[2];
  assign Y[6] = E & A[0] & A[1] & notA[2];
  assign Y[7] = E & A[0] & A[1] & A[2];
endmodule;

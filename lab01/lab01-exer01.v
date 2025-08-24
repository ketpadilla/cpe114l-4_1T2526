// Write the Verilog code for the circuit found in the image below. Create a test bench for it to determine the outputs of the circuit. Run and simulate the program.

module circuit(Y, A, B, C, D);
  output Y;
  input A, B, C, D;
  wire wireA, wireAB, wireC, wireBC, wireCD, wireABC, wireABCD1, wireABCD2;

  not NOT1(wireA, A);
  nor NOR1(wireAB, wireA, B);
  not NOT2(wireC, C);
  and AND1(wireBC, B, wireC);
  or OR1(wireCD, C, D);

  or OR2(wireABC, wireAB, wireBC);
  and AND2(wireABCD1, wireAB, wireCD);
  not NOT3(wireABCD2, wireABCD1);

  or OR3(Y, wireABC, wireABCD2);
endmodule

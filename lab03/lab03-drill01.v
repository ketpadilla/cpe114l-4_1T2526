//Verilog model of circuit of Fig 2.1
module circuit2_1(V, W, X, Y, Z, out1);
  output out1;
  input V, W, X, Y, Z;
  wire Vnot, Wnot, Xnot, Ynot, Znot, or1, or2, or3;
  
  not U1(Vnot, V), U2(Wnot, W), U3(Xnot, X);
  not U4(Ynot, Y), U5(Znot, Z);
  and U7(or1, Vnot, Wnot, Znot), U8(or2, W, Ynot, Z);
  and U9(or3, V, X, Z);
  or U6(out1, or1, or2, or3);
endmodule
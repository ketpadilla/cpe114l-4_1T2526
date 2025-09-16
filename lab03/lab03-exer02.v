module circuit(Y, EN, S, D); 
  output Y;
  input EN;
  input [2:0] S;
  input [7:0] D;

  wire [7:0] wireAND;
  wire [2:0] notS;
  wire notEN;


  not NOT0(notS[0], S[0]);
  not NOT1(notS[1], S[1]);
  not NOT2(notS[2], S[2]);

  not NOT3(notEN, EN);

  and AND0(wireAND[0], D[0], notS[2], notS[1], notS[0], notEN);
  and AND1(wireAND[1], D[1], notS[2], notS[1], S[0], notEN);
  and AND2(wireAND[2], D[2], notS[2], S[1], notS[0], notEN);
  and AND3(wireAND[3], D[3], notS[2], S[1], S[0], notEN);
  and AND4(wireAND[4], D[4], S[2], notS[1], notS[0], notEN);
  and AND5(wireAND[5], D[5], S[2], notS[1], S[0], notEN);
  and AND6(wireAND[6], D[6], S[2], S[1], notS[0], notEN);
  and AND7(wireAND[7], D[7], S[2], S[1], S[0], notEN);

  or OR0(Y, wireAND[0], wireAND[1], wireAND[2], wireAND[3], wireAND[4], wireAND[5], wireAND[6], wireAND[7]);
endmodule

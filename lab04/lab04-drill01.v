/*

  A. Create a UDP description of a 3-bit majority circuit.
  We can consider that the output of this circuit is 1 if the input vector has two
  or more 1’s. The program below shows a synthesis of a majority circuit with the
  corresponding test bench. Note that the declaration input A, B, C matters because
  this is how Verilog will determine which input belongs to which column. Copy the
  code then simulate.

*/

primitive Majority3 ( Z, A, B, C ) ;
  input A, B, C ;
  output Z ;

    table
    // A B C Z
    0 0 ? : 0 ;
    0 ? 0 : 0 ;
    ? 0 0 : 0 ;
    1 1 ? : 1 ;
    1 ? 1 : 1 ;
    ? 1 1 : 1 ;
    endtable
endprimitive

module testprimitive1;
  reg A, B, C;
  wire X;
  Majority3 (X,A,B,C);

  initial begin
    A=1'b0;B=1'b0;C=1'b0;
    $display(" A B C X");
    $monitor(" %b %b %b %b",A,B,C,X);
    #2 A=1'b0; B=1'b0; C=1'b0;
    #2 A=1'b0; B=1'b0; C=1'b1;
    #2 A=1'b0; B=1'b1; C=1'b0;
    #2 A=1'b0; B=1'b1; C=1'b1;
    #2 A=1'b1; B=1'b0; C=1'b0;
    #2 A=1'b1; B=1'b0; C=1'b1;
    #2 A=1'b1; B=1'b1; C=1'b0;
    #2 A=1'b1; B=1'b1; C=1'b1;
    #2 $finish;
  end
endmodule
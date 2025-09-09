module test2_2;
  reg [3:0]A;
  reg [1:0]sel;
  wire Out2;

  initial begin
    $display(" TIME A select Output");
    $monitor($time,,,,,,,"%h %d %b",A, sel, Out2);
    #50 A=4'hE; sel=2'b00;
    #50 A=4'hA; sel=2'b11;
    #50 A=4'hC; sel=2'b10;
    #50 A=4'hB; sel=2'b01;
    #50 A=4'h0; sel=2'b01;
    #50 $finish;
  end
  
  circuit2_2 t2_2(A, sel, Out2);
endmodule
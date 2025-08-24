module circuitTEST();
  reg E;
  reg [2:0] A;
  wire [7:0] Y;

  circuit fs(Y, E, A);
  initial begin
    $display(" E A[0:2] | Y | time");
    $monitor(" %b %b | %b | %b ", E, A, Y, $time);
    $dumpfile("./out/lab01-exer02.vcd"); $dumpvars;
    E=1'b0; A=3'b000;
    #10 E=1'b1; A=3'b000;
    #10 E=1'b1; A=3'b001;
    #10 E=1'b1; A=3'b010;
    #10 E=1'b1; A=3'b011;
    #10 E=1'b1; A=3'b100;
    #10 E=1'b1; A=3'b101;
    #10 E=1'b1; A=3'b110;
    #10 E=1'b1; A=3'b111;
    #10 $finish;
  end
endmodule
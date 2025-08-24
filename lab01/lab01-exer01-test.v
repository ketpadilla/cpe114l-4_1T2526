module circuitTEST();
  reg A, B, C, D;
  wire out;
  circuit fs(out, A, B, C, D);
  initial begin
    $display("A B C D | out |");
    $monitor(" %b %b %b %b | %b | %b ", A, B, C, D, out, $time);
    $dumpfile("./out/lab01-exer01.vcd"); $dumpvars;
    A=1'b0; B=1'b0; C=1'b0; D=1'b0;
    #10 A=1'b0; B=1'b0; C=1'b0; D=1'b1;
    #10 A=1'b0; B=1'b0; C=1'b0; D=1'b0;
    #10 A=1'b0; B=1'b0; C=1'b1; D=1'b1;
    #10 A=1'b0; B=1'b0; C=1'b1; D=1'b0;
    #10 A=1'b0; B=1'b1; C=1'b0; D=1'b1;
    #10 A=1'b0; B=1'b1; C=1'b0; D=1'b0;
    #10 A=1'b0; B=1'b1; C=1'b1; D=1'b1;
    #10 A=1'b0; B=1'b1; C=1'b1; D=1'b0;
    #10 A=1'b1; B=1'b0; C=1'b0; D=1'b1;
    #10 A=1'b1; B=1'b0; C=1'b0; D=1'b0;
    #10 A=1'b1; B=1'b0; C=1'b1; D=1'b1;
    #10 A=1'b1; B=1'b0; C=1'b1; D=1'b0;
    #10 A=1'b1; B=1'b1; C=1'b0; D=1'b1;
    #10 A=1'b1; B=1'b1; C=1'b0; D=1'b0;
    #10 A=1'b1; B=1'b1; C=1'b1; D=1'b1;
    #10 A=1'b1; B=1'b1; C=1'b1; D=1'b0;
    #10 $finish;
  end
endmodule
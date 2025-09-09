module circuitTEST();
  wire Y;
  reg EN;
  reg [2:0] S;
  reg [7:0] D;

  circuit fs(Y, EN, S, D);
  initial begin
    $display(" EN  S[2:0] | Y |");
    $monitor(" %b    %b   | %b |", EN, S, Y);
    EN=1'b0; S=3'b000; D=8'b01011100;

    #10 EN=1'b0; S=3'b000;
    #10 EN=1'b0; S=3'b001;
    #10 EN=1'b0; S=3'b010;
    #10 EN=1'b0; S=3'b011;
    #10 EN=1'b0; S=3'b100;
    #10 EN=1'b0; S=3'b101;
    #10 EN=1'b0; S=3'b110;
    #10 EN=1'b0; S=3'b111;

    #10 EN=1'b1; S=3'b000;
    #10 EN=1'b1; S=3'b001;
    #10 EN=1'b1; S=3'b010;
    #10 EN=1'b1; S=3'b011;
    #10 EN=1'b1; S=3'b100;
    #10 EN=1'b1; S=3'b101;
    #10 EN=1'b1; S=3'b110;
    #10 EN=1'b1; S=3'b111;

    #10 $finish;
  end
endmodule

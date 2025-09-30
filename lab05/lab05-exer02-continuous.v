/*
  Using dataflow modeling, recreate the Binary to 7-segment decoder exercise using only using (a) continuous assignment statements and (b) conditional operators. The symbols to be recreated are the following:
    0-9, A-F (given b and d)
*/

// Using Continuous Assignment Statements
module bin_7Seg(input A, B, C, D, output a, b, c, d, e, f, g);
  assign a = (A & ~B & ~C) | (~A & B & D) | (A & ~D) | (~A & C) | (B & C) | (~B & ~D);
  assign b = (~A & ~C & ~D) | (~A & C & D) | (A & ~C & D) | (~B & ~C) | (~B & ~D);
  assign c = (~A & ~C) | (~A & D) | (~C & D) | (~A & B) | (A & ~B);
  assign d = (~A & ~B & ~D) | (~B & C & D) | (B & ~C & D) | (B & C & ~D) | (A & ~C);
  assign e = (~B & ~D) | (C & ~D) | (A & C) | (A & B);
  assign f = (~A & B & ~C) | (~C & ~D) | (B & ~D) | (A & ~B) | (A & C);
  assign g = (~A & B & ~C) | (~B & C) | (C & ~D) | (A & ~B) | (A & D);
endmodule

module bin_7SegTEST();
  reg [3:0] in;
  wire a, b, c, d, e, f, g;

  bin_7Seg fs(in[3], in[2], in[1], in[0], a, b, c, d, e, f, g);

  integer i;
  
  initial begin
    $dumpfile("./out/lab05-exer02-continuous.vcd"); $dumpvars;
    $display(" i[3:0] | a b c d e f g | time");
    $monitor(" %b   | %b %b %b %b %b %b %b | %0t ", in, a, b, c, d, e, f, g, $time);

    for (i = 0; i < 16; i = i + 1) begin
      in = i; #10;
    end

    #10 $finish;
  end
endmodule
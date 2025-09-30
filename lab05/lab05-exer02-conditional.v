/*
  Using dataflow modeling, recreate the Binary to 7-segment decoder exercise using only using (a) continuous assignment statements and (b) conditional operators. The symbols to be recreated are the following:
    0-9, A-F (given b and d)
*/

// Using Conditional Operations
module bin_7Seg(input [3:0] in, output [6:0] out);
  assign out = (in == 4'h0) ? 7'b1111110 :
               (in == 4'h1) ? 7'b0110000 :
               (in == 4'h2) ? 7'b1101101 :
               (in == 4'h3) ? 7'b1111001 :
               (in == 4'h4) ? 7'b0110011 :
               (in == 4'h5) ? 7'b1011011 :
               (in == 4'h6) ? 7'b1011111 :
               (in == 4'h7) ? 7'b1110000 :
               (in == 4'h8) ? 7'b1111111 :
               (in == 4'h9) ? 7'b1111011 :
               (in == 4'hA) ? 7'b1110111 :
               (in == 4'hB) ? 7'b0011111 :
               (in == 4'hC) ? 7'b1001110 :
               (in == 4'hD) ? 7'b0111101 :
               (in == 4'hE) ? 7'b1001111 :
               (in == 4'hF) ? 7'b1000111 :
                              7'b0000000;

endmodule

module bin_7SegTEST();
  reg [3:0] in;
  wire [6:0] out;

  bin_7Seg fs(in, out);

  integer i;
  
  initial begin
    $dumpfile("./out/lab05-exer02-conditional.vcd"); $dumpvars;
    $display(" i[3:0] | out[6:0]      | time");
    $monitor(" %b   | %b       | %0t ", in, out, $time);

    for (i = 0; i < 16; i = i + 1) begin
      in = i; #10;
    end

    #10 $finish;
  end
endmodule
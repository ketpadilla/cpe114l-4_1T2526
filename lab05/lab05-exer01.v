/*
  Create a dataflow model of a circuit that compares two 8-bit numbers to check which among the input has the greater number of bits that are set (bit is equal to 1). Simulate
*/

module compare(input [7:0] A, B, output [1:0] res);
  wire [3:0] countA = A[0] + A[1] + A[2] + A[3] + A[4] + A[5] + A[6] + A[7];
  wire [3:0] countB = B[0] + B[1] + B[2] + B[3] + B[4] + B[5] + B[6] + B[7];

  assign res = (countA > countB) ? 2'b01 : (countA < countB) ? 2'b10 : 2'b00;
endmodule

module compareTEST();
  reg [7:0] A, B;
  wire [1:0] res;
  compare fs(A, B, res);

  integer i, j;

  initial begin
    $display(" A[7:0] B[7:0] | res | time");
    $monitor(" %b %b | %b | %0t ", A, B, res, $time);
    $dumpfile("./out/lab05-exer01.vcd"); $dumpvars;
    
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        A = i;
        B = j;
        #10;
      end
    end
    
    $finish;
  end
endmodule
/*
  Design an all-bit zero/one detector using dataflow modelling. Save the file as drill6_2.vl
*/

module AllBit(input [31:0]x, output zero, one);
  assign zero=~(|x);
  assign one=&x;
endmodule

module AllBitTest();
  reg [31:0] inputX;
  wire outputZ, outputO;
  AllBit Abit(inputX, outputZ, outputO);

  initial begin
    $dumpfile("./out/lab05-drill02.vcd");
    $dumpvars(0, AllBitTest);
  end

  initial fork
    $monitor($time,,," %h",inputX," %h",outputO," %h",outputZ);
    inputX=32'h0;
    #1 inputX=32'h12345678;
    #2 inputX=0;
    #3 inputX=32'hFFFFFFFF;
    #4 inputX=32;
    #4 $finish;
  join
endmodule
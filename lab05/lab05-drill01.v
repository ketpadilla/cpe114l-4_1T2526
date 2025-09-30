/*
  Create a dataflow description of a 4-bit comparator (use relational operators greater than or less than and the equality operator is equal to). Simulate
*/

module magcom (input [3:0] A, B, output lt, gt, eq);
  assign lt=(A<B);
  assign gt=(A>B);
  assign eq=(A==B);
endmodule

module testMagCom();
  reg [3:0] A, B;
  wire lt, gt, eq;
  magcom tb(A, B, lt, gt, eq);
  reg [255:0]string1, string2, string3;

  initial fork
    A=1'b0; B=1'b0;
    $display(" A B \t\t\t\t A<B \t\t \t\t A>B\t\t\t\t A==B");
    $monitor("%d %d %s %s %s",A, B, string1, string2, string3);
  join

  initial begin
    $dumpfile("./out/lab05-drill01.vcd");
    $dumpvars(0, testMagCom);

    #1 A=4'd7;
    B=4'd7;
    if (lt==1) string1="true";
    else string1="false";
    if (gt==1) string2="true";
    else string2="false";
    if (eq==1) string3="true";
    else string3="false";

    #3 A=4'd4;
    B=4'd6;
    if (lt==1) string1="true";
    else string1="false";
    if (gt==1) string2="true";
    else string2="false";
    if (eq==1) string3="true";
    else string3="false";

    #5 A=4'd9;
    B=4'd8;
    if (lt==1) string1="true";
    else string1="false";
    if (gt==1) string2="true";
    else string2="false";
    if (eq==1) string3="true";
    else string3="false";

    #7 A=4'd10;
    B=4'd1;
    if (lt==1) string1="true";
    else string1="false";
    if (gt==1) string2="true";
    else string2="false";
    if (eq==1) string3="true";
    else string3="false";

    #9 $finish;
  end
endmodule
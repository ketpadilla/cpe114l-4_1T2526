module test2_1;
  wire w1;
  reg x1, x2, x3, x4, x5;
  circuit2_1 test2_1(x1, x2, x3, x4, x5, w1);
  
  initial begin
  x1=1'b0; x2=1'b0; x3=1'b0; x4=1'b0; x5=1'b0; //0
  #100 $finish;
  end

  initial begin
  #2 $display(x1,x2,x3,x4,x5," ",w1);
  #2 x1=1'b0; x2=1'b0; x3=1'b0; x4=1'b1; x5=1'b0; #2 $display(x1,x2,x3,x4,x5," ",w1); //2
  #2 x1=1'b0; x2=1'b0; x3=1'b1; x4=1'b0; x5=1'b0; #2 $display(x1,x2,x3,x4,x5," ",w1); //4
  #2 x1=1'b0; x2=1'b0; x3=1'b1; x4=1'b1; x5=1'b0; #2 $display(x1,x2,x3,x4,x5," ",w1); //6
  #2 x1=1'b0; x2=1'b1; x3=1'b0; x4=1'b0; x5=1'b1; #2 $display(x1,x2,x3,x4,x5," ",w1); //9
  #2 x1=1'b0; x2=1'b1; x3=1'b1; x4=1'b0; x5=1'b1; #2 $display(x1,x2,x3,x4,x5," ",w1); //13
  #2 x1=1'b1; x2=1'b0; x3=1'b1; x4=1'b0; x5=1'b1; #2 $display(x1,x2,x3,x4,x5," ",w1); //21
  end
endmodule
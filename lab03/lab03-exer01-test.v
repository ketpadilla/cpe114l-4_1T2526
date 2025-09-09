module bcd_to_excess_TEST();
  wire [3:0] Out;
  reg [3:0] In;

  bcd_to_excess dut(In, Out);
  initial begin
    $display(" In[3:0]  | Out[3:0]");
    $monitor(" %b     | %b", In, Out);
    In = 4'b0000;
    
    #10 In = 4'b0001;
    #10 In = 4'b0010;
    #10 In = 4'b0100;
    #10 In = 4'b0101;
    #10 In = 4'b0110;
    #10 In = 4'b0111;
    #10 In = 4'b1000;
    #10 In = 4'b1001;
    #10 In = 4'b1010;
    #10 In = 4'b1100;
    #10 In = 4'b1101;
    #10 In = 4'b1110;
    #10 In = 4'b1111;

    #10 $finish;
  end
endmodule

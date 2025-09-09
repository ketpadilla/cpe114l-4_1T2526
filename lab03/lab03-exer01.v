// Develop and simulate a gate-level model of a circuit that generates the excess-3 of a BCD digit. Show the outputs of all possible input combinations.

module bcd_to_excess(In, Out);
  input [3:0] In;
  output [3:0] Out;
  
  wire [3:0] notIn;
  wire [6:0] andWire;

  not NOT0(notIn[0], In[0]); // ~D
  not NOT1(notIn[1], In[1]); // ~C
  not NOT2(notIn[2], In[2]); // ~B
  not NOT3(notIn[3], In[3]); // ~A

  and AND0(andWire[0], In[2], In[0]); // B & D
  and AND1(andWire[1], In[2], In[1]); // B & C
  or OR0(Out[3], andWire[0], andWire[1], In[3]); 

  and AND2(andWire[2], notIn[2], In[0]); // ~B & D
  and AND3(andWire[3], notIn[2], In[1]); // ~B & C
  and AND4(andWire[4], In[2], notIn[1], notIn[0]); // B & ~C & ~D
  or OR1(Out[2], andWire[2], andWire[3], andWire[4]);
  
  and AND5(andWire[5], notIn[1], notIn[0]); // ~C & ~D
  and AND6(andWire[6], In[1], In[0]); // C & D
  or OR2(Out[1], andWire[5], andWire[6]);

  assign Out[0] = notIn[0];

endmodule
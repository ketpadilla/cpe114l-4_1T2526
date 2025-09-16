module circuit2_2(input [3:0]I, input [1:0]S, output Out1);
  wire [3:0]In;
  wire S0not, S1not;
  
  not #(2) (S0not, S[0]);
  not #(2) (S1not, S[1]);
  and #(5) (In[0], I[0], S0not, S1not);
  and #(5) (In[1], I[1], S[0], S1not);
  and #(5) (In[2], I[2], S0not, S[1]);
  and #(5) (In[3], I[3], S[0], S[1]);
  or #(5) (Out1, In[0], In[1], In[2], In[3]);
endmodule
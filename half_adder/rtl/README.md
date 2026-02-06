//Half adder code using logic diagram
module half_adder( 
  input a,b,
  output sum,carry);
  
  xor m1(sum,a,b);
  and m2(carry,a,b);
  
endmodule

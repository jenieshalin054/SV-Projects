class ha_trans;
  rand bit a;
  rand bit b;
  
  bit sum;
  bit carry;
  function void print(string tag="");
    $display("[%s] a=%0b b=%0b | sum=%0b carry=%0b",
             tag,a,b,sum,carry);
  endfunction
endclass
  

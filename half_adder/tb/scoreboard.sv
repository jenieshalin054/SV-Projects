class ha_scb;
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task run();
    ha_trans tx;
    bit ex_sum;
    bit ex_carry;
    
    forever begin
      mon2scb.get(tx);
      
      ex_sum = tx.a ^ tx.b ;
      ex_carry = (tx.a & tx.b) | (tx.b & tx.a);
      
      if(tx.sum !== ex_sum || tx.carry !== ex_carry) begin
        $error("Failed: a=%0b, b=%0b| sum = %0b carry = %0b | exp_s = %0b, exp_c = %0b", tx.a, tx.b, tx.sum, tx.carry, ex_sum, ex_carry);
      end
      else begin
        tx.print("Passed");
      end
    end
  endtask
endclass
      

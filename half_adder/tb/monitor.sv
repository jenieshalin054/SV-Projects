class ha_mon;
  mailbox mon2scb;
  virtual ha_if vif;
  event bfm_done;
  ha_cov cov;
  
  function new(mailbox mon2scb, virtual ha_if vif, event bfm_done);
    this.mon2scb = mon2scb;
    this.vif = vif;
    this.bfm_done = bfm_done;
    cov = new(vif);
  endfunction
  
  task run();
    ha_trans tx;
    forever begin
      @bfm_done;
      #0;
      tx=new();
      tx.a=vif.a;
      tx.b=vif.b;
      tx.sum=vif.sum;
      tx.carry=vif.carry;
      cov.sample();
      mon2scb.put(tx);
    end
  endtask
endclass

class ha_bfm;
  mailbox gen2drv;
  virtual ha_if vif;
  event bfm_done;
  
  function new (mailbox gen2drv, virtual ha_if vif, event bfm_done);
    this.gen2drv = gen2drv;
    this.vif= vif;
    this.bfm_done = bfm_done;
  endfunction
  
  task run();
    ha_trans tx;
    forever begin
      gen2drv.get(tx);
      vif.a=tx.a;
      vif.b=tx.b;
      #1;
      -> bfm_done;
    end
  endtask
endclass

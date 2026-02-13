class ha_env;
  ha_gen gen;
  ha_bfm bfm;
  ha_mon mon;
  ha_scb scb;
  event bfm_done;
  
  mailbox gen2drv;
  mailbox mon2scb;
  
  virtual ha_if vif;
  
  function new(virtual ha_if pif);
    this.vif = pif;
    
    gen2drv = new();
    mon2scb = new();
    
    gen = new(gen2drv);
    bfm = new(gen2drv, vif, bfm_done);
    mon = new(mon2scb, vif, bfm_done);
    scb = new(mon2scb);
  endfunction
  
  task run();
    fork
      gen.run();
      bfm.run();
      mon.run();
      scb.run();
    join_none
  endtask
endclass

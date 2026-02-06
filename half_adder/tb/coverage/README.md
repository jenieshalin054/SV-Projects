class ha_cov;
  virtual ha_if vif;

  covergroup ha_cg;
    option.per_instance = 1;

    cp_a   : coverpoint vif.a;
    cp_b   : coverpoint vif.b;

    cp_all : coverpoint {vif.a, vif.b} {
      bins all_vals[] = {[0:3]};
    }
  endgroup

  function new(virtual ha_if vif);
    this.vif = vif;
    ha_cg = new();
  endfunction

  function void sample();
    ha_cg.sample();
  endfunction
endclass

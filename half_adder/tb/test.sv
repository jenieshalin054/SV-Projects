`include "interface.sv"
`include "transaction.sv"
`include "coverage.sv"
`include "generator.sv"
`include "bfm.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module top_fa;
  ha_if pif();
  ha_env env;
  
  half_adder dut( .a (pif.a), .b (pif.b),
                 .sum   (pif.sum), .carry (pif.carry));
  initial begin
    env = new(pif);
    env.run();
    #50;
    $finish;
  end
  final begin
    $display("\n==============================");
    $display(" Half Adder Functional Coverage");
    $display("==============================");
    $display("Coverage = %0.2f %%",
             env.mon.cov.ha_cg.get_coverage());
  end
 
endmodule

`include "transaction.sv"
`include "interface.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "reference.sv"
`include "scoreboard.sv"
`include "environment.sv"


module testbench();

  reg clk = 0;


  always #5 clk = ~clk;


  // Interface

  dff_itf itf(clk);


  // DUT

  dff d1(itf);


  // Environment

  environment e;


  initial begin

    $display("===========================================================================");
    $display("                      VERIFICATION DFF IN SV");
    $display("===========================================================================");


    e = new(itf, itf);


    e.run();


    $finish;

  end

endmodule

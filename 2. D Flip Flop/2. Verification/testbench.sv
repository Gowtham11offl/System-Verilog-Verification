`include "transaction.sv"
`include "interface.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module testbench();
  
  reg clk=0;
  always #5 clk=~clk;
  
  //connecting interface 
  dff_itf itf(clk);
  //connecting  dut
  dff d1(.clk(clk),.rst(itf.rst),.d(itf.d),.q(itf.q));
  
  environment e;
 
  initial begin
    $dumpfile("v.vcd");
    $dumpvars(0,testbench);
    $display("===========================================================================");
    $display("                      VERIFICATION DFF IN SV                               ");
    $display("===========================================================================");
    e=new(itf,itf);
    e.run();
    #1000 $finish;
   end
  
endmodule

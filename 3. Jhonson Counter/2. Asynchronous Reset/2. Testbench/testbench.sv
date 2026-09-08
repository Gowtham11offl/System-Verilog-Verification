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
  
    
  jc_itf itf(clk);
  jhonson_counter d1(.clk(clk),.rst(itf.rst),.q(itf.q));
  
  environment e;
 
  initial begin
    $dumpfile("v.vcd");
    $dumpvars(0,testbench);
    $display("===========================================================================");
    $display("                   VERIFICATION JHONSON COUNTER IN SV                      ");
    $display("===========================================================================");
    itf.rst=1;
    #10;
    e=new(itf,itf);
    e.run();
   end
  
endmodule

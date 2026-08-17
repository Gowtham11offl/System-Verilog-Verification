interface dff_itf(input clk);
  
  logic rst;
  logic d;
  logic q;
  
  clocking drv_clk @(posedge  clk);
    default output #0;
    output rst,d; 
  endclocking
  
  clocking mon_clk @(posedge clk);
    default input #0;
    input q,rst,d;
  endclocking

  modport drive(input clk,clocking drv_clk);
  modport mon(input clk,clocking mon_clk);
  
endinterface

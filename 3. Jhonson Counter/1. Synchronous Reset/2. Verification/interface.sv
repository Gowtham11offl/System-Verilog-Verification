interface jc_itf(input clk);
  
  logic rst;
  logic [3:0]q;
  
  clocking drv_clk @(posedge  clk);
    default input #1 output #0;
    input q;
    output rst; 
  endclocking
  
  clocking mon_clk @(posedge clk);
    default input #1step output #0;
    input q,rst;
  endclocking

  modport drive(input clk,clocking drv_clk);
  modport mon(input clk,clocking mon_clk);
  
endinterface

interface jc_itf(input clk);
  
  logic rst;
  logic [3:0]q;
  
  clocking cb @(posedge  clk);
    default input #1 output #0;
    input q;
  endclocking
  

  modport drive(input clk,output rst,clocking cb);
    modport mon(input clk,input rst,input q,clocking cb);
  
endinterface

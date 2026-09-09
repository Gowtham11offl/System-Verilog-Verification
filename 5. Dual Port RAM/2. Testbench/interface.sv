interface ram_itf(input clk);

  logic [15:0] data1;
  logic [15:0] data2;
  logic [7:0] addr1;
  logic [7:0] addr2;
  logic w_e1;
  logic w_e2;
  logic [15:0]data_out1;
  logic [15:0]data_out2;
  
  clocking dr_clk @(posedge clk);
    
    default input #1 output #0;
    
    input data_out1,data_out2;
    output data1,data2,addr1,addr2,w_e1,w_e2;
    
  endclocking
  
  clocking mon_clk @(posedge clk);
    
    default input #0 output #0;
    
    input data_out1,data_out2,data1,data2,addr1,addr2,w_e1,w_e2;
    
  endclocking
  
  modport mon(input clk,clocking mon_clk);
  modport dr(input clk,clocking dr_clk);
  
endinterface

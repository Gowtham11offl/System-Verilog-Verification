interface dff_itf(input logic clk);

  logic rst;
  logic d;
  logic q;
  logic en;
  logic preset;

  
  clocking driv_cb @(posedge clk);

    output d;
    output rst;
    output en;
    output preset;

  endclocking

  clocking mon_cb @(posedge clk);

    input d;
    input rst;
    input en;
    input preset;
    input q;

  endclocking


  modport dut (
    input clk,
    input rst,
    input d,
    input en,
    input preset,
    output q
  );


  modport driv (
    input clk,
    output d,
    output rst,
    output en,
    output preset
  );

  modport mon (
    input clk,
    input d,
    input rst,
    input en,
    input preset,
    input q
  );

endinterface

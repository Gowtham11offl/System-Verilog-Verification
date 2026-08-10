`include "transaction.sv"
`include "interface.sv"

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "reference.sv"
`include "scoreboard.sv"

module top_module();
  add_itf itf();

  full_adder d1(itf);
  
  virtual add_itf.drive vif;
  virtual add_itf.mon vif1;
  
  mailbox mb;
  mailbox mb1;
  mailbox mb2;
  mailbox mb3;
  
  driver d;
  generator g;
  monitor m;
  scoreboard s;
  reference r;
  
  initial begin
    
    vif=itf;
    vif1=itf;
    
    mb=new();
    mb1=new();
    mb2=new();
    mb3=new();
    
    g=new(mb,mb1);
    d=new(mb,vif);
    m=new(mb2,vif1);
    r=new(mb1,mb3);
    s=new(mb2,mb3);
    
    fork
      g.gen();
      d.driv();
      m.montr();
      s.sb();
      r.add();
    join
  end
  
endmodule

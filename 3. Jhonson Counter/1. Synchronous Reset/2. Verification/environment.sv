class environment;

  generator g;
  driver d;
  monitor m;
  scoreboard s;
  event done;
  
  real per;

  mailbox #(transaction) gen_drv;
  mailbox #(transaction) mon_scb;

  virtual jc_itf.drive vif;
  virtual jc_itf.mon vif1;

  function new(virtual jc_itf.drive vif,virtual jc_itf.mon vif1);

    this.vif = vif;
    this.vif1=vif1;

    gen_drv=new();
    mon_scb=new();

    g=new(gen_drv,done);
    d=new(gen_drv, vif,done);
    m=new(mon_scb, vif1);
    s=new(mon_scb);

  endfunction

  task run();
    
    fork
      g.gen();
      d.driv();
      m.mtr();
      s.sb();
    join_any
    
    disable fork;
      
      per=(s.count/s.count2)*100;
      $display("#####################################################");
      $display("#     TOTAL NO OF TEST_CASES=%0d                    #",s.count2);
      $display("#     PASSED=%0d                                    #",s.count);
      $display("#     FAILED=%0d                                      #",s.count1);
      $display("#     SUCCESS RATE=%0f                       #",per);
      $display("#####################################################");
      #1;
      $finish;

  endtask

endclass

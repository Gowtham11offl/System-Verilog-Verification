class driver;
  transaction t;
  mailbox #(transaction) from_gen;
  event done;
  
  virtual jc_itf.drive vif;
  
  function new(mailbox #(transaction) from_gen,virtual jc_itf.drive vif,event done);
    this.from_gen=from_gen;
    this.vif=vif;
    this.done=done;
  endfunction
  
  task driv();
    begin
      forever begin
        t=new();
        from_gen.get(t);
        
        @(vif.drv_clk);
        
        vif.drv_clk.rst<=t.rst;

        $display("[time=%0t] DRIVER: rst=%b ",$time, t.rst);
        ->done;
      end
    end
  endtask
  
endclass

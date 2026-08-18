class driver;
  transaction t;
  mailbox #(transaction) from_gen;
  
  virtual dff_itf.drive vif;
  
  function new(mailbox #(transaction) from_gen,virtual dff_itf.drive vif);
    this.from_gen=from_gen;
    this.vif=vif;
  endfunction
  
  task driv();
    begin
      repeat(30) begin
        t=new();
        from_gen.get(t);
        
        @(vif.drv_clk);
        
        vif.drv_clk.rst<=t.rst;
        vif.drv_clk.d<=t.d;
        
        $display("          DRIVER: rst=%b d=%b", t.rst, t.d);
      end
    end
  endtask
  
endclass

class driver;
  transaction t;
  
  virtual jc_itf.drive vif;
  
  function new(virtual jc_itf.drive vif);
    this.vif=vif;
  endfunction
  
  task driv();
    begin
      repeat (50) begin
        t=new();
        #($urandom_range(50,90));
        vif.rst=1;
        $display("[time=%0t] DRIVER: rst=%b ",$time, t.rst);
        #($urandom_range(10,20));
        vif.rst=0;
        $display("[time=%0t] DRIVER: rst=%b ",$time, t.rst);
      end
    end
  endtask
  
endclass

class monitor;
  
  mailbox #(transaction) to_scoreboard;
  transaction t;
  
  virtual jc_itf.mon vif;
  
  function new(mailbox #(transaction) to_scoreboard,virtual jc_itf.mon vif);
    this.to_scoreboard = to_scoreboard;
    this.vif=vif;
  endfunction

  task mtr();
    begin
      forever begin
        t=new();
        
        @(vif.mon_clk);
        
        t.rst=vif.mon_clk.rst;
        t.q=vif.mon_clk.q;
        to_scoreboard.put(t);
        $display("[time=%0t] MONITOR: rst=%B q=%b ",$time,t.rst,t.q);
      end
    end
  endtask
  
  
endclass

class monitor;
  
  mailbox #(transaction) to_scoreboard;
  transaction t;
  
  virtual dff_itf.mon vif;
  
  function new(mailbox #(transaction) to_scoreboard,virtual dff_itf.mon vif);
    this.to_scoreboard = to_scoreboard;
    this.vif=vif;
  endfunction

  task mtr();
    begin
       repeat (30) begin
        t=new();
        
        @(vif.mon_clk);
        
        t.rst=vif.mon_clk.rst;
        t.d=vif.mon_clk.d;
        t.q=vif.mon_clk.q;
        to_scoreboard.put(t);
        $display("          MONITOR: rst=%B d=%B q=%b ",t.rst,t.d,t.q);
      end
    end
  endtask
  
  
endclass

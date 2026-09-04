class scoreboard;
  
   transaction t1;

   mailbox #(transaction) from_monitor;
  
   bit [3:0] expected_q;
   int count,count1,count2;
   reg prev_rst=1;
   reg prev_q;
  
  function new(mailbox #(transaction) from_monitor);
    this.from_monitor=from_monitor;
  endfunction
  
  task sb();
    begin
      
      forever begin
        t1=new();
       
        from_monitor.get(t1);
        
        count2=count2+1;
        
        if(prev_rst)
          expected_q=4'd0;
        else begin
          expected_q={expected_q[2:0],~expected_q[3]};
        end
        prev_rst=t1.rst;
        
        $display("[time=%0t] Actual_q =%b   Expected_q=%b",$time,t1.q,expected_q);
              
        if(t1.q==expected_q )begin
          count=count+1;
          $display("  PASS ");
        end
        else begin
          count1=count1+1;
          $display(" FAIL ");
        end
        
        
        $display("=========================================================================");
      end
    end
  endtask
     
endclass

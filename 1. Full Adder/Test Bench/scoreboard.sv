class scoreboard;
  
  transaction t1;
  transaction t2;
  
  mailbox mb1;
  mailbox mb;
  
  function new(mailbox mb1,mailbox mb);
    this.mb1=mb1;
    this.mb=mb;
  endfunction
  
  task sb();
    begin
      $display("=================================================================");
$display("              VERIFICATION FULL ADDER IN SV                ");
      $display("=================================================================");
      repeat(30)begin
        t1=new();
        t2=new();
        mb1.get(t1);
        mb.get(t2);
        
        $display("a=%b b=%b cin=%b",t1.a,t1.b,t1.cin);
        $display("expected_sum=%b,expected_carry=%b",t2.sum,t2.carry);
        $display("actual_sum=%b,actual_carry=%b",t1.sum,t1.carry);
      
        if(t1.sum==t2.sum && t1.carry==t2.carry)begin
          $display("+--------+");
          $display("|  PASS  |");
          $display("+--------+");
        end
        else begin
          $display("+--------+");
          $display("|  FAIL  |");
          $display("+--------+");
        end
        
        $display("=========================================================================");
        #10;
      end
    end
  endtask
     
endclass

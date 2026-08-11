class monitor; 
  mailbox mb1;
  transaction t;
  
  virtual add_itf.mon vif;
  
  function new(mailbox mb1, virtual add_itf.mon vif);
    
    this.mb1 = mb1;
    this.vif = vif; 
    
  endfunction
  
  task montr();
    
    begin 
      
      repeat (30) begin 
        
        t = new();
        #1;
        
        t.a = vif.a;
        t.b = vif.b;
        t.cin = vif.cin;
        t.sum = vif.sum;
        t.carry = vif.carry;
      	
        mb1.put(t);
        #9;
        
      end
      
    end
    
    
  endtask
  
  
  
  
endclass

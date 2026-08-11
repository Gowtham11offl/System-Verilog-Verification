class reference;
  
  transaction t;
  
  mailbox mb;
  mailbox mb1;
  
  
  function new(mailbox mb, mailbox mb1);
    
    this.mb = mb;
    this.mb1 = mb1;   
    
    
  endfunction
  
  
  task add();
    
    begin 
      
      repeat(30) begin 
        
        t= new(); 
        
        mb.get(t);
        
        t.sum=t.a^t.b^t.cin;
        t.carry=(t.a&t.b)|(t.b&t.cin)|(t.cin&t.a);
        
        mb1.put(t); 
        #10;
        
        
      end
      
    end
    
    
    
    
  endtask
  
  
endclass

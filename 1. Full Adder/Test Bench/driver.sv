class driver;
  
  transaction t;
  mailbox mb;
  
  virtual add_itf.drive vif; 
  
  function new(mailbox mb, virtual add_itf.drive vif);
    
    this.mb = mb; 
    this.vif = vif; 
    
  endfunction
  
  
  task driv(); 
    begin
      
      repeat (30) begin 
        
        t=new();
        mb.get(t);
        
        vif.a = t.a;
        vif.b = t.b;
        vif.cin = t.cin;
        
        #10;
        
      end
      
    end
    
  endtask
  
  
  
  
  
  
endclass

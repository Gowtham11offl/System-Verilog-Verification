class generator;
  
  mailbox mb;
  mailbox mb1; 
  transaction t; 
  
  
  function new(mailbox mb, mailbox mb1);
    this.mb = mb; 
    this.mb1 = mb1;
  endfunction
  
  task gen();
    begin
      
      repeat(30) begin 
        
        t=new(); 
        assert(t.randomize());
        mb.put(t);
        mb1.put(t);
        #10;
        
      end
      
    end
  endtask
  
  
  
  
  
  
  
  
  
endclass

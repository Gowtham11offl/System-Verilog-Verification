class generator;
  transaction t;
  mailbox #(transaction) to_driver;
  event done;
  
  function new(mailbox #(transaction) to_driver,event done);
    this.to_driver=to_driver;
    this.done=done;
  endfunction
  
  task gen();
    begin
      repeat (150)
        begin
          t=new();
          t.randomize();
          to_driver.put(t);
          @(done);
      end
    end
  endtask
  
endclass

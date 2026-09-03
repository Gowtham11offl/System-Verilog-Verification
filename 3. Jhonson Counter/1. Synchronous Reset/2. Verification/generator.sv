class generator;
  
  mailbox #(transaction) to_drive;
  transaction t;
  event done;
  
  function new(mailbox #(transaction) to_drive,event done);
    this.to_drive=to_drive;
    this.done=done;
  endfunction
  
  task gen();
    begin
      repeat(100) begin
        t=new();
        t.randomize();
        to_drive.put(t);
        @(done);
      end
     end
  endtask
  
endclass

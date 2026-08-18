class generator;
  
  mailbox #(transaction) to_drive;
  transaction t;
  
  function new(mailbox #(transaction) to_drive);
    this.to_drive=to_drive;
  endfunction
  
  task gen();
    begin
      repeat (30) begin
        t=new();
        t.randomize();
        to_drive.put(t);
      end
     end
  endtask
  
endclass

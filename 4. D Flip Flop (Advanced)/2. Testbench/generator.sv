class generator;

  transaction t;

  mailbox gentodriv;
  mailbox gentoref;


  function new(
    mailbox gentodriv,
    mailbox gentoref
  );

    this.gentodriv = gentodriv;
    this.gentoref  = gentoref;

  endfunction


  task gen();

    repeat(30) begin

      t = new();

      assert(t.randomize())
        else $error("Randomization failed");


      gentodriv.put(t);
      gentoref.put(t);

    end

  endtask

endclass

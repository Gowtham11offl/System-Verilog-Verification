class dff_reference;

  transaction t;
  transaction expected;

  mailbox gentoref;
  mailbox reftoscore;

  event done;

  bit expected_q = 1'b0;


  function new(
    mailbox reftoscore,
    mailbox gentoref,
    event done
  );

    this.reftoscore = reftoscore;
    this.gentoref   = gentoref;
    this.done       = done;

  endfunction


  task r_dff();

    repeat(30) begin

      gentoref.get(t);


      @done;


      expected = new();

      expected.d      = t.d;
      expected.rst    = t.rst;
      expected.en     = t.en;
      expected.preset = t.preset;


      // DFF reference model

      if(t.rst)

        expected_q = 1'b0;

      else if(t.preset)

        expected_q = 1'b1;

      else if(t.en)

        expected_q = t.d;

      // If en = 0:
      // expected_q keeps its previous value.


      expected.q = expected_q;


      // Send expected transaction
      reftoscore.put(expected);

    end

  endtask

endclass

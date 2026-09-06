class monitor;

  transaction t;

  mailbox montoscore;

  virtual dff_itf.mon intf2;


  function new(
    virtual dff_itf.mon intf2,
    mailbox montoscore
  );

    this.intf2      = intf2;
    this.montoscore = montoscore;

  endfunction


  task moni();

    repeat(30) begin

      @(posedge intf2.clk);

      #1;

      t = new();

      t.d      = intf2.d;
      t.rst    = intf2.rst;
      t.en     = intf2.en;
      t.preset = intf2.preset;
      t.q      = intf2.q;


      montoscore.put(t);

    end

  endtask

endclass

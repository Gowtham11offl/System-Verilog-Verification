class driver;

  transaction t;

  mailbox gentodriv;

  virtual dff_itf.driv intf1;

  event done;


  function new(
    mailbox gentodriv,
    virtual dff_itf.driv intf1,
    event done
  );

    this.gentodriv = gentodriv;
    this.intf1     = intf1;
    this.done      = done;

  endfunction


  task drive();

    repeat(30) begin

      gentodriv.get(t);

      @(posedge intf1.clk);

      intf1.d      = t.d;
      intf1.rst    = t.rst;
      intf1.en     = t.en;
      intf1.preset = t.preset;


      -> done;

    end

  endtask

endclass

class environment;

  // Mailboxes

  mailbox gentodriv;
  mailbox gentoref;
  mailbox montoscore;
  mailbox reftoscore;


  // Virtual interfaces

  virtual dff_itf.driv intf1;
  virtual dff_itf.mon  intf2;


  // Event

  event done;


  // Components

  generator     gen;
  driver        drv;
  monitor       mon;
  dff_reference refer;
  scoreboard    sb;


  function new(
    virtual dff_itf.driv intf1,
    virtual dff_itf.mon  intf2
  );

    this.intf1 = intf1;
    this.intf2 = intf2;


    // Create mailboxes

    gentodriv  = new();
    gentoref   = new();
    montoscore = new();
    reftoscore = new();


    // Create components

    gen = new(
      gentodriv,
      gentoref
    );


    drv = new(
      gentodriv,
      intf1,
      done
    );


    mon = new(
      intf2,
      montoscore
    );


    refer = new(
      reftoscore,
      gentoref,
      done
    );


    sb = new(
      montoscore,
      reftoscore
    );

  endfunction


  task run();

    fork

      gen.gen();

      drv.drive();

      mon.moni();

      refer.r_dff();

      sb.sb();

    join

  endtask

endclass

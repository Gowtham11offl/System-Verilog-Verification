class transaction;

  rand bit rst;
  rand bit d;
  rand bit en;
  rand bit preset;

  bit q;


  constraint c_rst {
    rst dist {0 := 90, 1 := 10};
  }


  constraint c_en {
    en dist {0 := 30, 1 := 70};
  }


  constraint c_preset {
    preset dist {0 := 90, 1 := 10};
  }

endclass

class scoreboard;

  transaction actual;
  transaction expected;

  mailbox montoscore;
  mailbox reftoscore;


  function new(
    mailbox montoscore,
    mailbox reftoscore
  );

    this.montoscore = montoscore;
    this.reftoscore = reftoscore;

  endfunction


  task sb();

    repeat(30) begin

      // Actual result from monitor
      montoscore.get(actual);


      // Expected result from reference
      reftoscore.get(expected);


      $display("Randomized Values : d=%b rst=%b en=%b preset=%b",
                actual.d,
                actual.rst,
                actual.en,
                actual.preset);

      $display("Expected Output = %b", expected.q);
      $display("Actual Output = %b", actual.q);


      if(actual.q == expected.q) begin

        
        $display("Verification Status :  PASS  ");
        

      end

      else begin

        $display(" Verification Status :  FAIL  ");

      end


      $display("==============================================");

    end

  endtask

endclass

module dff(dff_itf.dut intf);

  always @(posedge intf.clk) begin

    if(intf.rst)

      intf.q <= 1'b0;

    else if(intf.preset)

      intf.q <= 1'b1;

    else if(intf.en)

      intf.q <= intf.d;

  end

endmodule

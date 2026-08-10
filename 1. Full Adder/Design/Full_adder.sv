module full_adder (add_itf.dut itf );
  assign itf.sum= itf.a ^ itf.b ^ itf.cin;
  assign itf.carry= (itf.a & itf.b) | (itf.b & itf.cin) | (itf.cin & itf.a);
endmodule

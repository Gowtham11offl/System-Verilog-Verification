module dual_port_ram(

  input bit [15:0] data1,data2,
  input bit[7:0] addr1,addr2,
  input bit w_e1,w_e2,clk,
  output  reg [15:0]q1,q2   
);
  reg [15:0] mem[256];
  
  always @(posedge clk) begin
    
    if(w_e1)
      mem[addr1]<=data1;
    else
      q1<=mem[addr1];
  end
  
  always @(posedge clk) begin
    if(w_e2 && !(w_e1 && addr1==addr2)) begin  //PORT1 PRIORITY  
      mem[addr2]<=data2;
    end
    else if(!w_e2)
      q2<=mem[addr2];
  end
  
endmodule 

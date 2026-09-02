class transaction;
  
  rand bit rst;
  bit [3:0]  q;
  constraint c1{rst dist {0:=20,1:=3};}
  
endclass

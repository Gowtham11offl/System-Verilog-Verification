class transaction;
  
  rand bit rst;
  rand bit d;
  bit q;
  constraint c1{rst dist {0:=20,1:=5};}
  
endclass

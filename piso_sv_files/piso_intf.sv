interface piso_intf(input bit clk);
  
  //port declaration
  logic piso_out;
  logic resetn, load, LSB;
  logic [`WIDTH-1:0] piso_in;
  
endinterface
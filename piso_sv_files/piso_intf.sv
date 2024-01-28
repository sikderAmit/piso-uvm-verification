interface piso_intf(input bit clk);
  
  logic piso_out;               //output port 
  logic resetn;                 // active-low reset
  logic load;                   //if load is 1 only then data will be loaded for write
  logic LSB;                    //if LBS 1 data will be read from left side
  logic [`WIDTH-1:0] piso_in;   //input data
  
endinterface
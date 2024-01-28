class piso_seq_item extends uvm_sequence_item;
  
  //port declaration
  logic piso_out;
  logic resetn, load, LSB;
  logic [`WIDTH-1:0] piso_in;
  
  `uvm_object_utils_begin(piso_seq_item)
  `uvm_field_int(resetn, UVM_ALL_ON)
  `uvm_field_int(piso_out, UVM_ALL_ON)
  `uvm_field_int(load, UVM_ALL_ON)
  `uvm_field_int(LSB, UVM_ALL_ON)
  `uvm_field_int(piso_in, UVM_ALL_ON)
  `uvm_object_utils_end
  
  //constructor
  function new(string name = "piso_seq_item");
    super.new(name);
  endfunction
  
endclass
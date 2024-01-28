class piso_sequence extends uvm_sequence;

  `uvm_object_utils(piso_sequence)

  //transaction handle declaration
  piso_seq_item item;

  //constructor function
  function new(string name = "piso_sequence");
    super.new(name);
  endfunction

  //body task
  virtual task body();
  endtask

  //reset task
  task reset();
    item = piso_seq_item::type_id::create("item");
    start_item(item);
    item.resetn = 0;
    finish_item(item);
  endtask

  //write task
  task write(logic [`WIDTH-1:0] data);
    item = piso_seq_item::type_id::create("item");
    start_item(item);
    item.resetn = 1;
    item.load = 1;
    item.piso_in = data;
    finish_item(item);
  endtask

  //read task
  task read(logic x);
    item = piso_seq_item::type_id::create("item");
    repeat(8) begin
      start_item(item);
      item.resetn = 1;
      item.load = 0;
      item.LSB = x;
    end
    finish_item(item);
  endtask

endclass

//reset class
class reset_seq extends piso_sequence;

  `uvm_object_utils(reset_seq)

  //constructor function
  function new(string name = "reset_seq");
    super.new(name);
  endfunction

  //body task
  task body();
    reset();
  endtask

endclass

//write class
class write_seq extends piso_sequence;

  `uvm_object_utils(write_seq)

  //internal veriable declaration
  logic [`WIDTH-1:0] data;

  //constructor function
  function new(string name = "write_seq");
    super.new(name);
  endfunction

  //body task
  task body();
    write(data);
  endtask

endclass

//read class
class read_seq extends piso_sequence;

  `uvm_object_utils(read_seq)

  //internal veriable declaration
  logic x;

  //constructor function
  function new(string name = "read_seq");
    super.new(name);
  endfunction

  //body task
  task body();
    read(x);
  endtask

endclass
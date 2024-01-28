class piso_drvr extends uvm_driver #(piso_seq_item);

  `uvm_component_utils(piso_drvr)

  //handle declaration
  piso_seq_item item;
  virtual piso_intf intf;

  //constructor function
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Driver Constructed...", UVM_MEDIUM)
  endfunction

  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Driver build phase", UVM_MEDIUM);
    if(!uvm_config_db #(virtual piso_intf)::get(this, "","piso_intf", intf))
      `uvm_fatal(get_full_name(), "Intf not found");
  endfunction

  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Driver connect phase", UVM_MEDIUM)
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Driver run phase", UVM_MEDIUM)
    forever begin
      seq_item_port.get_next_item(item);
      intf.resetn <= item.resetn;
      intf.load <= item.load;
      intf.piso_in <= item.piso_in;
      intf.LSB <= item.LSB;
      @(negedge intf.clk);
      seq_item_port.item_done();
    end
  endtask

endclass
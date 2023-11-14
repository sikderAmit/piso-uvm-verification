class piso_mntr extends uvm_monitor;

  //factory class-type registration
  `uvm_component_utils(piso_mntr)

  //constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Monitor Constructed...", UVM_MEDIUM);
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Monitor build phase", UVM_MEDIUM);
  endfunction

  //connect phase
  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Monitor connect phase", UVM_MEDIUM);
  endfunction

  //run phase
  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Monitor run phase", UVM_MEDIUM);
  endtask

endclass
class piso_scb extends uvm_scoreboard;

  `uvm_component_utils(piso_scb)

  //constructor function
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Scb Constructed...", UVM_MEDIUM);
  endfunction

  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Scb build phase", UVM_MEDIUM);
  endfunction

  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Scb connect phase", UVM_MEDIUM);
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Scb run phase", UVM_MEDIUM);
  endtask

endclass
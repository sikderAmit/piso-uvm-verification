class piso_predictor extends uvm_component;

  `uvm_component_utils(piso_predictor)

  //constructor function
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Predictor Constructed...", UVM_MEDIUM);
  endfunction

  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Predictor build phase", UVM_MEDIUM);
  endfunction

  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Predictor connect phase", UVM_MEDIUM);
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Predictor run phase", UVM_MEDIUM);
  endtask

endclass
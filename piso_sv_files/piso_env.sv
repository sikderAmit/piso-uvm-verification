class piso_env extends uvm_env;

  `uvm_component_utils(piso_env)

  //handle declaration
  piso_agnt agn;
  piso_scb scb;
  piso_predictor prdr;

  //constructor function
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Env Constructed...", UVM_MEDIUM)
  endfunction

  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test build phase", UVM_MEDIUM);
    agn = piso_agnt::type_id::create("agn", this);
    scb = piso_scb::type_id::create("scb", this);
    prdr = piso_predictor::type_id::create("prdr", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test connect phase", UVM_MEDIUM);
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test run phase", UVM_MEDIUM);
  endtask

endclass
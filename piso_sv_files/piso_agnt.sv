class piso_agnt extends uvm_agent;

  //factory class-type registration
  `uvm_component_utils(piso_agnt)

  //handle declaration
  piso_drvr drvr;
  piso_mntr mntr;
  uvm_sequencer #(piso_seq_item) sqncr;

  //constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Agent Constructed...", UVM_MEDIUM);
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Agent build phase", UVM_MEDIUM);
    drvr = piso_drvr::type_id::create("drvr", this);
    mntr = piso_mntr::type_id::create("mntr", this);
    sqncr = uvm_sequencer #(piso_seq_item) ::type_id::create("sqncr", this);
  endfunction

  //connect phase
  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Agent connect phase", UVM_MEDIUM);
    drvr.seq_item_port.connect(sqncr.seq_item_export);
  endfunction

  //run phase
  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Agent run phase", UVM_MEDIUM);
  endtask

endclass
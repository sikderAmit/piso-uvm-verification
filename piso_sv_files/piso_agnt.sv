class piso_agnt extends uvm_agent;

  `uvm_component_utils(piso_agnt)

  //class handle declaration
  piso_drvr drvr;
  piso_mntr mntr;

  //sequencer port declaration
  uvm_sequencer #(piso_seq_item) sqncr;

  //constructor function
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Agent Constructed...", UVM_MEDIUM);
  endfunction

  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Agent build phase", UVM_MEDIUM);
    if(get_is_active()) begin
      drvr = piso_drvr::type_id::create("drvr", this);
      sqncr = uvm_sequencer #(piso_seq_item) ::type_id::create("sqncr", this);
    end
    mntr = piso_mntr::type_id::create("mntr", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Agent connect phase", UVM_MEDIUM);
    drvr.seq_item_port.connect(sqncr.seq_item_export);
  endfunction

  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Agent run phase", UVM_MEDIUM);
  endtask

endclass
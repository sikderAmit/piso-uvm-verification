class piso_test extends uvm_test;
  
  `uvm_component_utils(piso_test)
  
  //enviroment handle declaration
  piso_env env;
  
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Test Constructed...", UVM_MEDIUM);
  endfunction
  
  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test build phase", UVM_MEDIUM);
    env = piso_env::type_id::create("env", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test connect phase", UVM_MEDIUM);
  endfunction
  
  //run phase
  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test run phase", UVM_MEDIUM);
    phase.raise_objection(this);
    reset();
    write(8'b0101_1010);
    reset();
    write(8'b1100_0011);
    read(1'b1);
    phase.drop_objection(this);
    
  endtask
  
  //reset task
  task reset();
    reset_seq rst;
    rst = reset_seq::type_id::create("rst");
    rst.start(env.agn.sqncr);
  endtask
  
  //write task
  task write(logic [`WIDTH-1:0] tmp);
    write_seq wr;
    wr = write_seq::type_id::create("wr");
    wr.data = tmp;
    wr.start(env.agn.sqncr);
  endtask
  
  //read task
  task read(logic a);
    read_seq rd;
    rd = read_seq::type_id::create("rd");
    rd.x = a;
    rd.start(env.agn.sqncr);
  endtask
  
endclass
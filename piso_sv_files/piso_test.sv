class piso_test extends uvm_test;
  
  //factory class-type registration
  `uvm_component_utils(piso_test)
  
  //handle declaration
  piso_env env;
  
  //sequence handle declaration
  reset_seq rst;
  write_seq wr;
  read_seq rd;
  
  //constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);    
    `uvm_info(get_full_name(),"Test Constructed...", UVM_MEDIUM);
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test build phase", UVM_MEDIUM);
    env = piso_env::type_id::create("env", this);
  endfunction
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test connect phase", UVM_MEDIUM);
  endfunction
  
  //run phase
  task run_phase(uvm_phase phase);
    `uvm_info(get_full_name(),"Test run phase", UVM_MEDIUM);
    
    phase.raise_objection(this);
    
    reset();
    //write(8'b0101_1010);
    //reset();
    //write(8'b1100_0011);
    //read(1'b1);
    
    phase.drop_objection(this);
    
  endtask
  
  //reset task
  task reset();
    rst = reset_seq::type_id::create("rst");
    rst.start(env.agn.sqncr);
  endtask
  
  //write task
  task write(logic [`WIDTH-1:0] tmp);
    wr = write_seq::type_id::create("wr");
    wr.data = tmp;
    wr.start(env.agn.sqncr);
  endtask
  
  //read task
  task read(logic a);
    rd = read_seq::type_id::create("rd");
    rd.x = a;
    rd.start(env.agn.sqncr);
  endtask
  
endclass
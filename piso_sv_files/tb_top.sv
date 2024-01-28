/*-------------------------------------------------
  project				    : piso uvm testBench
  creator				    : Amit Sikder
  Created   			  : 14.11.2023
  Number of files   : 14
---------------------------------------------------
  Description: This is the top module
---------------------------------------------------
*/

module tb_top;

//clock generation
bit clk;
always #10 clk = ~clk;

//interface instanciation
piso_intf intf(clk);

//dut connection
piso DUT(
  .piso_out(intf.piso_out),
  .clk(clk),
  .resetn(intf.resetn),
  .load(intf.load),
  .LSB(intf.LSB),
  .piso_in(intf.piso_in)
);

//run test
initial begin
  uvm_config_db #(virtual piso_intf)::set(null, "*", "piso_intf", intf);
  run_test("piso_test");
end

//dump file
initial begin
  $dumpfile("dump.vcd"); 
  $dumpvars;
end

endmodule
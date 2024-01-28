/*-------------------------------------------------
	project			: piso uvm testBench
  	creator			: Amit Sikder
  	Created   		: 14.11.2023
   	Modified                : 28.01.2024
	Number of files 	: 14
---------------------------------------------------
	Description: This is the piso RTL
---------------------------------------------------
*/
`define WIDTH 8

module piso(
				output reg piso_out,
  				input clk, resetn, load, LSB,
  				input [`WIDTH-1:0] piso_in
			);
  
  reg [`WIDTH-1:0] tmp;
  
  always@(!resetn) tmp <= 8'b0;
  
  always@(posedge clk && resetn && load) tmp <= piso_in;
  
  always@(posedge clk && resetn && !load) begin
	
    if(!LSB) {piso_out, tmp} <= {tmp, 1'b0};
    else {tmp, piso_out} <= {1'b0, tmp};
    //$display($time, "ns data : %b", tmp);
    
  end
  
endmodule

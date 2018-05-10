`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:09 02/24/2018 
// Design Name: 
// Module Name:    sample_40kHz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sample_40kHz(
	input CLK,
	output trans
	);
	
	//define signals
	reg [10:0] pwm_base_reg = 11'h000;
	wire pwm_out;
	wire pwmbp;
	

//PWM Base Cycle Generate
	always @(posedge CLK) begin
		if (pwmbp == 1'b1) begin
			pwm_base_reg <= 11'h000;
		end
		else begin
			pwm_base_reg <= pwm_base_reg + 1'b1;
		end
	end
	
	assign pwmbp = (pwm_base_reg[10:0] == 11'd1249) ? 1'b1 : 1'b0;
	
	pwm_out = (pwm_base_reg[10:0] == 11'd1249) ? 1'b1 : 1'b0;
   assign trans = pwm_out;


endmodule

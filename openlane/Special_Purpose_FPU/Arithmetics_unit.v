/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit        ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                                ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                           ////
////                  muni_aditya@yahoo.com                        ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module arithmetics_unit( fir_term,sec_term , op_sel , clk, rst, enable,enable_function ,result  ,o_stb) ;

input [63:0] fir_term,sec_term;
input [1:0] op_sel;
input clk,rst,enable,enable_function;

//////////////inputs/////////////////

output reg[63:0] result;
output reg o_stb;

//////////////output/////////////////

wire div_ack,mult_ack,add_ack;
wire [63:0] add_result,div_result,mult_result;
wire add_enable_a,mult_enable_a,div_enable_a;
wire add_enable_b,mult_enable_b,div_enable_b;
wire add_o_stb , div_o_stb ,mult_o_stb;

wire input_add_a_ack,input_add_b_ack
	  ,input_mult_a_ack,input_mult_b_ack
	  ,input_div_a_ack,input_div_b_ack;
	  
reg [1:0] op_sel_reg;

//////////////wires/////////////////

double_adder add_op (
    .input_a(fir_term),
    .input_b(sec_term),
    .input_a_stb(add_enable_a),
    .input_b_stb(add_enable_b),
    .output_z_ack(add_ack),
    .clk(clk),
    .rst(rst),
    .output_z(add_result),
    .output_z_stb(add_o_stb),
	 .input_a_ack(input_add_a_ack),
    .input_b_ack(input_add_b_ack)
    );

double_multiplier mult_op (
    .input_a(fir_term),
    .input_b(sec_term),
    .input_a_stb(mult_enable_a),
    .input_b_stb(mult_enable_b),
    .output_z_ack(mult_ack),
    .clk(clk),
    .rst(rst),
    .output_z(mult_result),
    .output_z_stb(mult_o_stb),
	 .input_a_ack(input_mult_a_ack),
    .input_b_ack(input_mult_b_ack)
    );

double_divider div_op (
    .input_a(fir_term),
    .input_b(sec_term),
    .input_a_stb(div_enable_a),
    .input_b_stb(div_enable_b),
    .output_z_ack(div_ack),
    .clk(clk),
    .rst(rst),
    .output_z(div_result),
    .output_z_stb(div_o_stb),
	 .input_a_ack(input_div_a_ack),
    .input_b_ack(input_div_b_ack)
    );
//////////////Instantiations/////////////////

//Select which result to output
//ADD = 00 ,DIV =01 ,MULT = 10 ,NO-OP = 11
always @ (*)
 begin
  case(op_sel_reg)
   2'b00:result=add_result;
   2'b01:result=div_result;
   2'b10:result=mult_result;
   2'b11:result=64'bxxx;
   default:result=64'bxxx;
  endcase
 end

//Select which sub-unit to enable
//ADD = 00 ,DIV =01 ,MULT = 10 ,NO-OP = 11
assign add_enable_a = enable && (op_sel_reg==2'b00);
assign div_enable_a = enable && (op_sel_reg==2'b01);
assign mult_enable_a = enable && (op_sel_reg==2'b10);

assign add_enable_b = enable && (op_sel_reg==2'b00);
assign div_enable_b = enable && (op_sel_reg==2'b01);
assign mult_enable_b = enable && (op_sel_reg==2'b10);

//Select which o_stb to output
//ADD = 00 ,DIV =01 ,MULT = 10 ,NO-OP = 11
always @ (*)
 begin
  case(op_sel_reg)
   2'b00:o_stb = add_o_stb;
   2'b01:o_stb = div_o_stb;
   2'b10:o_stb = mult_o_stb;
   2'b11:o_stb = 1'b0;
   default:o_stb = 1'b0;
  endcase
end

//Output acknowledge always set to 1
//We don't use 2-way handshake
assign div_ack = 1'b1;
assign mult_ack = 1'b1;
assign add_ack = 1'b1;

always @ (posedge clk or posedge rst)
 begin
   if(rst)
	  op_sel_reg<=2'b11;
	else
	 begin
		if(enable_function)
		  op_sel_reg<=op_sel;
		else 
		  op_sel_reg<=op_sel_reg;
	 end
 end

endmodule

/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                          ////
////  Trigonometric functions using double precision Floating Point Unit////
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

//`define INPUT_WIDTH 32

module top( clk,rst,first_operand,sec_operand,operation,result,done) ;

input clk,rst;
input [15:0] first_operand,sec_operand;
input [8:0] operation;
////////////// INPUTS ///////////////

output [63:0] result;
output done;
////////////// OUTPUTS //////////////

wire [2:0] first_actv,sec_actv;
wire function_result_fir_done,function_result_sec_done;
wire enable_arithmetics,enable_function;
wire [1:0] op_sel;
wire [63:0] function_fir_result,function_sec_result;
////////////// WIRES  //////////////

//Arithmetics Unit
//Unit that performs the floating point mathematical operations
//Operations supported -> Addition,Substraction,Multiplication,Division
//Input 2 64-bit floating point numbers - Output 64-bit floating point
arithmetics_unit 	arithmetics_unit_UUT (
    .fir_term(function_fir_result),
    .sec_term(function_sec_result),
    .op_sel(op_sel),
    .clk(clk),
    .rst(rst),
    .enable(enable_arithmetics),
	 .enable_function(enable_function),
    .result(result),
    .o_stb(done)
    );

//Function Unit
//Unit that performs a trigonometric function on the input
//Supports sin,cos,tan and their inverses
//Input an integer - Output 64-bit floating point
function_unit function_unit_UUT (
    .enable(enable_function),
    .degrees(first_operand),
    .data1(function_fir_result),
    .rst(rst),
    .actv(first_actv),
    .clk(clk),
	 .done(function_result_fir_done)
    );

function_unit function_unit_UUT_2 (
    .enable(enable_function),
    .degrees(sec_operand),
    .data1(function_sec_result),
    .rst(rst),
    .actv(sec_actv),
    .clk(clk),
	 .done(function_result_sec_done)
    );

assign enable_arithmetics = function_result_fir_done && function_result_sec_done;

//Control Unit
//Controls the user input and does the decoding
//TODO//Pipelining main unit
control_unit control_unit_UUT (
    .operation(operation),
    .first_actv(first_actv),
    .sec_actv(sec_actv),
    .enable_function(enable_function),
    .op_sel(op_sel)
    );

///////////////  INSTANTIATIONS /////////
endmodule

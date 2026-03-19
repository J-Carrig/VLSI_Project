/////////////////////////////////////////////////////////////////////
////                                                             ////
////                                                             ////
////  Trigonometric functions using                              ////
////  double precision Floating Point Unit                       ////
////                                                             ////
////  Author: Muni Aditya                                        ////
////          muni_aditya@yahoo.com                              ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2013 Muni Aditya                              ////
////                  muni_aditya@yahoo.com                      ////
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

`define INPUT_WIDTH 16

/*
3'b000:		sin
3'b001:		cos
3'b010:		tan
3'b011:		csc
3'b100:	 	sec
3'b101:  	cot

*/


module top_fpu_tb;


reg enable;
reg [`INPUT_WIDTH-1:0] degrees ;
reg rst;
reg [2:0] actv;
reg clk;
wire [63:0] data1;


function_unit u1 (.enable(enable), .degrees(degrees), .data1(data1), .rst(rst), .actv(actv), .clk(clk), .done(done));

always  #5 clk = !clk;

initial



begin
  $dumpfile("gtk_top_fpu_tb.vcd");
  $dumpvars(0, top_fpu_tb);
  rst = 1'b0 ;
  clk = 1'b0 ;
 #100
 @(posedge clk) ;
  rst <= 1'b0 ;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 enable <= 1'b1;


#50

// QUADRANT 1
  degrees <= `INPUT_WIDTH'd82;
  actv <= 3'b000;
  enable = 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 if (data1==64'h3fefb046a930947a)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

  degrees <= `INPUT_WIDTH'd14;
  actv <= 3'b001;
  enable = 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 if (data1==64'h3fef0ca99f79ba25)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

  degrees <= `INPUT_WIDTH'd365;
  actv <= 3'b010;
  enable = 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 if (data1==64'h3fb665a8349d55e1)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

  degrees <= `INPUT_WIDTH'd45;
  actv <= 3'b011;
  enable = 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 if (data1==64'h3ff6a09e667f3bcd)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

  degrees <= `INPUT_WIDTH'd3;
  actv <= 3'b100;
  enable = 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 if (data1==64'h3ff0059f0252e0bc)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

  degrees <= `INPUT_WIDTH'd67;
  actv <= 3'b101;
  enable = 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 if (data1==64'h3fdb2a986b66229e)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


// QUADRANT 2

enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd112;
  actv <= 3'b000;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
   if (data1==64'h3fedab7d7997cb58)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd101;
  actv <= 3'b001;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  if (data1==64'hbfc86c6ddd76624f)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd177;
  actv <= 3'b010;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
   if (data1==64'hbfaad53144273e6e)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd495;
  actv <= 3'b011;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  if (data1==64'h3ff6a09e667f3bcc)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);

enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd123;
  actv <= 3'b100;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
   if (data1==64'hbffd6093ce555fa7)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd92;
  actv <= 3'b101;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
   if (data1==64'hbfa1e12295d61fc0)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


// QUADRANT 3


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd200;
  actv <= 3'b000;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  if (data1==64'hbfd5e3a8748a0bf4)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd266;
  actv <= 3'b001;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
   if (data1==64'hbfb1db8f6d6a513c)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd555;
  actv <= 3'b010;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  if (data1==64'h3fd126145e9ecd56)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd610;
  actv <= 3'b011;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  if (data1==64'hbff106df459ea072)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd245;
  actv <= 3'b100;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
   if (data1==64'hc002edfb187b113a)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd232;
  actv <= 3'b101;
  enable <= 1'b1;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  if (data1==64'h3fe9004ab6d5cc8e)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


	// QUADRANT 4

enable <= 1'b0;
 @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd355;
  actv <= 3'b000;
  enable <= 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
  if (data1==64'hbfb64fd6b8c2810d)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd330;
  actv <= 3'b001;
  enable <= 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 if (data1==64'h3febb67ae8584ca8)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);



enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd281;
  actv <= 3'b010;
  enable <= 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
  if (data1==64'hc0149405f7cc6442)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd300;
  actv <= 3'b011;
  enable <= 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
   if (data1==64'hbff279a74590331d)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);



enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd670;
  actv <= 3'b100;
  enable = 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
   if (data1==64'h3ff8e43eaadf9334)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);



enable <= 1'b0;
  @(posedge clk) ;
  @(posedge clk) ;
  @(posedge clk) ;
  degrees <= `INPUT_WIDTH'd341;
  actv <= 3'b101;
  enable <= 1'b1;

 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
 @(posedge clk) ;
  if (data1==64'hc0073bd2e9a270e0)
	$display($time,"ps For input %d Answer is correct %h", degrees, data1);
else
	$display($time,"ps Error! for input %d out is incorrect %h", degrees, data1);


  #50

  $finish;

  end
 initial begin
	$dumpfile("fpu.vcd");
	$dumpvars;
end

endmodule

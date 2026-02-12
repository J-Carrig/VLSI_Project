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

`define INPUT_WIDTH 16

module cotangent_lut (quad, enable, degrees, data, rst, clk,done_in,done_out);

input done_in;
input [1:0] quad;
input enable;
input rst;
input [`INPUT_WIDTH-1:0] degrees ;
input clk;

//////////////inputs/////////////////

output reg [63:0] data;
output reg done_out;

//////////////output/////////////////


always@(posedge clk )
 begin
  if(rst)
    done_out<=1'b0;
  else
    done_out<=done_in;
 end

always@(posedge clk )

// needs to be positive in first and third quadrants

 begin
        if (quad == 2'b01 || quad == 2'b11)
        begin
        data[63] <= 1'b1;
        end

        else
        begin
        data[63] <= 1'b0;
        end


	if(enable)
	case (degrees)

//look up table

`INPUT_WIDTH'd0  : data[62:0] <= 63'h7ff0000000000000;
`INPUT_WIDTH'd1  : data[62:0] <= 63'h404ca51d76749a71;
`INPUT_WIDTH'd2  : data[62:0] <= 63'h403ca2e17ec2185c;
`INPUT_WIDTH'd3  : data[62:0] <= 63'h403314c55fbc4c66;
`INPUT_WIDTH'd4  : data[62:0] <= 63'h402c99f0ed772d4c;
`INPUT_WIDTH'd5  : data[62:0] <= 63'h4026dc2fd0bfdbe2;
`INPUT_WIDTH'd6  : data[62:0] <= 63'h4023075ac71a38c7;
`INPUT_WIDTH'd7  : data[62:0] <= 63'h402049e7c666e3fe;
`INPUT_WIDTH'd8  : data[62:0] <= 63'h401c76237b025ae8;
`INPUT_WIDTH'd9  : data[62:0] <= 63'h4019414813ba662c;
`INPUT_WIDTH'd10  : data[62:0] <= 63'h4016af648056a136;
`INPUT_WIDTH'd11  : data[62:0] <= 63'h40149405f7cc644c;
`INPUT_WIDTH'd12  : data[62:0] <= 63'h4012d18a8e2ff28c;
`INPUT_WIDTH'd13  : data[62:0] <= 63'h4011536e695dda94;
`INPUT_WIDTH'd14  : data[62:0] <= 63'h40100b0a2833d3c4;
`INPUT_WIDTH'd15  : data[62:0] <= 63'h400ddb3d742c2656;
`INPUT_WIDTH'd16  : data[62:0] <= 63'h400be6398b3f2869;
`INPUT_WIDTH'd17  : data[62:0] <= 63'h400a2ab4c713671d;
`INPUT_WIDTH'd18  : data[62:0] <= 63'h40089f188bdcd7b0;
`INPUT_WIDTH'd19  : data[62:0] <= 63'h40073bd2e9a270e1;
`INPUT_WIDTH'd20  : data[62:0] <= 63'h4005fad570f872d9;
`INPUT_WIDTH'd21  : data[62:0] <= 63'h4004d738ef803784;
`INPUT_WIDTH'd22  : data[62:0] <= 63'h4003ccfa561175d6;
`INPUT_WIDTH'd23  : data[62:0] <= 63'h4002d8c9200b5686;
`INPUT_WIDTH'd24  : data[62:0] <= 63'h4001f7e220cc4172;
`INPUT_WIDTH'd25  : data[62:0] <= 63'h400127f33e8d12e5;
`INPUT_WIDTH'd26  : data[62:0] <= 63'h40006705b35391e7;
`INPUT_WIDTH'd27  : data[62:0] <= 63'h3fff66da45fee3f1;
`INPUT_WIDTH'd28  : data[62:0] <= 63'h3ffe1774a2562593;
`INPUT_WIDTH'd29  : data[62:0] <= 63'h3ffcdd612dd501f4;
`INPUT_WIDTH'd30  : data[62:0] <= 63'h3ffbb67ae8584cab;
`INPUT_WIDTH'd31  : data[62:0] <= 63'h3ffaa0e385c196ab;
`INPUT_WIDTH'd32  : data[62:0] <= 63'h3ff99af8610e4105;
`INPUT_WIDTH'd33  : data[62:0] <= 63'h3ff8a34971bd700d;
`INPUT_WIDTH'd34  : data[62:0] <= 63'h3ff7b891d9a169b2;
`INPUT_WIDTH'd35  : data[62:0] <= 63'h3ff6d9b1b96ce128;
`INPUT_WIDTH'd36  : data[62:0] <= 63'h3ff605a90c73ab7a;
`INPUT_WIDTH'd37  : data[62:0] <= 63'h3ff53b9359d2f919;
`INPUT_WIDTH'd38  : data[62:0] <= 63'h3ff47aa413b0ee1f;
`INPUT_WIDTH'd39  : data[62:0] <= 63'h3ff3c2238553dcef;
`INPUT_WIDTH'd40  : data[62:0] <= 63'h3ff3116c3711527e;
`INPUT_WIDTH'd41  : data[62:0] <= 63'h3ff267e8b3f5da83;
`INPUT_WIDTH'd42  : data[62:0] <= 63'h3ff1c511a0db83e3;
`INPUT_WIDTH'd43  : data[62:0] <= 63'h3ff1286c17acf49d;
`INPUT_WIDTH'd44  : data[62:0] <= 63'h3ff091883bfbf42e;
`INPUT_WIDTH'd45  : data[62:0] <= 63'h3ff0000000000000;
`INPUT_WIDTH'd46  : data[62:0] <= 63'h3feee6ec253d2462;
`INPUT_WIDTH'd47  : data[62:0] <= 63'h3fedd729e0bf9cb6;
`INPUT_WIDTH'd48  : data[62:0] <= 63'h3fecd01c246e4060;
`INPUT_WIDTH'd49  : data[62:0] <= 63'h3febd1326bb88d0f;
`INPUT_WIDTH'd50  : data[62:0] <= 63'h3fead9e7783fbf1e;
`INPUT_WIDTH'd51  : data[62:0] <= 63'h3fe9e9c0346ca837;
`INPUT_WIDTH'd52  : data[62:0] <= 63'h3fe9004ab6d5cc91;
`INPUT_WIDTH'd53  : data[62:0] <= 63'h3fe81d1d621eb710;
`INPUT_WIDTH'd54  : data[62:0] <= 63'h3fe73fd61d9df543;
`INPUT_WIDTH'd55  : data[62:0] <= 63'h3fe66819a3a0bf7a;
`INPUT_WIDTH'd56  : data[62:0] <= 63'h3fe59592e296c626;
`INPUT_WIDTH'd57  : data[62:0] <= 63'h3fe4c7f26ed1d60e;
`INPUT_WIDTH'd58  : data[62:0] <= 63'h3fe3feee02d72515;
`INPUT_WIDTH'd59  : data[62:0] <= 63'h3fe33a400c85af9d;
`INPUT_WIDTH'd60  : data[62:0] <= 63'h3fe279a74590331b;
`INPUT_WIDTH'd61  : data[62:0] <= 63'h3fe1bce655fbb9bf;
`INPUT_WIDTH'd62  : data[62:0] <= 63'h3fe103c37f7ebedc;
`INPUT_WIDTH'd63  : data[62:0] <= 63'h3fe04e0850c1dd5c;
`INPUT_WIDTH'd64  : data[62:0] <= 63'h3fdf3702bf455cf5;
`INPUT_WIDTH'd65  : data[62:0] <= 63'h3fddd7fc13699ab1;
`INPUT_WIDTH'd66  : data[62:0] <= 63'h3fdc7ea074a90a0c;
`INPUT_WIDTH'd67  : data[62:0] <= 63'h3fdb2a986b66229e;
`INPUT_WIDTH'd68  : data[62:0] <= 63'h3fd9db90d0ac0d40;
`INPUT_WIDTH'd69  : data[62:0] <= 63'h3fd8913a75259d07;
`INPUT_WIDTH'd70  : data[62:0] <= 63'h3fd74b49cf3902d4;
`INPUT_WIDTH'd71  : data[62:0] <= 63'h3fd60976af8c1612;
`INPUT_WIDTH'd72  : data[62:0] <= 63'h3fd4cb7bfb4961ae;
`INPUT_WIDTH'd73  : data[62:0] <= 63'h3fd391176b8feb5b;
`INPUT_WIDTH'd74  : data[62:0] <= 63'h3fd25a0951873b22;
`INPUT_WIDTH'd75  : data[62:0] <= 63'h3fd126145e9ecd56;
`INPUT_WIDTH'd76  : data[62:0] <= 63'h3fcfe9fae1181f54;
`INPUT_WIDTH'd77  : data[62:0] <= 63'h3fcd8d16c1491594;
`INPUT_WIDTH'd78  : data[62:0] <= 63'h3fcb350dac76234b;
`INPUT_WIDTH'd79  : data[62:0] <= 63'h3fc8e174375dceb6;
`INPUT_WIDTH'd80  : data[62:0] <= 63'h3fc691e1ebc5cbbb;
`INPUT_WIDTH'd81  : data[62:0] <= 63'h3fc445f0fbb1cf92;
`INPUT_WIDTH'd82  : data[62:0] <= 63'h3fc1fd3df8664fe5;
`INPUT_WIDTH'd83  : data[62:0] <= 63'h3fbf6ecf19881d32;
`INPUT_WIDTH'd84  : data[62:0] <= 63'h3fbae81c75231d97;
`INPUT_WIDTH'd85  : data[62:0] <= 63'h3fb665a8349d55e1;
`INPUT_WIDTH'd86  : data[62:0] <= 63'h3fb1e6b93a693204;
`INPUT_WIDTH'd87  : data[62:0] <= 63'h3faad53144273e72;
`INPUT_WIDTH'd88  : data[62:0] <= 63'h3fa1e12295d61fc2;
`INPUT_WIDTH'd89  : data[62:0] <= 63'h3f91dfbd9410a422;
`INPUT_WIDTH'd90  : data[62:0] <= 63'h0000000000000000;


default:data <= 64'h0;

endcase

else
  data <= 64'hxxxxxxxxxxxxxxx;



end


endmodule

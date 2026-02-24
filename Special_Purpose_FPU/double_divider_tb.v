`timescale 1ns/1ps


module double_divider_tb();
reg clk;
reg rst;
wire [63:0]input_a;
wire [63:0]input_b;
wire [63:0]output_z;
reg output_z_ack;
wire output_z_stb;
reg input_a_stb;
reg input_b_stb;
wire input_a_ack;
wire input_b_ack;
reg [63:0] Tin_a;
reg [63:0] Tin_b;
reg [63:0] array_a [0:cases-1];
reg [63:0] array_b [0:cases-1];
reg [63:0] array_out [0:cases-1];
integer i,j;
parameter cases = 2024;

initial
    begin
        $dumpfile("gtk_double_divider.vcd");
        $dumpvars(0, double_divider_tb);
        clk = 0;
        rst = 0;
        i = 0;
  		  j=0;
  		  input_a_stb = 1'b1;
  		  input_b_stb = 1'b1;
  		  output_z_ack = 1'b1;
        $readmemh("div_stim_a.txt" , array_a ); // initialize memory a
        $readmemh("div_stim_b.txt" , array_b );// initialize memory b
		  $readmemh("div_output.txt" , array_out );// Initialize output memory
        Tin_a = 64'h0;
        Tin_b = 64'h0;
        #10 rst = ~rst;
        #10 rst = ~rst;
    end

always
	begin
		#5 clk=~clk;
	end

//Input
always@(posedge clk or posedge rst)
    begin
        if(rst)
            begin
                Tin_a <= 64'h0;
                Tin_b <= 64'h0;
            end
        else
            begin
                Tin_a <= array_a[i];
                Tin_b <= array_b[i];
            end
    end

//Tests
always@(posedge clk)
    begin
        if(output_z_stb == 1)
            begin
					 //checking for correct output
					 if(array_out[i] == output_z )
					  begin
					  $display("Test %d|%d is correct",i+1 , cases);
					  j=j+1;
					  end

					 if(j==cases && i==cases-1)
					   $display("All tests are correct !!");
					 else if(j!=cases && i==cases-1)
					   $display("%d out of %d are correct !!",j,cases);
                //increasing index going to next set of inputs
					 i = i + 1;

            end
    end

//Instantiation
double_divider uut(.input_a(input_a),
                 .input_b(input_b),
                 .input_a_stb(input_a_stb),
                 .input_b_stb(input_b_stb),
                 .output_z_ack(output_z_ack),
                 .clk(clk),
                 .rst(rst),
                 .output_z(output_z),
                 .output_z_stb(output_z_stb),
                 .input_a_ack(input_a_ack),
                 .input_b_ack(input_b_ack)
                 );

assign input_a = Tin_a;
assign input_b = Tin_b;

endmodule

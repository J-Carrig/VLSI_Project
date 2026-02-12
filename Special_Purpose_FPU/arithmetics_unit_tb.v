`timescale 1ns/1ps

module arithmetics_unit_tb();

parameter cases = 132;

reg clk;
reg rst;
wire [63:0]input_a;
wire [63:0]input_b;
wire [63:0]output_z;
reg enable;
wire o_stb;
wire [1:0] op_sel;
reg enable_function;
reg [1:0] Tin_op;
reg [63:0] Tin_a;
reg [63:0] Tin_b;
reg [63:0] array_a [0:cases-1];
reg [1:0] array_op [0:cases-1];
reg [63:0] array_b [0:cases-1];
reg [63:0] array_out [0:cases-1];
integer i,j,k;


initial
    begin
        $dumpfile("gtk_arithmetics_unit_tb.vcd");
        $dumpvars(0, arithmetics_unit_tb);
	     for(k=0;k<132;k=k+3)
		   begin
		    array_op[k]=2'b00;
			 array_op[k+1]=2'b01;
			 array_op[k+2]=2'b10;
			end
	     
        clk = 0;
        rst = 0;
        i = 0;
  		  j=0;
        enable=1;
		  enable_function=1;
        $readmemh("arithmetics_stim_a.txt" , array_a ); // initialize memory a
        $readmemh("arithmetics_stim_b.txt" , array_b );// initialize memory b
		  $readmemh("arithmetics_output.txt" , array_out );// Initialize output memory
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
                Tin_op <= 2'h0;
            end
        else
            begin
                Tin_a <= array_a[i];
                Tin_b <= array_b[i];
                Tin_op <= array_op[i];
            end
    end

//Tests
always@(posedge clk)
    begin
        if(o_stb == 1)
            begin
					 //checking for correct output
					 if(array_out[i] == output_z )
					  begin
					  $display("Test %d / %d is correct",i+1,cases);
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
arithmetics_unit uut (
    .fir_term(input_a),
    .sec_term(input_b),
    .op_sel(op_sel),
    .clk(clk),
    .rst(rst),
    .enable(enable),
	 .enable_function(enable_function),
    .result(output_z),
    .o_stb(o_stb)
    );

assign input_a = Tin_a;
assign input_b = Tin_b;
assign op_sel = Tin_op;

endmodule

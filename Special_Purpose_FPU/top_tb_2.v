`timescale 1ns/1ps

module top_tb_2();
reg clk;
reg rst;
wire [15:0]input_a;
wire [15:0]input_b;
wire [63:0]output_z;
wire done;
wire [8:0]operation;
reg wait_flag;
reg [9:0] Tin_op;
reg [15:0] Tin_a;
reg [15:0] Tin_b;
reg [63:0] array_a [0:8];
reg [15:0] array_b [0:8];
reg [8:0] array_op [0:8];
reg [63:0] array_out [0:8];

integer i,j;
parameter cases=9;

initial
    begin
        $dumpfile("gtk_top2.vcd");
        $dumpvars(0, top_tb_2);
        array_op[0]=10'b000000001;
        array_op[1]=10'b000001001;
        array_op[2]=10'b010101001;
        array_op[3]=10'b000000101;
        array_op[4]=10'b000001101;
        array_op[5]=10'b010101101;
        array_op[6]=10'b000001011;
        array_op[7]=10'b000000011;
        array_op[8]=10'b010101011;

        clk = 0;
        rst = 0;
        i = 0;
  		  j=0;
        $readmemh("top_input_a.txt" , array_a ); // initialize memory a
        $readmemh("top_input_b.txt" , array_b );// initialize memory b
		  $readmemh("top_output.txt" , array_out );// Initialize output memory
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
                Tin_a <= 16'h0;
					 Tin_b <= 16'h0;
                Tin_op <= 8'h0;
					 wait_flag<=1'b0;
            end
        else if (wait_flag==1'b0)
            begin
                Tin_a <= array_a[i];
                Tin_b <= array_b[i];
                Tin_op <= array_op[i];
					 wait_flag<=1'b1;
            end
		  else if (wait_flag==1'b1 && done==1'b0 )
            begin
                Tin_a <= 16'h0;
					 Tin_b <= 16'h0;
                Tin_op <= 8'h0;
					 wait_flag<=1'b1;
            end
		  else
		     begin
                Tin_a <= 16'h0;
					 Tin_b <= 16'h0;
                Tin_op <= 8'h0;
					 wait_flag<=1'b0;
			  end
    end


//Tests
always@(posedge done)
    begin
        if(done == 1)
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
top top_UUT (
    .clk(clk),
    .rst(rst),
    .first_operand(input_a),
    .sec_operand(input_b),
    .operation(operation),
    .result(output_z),
    .done(done)
    );

assign input_a = Tin_a;
assign input_b = Tin_b;
assign operation = Tin_op;

endmodule

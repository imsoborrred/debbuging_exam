module four_bit_counter(
	input logic S, //select line in diagram Line
	input logic up_and_down, // select for up or down count
	input logic clk,
	input logic reset,
	input logic [3:0] D,
	output logic [3:0] qout ,//up output
	output logic [3:0] dout //down output

	);
	wire [3:0]y;
	wire [3:0]w;//up
	wire [3:0] q;
	wire [3:0] ud; //down
	wire [3:0] bb; // value for up or down
	
	assign bb = up_and_down ? w : ud; // which to store up or down ?
	assign y = S ? D : bb; // pass value of Y to flip flop
	//up ward
	assign qout=q;
	assign w[0]=~q[0] ;
	assign w[1]=q[0]^q[1];
	assign w[2]=(q[0]&q[1]) ^ q[2];
	assign w[3]=(q[0]&q[1]&q[2]) ^ q[3] ;
	
	// down ward
	assign dout=q;
	assign ud[0]=~q[0] ;
	assign ud[1]=(~q[0])^(q[1]);
	assign ud[2]=(q[2])^(~q[1]&~q[0]);
	assign ud[3]=(q[3])^(~q[1]&~q[0]&~q[2]) ;
	
d_flip_flop f1(.data(y[0]),.reset(reset),.q(q[0]),.clk(clk));
d_flip_flop f2(.data(y[1]),.reset(reset),.q(q[1]),.clk(clk));
d_flip_flop f3(.data(y[2]),.reset(reset),.q(q[2]),.clk(clk));
d_flip_flop f4(.data(y[3]),.reset(reset),.q(q[3]),.clk(clk));
    
endmodule
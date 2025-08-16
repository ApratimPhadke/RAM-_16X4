`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2025 01:35:06 AM
// Design Name: 
// Module Name: ram16x4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
/*

module ram16x4 #(
parameter integer DATA_WIDTH = 4,
parameter integer DEPTH =16 )(
input wire clk,
input wire write_enable,
input wire [$clog2(DEPTH)-1:0] addr,
input wire [(DATA_WIDTH -1) :0] data_in,
output wire  [(DATA_WIDTH -1) :0] data_out 
);
reg [DATA_WIDTH -1:0] memory [0:DEPTH-1];
always @(posedge clk) begin 
if(write_enable) begin 
memory[addr]<=data_in;
end 
end 
assign data_out = memory[addr];
endmodule 
*/

module ram16x4 #(
    parameter integer DATA_WIDTH = 4,
    parameter integer DEPTH = 16
) (
    input wire clk,
    input wire write_enable,
    input wire [$clog2(DEPTH)-1:0] addr,
    input wire [(DATA_WIDTH -1):0] data_in,
    output reg [(DATA_WIDTH -1):0] data_out   // <-- make output reg
);

    reg [DATA_WIDTH -1:0] memory [0:DEPTH -1];

    // Write logic
    always @(posedge clk) begin 
        if(write_enable) begin 
            memory[addr] <= data_in;
        end
        data_out <= memory[addr];   // <-- register the read data
    end 

    // Initialize memory
    integer j;
    initial begin
        for (j=0; j<DEPTH; j=j+1) begin
            memory[j] = {DATA_WIDTH{1'b0}};
        end
    end

endmodule

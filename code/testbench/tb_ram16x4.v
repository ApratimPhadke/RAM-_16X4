`timescale 1ns/1ps

module tb_ram16x4;

    // Parameters
    localparam DATA_WIDTH = 4;
    localparam DEPTH = 16;

    // Signals
    reg clk;
    reg write_enable;
    reg [$clog2(DEPTH)-1:0] addr;
    reg [DATA_WIDTH-1:0] data_in;
    wire [DATA_WIDTH-1:0] data_out;

    // DUT instance
    ram16x4 #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .write_enable(write_enable),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Init
        clk = 0;
        write_enable = 0;
        addr = 0;
        data_in = 0;

        // Write data
        #10;
        write_enable = 1; addr = 4'd3; data_in = 4'b1010;  // Write 0xA at addr=3
        #10;
        write_enable = 0; addr = 4'd3;                     // Read back addr=3
        #10;

        // Another write
        write_enable = 1; addr = 4'd5; data_in = 4'b1100;  // Write 0xC at addr=5
        #10;
        write_enable = 0; addr = 4'd5;                     // Read back addr=5
        #10;

        // Finish
        $stop;
    end

endmodule

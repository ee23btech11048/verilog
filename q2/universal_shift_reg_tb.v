`timescale 1ns / 1ps

module universal_shift_reg_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg [8:0] select;
    reg [15:0] parallel_in;
    reg serial_left_data_in;
    reg serial_right_data_in;

    // Outputs
    wire [15:0] p_dout;
    wire s_left_dout;
    wire s_right_dout;

    // Instantiate the Universal Shift Register module
    universal_shift_reg dut (
        .clk(clk),
        .rst_n(rst_n),
        .select(select),
        .parallel_in(parallel_in),
        .serial_left_data_in(serial_left_data_in),
        .serial_right_data_in(serial_right_data_in),
        .p_dout(p_dout),
        .s_left_dout(s_left_dout),
        .s_right_dout(s_right_dout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset generation
    initial begin
        rst_n = 1'b0;
        #10;
        rst_n = 1'b1;
        #10;
    end

    // Stimulus
    initial begin
        // Initialize inputs
        select = 9'b000000001; // Example: SISO left mode
        parallel_in = 16'b1100110011001100;
        serial_left_data_in = 1'b1;
        serial_right_data_in = 1'b0;

        // End simulation after some time
        #1000;
        $finish;
    end

    // Dump VCD file
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, universal_shift_reg_tb);
    end

endmodule


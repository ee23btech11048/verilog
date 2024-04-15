`timescale 1ns / 1ps

module wallace_tree_multiplier_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Output
    wire [7:0] P;

    // Instantiate the Wallace Tree Multiplier module
    wallace_tree_multiplier dut (
        .A(A),
        .B(B),
        .P(P)
    );

    // Clock
    reg clk = 1'b0;

    // Toggle clock
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $dumpfile("wallace_tree_multiplier_tb.vcd");
        $dumpvars(0, wallace_tree_multiplier_tb);

        // Test cases
        A = 4'b0001; B = 4'b0001; #10; // A * B = 1 * 1 = 1
        A = 4'b0010; B = 4'b0010; #10; // A * B = 2 * 2 = 4
        A = 4'b0011; B = 4'b0011; #10; // A * B = 3 * 3 = 9
        A = 4'b0101; B = 4'b0111; #10; // A * B = 5 * 7 = 35

        // Add more test cases here if needed

        // End simulation
        $finish;
    end

    // Display results
    always @* begin
        $display("A = %b, B = %b, P = %b", A, B, P);
    end

endmodule


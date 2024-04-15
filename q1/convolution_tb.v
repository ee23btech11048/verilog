module convolution_tb;

    // Inputs
    reg [3:0] x [0:7];
    reg [3:0] h [0:7];

    // Outputs
    wire [3:0] y0, y1, y2, y3, y4, y5, y6, y7;
    wire [3:0] y8, y9, y10, y11, y12, y13, y14, y15;

    // Clock
    reg clk = 0;

    // Instantiate the convolution module
    convolution dut (
        // Inputs
        .x0(x[0]), .x1(x[1]), .x2(x[2]), .x3(x[3]),
        .x4(x[4]), .x5(x[5]), .x6(x[6]), .x7(x[7]),
        .h0(h[0]), .h1(h[1]), .h2(h[2]), .h3(h[3]),
        .h4(h[4]), .h5(h[5]), .h6(h[6]), .h7(h[7]),
        // Outputs
        .y0(y0), .y1(y1), .y2(y2), .y3(y3),
        .y4(y4), .y5(y5), .y6(y6), .y7(y7),
        .y8(y8), .y9(y9), .y10(y10), .y11(y11),
        .y12(y12), .y13(y13), .y14(y14), .y15(y15),
        // Clock (assuming it's named clk in convolution module)
        .clk(clk)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Initialize inputs
        x[0] = 4'b0001; x[1] = 4'b0010; x[2] = 4'b0011; x[3] = 4'b0100;
        x[4] = 4'b0101; x[5] = 4'b0110; x[6] = 4'b0111; x[7] = 4'b1000;

        h[0] = 4'b1000; h[1] = 4'b0111; h[2] = 4'b0110; h[3] = 4'b0101;
        h[4] = 4'b0100; h[5] = 4'b0011; h[6] = 4'b0010; h[7] = 4'b0001;

        // Dump VCD file
        $dumpfile("simulation_output.vcd");
        $dumpvars(0, convolution_tb);

        // Simulate for 100 time units
        #100;

        // Display output
        $display("Output vector y:");
        $display("y0 = %b", y0);
        $display("y1 = %b", y1);
        $display("y2 = %b", y2);
        $display("y3 = %b", y3);
        $display("y4 = %b", y4);
        $display("y5 = %b", y5);
        $display("y6 = %b", y6);
        $display("y7 = %b", y7);
        $display("y8 = %b", y8);
        $display("y9 = %b", y9);
        $display("y10 = %b", y10);
        $display("y11 = %b", y11);
        $display("y12 = %b", y12);
        $display("y13 = %b", y13);
        $display("y14 = %b", y14);
        $display("y15 = %b", y15);

        // End simulation
        $finish;
    end

endmodule


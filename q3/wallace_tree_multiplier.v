module wallace_tree_multiplier (
    input [3:0] A, // 4-bit input A
    input [3:0] B, // 4-bit input B
    output reg [7:0] P // 8-bit output P
);

    reg [5:0] S [0:2]; // Sum register array
    reg [5:0] C [0:1]; // Carry register array
    reg [3:0] P_part [0:3]; // Partial product register array

    // Generate partial products
    always @* begin
        P_part[0] = {A[0], B[0], 2'b00};
        P_part[1] = {A[1], B[1], 2'b00};
        P_part[2] = {A[2], B[2], 2'b00};
        P_part[3] = {A[3], B[3], 2'b00};
    end

    // Wallace Tree Reduction
    always @* begin
        // First Reduction Stage
        S[0] = P_part[0] + P_part[1];
        C[0] = &{1'b0, P_part[0], P_part[1]};

        // Second Reduction Stage
        S[1] = P_part[2] + P_part[3] + C[0];
        C[1] = &{P_part[2], P_part[3], C[0]};

        // Final Reduction Stage
        P = S[1] + C[1];
    end

endmodule


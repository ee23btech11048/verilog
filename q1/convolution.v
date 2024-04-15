module convolution (
    // Inputs
    input [3:0] x0, x1, x2, x3, x4, x5, x6, x7,
    input [3:0] h0, h1, h2, h3, h4, h5, h6, h7,
    // Output
    output reg [3:0] y0, y1, y2, y3, y4, y5, y6, y7,
    output reg [3:0] y8, y9, y10, y11, y12, y13, y14, y15,
     input  clk
);

    // Convolution operation
    always @* begin
        y0  = x0  * h7  + x1  * h6  + x2  * h5  + x3  * h4  +
              x4  * h3  + x5  * h2  + x6  * h1  + x7  * h0;
        y1  = x0  * h6  + x1  * h5  + x2  * h4  + x3  * h3  +
              x4  * h2  + x5  * h1  + x6  * h0  + x7  * h7;
        y2  = x0  * h5  + x1  * h4  + x2  * h3  + x3  * h2  +
              x4  * h1  + x5  * h0  + x6  * h7  + x7  * h6;
        y3  = x0  * h4  + x1  * h3  + x2  * h2  + x3  * h1  +
              x4  * h0  + x5  * h7  + x6  * h6  + x7  * h5;
        y4  = x0  * h3  + x1  * h2  + x2  * h1  + x3  * h0  +
              x4  * h7  + x5  * h6  + x6  * h5  + x7  * h4;
        y5  = x0  * h2  + x1  * h1  + x2  * h0  + x3  * h7  +
              x4  * h6  + x5  * h5  + x6  * h4  + x7  * h3;
        y6  = x0  * h1  + x1  * h0  + x2  * h7  + x3  * h6  +
              x4  * h5  + x5  * h4  + x6  * h3  + x7  * h2;
        y7  = x0  * h0  + x1  * h7  + x2  * h6  + x3  * h5  +
              x4  * h4  + x5  * h3  + x6  * h2  + x7  * h1;
        y8  = x1  * h0  + x2  * h7  + x3  * h6  + x4  * h5  +
              x5  * h4  + x6  * h3  + x7  * h2  + x0  * h1;
        y9  = x2  * h0  + x3  * h7  + x4  * h6  + x5  * h5  +
              x6  * h4  + x7  * h3  + x0  * h2  + x1  * h1;
        y10 = x3  * h0  + x4  * h7  + x5  * h6  + x6  * h5  +
              x7  * h4  + x0  * h3  + x1  * h2  + x2  * h1;
        y11 = x4  * h0  + x5  * h7  + x6  * h6  + x7  * h5  +
              x0  * h4  + x1  * h3  + x2  * h2  + x3  * h1;
        y12 = x5  * h0  + x6  * h7  + x7  * h6  + x0  * h5  +
              x1  * h4  + x2  * h3  + x3  * h2  + x4  * h1;
        y13 = x6  * h0  + x7  * h7  + x0  * h6  + x1  * h5  +
              x2  * h4  + x3  * h3  + x4  * h2  + x5  * h1;
        y14 = x7  * h0  + x0  * h7  + x1  * h6  + x2  * h5  +
              x3  * h4  + x4  * h3  + x5  * h2  + x6  * h1;
        y15 = x0  * h0  + x1  * h7  + x2  * h6  + x3  * h5  +
              x4  * h4  + x5  * h3  + x6  * h2  + x7  * h1;
    end

endmodule



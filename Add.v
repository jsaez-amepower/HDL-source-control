module Add #(
    parameter DW = 18,
    parameter US = 1
)
(
    input       [DW-1:0] a,
    input       [DW-1:0] b,
    input       c_in,
    output reg  [DW-1:0] sum,
    output reg           carry
);

    always @ (a or b or c_in)
        if (US) begin
            {carry, sum} = a + b + c_in;  
        end
        else begin
            {carry, sum} = $signed(a) + $signed(b) + $signed(c_in);  
        end

endmodule
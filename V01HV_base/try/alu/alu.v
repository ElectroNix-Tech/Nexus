/*
- Z => Zero
    - a == b
    - a != b
- N => Negative/Sign
    - N = risultato[MSB]
- C => Carry - per aritmetica unsigned
    - 1111 + 0001 = 0000,  C = 1
    - Si può usare nella sottrazione come carry out o borrow
- V => Overflow - per aritmetica signed
    - 0111 = +7, 0001 = +1 -> 0111 + 0001 = 1000 != -8(1000 signed)
*/
    //| Istruzione |  Z  |  N  |  C  |  V  |

module alu_add (
    input  wire [15:0] a,
    input  wire [15:0] b,
    output wire [15:0] result,
    output wire [3:0] flags
);
    //| `ADD`      |  V  |  V  |  V  |  V  |
    wire [16:0] sum; // 17 bit per catturare il carry out
    assign sum = {1'b0, a} + {1'b0, b};
    assign result = sum[15:0];
    assign flags[3] = (result == 16'b0);                            // Z
    assign flags[2] = result[15];                                   // N
    assign flags[1] = sum[16];                                      // C
    assign flags[0] = (a[15] == b[15]) && (result[15] != a[15]);    // V - Se a & b hanno lo stesso segno e il risultato ha un segno diverso, c'è overflow

endmodule


module alu_sub (
    input  wire [15:0] a,
    input  wire [15:0] b,
    output wire [15:0] result,
    output wire [3:0] flags
);
    //| `SUB`      |  V  |  V  |  V  |  V  |
    wire [16:0] sub; // 17 bit per catturare il carry out
    assign sub = {1'b0, a} - {1'b0, b};
    assign result = sub[15:0];
    assign flags[3] = (result == 16'b0);                            // Z
    assign flags[2] = result[15];                                   // N
    assign flags[1] = (a >= b);                                     // C - 1 if a >= b => no borrow
    assign flags[0] = (a[15] != b[15]) && (result[15] != a[15]);    // V - a e b hanno segno diverso e il risultato cambia segno rispetto ad a
endmodule

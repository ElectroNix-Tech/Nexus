`timescale 1ns/1ps

module alu_tb;

    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] result;

    alu dut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Test 1
        a = 5;
        b = 3;
        #10;

        if (result != 8)
            $display("ERRORE: 5 + 3 != %d", result);
        else
            $display("OK: 5 + 3 = %d", result);

        // Test 2
        a = 100;
        b = 25;
        #10;

        if (result != 125)
            $display("ERRORE: 100 + 25 != %d", result);
        else
            $display("OK: 100 + 25 = %d", result);

        // Test 3
        a = 16'hFFFF;
        b = 1;
        #10;

        if (result != 16'h0000)
            $display("ERRORE: overflow test");
        else
            $display("OK: overflow test");

        $finish;
    end

endmodule
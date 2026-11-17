/*
MUL TEST CASES
FLAGS = {Z, N, C, V}

1. 34 * 43
   Result: 16'h05B6
   Flags:  4'b0000

2. 10 * 0
   Result: 16'h0000
   Flags:  4'b1000

3. 656 * (-100)
   Result: 16'hFFC0
   Flags:  4'b0111

4. 66 * 1000
   Result: 16'h01D0
   Flags:  4'b0011

5. 15420 * 16384
   Result: 16'h0000
   Flags:  4'b1011

6. 16'hFFFF * 16'h0002
   Result: 16'hFFFE
   Flags:  4'b0010
   C = 1, V = 0

7. 16'h00C8 * 16'h00C8
   Result: 16'h9C40
   Flags:  4'b0101
   C = 0, V = 1
*/

`timescale 1ns / 1ps

module alu_mull_tb;

    // Inputs
    reg [15:0] a;
    reg [15:0] b;
    // Outputs
    wire [15:0] result;
    wire [3:0] flags;

    // Test statistics
    integer tests;
    integer failures;

    // Instantiate the Unit Under Control (UUT)
    alu_mull dut (
        .a(a),
        .b(b),
        .result(result),
        .flags(flags)
    );

    // Test task
    task check_mull;

        input [15:0] a_in;
        input [15:0] b_in;
        input [15:0] expected_result;
        input [3:0] expected_flags;

        begin

            //Stimulus
            a = a_in;
            b = b_in;

            // Allow combinational logic to settle
            #1;

            tests = tests + 1;

            if (result != expected_result || flags != expected_flags) begin
                failures += 1;
                $display("Test failed: a=%h, b=%h, expected result=%h, got result=%h, expected flags=%b, got flags=%b", 
                    a_in, 
                    b_in, 
                    expected_result, 
                    result, 
                    expected_flags, 
                    flags);
            end else begin
                $display("Test passed: a=%h, b=%h, result=%h, flags=%b",
                    a_in,
                    b_in,
                    result,
                    flags);
            end
        end
    endtask

    // Tests
    initial begin
        tests = 0;
        failures = 0;

        check_mull(
            16'd34,
            16'd43,
            16'h05B6,
            4'b0000
        );

        check_mull(
            16'd10,
            16'd0,
            16'h0000,
            4'b1000
        );

        check_mull(
            16'd656,
            -16'd100,
            16'hFFC0,
            4'b0111
        );

        check_mull(
            16'd66,
            16'd1000,
            16'h01D0,
            4'b0011
        );

        check_mull(
            16'd15420,
            16'd16384,
            16'h0000,
            4'b1011
        );

        check_mull(
            16'hFFFF,
            16'h0002,
            16'hFFFE,
            4'b0110
        );

        check_mull(
            16'h00C8,
            16'h00C8,
            16'h9C40,
            4'b0101
        );

        $display("");
        $display("===========================");
        $display("ADD TESTS: %d", tests);
        $display("FAILURES: %d", failures);
        $display("=========================");

        if (failures != 0) $fatal;

        $finish;
    end
endmodule
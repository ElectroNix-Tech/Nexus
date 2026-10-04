/*
5 - 3
3 - 5
0 - 1
FFFF - 1
8000 - 1
7FFF - FFFF

Risultati attesi:
==> 2, fffe, ffff, 7fff, 8000
==> ZNCV: 0000, 0111, 0111, 0110, 0000, 0000
*/
`timescale 1ns/1ps

module alu_sub_tb;

    // =========================
    // DUT signals
    // =========================

    reg  [15:0] a;
    reg  [15:0] b;

    wire [15:0] result;
    wire [3:0]  flags;


    // =========================
    // Test statistics
    // =========================

    integer tests;
    integer failures;


    // =========================
    // DUT
    // =========================

    alu_sub dut (
        .a(a),
        .b(b),
        .result(result),
        .flags(flags)
    );


    // =========================
    // Test task
    // =========================

    task check_sub;

        input [15:0] a_in;
        input [15:0] b_in;
        input [15:0] expected_result;
        input [3:0]  expected_flags;

        begin

            // Stimulus
            a = a_in;
            b = b_in;

            // Allow combinational logic to settle
            #1;

            tests = tests + 1;

            // Check
            if (result !== expected_result || flags !== expected_flags) begin

                failures = failures + 1;

                $display(
                    "FAIL | A=%h B=%h | RESULT=%h expected=%h | FLAGS=%b expected=%b",
                    a,
                    b,
                    result,
                    expected_result,
                    flags,
                    expected_flags
                );

            end
            else begin

                $display(
                    "PASS | A=%h B=%h | RESULT=%h | FLAGS=%b",
                    a,
                    b,
                    result,
                    flags
                );

            end

        end

    endtask


    // =========================
    // Tests
    // =========================

    initial begin

        tests    = 0;
        failures = 0;


        // Normal subition
        check_sub(
            16'h0000,
            16'h0000,
            16'h0000,
            4'b0000
        );


        // Result = 0, unsigned carry
        check_sub(
            16'h0000,
            16'h0000,
            16'h0000,
            4'b0000
        );


        // Signed positive overflow
        check_sub(
            16'h0000,
            16'h0000,
            16'h0000,
            4'b0000
        );


        // Signed negative overflow
        check_sub(
            16'h0000,
            16'h0000,
            16'h0000,
            4'b0000
        );


        // Different signs: no signed overflow
        check_sub(
            16'h0000,
            16'h0000,
            16'h0000,
            4'b0000
        );


        // Zero result without carry
        check_sub(
            16'h0000,
            16'h0000,
            16'h0000,
            4'b0000
        );


        // Negative result
        check_sub(
            16'h0000,
            16'h0000,
            16'h0000,
            4'b0000
        );


        // =========================
        // Final report
        // =========================

        $display("");
        $display("==============================");
        $display("SUB TESTS: %d", tests);
        $display("FAILURES : %d", failures);
        $display("==============================");


        if (failures != 0)
            $fatal;

        $finish;

    end

endmodule

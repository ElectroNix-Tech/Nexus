/*
5 - 3
3 - 5
0 - 1
FFFF - 1
8000 - 1
7FFF - FFFF

Risultati attesi:
==> 2, fffe, ffff, fffe, 7fff, 8000
==> ZNCV: 0000 0100 0100 0110 0011 0001
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


        check_sub(
            16'h5,
            16'h3,
            16'h2,
            4'b0010
        );

        check_sub(
            16'h3,
            16'h5,
            16'hFFFE,
            4'b0100
        );

        check_sub(
            16'h0,
            16'h1,
            16'hFFFF,
            4'b0100
        );

        check_sub(
            16'hFFFF,
            16'h1,
            16'hFFFE,
            4'b0110
        );

        check_sub(
            16'h8000,
            16'h1,
            16'h7FFF,
            4'b0011
        );

        check_sub(
            16'h7FFF,
            16'hFFFF,
            16'h8000,
            4'b0101
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

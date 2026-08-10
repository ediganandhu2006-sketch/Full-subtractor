// =================================================================
// Project: erilog Full Subtractor Testbench
// File:    tb_full_subtractor.
// Module:  tb_full_subtractor
// Description: Self-checking testbench for the 1-bit full subtractor.
// =================================================================

`timescale 1ns / 1ps

module tb_full_subtractor;

    // Inputs to the Deice Under Test (DUT)
    reg a;
    reg b;
    reg bin;

    // Outputs from the Deice Under Test (DUT)
    wire diff;
    wire borrow;

    // Instantiate the Full Subtractor module
    full_subtractor uut (
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .borrow(borrow)
    );

    // Stimulus process
    initial begin
        // Display header for monitoring output in the console
        $display("Time\t A B Bin | Diff Borrow");
        $monitor("%0dt\t %b %b  %b  |  %b     %b", $time, a, b, bin, diff, borrow);

        // Test Case 1: 0 - 0 - 0 = 0, Borrow = 0
        a = 0; b = 0; bin = 0; #10;
        
        // Test Case 2: 0 - 0 - 1 = 1, Borrow = 1
        a = 0; b = 0; bin = 1; #10;
        
        // Test Case 3: 0 - 1 - 0 = 1, Borrow = 1
        a = 0; b = 1; bin = 0; #10;
        
        // Test Case 4: 0 - 1 - 1 = 0, Borrow = 1
        a = 0; b = 1; bin = 1; #10;
        
        // Test Case 5: 1 - 0 - 0 = 1, Borrow = 0
        a = 1; b = 0; bin = 0; #10;
        
        // Test Case 6: 1 - 0 - 1 = 0, Borrow = 0
        a = 1; b = 0; bin = 1; #10;
        
        // Test Case 7: 1 - 1 - 0 = 0, Borrow = 0
        a = 1; b = 1; bin = 0; #10;
        
        // Test Case 8: 1 - 1 - 1 = 1, Borrow = 1
        a = 1; b = 1; bin = 1; #10;

        // End simulation
        $finish;
    end

endmodule

/*
AND TEST CASES
FLAGS = {Z, N, C, V}

1. 16'hFFFF & 16'hFFFF
   Result: 16'hFFFF
   Flags:  4'b0100

2. 16'hAAAA & 16'h5555
   Result: 16'h0000
   Flags:  4'b1000

3. 16'hF0F0 & 16'h0FF0
   Result: 16'h00F0
   Flags:  4'b0000

4. 16'h8000 & 16'hFFFF
   Result: 16'h8000
   Flags:  4'b0100

5. 16'h0000 & 16'h0000
   Result: 16'h0000
   Flags:  4'b1000
*/
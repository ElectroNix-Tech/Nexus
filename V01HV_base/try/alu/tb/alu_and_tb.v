/*
    ALU AND - Test Vectors

    A      B      Expected Result    Flags (Z,N,C,V)
    -------------------------------------------------
    FFFF   FFFF       FFFF                 0100
    0000   0000       0000                 1000
    F0F0   0F0F       0000                 1000
    1234   4444       0004                 0000
    FED0   FDE0       FEC0                 0100
    A5A5   DA5A       8000                 0100
*/
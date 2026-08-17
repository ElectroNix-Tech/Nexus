Registri speciali:
- Flags

---

# Flags
Info contenute:
- Z => Zero
    - a == b
    - a != b
- N => Negative/Sign
    - N = risultato[MSB]
- C => Carry - per aritmetica signed
    - 1111 + 0001 = 0000,  C = 1
    - Si può usare nella sottrazione come carry out o borrow
- V => Overflow - per aritmetica unsigned
    - 0111 = +7, 0001 = +1 -> 0111 + 0001 = 1000 != -8(1000 signed)
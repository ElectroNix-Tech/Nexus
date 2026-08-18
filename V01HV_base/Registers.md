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

| Istruzione |  Z  |  N  |  C  |  V  |
| ---------- | :-: | :-: | :-: | :-: |
| `ADD`      |  V  |  V  |  V  |  V  |
| `SUB`      |  V  |  V  |  V  |  V  |
| `MUL`      |  V  |  V  |  V  |  V  | "il prodotto (un)signed è rappresentabile in 16 bit?"
| `AND`      |  V  |  V  |  X  |  X  |
| `OR`       |  V  |  V  |  X  |  X  |
| `XOR`      |  V  |  V  |  X  |  X  |
| `NOT`      |  V  |  V  |  X  |  X  |
| `CMP`      |  V  |  V  |  V  |  V  |
| `SHL`      |  V  |  V  |  V  |  X  |
| `SHR`      |  V  |  V  |  V  |  X  |
| `SHRA`     |  V  |  V  |  V  |  X  |
| `MOV`      |  X  |  X  |  X  |  X  |
| `LOAD`     |  X  |  X  |  X  |  X  |
| `STORE`    |  X  |  X  |  X  |  X  |
| `PUSH`     |  X  |  X  |  X  |  X  |
| `POP`      |  X  |  X  |  X  |  X  |
| `JCC`      |  X  |  X  |  X  |  X  |
| `CALL`     |  X  |  X  |  X  |  X  |
| `RET`      |  X  |  X  |  X  |  X  |
| `HALT`     |  X  |  X  |  X  |  X  |
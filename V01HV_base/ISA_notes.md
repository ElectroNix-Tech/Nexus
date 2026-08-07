# Filosofia della ISA

- Ogni istruzione deve giustificare la propria esistenza.
- Evitare istruzioni ridondanti.
- Privilegiare operazioni fondamentali rispetto a scorciatoie.
- La semplicità dell'hardware è un criterio progettuale importante.

# Elenco ISA

Aritmetica
- ADD
- SUB
- MUL

Logica
- AND
- OR
- XOR
- NOT

Confronto
- CMP

Shift
- SHL
- SHR

Memoria
- LOAD
- STORE
- MOV
- PUSH
- POP

Controllo del flusso
- JCC
- CALL
- RET
- HALT

## Formati delle istruzioni

Formati previsti:
- **R** — operazioni tra registri
- **I** — operazioni con valori immediati
- **M** — accesso alla memoria
- **J** — controllo del flusso

Le istruzioni LOAD e STORE supportano l'indirizzamento tramite registro base + offset.

---

# ISA reference table

| Nome | Opcode | Formato | Operandi | Destinazione | Semantica | Flags | Memoria | Vincoli encoding | Note |
|------|--------|---------|----------|--------------|-----------|-------|---------|------------------|------|
| ADD | TBD | R | Rd, Rs1, Rs2 | Rd | TBD | TBD | No | Rd vincolato | |
| SUB | TBD | R | Rd, Rs1, Rs2 | Rd | TBD | TBD | No | Rd vincolato | |
| ... | | | | | | | | | |

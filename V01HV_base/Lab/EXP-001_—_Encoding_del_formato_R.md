# EXP-001 — Encoding del formato R

## Problema
Progettare un formato di istruzione a 16 bit che permetta di utilizzare:
- fino a 32 istruzioni (opcode a 5 bit);
- 16 registri generali;
- istruzioni aritmetico-logiche a 3 operandi;

senza aumentare la lunghezza delle istruzioni e cercando il miglior compromesso tra semplicità, prestazioni ed evolvibilità dell'architettura.

---

## Soluzione A

### Descrizione

ISA classica a 3 operandi con istruzioni di lunghezza superiore (o formato esteso).

### Vantaggi

- Nessun vincolo sull'utilizzo dei registri.
- Modello semplice e intuitivo.
- Massima flessibilità.

### Svantaggi

- Non rispetta il vincolo delle istruzioni a 16 bit.
- Aumenta memoria occupata e banda necessaria.

---

## Soluzione B

### Descrizione

ISA a 2 operandi, dove il registro destinazione coincide con uno degli operandi.

### Vantaggi

- Encoding semplice.
- Decoder semplice.
- Hardware meno complesso.

### Svantaggi

- Maggior numero di istruzioni.
- Uso frequente di MOV.
- Peggiore leggibilità del codice.

---

## Soluzione C

### Descrizione

ISA a 3 operandi con condivisione di un bit tra opcode e registro destinazione. Il bit più significativo del registro destinazione è determinato dall'opcode, riducendo a 3 i bit espliciti necessari per codificare il registro di destinazione.

### Vantaggi

- Mantiene il modello a 3 operandi.
- Recupera un bit senza aumentare la lunghezza dell'istruzione.
- Riduce l'utilizzo di MOV rispetto alla soluzione B.
- Hardware potenzialmente semplice da implementare.

### Svantaggi

- Vincolo sul gruppo di registri utilizzabile come destinazione.
- Da valutare l'impatto sul compilatore.
- Da verificare il comportamento su programmi complessi.

---

## Confronto delle soluzioni

| Criterio | Soluzione A<br>Istruzioni estese | Soluzione B<br>2 operandi | Soluzione C<br>Bit condiviso |
|-----------|:-------------------------------:|:-------------------------:|:----------------------------:|
| **Vincoli progettuali** ||||
| Rispetta istruzioni da 16 bit | -- | ++ | ++ |
| Mantiene 16 registri | ++ | ++ | ++ |
| Mantiene 3 operandi | ++ | -- | ++ |
| Recupero del bit mancante | N/A | ++ | ++ |
| **Implementazione** ||||
| Complessità hardware | - | ++ | + |
| Complessità del decoder | - | ++ | + |
| Complessità del compilatore | ++ | + | + |
| Complessità della register allocation | ++ | - | 0 |
| **Utilizzo pratico** ||||
| Facilità di programmazione Assembly | ++ | - | + |
| Facilità di programmazione in linguaggi compilati | ++ | ++ | ++ |
| Istruzioni aggiuntive (MOV) | ++ | -- | + |
| Prestazioni teoriche | + | - | ++ |
| Efficienza dell'encoding | -- | ++ | ++ |
| Flessibilità dell'ISA | ++ | - | + |
| Scalabilità | ++ | + | 0 |
| **Valutazione complessiva** ||||
| Coerenza con gli obiettivi della Nexus | | | |

---

## Decisione

### Stato Soluzione C - Bit condiviso

- [x] Accettata
- [ ] Accettata con modifiche
- [ ] Da approfondire
- [ ] Rimandata
- [ ] Scartata

### Motivazione

Tra le soluzioni analizzate, la codifica con bit condiviso tra opcode e registro destinazione rappresenta il miglior compromesso rispetto agli obiettivi della Nexus V1.

La soluzione mantiene istruzioni a lunghezza fissa di 16 bit, conserva il modello a 3 operandi e richiede un impatto hardware contenuto. Il vincolo introdotto riguarda esclusivamente il registro destinazione e può essere gestito dal compilatore o dal programmatore assembly quando necessario.

Le alternative analizzate presentano compromessi meno favorevoli: le istruzioni estese violano il requisito dei 16 bit, mentre l'ISA a 2 operandi aumenta il numero di istruzioni e riduce l'espressività dell'architettura.

La soluzione viene quindi adottata come scelta progettuale della Nexus V1. Eventuali revisioni future potranno modificarla qualora emergano limiti significativi durante lo sviluppo dell'architettura o l'implementazione della CPU.


### Azioni successive

- [ ] Proseguire l'analisi teorica
- [ ] Progettare esperimenti mirati
- [ ] Adottare una soluzione definitiva
- [x] Aggiornare le specifiche dell'ISA.
- [x] Proseguire con la progettazione dei formati delle istruzioni.
- [x] Aggiornare le specifiche
- [x] Aggiornare la documentazione

---

## Idee future

- Valutare l'impatto della soluzione sulla progettazione del compilatore etc.
- Verificare la compatibilità della soluzione con future estensioni dell'ISA (es. istruzioni matriciali, SIMD o nuovi formati).
- Analizzare se il bit condiviso possa essere applicato anche ad altri campi dell'istruzione.
- Confrontare questa soluzione con ISA reali e con eventuali tecniche simili presenti in letteratura.
- Rivalutare la decisione durante la progettazione della Nexus V2, sulla base dell'esperienza maturata con la V1.

---

## Note

- Questo esperimento costituisce la base per la definizione del formato delle istruzioni della Nexus V1.
- La soluzione scelta è stata selezionata sulla base di un'analisi teorica e dei vincoli progettuali definiti per la V1.
- Eventuali modifiche future dovranno essere motivate da limiti riscontrati durante la progettazione, l'implementazione o la validazione dell'architettura.

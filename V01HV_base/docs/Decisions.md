<div align="right">17/08/2026</div>

## Registro FLAGS

**Decisione**

La Nexus V1 utilizzerà un registro `FLAGS` dedicato di 4 bit:

- `Z` — Zero
- `N` — Negative
- `C` — Carry
- `V` — Overflow

**Motivazione**

I quattro flag forniscono le informazioni necessarie per aritmetica e confronti signed/unsigned, mantenendo il registro minimale.

**Conseguenze**

- `FLAGS` avrà dimensione diversa dai registri generali.
- Le istruzioni che lo modificano dovranno essere definite nell'ISA.

<div align="right">06/08/2026</div>

## Condizioni di JCC basate sui FLAGS

**Decisione**

L'istruzione `JCC` utilizzerà condizioni espresse come combinazioni dei bit del registro `FLAGS`, invece di prevedere condizioni signed e unsigned separate come istruzioni o condizioni indipendenti.

**Motivazione**

- Permette di utilizzare un'unica struttura di controllo delle condizioni.
- Evita di duplicare le condizioni signed e unsigned.
- Utilizza in modo più generale le informazioni prodotte dalla ALU.
- Mantiene l'ISA compatta.
- Lascia maggiore spazio a future estensioni delle condizioni.

**Conseguenze**

- Il registro `FLAGS` dovrà contenere informazioni sufficienti per distinguere correttamente confronti signed e unsigned.
- Dovrà essere definita la semantica precisa dei singoli flag.
- Dovrà essere definito il modo in cui il campo condizione di `JCC` seleziona le combinazioni dei flag.
- `JCC` potrà supportare sia condizioni signed sia unsigned senza duplicare le condizioni nell'ISA.

# DEC-00X — Codifica del formato R

## Decisione

Per la Nexus V1 viene adottata una codifica del formato R basata sulla condivisione di un bit tra l'opcode e il registro destinazione.

Il bit più significativo del registro destinazione non viene codificato esplicitamente, ma viene ricavato da un bit dell'opcode.

I registri sorgente mantengono invece una codifica completa a 4 bit.

## Motivazione

La soluzione consente di mantenere:

- istruzioni a lunghezza fissa di 16 bit;
- 16 registri generali;
- istruzioni aritmetico-logiche a 3 operandi.

Rispetto a una ISA a 2 operandi, riduce il numero di istruzioni `MOV` necessarie e preserva una maggiore espressività dell'ISA.

## Conseguenze

- Il registro destinazione è vincolato al gruppo di registri determinato dall'opcode.
- Il decoder dovrà ricostruire il bit più significativo del registro destinazione durante la decodifica.
- Il compilatore (o il programmatore assembly) dovrà tenere conto del vincolo durante l'allocazione dei registri.
- La soluzione verrà rivalutata nelle versioni future dell'architettura qualora emergano limiti significativi.

---

<div align="right">05/08/2026</div>

### Numero e dimensione dei registri

La Nexus V1 utilizzerà:

* **16 registri generali**
* **16 bit per registro**

I registri saranno identificati come:

R0 - R15

Ogni registro potrà contenere un valore intero a 16 bit.


### Motivazione della scelta

La scelta di utilizzare 16 registri rappresenta un compromesso tra semplicità hardware e flessibilità software.

Un numero inferiore di registri ridurrebbe la complessità del formato delle istruzioni, ma aumenterebbe il numero di accessi alla memoria necessari durante l'esecuzione dei programmi.

---

### La Nexus V1 utilizzerà più formati di istruzione.

Motivazione:

- permette di utilizzare meglio i 16 bit disponibili;
- evita di sprecare campi inutilizzati;
- permette istruzioni più espressive;

---

### Salti condizionati
Decisione:
- Utilizzare un'unica istruzione JCC.
- La condizione è codificata come parametro dell'istruzione, non come opcode separato.

Motivazione:
- Riduce il numero di opcode necessari.
- Rende l'ISA più compatta ed estendibile.

---

### Registro FLAGS
Decisione:
- Introdurre un registro FLAGS dedicato.

Motivazione:
- Semplifica confronti e salti condizionati.
- È una soluzione standard, pulita ed efficiente.

---

### CALL / RET
Decisione:
- CALL salva automaticamente l'indirizzo di ritorno nello stack.
- RET lo recupera dallo stack.

Motivazione:
- Permette chiamate annidate e ricorsive.
- Semplifica la programmazione e il futuro compilatore.
- L'aumento di complessità hardware è contenuto.

---

### ALTRO
- Deciso di utilizzare un registro FLAGS dedicato.
- I salti condizionati useranno FLAGS.
- I registri speciali saranno separati dai registri generali.

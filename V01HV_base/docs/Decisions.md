<div align="right">06/08/2026</div>

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

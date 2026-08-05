<div align="right">06/08/2026</div>
## Numero e dimensione dei registri

La Nexus V1 utilizzerà:

* **16 registri generali**
* **16 bit per registro**

I registri saranno identificati come:

R0 - R15

Ogni registro potrà contenere un valore intero a 16 bit.


## Motivazione della scelta

La scelta di utilizzare 16 registri rappresenta un compromesso tra semplicità hardware e flessibilità software.

Un numero inferiore di registri ridurrebbe la complessità del formato delle istruzioni, ma aumenterebbe il numero di accessi alla memoria necessari durante l'esecuzione dei programmi.

---

## La Nexus V1 utilizzerà più formati di istruzione.

Motivazione:

- permette di utilizzare meglio i 16 bit disponibili;
- evita di sprecare campi inutilizzati;
- permette istruzioni più espressive;

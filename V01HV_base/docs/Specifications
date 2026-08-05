# Specifications - Versione 1

## 1. Introduzione

La Versione 1 (V1) rappresenta la prima implementazione della famiglia di processori **Nexus**.

Lo scopo principale di questa versione non è ottenere le massime prestazioni, bensì progettare e realizzare una CPU completa, coerente e realmente funzionante, comprendendone a fondo ogni componente e ogni scelta progettuale.

La V1 costituirà la base per tutte le versioni successive, che introdurranno nuove funzionalità, ottimizzazioni e architetture più avanzate.

---

# 2. Obiettivi

La Versione 1 dovrà:

* essere completamente progettata da zero;
* essere implementabile sulla FPGA Tang Nano 9K;
* essere interamente descritta in Verilog HDL;
* poter eseguire programmi scritti appositamente per la sua ISA;
* poter essere programmata tramite un assembler sviluppato insieme al progetto;
* essere facilmente espandibile nelle versioni future;
* privilegiare chiarezza, modularità e comprensione rispetto alle prestazioni assolute.

---

# 3. Filosofia progettuale

Ogni scelta progettuale dovrà essere motivata da ragioni tecniche.
La complessità verrà introdotta solo quando realmente necessaria.
L'obiettivo non è replicare fedelmente un'architettura esistente, ma comprenderne i principi fondamentali e sviluppare gradualmente una propria filosofia progettuale.
Ogni versione del progetto dovrà poter essere studiata e compresa indipendentemente dalle successive.

---

# 4. Specifiche principali

| Caratteristica          | Specifica                           |
| ----------------------- | ----------------------------------- |
| Dimensione della parola | 16 bit                              |
| Registri generali       | 16                                  |
| Linguaggio HDL          | Verilog                             |
| FPGA di riferimento     | Tang Nano 9K                        |
| ISA                     | Proprietaria                        |
| Assembly                | Proprietario                        |
| Assembler               | Sviluppato all'interno del progetto |
| Architettura            | Harvard (prima implementazione)     |

---

# 5. Obiettivi didattici

Durante lo sviluppo della V1 si intende acquisire una comprensione pratica di:

* organizzazione di una CPU;
* datapath;
* unità di controllo;
* file di registri;
* ALU;
* memoria;
* formato delle istruzioni;
* progettazione di una ISA;
* ciclo di esecuzione delle istruzioni;
* sviluppo di hardware sintetizzabile su FPGA.

---

# 6. Cosa NON farà la V1

Per mantenere il progetto focalizzato, questa versione non includerà funzionalità avanzate quali:

* pipeline;
* cache;
* branch prediction;
* esecuzione superscalare;
* esecuzione fuori ordine;
* memoria virtuale;
* multicore;
* acceleratori dedicati.

Queste caratteristiche potranno essere introdotte nelle versioni successive qualora risultino coerenti con l'evoluzione del progetto.

---

# 7. Visione futura

La V1 rappresenta il punto di partenza della famiglia Nexus.

Le versioni successive esploreranno differenti architetture e tecniche progettuali, tra cui, a titolo esemplificativo:

* architettura Von Neumann;
* pipeline;
* gestione avanzata della memoria;
* parallelismo;
* estensioni vettoriali;
* acceleratori hardware;
* architetture orientate al calcolo matriciale.

L'obiettivo finale è acquisire le competenze necessarie per progettare architetture originali, comprendendone a fondo vantaggi, limiti e compromessi.

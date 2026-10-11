## Proprietà della moltiplicazione signed/unsigned

**Enunciato**

Siano $$\(A\)$$ e $$\(B\)$$ due vettori binari di \(n\) bit. Interpretando gli stessi vettori come unsigned oppure come signed in complemento a due, i prodotti matematici possono differire, ma i rispettivi \(n\) bit meno significativi sono sempre identici.

### Dimostrazione

Indichiamo con $$\(U_A,U_B\)$$ i valori unsigned e con $$\(S_A,S_B\)$$ i valori signed degli operandi.

Per un vettore binario \(X\) di \(n\) bit, il valore signed in complemento a due si ricava dal valore unsigned sottraendo \(2^n\) se il bit più significativo è \(1\). Pertanto:

$$
S_A=U_A-k2^n,\qquad S_B=U_B-j2^n
$$

dove $$\(k,j\in\{0,1\}\)$$ sono i bit più significativi dei rispettivi operandi.

Applicando la proprietà distributiva:

$$
\begin{aligned}
S_AS_B
&=(U_A-k2^n)(U_B-j2^n)\\
&=U_AU_B-jU_A2^n-kU_B2^n\\
&\quad+kj2^{2n}
\end{aligned}
$$

Tutti i termini aggiuntivi rispetto a $$\(U_AU_B\)$$ sono multipli di $$\(2^n\)$$. Di conseguenza, esiste un intero \(q\) tale che:

$$
S_AS_B=U_AU_B+q2^n
$$

Quindi:

$$
\boxed{S_AS_B\equiv U_AU_B\pmod{2^n}}
$$

La congruenza modulo \(2^n\) indica che la differenza tra i due prodotti è divisibile per $$\(2^n\)$$. I due prodotti hanno pertanto lo stesso resto nella divisione per $$\(2^n\)$$, corrispondente ai rispettivi \(n\) bit meno significativi.

Equivalentemente:

$$\boxed{S_AS_B\bmod 2^n = U_AU_B\bmod 2^n}$$

### Conseguenza architetturale

Il risultato di una moltiplicazione troncato a \(n\) bit è indipendente dall'interpretazione signed/unsigned degli operandi. L'interpretazione modifica il valore matematico del prodotto completo, ma non i suoi \(n\) bit meno significativi.

In Nexus V1, con operandi da 16 bit, `MUL` può quindi restituire i 16 bit meno significativi del prodotto. I flag di overflow devono invece essere valutati separatamente secondo la semantica definita per l'operazione unsigned (`C`) e signed (`V`).

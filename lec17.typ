== Lecture 17

Short Lecture Today:


- We'll finish chapter 1
- Will spend the rest of week on ch. 2: Poisson processes.

#pagebreak()

§1.9 & 1.10 on *Exit Distributions* & *Times*


- We have already seen some of this in homework & workshops.
- Basis for this is FSA (First Step Analysis)

Eg: Gambler's Ruin, $P_x ("Jackpot")$ & $P_x ("Ruin")$ is the exit distribution from $ {1, 2, dots, N-1} $ started at $x$.

#pagebreak()

Def: For $A subset S$, let

$
  V_A = min{n >= 0: X_n in A}
$

be 1st time MC hits set $A$.

#pagebreak()

Eg: Gambler's Ruin

#figure[
  #image(
    "./figs/p17_05m.png",
    width: 40%,
  )
]

$
  & h(i) = P_i (V_N < V_0) = P_i ("Jackpot") \
  & h(N) = P_N ("Jackpot") = 1 \
  & h(0) = P_0 ("Jackpot") = 0
$

For $i in {1, 2, dots, N-1}$, $h(i) = sum_j p_(i j) h(j) = q h(i-1) + p h(i+1)$ is what we got by FSA on HW #1.

#pagebreak()

#text(size: 10pt)[
  Theorem Let $(X_n)$ be a MC on $S$. Suppose $A, B subset S$ such that $C = S backslash (A union B)$ is finite.

  Suppose

  $
    h(a) & = 1                  & quad a in A \
    h(b) & = 0                  & quad b in B \
    h(i) & = sum_j p_(i j) h(j) & quad i in C
  $

  Then, $h(i) = P_i (V_A < V_B)#footnote[Exit distribution]$ if $P_i (min{V_A, V_B} < oo) > 0$ for all $i in C$.

  *Proof:* Essentially FSA, but more technical, see [D].
]

#pagebreak()

- For Gambler's Ruin, take
  $
    A & = {N} \
    B & = {0}
  $

If we can solve

$
  & h(N) = 1 \
  & h(0) = 0 \
  & h(i) = q h(i-1) + p h(i+1)
$

The theorem tells us $h(i) = P_i ("Jackpot")$

#pagebreak()

Look at Ex 1.42 [D] "Matching Pennies" on your own.
Wikipedia: "Genetic Drift"

Ex 1.43 "Wright-Fisher model with no mutation"

$
  S = {0, 1, dots, N}
$

$
  p_(i j) & = binom(N, j) (i/N)^j ((N-i)/N)^(N-j) \
          & = P("Binomial"(N, i/N) = j)
$

$X_n$ = \# of "type A" genes. (Haploid model: A or a)

#pagebreak()

#text(size: 10pt)[
  $0$ and $N$ are absorbing states.

  $
    & "Binomial"(N, 0) equiv 0 \
    & "Binomial"(N, 1) equiv N
  $

  Notice for $h(i) = i/N$,

  $
    h(i) = sum_j p_(i j) h(j)
  $

  Indeed,

  $
    & sum_j binom(N, j) (i/N)^j ((N-i)/N)^(N-j) j/N \
    & = 1/N E("Bin"(N, i/N)) = i/N
  $
]

#pagebreak()

$therefore$ by Lemma, taking $A = {N}$, $B = {0}$,

$
  & P_i (V_A < V_B) \
  & = P_i ("Fixation to 'type A' genes") \
  & = i/N \
  & = "initial prop. of type A genes."
$

#pagebreak()

Reducible Chains

Exit distributions are important for determining long run behavior of reducible MC's.

See ex 1.46 [D] for a nice example.

#pagebreak()

*Idea* Find closed communicating classes. Assuming, for example, $abs(S) < oo$, the MC will eventually arrive in one such class, and stay there forever. So if $i in S$ and $j in C$, a closed class, we can find $lim_(n->oo) p_(i j)^n$.

#pagebreak()

By finding
1. $P_i ("Hit C before any other closed class")$
2. SD $pi$ for $underline(P)$ restricted to $C$.

Then $lim_(n->oo) p_(i j)^n = pi_j P("hit C 1st")$

#pagebreak()

#figure[
  #image(
    "./figs/p17_37m.png",
    width: 50%,
  )
]

MC eventually ends up in
$A = {1, 5}$ or $B = {4, 6, 7}$.

$
  pi_A & = 1/3 (2, 1) \
  pi_B & = 1/9 (8, 5, 4)
$

#pagebreak()

To find $P_i(V_A < V_B)$, it is easier to study:

#figure[
  #image(
    "./figs/p17_40m.png",
    width: 50%,
  )
]

$
  h(A) & = 1, quad h(B) = 0 \
  h(2) & = 0.1 + 0.2 h(2) + 0.3 h(3) \
  h(3) & = 0.2 + 0.5 h(3)
$

#pagebreak()

$
  => & h(2) = 11/40 \
     & h(3) = 2/5
$

Therefore, for example,

$
  lim_(n->oo) p_(2 1)^n & = P_2(V_A < V_B) (pi_A)_1 = 11/40 dot 2/3 \
  lim_(n->oo) p_(3 7)^n & = (1 - P_3(V_A < V_B)) (pi_B)_7 \
                        & = (1 - 2/5) dot 4/17
$

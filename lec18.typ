== Lecture 18

Last lecture, we discussed exit distributions (§1.9).

Today, we'll quickly discuss exit times (§1.10).

#pagebreak()

Def For $A subset S$, let

$
  V_A = min { n >= 0 : X_n in A }
$
be the first time the MC hits set A.

#pagebreak()

Eg Gambler's Ruin

$
  g(i) = & E_i (min { V_0, V_N }) \
       = & "Expected number of bets until game over," \
         & "starting with" i
$

$
  g(0) & = g(N) = 0 "for" i in {1, 2, dots, N-1} \
  g(i) & = 1#footnote[1 step, then start from $i-1$ or $i+1$.] + q g(i-1) + p g(i+1)
$

#pagebreak()

Theorem. $(X_n)$ MC on $S$. Suppose $A subset S$ such that $C = S backslash A$ is finite. Suppose

$
  g(a) & = 0                      & quad a in A \
  g(i) & = 1 + sum_j p_(i j) g(j) & quad i in C
$

Then $g(i) = E_i (V_A)$ if $P_i (V_A < oo) > 0$ for all $i in C$.

- For gambler's ruin, take $A = {0, N}$.

#pagebreak()

Eg Waiting time for TT#footnote[2 tails in a row] while flipping a fair coin

$
  S = {0, 1, 2}
$

MC in state $i$ if last $i$ flips are T.
The first time we see TT is the first time we visit 2, started at 0: $E_0 (V_2)$.

#pagebreak()

To find $g_i = E_i (V_2)$, we solve

$
  cases(
    g_2 = 0,
    g_0 = 1 + 1/2 (g_0 + g_1),
    g_1 = 1 + 1/2 g_0 + cancel(1/2 g_2)
  )
$

& then apply the theorem.

#figure[
  #image(
    "./figs/p18_11m.png",
    width: 20%,
  )
]

#pagebreak()

$
  & cases(
      g_0 = 1 + 1/2 (g_0 + g_1),
      g_1 = 1 + 1/2 g_0
    ) \
  & => cases(
      g_0 = 2 + g_1,
      2 g_1 = 2 + g_0
    ) \
  & => cases(
      g_0 = 6,
      g_1 = 4
    ) \
  & therefore E_0 (V_2) = g_0 = 6
$

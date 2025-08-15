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

= Poisson Processes

New chapter, §2 in [D]

Poisson Processes

#pagebreak()

- In Stat 134 (or equivalent course) you have already seen Poisson processes.
- In Stat 150, we'll study this fundamental process more rigorously.

#pagebreak()

- The (1-dimensional) Poisson process is a point process on the line $[0, oo)$ with i.i.d. exponential "inter-arrival times" between points.

#figure[
  #image(
    "./figs/p18_16m.png",
    width: 100%,
  )
]

#pagebreak()

The Poisson process is important because:

- Many real-world situations can be modeled using them:
  - Cars arriving at a toll booth
  - Galaxies in some region of the universe (3-D Poisson process)

#pagebreak()

- But also, many calculations work out nicely for the Poisson process because exponential RVs have the "lack of memory" property.
- The exponential RV is, in fact, the *only* continuous RV with this property.

#pagebreak()

- In §3, we'll study "renewal processes" --- which have i.i.d. inter-arrival times, which need not be exponential.
- These processes are more complicated, so it is crucial we understand the Poisson process well first.

#pagebreak()

§2.1 --- Exponential RVs

- This section is Stat 134 review. *Please* read on your own to refresh your memory.
- We'll just quickly summarize here:

#pagebreak()

Recall: "Survival function" of a RV $X$ is
$
  P(X > x) = 1 - F(x)#footnote[CDF]
$

Def $X tilde "Exp"(lambda)$, Exponential RV with *rate* $lambda$ if

$
  P(X > x) = e^(-lambda x) , quad x >= 0.
$

#pagebreak()

To get PDF,

$
  f(x) & = F'(x) = d/(d x) (1 - e^(-lambda x)) \
       & = lambda e^(-lambda x).
$

Can show:

$
      E X & = 1/lambda \
  "Var" X & = 1/lambda^2
$

#pagebreak()

Other useful properties:

1. Lack of Memory (LoM):

$
  P(X > t+s | X > t) = P(X > s)
$

$
  ["Proof: LHS" = (e^(-lambda (t+s)))/(e^(-lambda t)) = e^(-lambda s) = "RHS"]
$

$therefore$ Conditional on $X > t$, RV starts afresh at time $t$, as though it were a brand new $"Exp"(lambda)$.

#pagebreak()

2. Sum of $n$ IID $"Exp"(lambda)$ RVs is called a Gamma($n, lambda$).

$
  T_n = sum_(i=1)^n T_i, quad T_i "i.i.d." "Exp"(lambda).
$

$
  f#footnote[PDF] _(T_n)(t) = lambda e^(-lambda t) ((lambda t)^(n-1))/((n-1)!) , quad t >= 0
$

- Proof: Induction (see [D]).
- Note: If $n=1$, $f(t) = lambda e^(-lambda t)$, so Gamma$(1, lambda) = "Exp"(lambda)$.

#pagebreak()

3. Minimum of independent exponential RVs is exponential. Its rate is the sum of rates:

Theorem. $X_i ~ "Exp"(lambda_i)$, and all $X_i$ independent. Then

i) $M = min{X_1, dots, X_n} =^d "Exp"(sum_(i=1)^n lambda_i)$

Moreover, let $I =$ index of smallest $X_i$, $M = X_I$. Then,

#pagebreak()

ii) $P(I=i) = (lambda_i) / (sum_(j=1)^n lambda_j)$ \
iii) $I, M#footnote[$= X_I$]$ are independent.

Part (iii) is perhaps the most surprising.

#pagebreak()

Proof:

i)

$
  P(M > t) & = P("all" X_i > t) \
           & = product_(i=1)^n P(X_i > t) "(indep.)" \
           & = product_(i=1)^n e^(-lambda_i t) \
           & = e^(-t sum_(i=1)^n lambda_i)
$

#pagebreak()

ii) Can be proved easily by induction --- see [D].

iii)

$
  f_(I, M)(i, t) &= lambda_i e^(-lambda_i t) product_(j != i)#footnote[All other RVs must be bigger than $t$, i.e., survival function.] e^(-lambda_j t) \
  &= (lambda_i)/(sum_j lambda_j) dot underbrace((sum_j lambda_j) e^(-(sum_j lambda_j)t), "PDF of a rate" sum lambda_i "Exp. RV.") \
  &= P(I=i)#footnote[By part ii).] f_M (t)
$

#pagebreak()

§2.2 --- Defining the Poisson Process

Recall: $X tilde "Poisson"(mu)$ if

$
  P(X=k) = e^(-mu) (mu^k)/(k!) , quad k=0, 1, 2, dots
$

Can show:

$
      E X & = mu \
  "Var" X & = mu
$

See [D].

#pagebreak()

Also easy to show:

*Theorem.*
If $X_i tilde "Poisson"(lambda_i)$ and all $X_i$ indep. Then

$
  sum_(i=1)^n X_i tilde "Poisson"(sum_(i=1)^n lambda_i).
$

*Proof:* Stat 134. See [D], by induction. $quad square$

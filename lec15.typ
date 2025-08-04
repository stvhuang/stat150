#import "@preview/fletcher:0.5.8": diagram, edge, node

== Lecture 15

Generalized Main MC Theorem
$(X_n)$ an *irreducible, ergodic* MC. Then

1. There is a SD $pi: pi = pi underline(P)$ & $sum pi_i = 1$
2. $lim_(n -> oo) p_(i j)^(n) = pi_j$ for all $i, j$.
3. $pi_j = lim_(n -> oo) (N_n (j)) / n = "LR prop. of steps in state" j$
$= 1 / (E_j T_j) = "inverse mean return time to" j$

#pagebreak()

Eg: SRW Reflected at 0

#diagram(
  edge-stroke: 1pt,
  node-stroke: 1pt,
  {
    let (A, B, C, D) = ((0, 0), (0.8, 0), (1.6, 0), (2.2, 0))

    node(A, $0$)
    node(B, $1$)
    node(C, $2$)
    node(D, $dots$, stroke: none)

    edge(A, B, "->", label: $p$, bend: 45deg)
    edge(B, C, "->", label: $p$, bend: 45deg)

    edge(B, A, "->", label: $q$, bend: 45deg)
    edge(C, B, "->", label: $q$, bend: 45deg)

    edge(A, A, "->", label: $q$, bend: 135deg, loop-angle: 180deg)
  },
)

What is SD $pi$? Does it exist?

#pagebreak()

This is a B&D MC (recall this means $p_(i j) = 0$ unless $j in {i, plus.minus 1}$).
So to find SD, we try to solve DB equations.

Recall normalizing method:
1. Find $x_i p_(i j) = x_j p_(j i)$ (usually start by setting some $x_i = 1$)
2. Then put $pi_i = x_i / (sum_j x_j)$.

This works provided $sum_i x_i < oo$.

#pagebreak()

In order to normalize, we need $sum_j x_j = sum_(j=0)^oo (p/q)^j < oo$

If $p >= 1/2$ then $p/q >= 1$

$
  therefore sum_j x_j = cases(
    oo & quad p >= 1/2,
    1 / (1 - p/q) & quad p < 1/2,
  )
$

So for $p < 1/2$

$
  pi_i & = (1 - p/q)(p/q)^i = (1-2p)/(1-p) (p/q)^i
$

#pagebreak()

$(X_n)$ is clearly irreducible.

$therefore$ For $p < 1/2$, $(X_n)$ is IRR & has SD.

By theorem 1.22 above,

$
  E_j T_j = 1 / pi_j = (q/p)^j (1-p)/(1-2p) < oo
$

$therefore$ For $p < 1/2$ all states are Pos Rec.

#pagebreak()

What happens for $p >= 1/2$?

- In this case, RW is getting pulled away from the reflecting boundary. It seems that RW can drift off to $oo$ and not have an equilibrium, at least when $p > 1/2$. $p = 1/2$ seems less clear.

#pagebreak()

Recall from HW #1

#figure[
  #image(
    "./figs/p15_09m.png",
    width: 40%,
  )
]

$
  P_x ( "hit N before 0" ) & = ((q/p)^x - 1) / ((q/p)^N - 1) \
                           & -> 1 - (q/p)^x
$

As $N -> oo$, provided $q/p < 1$ ($p > 1/2$)

#pagebreak()

$therefore$ For SRW reflected at 0:

$
  P_x#footnote[$x >= 1$] (T_0 < oo) = (q/p)^x < 1
$

$therefore$ For $p > 1/2$, all states are Trans.

What about the borderline case $p=1/2$?

#pagebreak()

Symmetric ($p=1/2$) SRW on $ZZ$ is Rec.
Therefore so is symmetric SRW reflected at 0.
(Why? Start at 0. Either $X_1=0$, or $X_1=1$. If $X_1=1$, since SRW on $ZZ$ is Rec., we will visit 0 again w.p. $1$.)

However, it is null Rec, and so doesn't have a SD.

#pagebreak()

By FSA can show:

#figure[
  #image(
    "./figs/p15_20m.png",
    width: 60%,
  )
]

$
  T & = min { n: X_n in {0, N} } \
    & ="time at end of game."
$

$
  E_x T = x(N-x)
$

#pagebreak()

$therefore$ Taking $N -> oo$: for sym. SRW reflected at 0, $E_1 T_0 = oo$.

$therefore E_0 T_0 = 1/2 + 1/2 (1 + E_1 T_0)$

$=> E_0 T_0 = oo$

$therefore$ 0 is null rec

$therefore$ All states are null rec ($(X_n)$ IRR.)

#pagebreak()

Branching Processes (BP)

Start with 1 particle $X_0 = 1$.

Suppose that each particle in any generation gives birth to an IID number of particles before it dies, according to some *distribution*#footnote["offspring distribution" often denoted by $xi$.] with mean $mu$.


#pagebreak()

Let $X_n$ = \# particles in $n$th generation. \
$(X_n)$ is a MC.

$
          & X_0 = 1 \
  \& quad & X_n | X_(n-1) = m = sum_(i=1)^m xi_i^(n)
$

where $xi_i^(n)$ IID, $E xi = mu$.

Q: Will MC ever visit (the absorbing state) 0 --- i.e. will the population die out eventually?

#pagebreak()

We will ignore the trivial case $P(xi = 1) = 1$. In this case each particle gives birth to 1 particle, $mu=1$, and the population survives.

#figure[
  #image(
    "./figs/p15_39m.png",
    height: 60%,
  )
]

#pagebreak()

In all other cases, survival only depends on whether $mu > 1$ or $mu <= 1$.

Theorem
$(X_n)$ a BP with offspring distribution $xi$, $mu = E xi$. Suppose $P(xi=1) != 1$.
Then

$
  rho = P("extinct") & = P(X_n=0 " eventually") \
                     & = cases(
                         1 & quad mu <= 1,
                         <1 & quad mu > 1
                       )
$

Moreover, $rho = P("extinct")$ is smallest positive solution to $x = sum_k P(xi=k)x^k$.

#pagebreak()

- The borderline case $mu=1$ is the most surprising.
- Also very useful that this result also gives us a formula for $P("survive") = 1 - rho$.

#pagebreak()

Recall

$
  & X_n | (X_(n-1) = m) = sum_(i=1)^m xi_i \
  & => E(X_n | X_(n-1)=m) = m mu \
  & => E(X_n | X_(n-1)) = mu X_(n-1) \
  & => E(X_n) = mu E(X_(n-1))
$

Since $X_0 = 1$, this implies

$
  E(X_n) = mu^n quad "for all" n >= 0
$

#pagebreak()

Hence

$
  E(X_n) ->^(n->oo) cases(
    0 & quad mu < 1,
    1 & quad mu = 1,
    oo & quad mu > 1
  )
$

By Markov's Inequality,

$
  & P(X_n > 0) <= E(X_n) -> 0 "if" mu < 1 \
  & therefore P("extinct") -> 1 "for" mu <= 1
$

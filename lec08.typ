#import "@preview/fletcher:0.5.8": diagram, edge, node

== Lecture 8

[D] §1.4-1.6: Stationary Distributions

Main result here is that if
1. $abs(S) < infinity$
2. Aperiodic (all states period 1)
3. Irreducible ($i <-> j$ for all $i, j in S$)

Then $(X_n)$ has a stationary distribution $pi = pi underline(P)$ and

$
  lim_(n -> oo) p_(i j)^n = pi_j
$

Moreover,

#pagebreak()

Let $N_n (j)$ = \# visits to $j$ by time $n$ \
$E_j T_j$ = mean return time to $j$

$ lim_(n -> oo) (N_n (j)) / n = 1 / (E_j T_j) = pi_j $

$
  "Therefore," pi_j & = "long-run proportion of time in" j \
                    & = "inverse mean return time to" j.
$

So $pi$ tells us about the long-run behavior of a MC.

#pagebreak()

- We will prove these results later (§1.7)
- For now we study their consequences through some examples
- Markov chains with $abs(S) = oo$ can have stationary distributions but the situation is more complicated (§1.10)

#pagebreak()

Important to note:
$
  lim_(n -> oo) underbrace(p_(i j)^n, "depends on" i " & " j) = underbrace(pi_j, "does not depend on" i)
$

I.e. dependence on initial state $X_0$ decreases as $n -> oo$.

#pagebreak()

May *not* be true if $(X_n)$ is periodic or reducible:

#diagram(edge-stroke: 1pt, node-stroke: 1pt, {
  let (A, B) = ((0, 0), (1, 0))

  node(A, $1$)
  node(B, $2$)
  edge(A, B, "->", bend: 20deg)
  edge(B, A, "->", bend: 20deg)
}) (periodic)

$
  P_(11)^n = cases(
    1 " if " n " is even",
    0 " if " n " is odd"
  ) \
  therefore lim_(n->infinity) P_(11)^n "does not exist!"
$

#pagebreak()

#diagram(edge-stroke: 1pt, node-stroke: 1pt, {
  let (A, B, C) = ((0, 0), (1, 0), (2, 0))

  node(A, $1$)
  node(B, $2$)
  node(C, $3$)

  edge(A, B, "->", bend: 30deg)
  edge(B, A, "->", bend: 30deg)

  edge(A, A, "->", bend: -135deg, loop-angle: -90deg)
  edge(C, C, "->", bend: -135deg, loop-angle: -90deg)
}) (reducible)

$lim_(n -> infinity) p_(i j)^n$ depends on $i$.

$
  p_(33)^n & = 1 "for all" n \
  p_(13)^n & = p_(23)^n = 0 "for all" n
$

$therefore lim_(n -> oo) p_(i j)^n$ depends on which class $i$ is from.

#pagebreak()

#footnote[Why $pi = pi P$?]Suppose we start $(X_n)$ randomly, \
i.e. $X_0$ is a RV on $S = {1, 2, dots, m}$ \
some distribution:

$
  q_i = P(X_0 = i), quad 1 <= i <= m
$

Then what is $P(X_n = j)$? $1 <= j <= m$

#pagebreak()

$
  P(X_n = j) & = sum_(i=1)^m P(X_n = j, X_0 = i) quad "(LoTP)" \
             & = sum_(i=1)^m P(X_0 = i) P(X_n = j | X_0 = i) \
             & = sum_(i=1)^m q_i p_(i j)^n \
             & = (q underline(P)^n)_j
$

$
     "Where" q & = (q_1, q_2, dots, q_m) \
  underline(P) & = (p_(i j))
$

#pagebreak()

Recall that stationary distribution $pi = (pi_1, dots, pi_m)$ has property that

$
  lim_(n->oo) p_(i j)^n = pi_j, quad "for any" i
$

It follows that $lim_(n->oo) P(X_n = j) = pi_j$ no matter what $q$ is:

$
  P(X_n = j) = sum_i q_i p_(i j)^n \
  therefore lim_(n->oo) P(X_n = j) = sum_i q_i pi_j = pi_j overbrace(sum_i q_i, "=1") = pi_j
$

#pagebreak()

Q: \
Now, what happens if we start $(X_n)$ in from its stationary distribution: $X_0 ~ pi$ \
I.e: $pi_i = P(X_0 = i)$?

#pagebreak()

$
  P(X_n = j) = sum_i P(X_(n-1) = i) p_(i j) quad "(LoTP+Cond. prob.)"
$

Take $n -> infinity$:

$
  pi_j = sum_i pi_i p_(i j)#footnote[$=(pi underline(P))_j$]
$

That is,

$
  pi = pi underline(P)#footnote[Probably the most important formula in §1.]
$

#pagebreak()

Note $pi = pi underline(P) =>$

$
  => pi underline(P)^2 = (pi underline(P)) underline(P) = pi underline(P) = pi
$

etc.

$
  => pi = pi underline(P)^n
$

for any $n$.

$
  => "if" X_0 ~ pi, "then" P(X_n = i) = pi_i
$

#pagebreak()

In other words:

If we start $(X_n)$ from $pi$, i.e. $X_0 ~ pi$, then $(X_n)$ stays in $pi$ forever:

$
  X_0 ~ pi => X_n ~ pi
$

for all $n$.

For this reason, we also sometimes call $pi$ the *equilibrium*.

#pagebreak()

There are many simple examples in §1.4 for you to look at.
- Can always try to find stationary distribution $pi$ by solving the system of equations $pi = pi underline(P)$ directly. Sometimes this is doable.
- However, often this is complicated. Several important special cases where $pi$ can be found are in §1.6.

#pagebreak()

A special case where it is easy to find $pi$:

For any $underline(P)$, rows sum to $1$:

$
  sum_j p_(i j) = 1, quad "for any" i
$

Def: $underline(P)$ is doubly stochastic if also columns sum to $1$:

$
  sum_i p_(i j) = 1, quad "for any" j
$

#pagebreak()

If $|S| = m$ and $underline(P)$ doubly stochastic then $pi = (1/m, dots, 1/m)$.

I.e. stationary distribution is uniform on $S$:

$
  (pi underline(P))_j = sum_i 1/m p_(i j) = 1/m sum_i p_(i j)#footnote[$sum_i p_(i j) = 1$ since $underline(P)$ is doubly stochastic.] = 1/m = pi_j \
  therefore pi = pi underline(P) quad square
$

- Other important special cases where $pi$ can be found are in §1.6.

#pagebreak()

Detailed Balance Equations \
Suppose that for some $pi=(pi_1, ..., pi_m)$
$
  pi_i p_(i j) = pi_j p_(j i) quad "for all" i, j quad "(DB)"
$

Then $pi = pi underline(P)$.

$
  (pi underline(P))_j & = sum_i pi_i p_(i j) =^("DB") sum_i pi_j p_(j i) \
                      & = pi_j overbrace(sum_i p_(j i), "=1") = pi_j \
                      & => pi underline(P) = pi
$

#pagebreak()

For what MC's $(X_n)$ should we expect DB to hold?#footnote[DB$=>$SD, but not SD$=>$DB]

$
  pi_i#footnote[$= lim_(n->oo) P(X_n=i) =$ LR proportion of time in $i$] p_(i j) = pi_j#footnote[LR proportion of time in $j$] p_(j i)
$

$therefore$ DB says LR prop. of transitions $i -> j$ = LR prop. of transitions $j -> i$.

#pagebreak()

Eg: Recall the Ehrenfest chain:

$N$ molecules separated by a thin membrane into 2 chambers.
Sometimes a molecule slips through.

$X_n$ = \# molecules in 1st chamber.

Each step pick a random molecule and move through.
$
  p_(i j) = cases(
    i/N & quad "for" j = i-1,
    1 - i/N & quad "for" j = i+1,
    0 & quad "o/w"
  )
$

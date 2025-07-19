#import "@preview/fletcher:0.5.8": diagram, edge, node

== Lecture 10

Eg Prof has 3 umbrellas.
Each day

#diagram(
  edge-stroke: 1pt,
  {
    let (A, B) = ((0, 0), (1, 0))

    node(A, "Home")
    node(B, "Office")
    edge(A, B, "->", label: "PM", bend: 10deg)
    edge(B, A, "->", label: "AM", bend: 10deg)
  },
)

Rains w.p. $p$ on each trip.

Takes umbrella if raining & has one at current location (o/w gets wet).

Q: What long-run fraction of time does prof get wet?

#pagebreak()

$X_n$ = \# umbrellas at current location

#let diagram_prof_unbrella = diagram(
  edge-stroke: 1pt,
  node-stroke: 1pt,
  {
    let (A, B, C, D) = ((0, 0), (1, 0), (2, 0), (3, 0))

    node(A, $0$)
    node(B, $3$)
    node(C, $1$)
    node(D, $2$)

    edge(A, B, "->", label: $1$, bend: 20deg)
    edge(B, C, "->", label: $p$, bend: 20deg)
    edge(C, D, "->", label: $1-p$, bend: 20deg)

    edge(D, C, "->", label: $1-p$, bend: 20deg)
    edge(C, B, "->", label: $p$, bend: 20deg)
    edge(B, A, "->", label: $1-p$, bend: 20deg)

    edge(D, D, "->", label: $p$, bend: 135deg, loop-angle: 0deg)
  },
)
#diagram_prof_unbrella

Can try to solve $pi = pi underline(P)$ directly. \
*But* easier to use DB. \
(DB because for any $i, j$ such that $p_(i j) > 0$, if we go $i -> j$ we must $j -> i$ before $i -> j$ again.)

#pagebreak()

Normalizing method

1. First find $x_i p_(i j) = x_j p_(j i) forall i, j$.
2. Then $pi_i = x_i / (sum_j x_j)$ is SD.

We are "normalizing" in step 2. so that $sum_i pi_i = 1$.

#pagebreak()

// #diagram_prof_unbrella

$
  & x_0 = (1-p) x_3 \
  & x_3 p = x_1 p \
  & x_1 (1-p) = x_2 (1-p) \
  & => cases(
      x_1 = x_2 = x_3,
      x_0 = (1-p) x_3
    )
$

Since we will normalize after, it doesn't matter which $x_i$ we take, as long as $!= 0$. $x_1 = 1$ is easy:

$
  x = (1-p, 1, 1, 1) => pi = ( (1-p)/(4-p), 1/(4-p), 1/(4-p), 1/(4-p) )
$

#pagebreak()

Q: What LR fraction of time does prof get wet?

This is $pi_0 p$ = LR prop. of times it is raining in his current location before the next trip.

$
  pi_0 p = (p(1-p))/(4-p)
$

#figure[
  #image(
    "./figs/p10_18m.png",
    width: 45%,
  )
]

#pagebreak()

The previous MC is a special case of "brith & death" (B&D) MC.

In such a MC, $|S|={l, l+1, dots, r}$ for some $l < r$ and

#figure[
  #image(
    "./figs/p10_22m.png",
    width: 80%,
  )
]

All other $p_(i j)=0$.

#pagebreak()

A B&D MC always satisfies DB:

($\#{i -> j "by time" n} = \#{i <- j "by time" n} plus.minus 1$ for any $i, j$ and time $n$.)

You can use this to find $pi$.

$
  pi_(l+i) = pi_l (p_l p_(l+1) dots p_(l+i-1)) / (q_(l+1) q_(l+2) dots q_(l+i))
$

#pagebreak()

DB:

$
  & pi_l p_l = pi_(l+1) q_(l+1) \
  & => pi_(l+1) = pi_l p_l/q_(l+1) \
  & pi_(l+1) p_(l+1) = pi_(l+2) q_(l+2) \
  & => pi_(l+2) = pi_(l+1) p_(l+1)/q_(l+2) = pi_l (p_l p_(l+1))/(q_(l+1) q_(l+2)) \
  & dots.v "etc." \
  & pi_(l+i) = pi_l (p_l p_(l+1) dots p_(l+i-1)) / (q_(l+1) q_(l+2) dots q_(l+i))
$

#pagebreak()

Eg SRW on ${a, a+1, dots, b}$ with "reflecting" boundary points $a, b$:

#figure[
  #image(
    "./figs/p10_32m.png",
    width: 40%,
  )
]

$pi_(a+i) = pi_a (p_a p_(a+1) dots p_(a+i-1)) / (q_(a+1) q_(a+2) dots q_(a+i)) = pi_a (p/q)^i$

Case 1. If $p=q=1/2, pi_a = pi_(a+1) = dots = pi_b$

$
  => pi = ( 1/(b-a+1), dots 1/(b-a+1) ) quad "(Uniform)"
$

#pagebreak()

Case 2. If $p != q$, then $pi_(a+i) = pi_a (p/q)^i$

We need $sum_(i=0)^(b-a) pi_(a+i) = 1$, so

$
  1/pi_a = sum_(i=0)^(b-a) (p/q)^i = ((p/q)^(b-a+1) - 1) / (p/q - 1)
$

Therefore,

$
  pi_(a+i) = (p/q - 1) / ((p/q)^(b-a+1) - 1) (p/q)^i
$

#pagebreak()

Metropolis-Hastings Algorithm

Used in Bayesian statistics, image reconstruction, for studying complicated statistical physics models, etc...

Suppose we want to sample from some distribution $pi$ on a set $S$.

#pagebreak()

We can construct a MC $(X_n)$ with SD $pi$.
If we run $(X_n)$ for a long time, $P(X_n = i) approx pi_i$, so the position of $(X_n)$ after a long time is close to a sample from the distribution $pi$.

Metropolis-Hastings gives us a method of constructing such a MC $(X_n)$:

#pagebreak()

Let $(Y_n)$ be a MC on $S$ with tr. prob. $q_(i j)$.

Then let $(X_n)$ be the MC on $S$ with tr. prob.

$
  & p_(i j) = q_(i j) r_(i j) \
  & quad "where" r_(i j) = min { (pi_j q_(j i)) / (pi_i q_(i j)), 1 }
$

#pagebreak()

In other words, if $(X_n)$ is currently at $i$, we select a possible next transition according to what $(Y_n)$ would do ($i -> j$ w.p. $q_(i j)$), *however* we accept this transition only with probability

$
  r_(i j) = min { (pi_j q_(j i)) / (pi_i q_(i j)), 1 }#footnote[w.p $1-r_(i j)$, we reject and staty at $i$]
$

Otherwise we stay at $i$ in this step.

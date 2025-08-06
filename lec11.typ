#import "@preview/fletcher:0.5.8": diagram, edge, node

== Lecture 11

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

#pagebreak()

Then $X_n$ has SD $pi$.

To see this we check DB:

$
  pi_i p_(i j) = pi_j p_(j i) quad forall i, j
$

Recall $p_(i j) = q_(i j) r_(i j) = q_(i j) min { (pi_j q_(j i)) / (pi_i q_(i j)), 1 }$.

*Case 1:*

$
  & "Suppose" (pi_j q_(j i)) / (pi_i q_(i j)) <= 1 \
  & "Then" r_(i j) = (pi_j q_(j i)) / (pi_i q_(i j)) "and" r_(j i) = 1
$

#pagebreak()

$
  therefore pi_i p_(j i) & = pi_i q_(j i) r_(j i) \
                         & = pi_i q_(j i) (pi_j q_(j i)) / (pi_i q_(j i)) \
                         & = pi_j q_(j i) \
$

$
  & pi_j p_(j i) & = pi_j q_(j i) r_(j i) \
  &              &         = pi_j q_(j i) \
$

$
  => pi_i p_(j i) = pi_j p_(j i)
$

#pagebreak()

*Case 2:* $(pi_j q_(j i)) / (pi_i q_(j i)) >= 1$ is symmetric, and follows similarly.

Therefore $(X_n)$ satisfies DB with $pi$. Hence $pi = pi underline(P)$.

$
  therefore lim_(n -> oo) P(X_n = i) = pi_i, "as desired"
$

#pagebreak()

Example: Generating samples from Geometric($lambda$), $lambda in (0,1)$, using SRW.

Then
$
  pi_i & = P("Geometric"(lambda) = i) \
       & = lambda^i (1-lambda) , i = 0, 1, dots
$

$(X_n)$ SRW: $q_(j i) = cases(
  1/2 quad j = i plus.minus 1,
  0 quad "o/w"
)$

$
  r_(j i) = min {1, (pi_j cancel(q_(j i))) / (pi_i cancel(q_(j i)))} = min {1, lambda^(j-i)}
$

#pagebreak()

Since $lambda < 1, r_(i, i+1) = lambda$ & $r_(i, i-1) = 1$#footnote[$= min {1, 1 / lambda}$]

$(Y_n)$ has $p_(i,j)$:

#align(center)[
  #text(size: 8pt)[
    #diagram(
      edge-stroke: 1pt,
      node-stroke: 1pt,
      {
        let (A, B, C, D, E) = ((0, 0), (1, 0), (2, 0), (3, 0), (3.75, 0))

        node(A, $0$)
        node(B, $1$)
        node(C, $2$)
        node(D, $3$)
        node(E, $dots$, stroke: 0pt)

        edge(A, B, "->", label: $lambda / 2$, bend: 20deg)
        edge(B, C, "->", label: $lambda / 2$, bend: 20deg)
        edge(C, D, "->", label: $lambda / 2$, bend: 20deg)

        edge(D, C, "->", label: $1 / 2$, bend: 20deg)
        edge(C, B, "->", label: $1 / 2$, bend: 20deg)
        edge(B, A, "->", label: $1 / 2$, bend: 20deg)

        edge(
          A,
          A,
          "->",
          label: $(1 - lambda) / 2$,
          bend: 135deg,
          loop-angle: 90deg,
        )
        edge(
          B,
          B,
          "->",
          label: $(1 - lambda) / 2$,
          bend: 135deg,
          loop-angle: 90deg,
        )
        edge(
          C,
          C,
          "->",
          label: $(1 - lambda) / 2$,
          bend: 135deg,
          loop-angle: 90deg,
        )
        edge(
          D,
          D,
          "->",
          label: $(1 - lambda) / 2$,
          bend: 135deg,
          loop-angle: 90deg,
        )
      },
    )
  ]#footnote[irreducible, aperiodic, $|S| = oo$]
]

Running $(Y_n)$ for a long time gives an approx sample from $"Geometric"(lambda)$ distribution.

#pagebreak()

[D] §1.7 --- Proof of main theorems

Recall from last week:

*Main MC Theorem*
If $(X_n)$ is aperiodic, irreducible and $|S| < oo$, then there is a SD $pi$ ( i.e. $pi = pi underline(P)$ & $sum pi_i = 1$) and

$
  & 1. lim_(n->oo) p_(i j)^n = pi_j quad "for any" i \
  & 2. lim_(n->oo) (N_n (j)) / n#footnote[LR prop. of time in $j$.] = 1 / (E_j [T_j])#footnote[Inverse mean return time to $j$.] = pi_j
$

#pagebreak()

We'll prove this theorem this week. Along the way we'll prove some more general results:#footnote[Holds for $|S| = oo$.]

*Theorem 1.19*
Suppose $(X_n)$ is irreducible, aperiodic and has a SD $pi = pi underline(P)$.
Then
$lim_(n->oo) p_(i j)^n = pi_j quad "for all" i,j$

*Theorem 1.20*
Suppose $(X_n)$ is irreducible and  Rec. Then it has a stationary measure $mu >= 0: sum_i mu_i p_(j i) = mu_j$ for all $i$.

#pagebreak()

*Note:* We don't assume $|S| < oo$ above.

However, if $|S| < oo$ then the stationary measure $mu$ can be normalized to get a SD:

$
  pi_i = mu_i / (sum_j mu_j)#footnote[$sum < oo$ since $|S| < oo$]
$

Then $pi >= 0$, $sum_i pi_i = 1$, & $pi = pi underline(P)$.

$therefore$ Theorems 1.19 & 1. 20 $=>$ Part (1.) in the main theorem.

#pagebreak()

However, if $|S| = oo$, we may not be able to normalize.

E.g. $(X_n)$ symmetric SRW on $Z$.

$mu_i equiv 1 quad sum_j mu_j = oo$

$therefore$ $pi$ would have to be $pi=0$ which is *not* a prob. dist. (does not add to $1$)

#pagebreak()

To prove theorem 1.19, we need:

*Lemma*
If $(X_n)$ has a SD $pi$ (i.e. $pi=pi underline(P)$ & $sum_i pi_i = 1$) then all states with $pi_j > 0$ are Rec.

*Proof.* From previous lectures,

$
  E_i N_j = sum_(n=1)^oo p_(i j)^n
$

$
  therefore sum_i pi_i E_i N_j = sum_(i=1)^oo pi_i sum_(n=1)^oo p_(i j)^n
$

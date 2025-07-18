== Lecture 10

*EG* Prof has 3 umbrellas. Each day
$ "TODO" ("am")^("pm") "TODO" $

Rains w.p. $p$ on each trip.

Takes umbrella if raining & has one at current location (o/w gets wet).

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 3pt,
  [*Q: What long-run fraction of time does prof get wet?*],
)

#pagebreak()

$ X_n = \# "umbrellas at current location" $

$
  0 "TODO"(1-p)^1 3 "TODO"^p 1 "TODO"(1-p)^(1-p) 2 "TODO"(p)
$

// The blue "why?" points to the self-loop on state 2.

Can try to solve $ pi = pi P $ directly.

*But* easier to use DB.

(DB because for any $i, j$ such that $P_(i j) > 0$, if we go $i -> j$ we must $j -> i$ before $i -> j$ again.)

#pagebreak()

== Normalizing method

1. First find $ x_i P_(i j) = x_j P_(j i) $ for all $i, j$.

2. Then $ pi_i = x_i / (sum_j x_j) $ is solution.

We are "normalizing" in step 2 so that $ sum_i pi_i = 1 $.

#pagebreak()

$
  0 "TODO"(1-p)^1 3 "TODO"^p 1 "TODO"(1-p)^(1-p) 2 "TODO"(p)
$

$ x_0 = (1-p) x_3 $
$ x_3 p = x_1 p $
$ x_1 (1-p) = x_2 (1-p) $

$ => x_1 = x_2 = x_3 $
$ x_0 = (1-p) x_3 $

Since we will normalize after, it doesn't matter which $x_i$ we take, as long as $!= 0$. $x_1 = 1$ is easy:

$ x = (1-p, 1, 1, 1) ==> pi = ( (1-p)/(4-p), 1/(4-p), 1/(4-p), 1/(4-p) ) $

#pagebreak()

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 3pt,
  [*Q: What long-run fraction of time does prof get wet?*],
)

This is $pi_0 p$ = long-run prop. of times it is raining in his current location before the next trip.

$ pi_0 p = (p(1-p))/(4-p) $

// A plot of $pi_0 p$ vs $p$ shows a downward-opening parabola on the interval $[0, 1]$.
// An arrow points to the curve, labeled "Worst climate for prof."
// The maximum is labeled at $p_* approx 0.5359$.

#pagebreak()

#underline[A B&D MC always satisfies DB:]

($ \# {i -> j " by time " n} = \# {i <- j " by time " n} +- 1 $ for any $i, j$ and time $n$.)

You can use this to find $pi$.

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 3pt,
  $
    pi_(l+i) = pi_l (p_l p_(l+1) dots p_(l+i-1)) / (q_(l+1) q_(l+2) dots q_(l+i))
  $,
)

#pagebreak()

DB: $ pi_l p_l = pi_(l+1) q_(l+1) $
$ => pi_(l+1) = pi_l p_l/q_(l+1) $

$ pi_(l+1) p_(l+1) = pi_(l+2) q_(l+2) $
$
  => pi_(l+2) = pi_(l+1) p_(l+1)/q_(l+2) = pi_l (p_l p_(l+1))/(q_(l+1) q_(l+2))
$

$dots$ etc.

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 3pt,
  $
    pi_(l+i) = pi_l (p_l p_(l+1) dots p_(l+i-1)) / (q_(l+1) q_(l+2) dots q_(l+i))
  $,
)

#pagebreak()

*EG* SRW on $ {a, a+1, ... b} $ with "reflecting" boundary points $a, b$:

TODO
// $ a circle.arrow.cw(q) longrightarrow_p longleftrightarrow_q^p i-1 longleftrightarrow_q^p i longleftrightarrow_q^p i+1 longleftrightarrow_q^p b circle.arrow.cw(p) $

$
  pi_(a+i) = pi_a (p_a p_(a+1) dots p_(a+i-1)) / (q_(a+1) q_(a+2) dots q_(a+i)) = pi_a (p/q)^i
$

*Case 1.* If $p=q=1/2$, $ pi_a = pi_(a+1) = ... = pi_b $
$ => pi = ( 1/(b-a+1), ..., 1/(b-a+1) ) $ (Uniform)

#pagebreak()

*Case 2.* If $p != q$, then $ pi_(a+i) = pi_a(p/q)^i $

We need $ sum_(i=0)^(b-a) pi_(a+i) = 1 $, so

$ 1/pi_a = sum_(i=0)^(b-a) (p/q)^i = ((p/q)^(b-a+1) - 1) / (p/q - 1) $

Therefore,
$ pi_(a+i) = (p/q - 1) / ((p/q)^(b-a+1) - 1) (p/q)^i $

#pagebreak()

Metropolis-Hastings Algorithm

Used in Bayesian statistics, image reconstruction, for studying complicated statistical physics models, etc...

Suppose we want to sample from some distribution $pi$ on a set $S$.

#pagebreak()

We can construct a MC $(X_n)$ with SD $pi$. If we run $(X_n)$ for a long time, $P(X_n = i) approx pi_i$, so the position of $(X_n)$ after a long time is close to a sample from the distribution $pi$.

Metropolis-Hastings gives us a method of constructing such a MC $(X_n)$:

#pagebreak()

Let $(Y_n)$ be a MC on $S$ with tr. prob. $q_(i j)$.

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 3pt,
  [
    Then let $(X_n)$ be the MC on $S$ with tr. prob.
    $ P_(i j) = q_(i j) r_(i j) $, where
    $ r_(i j) = min { (pi_j q_(j i)) / (pi_i q_(i j)), 1 } $
  ],
)

#pagebreak()

In other words, if $(X_n)$ is currently at $i$, we select a possible next transition according to what $(Y_n)$ would do ($i -> j$ w.p. $q_(i j)$), *however* we accept this transition only with probability
$ r_(i j) = min { (pi_j q_(j i)) / (pi_i q_(i j)), 1 } $
Otherwise we stay at $i$ in this step.

#pagebreak()

*Case 2:* $ (pi_j q_(j i)) / (pi_i q_(i j)) >= 1 $ is symmetric, and follows similarly.

Therefore $(X_n)$ satisfies DB with $pi$. Hence $pi = pi P$.

$ therefore lim_(n->oo) P(X_n=i) = pi_i $, as desired.

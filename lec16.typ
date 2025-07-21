== Lecture 16

Branching Processes (BP)

Start with 1 particle $X_0=1$.

Suppose that each particle in any generation gives birth to an iid number of particles before it dies, according to some distribution with mean $mu$.

("offspring distribution" often denoted by $xi$)

#pagebreak()

Let $X_n$ = \# particles in $n$th generation.
($X_n$) is a MC.

$
  X_0 = 1
$
$
  & X_n | X_(n-1) = m = sum_(i=1)^m xi_i^(n)
$

where $xi_i^(n)$ iid, $E xi = mu$.

*Q: Will MC ever visit (the absorbing state) 0 -- i.e. will the population die out eventually?*

#pagebreak()

We will ignore the trivial case $P(xi=1)=1$. In this case each particle gives birth to 1 particle, $mu=1$, and the population survives:

$
  dots.v
$
$
  arrow.t
$
$
  dots.v
$
$
  arrow.t
$
$
  dots.v
$
$
  arrow.t
$
$
  dots.v
$

#pagebreak()

In all other cases, survival only depends on whether $mu > 1$ or $mu < 1$.

*Theorem*: $(X_n)$ a BP with offspring distribution $xi$, $mu=E xi$. Suppose $P(xi=1) != 1$. Then
$
  rho = P("extinct") = P(X_n=0 " eventually") = cases(
    1 & "if " mu <= 1,
    <1 & "if " mu > 1
  )
$

Moreover, $rho = P("extinct")$ is smallest positive solution to $x = sum_k P(xi=k) x^k$.

#pagebreak()

- The borderline case $mu=1$ is the most surprising.

- Also very useful that this result also gives us a formula for $P("survive") = 1 - rho$.

#pagebreak()

Recall,
$
  X_n | X_(n-1)=m = sum_(i=1)^m xi_i
$
$
  => E(X_n | X_(n-1)=m) = m mu
$
$
  => E(X_n | X_(n-1)) = mu X_(n-1)
$
$
  => E(X_n) = mu E(X_(n-1))
$

Since $X_0=1$, this implies
$
  E(X_n) = mu^n " for all " n >= 0.
$

#pagebreak()

For $mu > 1$, we need to be more careful:

Recall, $rho = P("extinct")$. By FSA,
$
  rho = sum_(k=0)^oo P(xi=k) rho^k
$

*Why?*
Children of 1st particle. Their "family trees" are indep, and each die out eventually w.p. $rho$.

#pagebreak()

$
  phi(t) = sum_(k=0)^oo P(xi=k) t^k
$
is called the *generating function* of the RV $xi$.

From the previous slide,
$
  rho = phi(rho)
$

I.e. $rho$ is a root of $phi$.
Recall that the theorem claims that $rho$ is the *smallest* pos. root.

#pagebreak()

Also note that $theta=1$ is always a root:
$
  phi(theta) = sum_(k=0)^oo P(xi=k) theta^k
$

Set $theta=1$:
$
  phi(1) = sum_(k=0)^oo P(xi=k) = 1
$

#pagebreak()

*Lemma*. $rho$ is smallest pos. solution of $phi(theta) = theta$, $theta in [0,1]$.

*Proof*.
$
  underbrace(P(X_n=0), "Die out by time n.") = sum_(k=0)^oo P(xi=k) underbrace(P(X_(n-1)=0)^k, "All family trees of all k children of 1st particle must die out (independently) by time n-1.")
$

#pagebreak()

Let $rho_n = P(X_n=0)$
By previous slide $rho_n = phi(rho_(n-1))$.

Note $rho_0 <= rho_1 <= rho_2 <= ...$
This is because $X_(n-1)=0 => X_n=0$ for any $n$. ($A supset B => P(A) >= P(B)$)

All $rho_n <= 1$. So by calculus (Monotone Convergence Theorem) the sequence converges:
$
  lim_(n->oo) rho_n = rho_oo (= sup_n rho_n)
$

#pagebreak()

TODO
// $
//   matrix(
//     $rho_n$, $ = phi(rho_(n-1))$
//   )
//   arrow(start: (0em, 0.5em), end: (0em, 1.5em))
//   arrow(start: (3.5em, 0.5em), end: (3.5em, 1.5em))
// $
// $
//   matrix(
//     $rho_oo$, $ space(2em) rho_oo$
//   )
//   ==> rho_oo = phi(rho_oo)
// $

So $rho_oo$ is a solution to $theta = phi(theta)$.

To finish proof of lemma, we show $rho_oo$ = smallest sol. in $[0,1]$.

#pagebreak()

Let $p$ = smallest pos. sol.
We show $p = rho_oo$.

Note: $phi(theta) = sum_(k=0)^oo P(xi=k) theta^k$ is increasing in $theta$, since all $P(xi=k) >= 0$.

$rho_0 = P(X_0=0) = 0 <= p$, since $X_0=1$.

Since $phi$ increasing, $phi(rho_0) <= phi(p)$
$=> rho_1 <= p$ since $phi(rho_0) = rho_1$, and $phi(p)=p$.

#pagebreak()

Repeating argument,
all $rho_n <= p$.

Take $n->oo$, $rho_oo <= p$. $square$

Using lemma, we can now study cases $mu>1$ and $mu=1$:

#pagebreak()

mu > 1
If $P(xi=0) = 0$, then clearly $p=0$. Also, $phi(theta) = sum_(k=1)^oo P(xi=k)theta^k$ (sum starts at $k=1$), so $phi(0) = 0$. $checkmark$

If $P(xi=0) > 0$, then
$
  phi(theta) = sum_(k=0)^oo P(xi=k) theta^k
$
$
  phi'(theta) = sum_(k=1)^oo P(xi=k) dot k theta^(k-1)
$
$
  phi'(1) = sum_(k=1)^oo P(xi=k) dot k = mu.
$

If $mu>1$, slope of $phi$ at $theta=1$ is larger than 1 = slope of diagonal

#pagebreak()

mu = 1
Recall, we exclude trivial case where $P(xi=1)=1$. Then $mu=1$ and $p=0$.

Suppose $mu=1$ & $P(xi=1)<1$. We show $phi$ has no root $theta < 1$.

Note $phi'(theta) = sum_(k=1)^oo P(xi=k) k theta^(k-1)$
$
  < sum_(k=1)^oo P(xi=k) k = mu = 1
$
if $theta < 1$.

#pagebreak()

$=> therefore$ If $theta < 1$ then
$
  integral_theta^1 phi'(u) d u = phi(1) - phi(theta) = 1 - phi(theta)
$
$
  < integral_theta^1 1 d u = 1 - theta
$

$=> phi(theta) > 1 - (1-theta) = theta$.

$therefore phi(theta) > theta$ for $theta < 1$.

$therefore theta=1$ only root in $[0,1]$. $square$

#pagebreak()

Eg Binary Branching:

TODO
// $
//   dot
//   arrow(start: (0em, 0.5em), end: (-1em, -0.5em))
//   arrow(start: (0em, 0.5em), end: (1em, -0.5em))
//   (x: -1em, y: -0.5em, dot)
//   (x: 1em, y: -0.5em, dot)
// $

$
  mu = 2alpha
$
TODO
// $ P(xi=2) = alpha, space(1em) P(xi=0) = 1 - alpha $

$
  phi(theta) = sum_(k=0)^oo P(xi=k) theta^k = 1 - alpha + alpha theta^2
$

$
  phi(theta) = theta => 0 = (theta-1)(alpha theta - (1-alpha)).
$

Roots are $theta=1$ & $theta = (1-alpha)/alpha < 1$ for $alpha > 1/2$ when $mu > 1$.

#pagebreak()

We turn now to:
[p] §1.9 & 1.10 on *Exit Distributions & Times*. (Basically just FSA).

*
We have already seen some of this in homework & workshops.
* Basis for this is FSA (First Step Analysis)

Eg: Gambler's ruin, $P_x("Jackpot")$ & $P_x("Ruin")$ is the exit distrib. from ${1, 2, ..., N-1}$ started at $x$.

== Lecture 15

Generalized Main MC Theorem
$(X_n)$ an *irreducible, ergodic* MC. Then

1. There is a SD $pi: pi = pi P$ & $sum pi_i = 1$
2. $lim_(n -> oo) p_(i j)^(n) = pi_j$; for all $i, j$.
3. $ pi_j = lim_(n -> oo) (N_n(j)) / n = $ LR prop. of steps in state $j$
  $ = 1 / (E_j T_j) = $ inverse mean return time to $j$

#pagebreak()

Eg: SRW Reflected at 0

TODO
// $ q circlearrowright 0 <->_(q)^(p) 1 <->_(q)^(p) 2 <-> ... $

What is SD $pi$? Does it exist?

#pagebreak()

This is a *B&D* MC (recall this means $p_(i j) = 0$ unless $j in {i, i+-1}$).
So to find SD, we try to solve DB equations.

*Recall normalizing method:*
1. Find $x_i p_(i j) = x_j p_(j i)$ (usually start by setting some $x_i = 1$)
2. Then put $pi_i = x_i / (sum_j x_j)$.

This works provided $sum_i x_i < oo$.

#pagebreak()

$(X_n)$ is clearly irreducible.
$therefore$ For $p < 1/2$, $(X_n)$ is IRR & has SD.

By theorem 1.22 above,
$
  E_j T_j = 1 / pi_j = (q/p)^j (1-p)/(1-2p) < oo
$

$therefore$ For $p < 1/2$ all states are pos rec.

#pagebreak()

What happens for $p >= 1/2$?

- In this case, RW is getting pulled away from the reflecting boundary. It seems that RW can drift off to $oo$ and not have an equilibrium, at least when $p > 1/2$. $p = 1/2$ seems less clear.

#pagebreak()

Recall From HW #1

TODO
// $ 0 under(q <- i -> p) N $

$
  P_x( "hit N before 0" ) = ((q/p)^x - 1) / ((q/p)^N - 1)
$

$
  -> 1 - (q/p)^x
$

As $N -> oo$, provided $q/p < 1$ ($p > 1/2$)

#pagebreak()

$therefore$ For SRW reflected at 0:
$
  P_x (T_0 < oo) = (q/p)^x < 1
$

$therefore$ For $p > 1/2$, all states are trans.

What about the borderline case $p=1/2$?

#pagebreak()

Symmetric ($p=1/2$) SRW on $Z$ is rec. Therefore so is symmetric SRW reflected at 0.
(Why? Start at 0. Either $X_1=0$, or $X_1=1$. If $X_1=1$, since SRW on $Z$ is rec., we will visit 0 again w.p. 1.)

However, it is *null rec*, and so doesn't have a SD.

#pagebreak()

By FSA can show:

TODO
// $ 0 under(1/2 <- i -> 1/2) N $

$
  T = min { n: X_n in {0, N} }
$
$ = $ time at end of game.

$ E_x T = x(N-x) $.

#pagebreak()

$therefore$ Taking $N -> oo$: for sym. SRW reflected at 0, $E_1 T_0 = oo$.

$therefore E_0 T_0 = 1/2 + 1/2 (1 + E_1 T_0)$

$=> E_0 T_0 = oo$

$therefore$ 0 is null rec

$therefore$ All states are null rec ($(X_n)$ IRR.)

#pagebreak()

Branching Processes (BP)

Start with 1 particle $X_0 = 1$.

Suppose that each particle in any generation gives birth to an IID number of particles before it dies, according to some *distribution* with mean $mu$.

$L>$ "offspring distribution" often denoted by $xi$.

#pagebreak()

Let $X_n$ = \# particles in $n$th generation.
$(X_n)$ is a MC.

$
  X_0 = 1
$
& $ X_n | X_(n-1) = m = sum_(i=1)^m xi_i^(n) $

where $xi_i^(n)$ IID, $E xi = mu$.

*Q: Will MC ever visit (the absorbing state) 0 — i.e. will the population die out eventually?*

#pagebreak()

We will ignore the trivial case $P(xi = 1) = 1$. In this case each particle gives birth to 1 particle, $mu=1$, and the population survives.

$
  dots.v
$
$arrow.t$
$arrow.t$
$arrow.t$

#pagebreak()

In all other cases, survival only depends on whether $mu > 1$ or $mu <= 1$.

Theorem
$(X_n)$ a BP with offspring distribution $xi$, $mu = E xi$. Suppose $P(xi=1) != 1$. Then
$
  rho = P("extinct") = P(X_n=0 " eventually") = cases(
    1 & "if " mu <= 1,
    <1 & "if " mu > 1
  )
$

Moreover, $rho = P("extinct")$ is smallest positive solution to $x = sum_k P(xi=k)x^k$.

#pagebreak()

*
The borderline case $mu=1$ is the most surprising.
* Also very useful that this result also gives us a formula for $P("survive") = 1 - rho$.

#pagebreak()

Recall

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

Since $X_0 = 1$, this implies
$ E(X_n) = mu^n " for all " n >= 0 $.

#pagebreak()

Hence

$
  E(X_n) ->_(n->oo) cases(
    0 & "if " mu < 1,
    1 & "if " mu = 1,
    oo & "if " mu > 1
  )
$

By Markov's Inequality,
$ P(X_n > 0) <= E(X_n) -> 0 $ if $mu < 1$

$therefore P("extinct") -> 1$ for $mu <= 1$.

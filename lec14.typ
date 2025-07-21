#import "@preview/fletcher:0.5.8": diagram, edge, node

== Lecture 14

Last week we proved the main MC theorem for finite state space MC's:

*Theorem.* $(X_n)$ an IRR, APER MC on state space $|S| < oo$. Then

1. There is a SD $pi$: $pi = pi underline(P)$ & $sum pi_j = 1$
2. $lim_(n -> oo) p_(i j)^n = pi_j$ for all $i, j$.
3. $pi_j = lim_(n -> oo) (N_n(j)) / n$ = LR prop. of steps in state $j$ $= 1 / (E_j T_j)$ = inverse mean return time to $j$

#pagebreak()

To prove this, we proved several general results:

*Theorem 1.19* Suppose $(X_n)$ is IRR, aperiodic and has a SD $pi=pi underline(P)$. Then $lim_(n->oo) p_(i j)^n = pi_j$ for all $i,j$

*Theorem 1.20* Suppose $(X_n)$ is IRR and REC. Then it has a stationary measure $mu >= 0$: $sum_i mu_i p_(i j) = mu_j$ for all $i$.

#pagebreak()

#text(size: 10pt)[
  *Theorem 1.21* $(X_n)$ IRR & REC. Then
  $
    lim_(n->oo) (N_n (j)) / n = 1 / (E_j T_j)
  $

  *Theorem 1.22* If $(X_n)$ IRR & has SD $pi$ (i.e. $pi=pi underline(P)$ & $sum_i pi_i = 1$) then
  $
    pi_j = 1 / (E_j T_j)
  $

  *Theorem 1.23* Suppose $(X_n)$ is IRR has SD $pi$, & $sum_x |f(x)| pi_x < oo$. Then
  $
    1/n sum_(m=1)^n f(X_m) -> sum_x f(x) pi_x
  $
]

#pagebreak()

Notice that some of the previous results can hold even when $|S| = oo$.

[D] §1.11: Infinite State Spaces

In this lecture we'll discuss the a generalized main MC theorem that can hold even when $|S|=oo$.

- The main issue is recurrence when $|S|=oo$. It is not enough *just* to be REC:

#pagebreak()

*Def* Suppose $j$ is REC: $P_j (T_j < oo) = 1$. Then we call $j$
- Positive Recurrent (Pos Rec) if $E_j T_j < oo$
- Null Recurrent (Null Rec) if $E_j T_j = oo$.

- Pos Rec: will return & mean wait time is finite.
- Null Rec: will return, but mean wait time is infinite.

#pagebreak()

- Boltzmann (1887) defined a state that is aperiodic & pos rec to be *ergodic*.

*Def* We call a MC ergodic if all states are ergodic.

#pagebreak()

Facts:

1. Pos/null rec is a class property. Therefore, so is ergodicity.
2. If a communication class is finite & rec, then it is pos rec. Therefore for finite state space MC's Rec $equiv$ Pos Rec.

#pagebreak()

*Generalized Main MC Theorem.*

$(X_n)$ an irreducible, ergodic MC. Then

1. There is a SD $pi$: $pi = pi underline(P)$ & $sum pi_i = 1$
2. $lim_(n -> oo) p_(i j)^n = pi_j$ for all $i,j$.
3. $pi_j = lim_(n -> oo) (N_n (j)) / n$ = LR prop. of steps in state $j$ $= 1 / (E_j T_j)$ = inverse mean return time to $j$

#pagebreak()

- We need pos rec so that we can normalize the stationary measure in theorem 1.20 above to get a stationary distribution: $pi = pi underline(P)$ and $sum pi_i = 1$.

#pagebreak()

*EG* SRW Reflected at 0.

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
)#footnote[$q = 1 - p$, $S = {0, 1, dots}$, $|S| = oo$]

What is SD $pi$? Does it exist?

#pagebreak()

This is a B&D MC (recall this means $p_(i j) = 0$ unless $j in {i, i plus.minus 1}$).
So to find SD, we try to solve DB equations.

Recall normalizing method:
1. Find $x_i p_(i j) = x_j p_(j i)$ (usually start by setting some $x_i=1$)
2. Then put $pi_i = x_i / (sum_j x_j)$.

This works provided $sum_j x_j < oo$.

#pagebreak()

Set $x_0 = 1$.

$
  x_0 p_(01) = x_1 p_(10) & => p = x_1 q \
                          & => x_1 = p/q \
  x_1 p_(12) = x_2 p_(21) & => p/q dot p = x_2 q \
                          & => x_2 = (p/q)^2 \
                          & dots.v \
                          & => x_j = (p/q)^j
$

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
  pi_i & = (1 - p/q)(p/q)^i = (1-2p)/(1-p) (p/q)^i#footnote[$> 0$]
$

#pagebreak()

$(X_n)$ is clearly irreducible.
$therefore$ For $p < 1/2$, $(X_n)$ IRR & has SD.

By Theorem 1.22 above,
$
  E_j T_j = 1/pi_j = (q/p)^j (1-p)/(1-2p) < oo
$

$therefore$ For $p < 1/2$ all states are pos rec.

#pagebreak()

What happens for $p >= 1/2$?

- In this case, RW is getting pull away from the reflecting boundary. It seems that RW can drift off to $oo$ and not have an equilibrium, at least when $p > 1/2$. $p=1/2$ seems less clear.

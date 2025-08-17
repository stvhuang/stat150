== Lecture 34

Finally, we'll prove the most famous result in MG theory:

"You can't beat an unfavorable game."

#pagebreak()

#underline[Theorem]
Let $(M_n)$ be a super-martingale with respect to $(X_n)$.
Let $H_n$ be "predictable" (depends only on info available #underline[before] time $n$: $X_(n-1), dots, X_0, M_0$) & bounded, $0 <= H_n <= C_n$.

Then:
$
  W_n = W_0 + sum_(m=1)^n H_m (M_m - M_(m-1))
$
where
- $W_n$ is the wealth after $n$ bets
- $W_0$ is the initial wealth
- $H_m$ is our bet on the value of $M_m - M_(m-1)$

is a *super-martingale*.

#pagebreak()

i.e. No way to bet on an unfavorable game to make it favorable if you:

* Cannot know the future ($H_n$ is predictable)
* Have a bounded amount of money to wager: $0 <= H_n <= C_n$

#pagebreak()

To see that the previous "doubling strategy" is a super-mg, let $M_n = sum_(i=1)^n X_i$ be the wealth of a gambler that places \$1 on all bets.

The wealth of a gambler that follows a doubling strategy selects $H_n = 2 H_(n-1)$ if in the last step, other gamblers...

#pagebreak()

_Proof._
$
  W_(n+1) - W_n = H_(n+1) (M_(n+1) - M_n)
$

So,
$
  & E[W_(n+1) - W_n | A_n] \
  &= E[H_(n+1) (M_(n+1) - M_n) | A_n] \
  &= H_(n+1) E[M_(n+1) - M_n | A_n] #h(2em) text("$H_(n+1)$ is constant on $A_n$")\
  &<= C_(n+1) dot 0 #h(2em) text("since $(M_n)$ is a super-mg")\
  &= 0
$

#pagebreak()

#underline[Theorem]
Let $(*M_n*)$ be a *super-martingale* wrt $(X_n)$.
Let $*H_n*$ be "predictable" (depends only on info available #underline[before] time $n$: $X_(n-1), dots, X_0, M_0$) & bounded, $0 <= *H_n* <= C_n$. (Constant depending on $n$).

Then:
$*W_n* = *W_0* + sum_(m=1)^n *H_m (M_m - M_(m-1))*$
where
- $W_n$ is the wealth after $n$ bets
- $W_0$ is the initial wealth
- $H_m$ is our bet on the value of $M_m - M_(m-1)$

is a *super-martingale*.

#pagebreak()

_Proof._
$
  W_(n+1) - W_n = H_(n+1) (M_(n+1) - M_n)
$

So
$
  & E[underline[W_(n+1) - W_n] | *A_n*] \
  &= E[H_(n+1) (M_(n+1) - M_n) | A_n] \
  &= H_(n+1) E[M_(n+1) - M_n | A_n] #h(2em) text("$H_(n+1)$ is constant on $A_n$") \
  &<= C_(n+1) dot 0 #h(2em) text("since $(M_n)$ is a super-mg") \
  &= 0
$

#pagebreak()

This theorem has a very important consequence.

Def: $T$ is a stopping time wrt $(X_n)$ if whether ${T=n}$ has occurred can be determined from the info by time $n$: $n, X_n, dots, X_0, M_0$.

We'll see many applications of the following theorem in §5.4.

#pagebreak()

#underline[Theorem]
Let $(M_n)$ be a super-martingale wrt $(X_n)$.
Let $T$ be a stopping time (ST).

Then the stopped process
// $ M_(n "and" T) = cases(
//   M_n, "if" n < T;
//   M_T, "if" n >= T;
// ) $
is a super-martingale wrt $(X_n)$.

In particular, $E[M_(n and T)] <= E[M_0]$.

If $(M_n)$ is a martingale, $E[M_(n and T)] = E[M_0]$.

#pagebreak()

_Proof._

Follows from the previous theorem by taking $H_n=1$ up to time $T$, and $H_n=0$ after the stopping time $T$. Then,
$
  W_n = M_(n and T)
$
is still a super-mg.

#pagebreak()

#underline[Warning]

As we saw for the doubling strategy, the same is #underline[not] necessarily true for $M_T$.

i.e. It is possible for $M_n$ to be a martingale and $T$ a stopping time, #underline[but] $E M_T != E M_0$.

This is a #underline[very] common mistake!

#pagebreak()

"Bad mg" where $E M_T != E M_0$

Eg: $X_i$ IID $= +- 1$ with probability $1/2$.
$
  S_n = S_0 + sum_(i=1)^n X_i
$

Suppose $S_0 = 1$.
$V_0 =$ time of 1st visit to 0.
$T = V_0$ is a ST.
Since $(S_n)$ is recurrent, $P_1(T < oo) = 1$.
$therefore S_T = 0 => E S_T = 0 != 1 = E S_0$.

#pagebreak()

The main problem is that $S_n$ can take very large values before finally visiting 0. In fact,
$
  E(max_(0 <= m <= T) S_m) = sum_(i=1)^oo P_1(V_m < V_0)
$ // Tail Sum Formula
$
  = sum_(m=1)^oo 1/m = oo
$ // Gambler's Ruin

#pagebreak()

On the other hand, if $M_n$ cannot get too large before $T$, then $E M_T = E M_0$:

*Optional Stopping Theorem (OST)* \
$(M_n)$ a martingale \
$T$ a stopping time \
$P(T < oo) = 1$, and for some $k < oo$, $abs(M_(T and n)) <= k$, then
$ E M_T = E M_0 $.

(There are other versions of the OST.)

#pagebreak()

_Proof._

Since $T$ is a ST, $E M_(T and n) = E M_0$.

$
  E M_(T and n) = E(M_T bb(1)_(T <= n)) + E(M_n bb(1)_(T > n))
$

As $n -> oo$, $E(M_n bb(1)_(T > n)) <= k P(T > n) -> 0$.

& $E(M_T bb(1)_(T <= n)) -> E M_T$.

$therefore$ Taking $n -> oo$, we find
$ E M_T = E M_0 $. // #square.stroked

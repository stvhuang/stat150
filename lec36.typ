== Lecture 36

Extinction probabilities using M.G.'s

*Def:* $X_i$ iid $ZZ$-valued, $mu = E X >= 0$, $P(X >= -1) = 1$, & $P(X = -1) > 0$. Then $S_n = S_0 + sum_(i=1)^n X_i$ is called a *left-continuous walk*.

Can make large jumps to $->$.
But can ever jump 1 to $<-$.

#pagebreak()

*Theorem.*

$
  P_x(V_0 < oo) = e^(alpha x_0)
$

where $alpha < 0$ solves $phi(alpha) = 1$ with $phi(theta) = E e^(theta X)$.

*Proof.* First note that $alpha$ is well-defined: $phi(0) = 1$ and $phi'(theta) = E(X e^(theta X))$, so $phi'(0) = E X >= 0$.

#pagebreak()

Also for $theta < 0$,
$ phi(theta) >= e^(-theta) P(X = -1) -> oo $ as $theta -> -oo$

This choice of $alpha$ makes $M_n = e^(alpha S_n)$ a M.G.

#pagebreak()

$
  E(M_(n+1) | cal(A)_n)
$
$
  = E(e^(alpha X_(n+1)) M_n | cal(A)_n)
$
$
  = M_n E e^(alpha X_(n+1))
$
since $E e^(alpha X_(n+1)) = 1$.

$M_n$ is not bounded, so again OST does not directly apply. We must use $E M_(min(n, V_0)) = E M_0$ and then take $n -> oo$.

#pagebreak()

(But ignoring this, and using OST anyway,

$
  e^(alpha x) = E_x M_0 = E_x M_(V_0)
$
$
  = P_x(V_0 < oo).
$

we do get the right answer.)

To make this rigorous,

#pagebreak()

$
  e^(alpha x) = E_x e^(alpha S_(min(V_0, n)))
$
$
  = P_x(V_0 <= n) + E_x(e^(alpha S_n) 1_(V_0 > n))
$

Take $n -> oo$: $E_x(e^(alpha S_n) 1_(V_0 > n)) -> 0$
since by SLLN $S_n approx n mu$ & $alpha < 0$
so $e^(alpha S_n) -> 0$. Hence,
$ e^(alpha x) = P_x(V_0 < oo) $. $qed$

#pagebreak()

This result can be used to obtain a "slick" proof of the branching process theorem --- using connection with left-cts walk & BP (Think: Test 1, \#2).

See [D] p. 217 for details.

#pagebreak()

[PK] §2-5
--- Martingale Maximal Inequality.

If $(M_n)$ a MG, then all
$E M_n = E M_0$.
So by Markov's Inequality,
$
  P(M_n >= lambda) <= (E M_0) / lambda.
$

#pagebreak()

However a much more powerful inequality holds:

*MG maximal inequality*

$
  P(max_(0 <= n <= m) M_n >= lambda) <= (E M_0) / lambda,
$

And so,
$
  P(max_(n >= 0) M_n >= lambda) <= (E M_0) / lambda.
$

#pagebreak()

*Eg* A gambler bets on a series of fair games (coin tosses, for example), always betting proportion $alpha in (0,1)$ of their current fortune.

$ X_n = $ fortune after $n$ bets.
$
  X_(n+1) = cases(
    (1+alpha) X_n & "w.p. " 1/2,
    (1-alpha) X_n & "w.p. " 1/2,
  )
$

#pagebreak()

*Q* Find an upper bound for prob. that they ever at some point double their money, that holds for an $alpha$.

That is,
$
  P("ever " X_n >= 2 X_0) <= ?
$

#pagebreak()

$
  therefore E(X_(n+1) | cal(A)_n)
$
$
  = 1/2 [ (1+alpha) X_n + (1-alpha) X_n ]
$
$
  = X_n
$

$ therefore $ by MG max ineq.
$
  P("ever double")
$
$
  = P(max_n X_n >= 2 X_0) <= 1/2 .
$

#pagebreak()

Proof of max ineq.

$
  E X_m = sum_(n=0)^m E(X_m 1_(X_0, dots, X_(n-1) < lambda, X_n >= lambda))
$
$
  + E(X_m 1_(X_0, dots, X_m < lambda))
$

(since $1 = sum_(n=0)^m 1_(X_0, dots, X_(n-1) < lambda, X_n >= lambda) + 1_(X_0, dots, X_m < lambda)$)

$
  >= sum_(n=0)^m E(X_m 1_(X_0, dots, X_(n-1) < lambda, X_n >= lambda))
$

#pagebreak()

$
  E X_m >= sum_(n=0)^m E(X_m 1_(X_0, dots, X_(n-1) < lambda, X_n >= lambda))
$

$
  = sum_(n=0)^m E(X_n 1_(X_0, dots, X_(n-1) < lambda, X_n >= lambda))
$

$
  E(X_m 1_(X_0, dots, X_(n-1) < lambda, X_n >= lambda))
$
$
  = E[E(X_m | X_0, dots, X_n) 1_(X_0, dots, X_(n-1) < lambda, X_n >= lambda)]
$
$
  = E(X_n 1_(X_0, dots, X_(n-1) < lambda, X_n >= lambda))
$

$
  >= lambda sum_(n=0)^m P(X_0, dots, X_(n-1) < lambda, X_n >= lambda)
$
$
  = lambda P(max_(0 <= n <= m) X_m >= lambda) space qed
$

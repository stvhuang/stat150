== Lecture 32

Martingales capture the notion of a *fair game*:

Suppose a series of outcomes $X_0, X_1, dots$ are bet on. Let $M_n =$ \$ won after $n$ bets.

($M_n$) is a martingale (MG) with respect to ($X_n$) if

#pagebreak()

1. All $E(|M_n|) < oo$ (usually not an issue.)

2. $M_n$ can be determined by $X_n, dots, X_0, M_0$ (i.e. \$ won after $n$ bets depends on initial fortune $M_0$ & first $n$ bets only.)

3. $ E(M_(n+1) - M_n | X_n = x_n, dots, X_0 = x_0, M_0 = m_0) = 0 $

for any $x_n, dots, x_0, m_0$.

(i.e. neither gambler nor the house has an advantage)

#pagebreak()

Often in our examples we will have ($X_n$) a MC & $M_n = f(X_n, n)$, i.e. some (deterministic) function of $X_n$ and $n$.

#pagebreak()

Martingales are extremely useful tools in probability.

For example, we can use them to get much easier proofs about exit distributions / exit times.

eg: Gambler's Ruin: Instead of solving tricky recurrence relations (HW\#1), MG's provide a slick proof.

#pagebreak()

To study MG's we'll need to use info about *conditional expectation* from Stat 134.

Please review your Stat 134 notes and/or read §5.1 Soj p201-204.

#pagebreak()

Shorthand notation to make life easier.

For a vector $v = (x_n, dots, x_0, m_0)$,
Let $A_v = { X_n = x_n, dots, X_0 = x_0, M_0 = m_0 }$.

Property (3) in definition of MG says $E(M_(n+1) - M_n | A_v) = 0$ for all $v$.

#pagebreak()

*Eg* SRW. $X_i$ IID. $mu = E X$.
$ S_n = S_0 + sum_(i=1)^n X_i $.

$ M_n = S_n - n mu $ MG wrt $X_n$

$
  E(M_(n+1) - M_n | A_v) = E(X_(n+1) - mu | A_v)
$
$
  = E(X_(n+1)) - mu = 0
$

#pagebreak()

*Eg* $X_i$ IID, $E X = 0$, $sigma^2 = "Var" X$.

$ M_n = S_n^2 - n sigma^2 $ MG wrt $X_n$

$
  M_(n+1) - M_n = (S_n + X_(n+1))^2 - S_n^2 - sigma^2
$
$
  = 2 S_n X_(n+1) + X_(n+1)^2 - sigma^2
$

$
  therefore E[M_(n+1) - M_n | A_v]
$
$
  = 2 S_n underbrace(E(X_(n+1)), "=0") + underbrace(E(X_(n+1)^2), "=sigma^2") - sigma^2
$
$
  = 0
$ $checkmark$

#pagebreak()

*Eg* Stock evolving in time:

$X_i$ IID, $E X = 1$.

$
  M_n = underbrace(X_n X_(n-1) dots X_1)_"fluctuations in value" underbrace(M_0)_"initial value"
$
where $M_n$ is the value at time $n$.

$
  E(M_(n+1) - M_n | A_v) = E[M_n (X_(n+1) - 1) | A_v]
$
$
  = M_n E(X_(n+1) - 1) = 0
$ $checkmark$

#pagebreak()

*Eg* Exponential MG.

$Y_i$ IID, $phi(theta) = E e^(theta Y) < oo$.

$ S_n = S_0 + sum_(i=1)^n Y_i $.

Then $M_n = (e^(theta S_n)) / (phi(theta)^n)$ is a MG
wrt ($Y_n$).

*Proof*: Use last example with $X_i = e^(theta Y_i) / phi(theta)$. $quad$ $square$

#pagebreak()

*Eg* Gambler's Ruin.

$Y_i$ IID, $P(X=1) = p$, $P(X=-1) = 1-p$.

Suppose $p != 1/2$. Then
$ M_n = (q/p)^(S_n) $ is a MG,
where $q=1-p$ & $S_n = S_0 + sum_i^n X_i$.

*Proof*. Select $theta$ such that $e^theta = q/p$.
Then $phi(theta) = p dot q/p + q dot p/q = 1$.
So by previous example $e^(theta S_n) = (q/p)^(S_n)$ is a mg. $quad$ $square$

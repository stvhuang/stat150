== Lecture 33

Recall: $(M_n)$ a mg wrt $(X_n)$ if
$
  E(M_(n+1) - M_n | A_n) = 0
$
where $A_n$ is defined by $X_n = x_n, dots, X_0 = x_0, M_0 = m_0$.

Eg Exponential mg.
$ Y_i $: IID, $phi(theta) = E e^(theta Y) < oo$.
$ S_n = S_0 + sum_(i=1)^n Y_i $.
Then $M_n = e^(theta S_n) / (phi(theta))^n$ is a mg.

#pagebreak()

Eg Gambler's ruin.
$ Y_i $: IID $P(X=-1) = p$, $P(X=-1) = 1-p$.

Suppose $p != 1/2$. Then
$ M_n = (q/p)^(S_n) $ is a mg,
where $q = 1-p$ & $S_n = S_0 + sum_i^n X_i$.

*Proof.* Select $theta$ such that $e^theta = q/p$.
Then $phi(theta) = p dot q/p + q dot p/q = 1$.
So by previous example $e^(theta S_n) = (q/p)^(S_n)$ is a mg.

#pagebreak()

In many applications, the game / process is *not* fair.

Super-mg if
$
  E(M_(n+1) - M_n | A_n) <= 0
$
$=>$ House has advantage

// To remember which is which, remember this
// from perspective of house: super/sub is good/bad
// for them.

Sub-mg if
$
  E(M_(n+1) - M_n | A_n) >= 0
$
$=>$ Gambler has advantage.

#pagebreak()

*Theorem.*
$(X_n)$ a MC, $(P)_(i j) = p_(i j)$.
Suppose
$
  f(i, n) >= sum_j p_(i j) f(j, n+1):
$
Then $M_n = f(X_n, n)$ super mg.

*Note*: $M_n$ super mg $<=> -M_n$ sub mg.
So similar result holds for sub mgs but with "$<=$" instead of "$>=$".

#pagebreak()

In many applications, the game / process is *not* fair.

Super-mg if
$
  E(M_(n+1) - M_n | A_n) <= 0
$
$=>$ House has advantage

// To remember which is which, remember this
// from perspective of house: super/sub is good/bad
// for them.

Sub-mg if
$
  E(M_(n+1) - M_n | A_n) >= 0
$
$=>$ Gambler has advantage.

#pagebreak()

*Proof.*
$
  E[f(X_(n+1), n+1) | A_n]
$
$arrow.r$ FSA
$
  = sum_y P_(X_n, y) f(y, n+1)
$
$
  <= f(X_n, n)
$
// $M_n = f(X_n, n)$
$
  therefore E[M_(n+1) - M_n | A_n] <= 0.
$
So $(M_n)$ a super mg.

#pagebreak()

[D] §5.3 — Stopping times & gambling strategies.

In this section, we'll prove the most famous result about mg's
"You cannot beat an unfolable game"

(Theorem 5.9 [D]) — Bad news for gamblers

#pagebreak()

First observation: If game is unfavorable (a super mg) then fortune will tend to $arrow.b$ in time.

*Theorem*. $(M_n)$ a supermg. Then
$ E M_n <= E M_m $ for any $n >= m$.

$=> (M_n)$ a mg. Then all $E M_n = E M_0$.

*Proof*. Try on your own.
or p 207. $qed$

#pagebreak()

To lead up to our main result, we first consider the following betting strategy (popular in 18th century France) where *martingales* got their name.

#pagebreak()

Series of iid coin flips. Bet on H. If win double your wager. Otherwise lose your wager. After every loss, double your wager, so that when you eventually win, you recover your losses + win a profit equal to size of original bet.

Eg
$
  X quad X quad X quad checkmark
$
$ 1 quad 2 quad 4 quad 8 quad -> = 15 $ spent
// $ space.h -> $ win 16

*Problem*: You might need a lot of $\$ \$ \$$ to continue along while you wait for a win.

#pagebreak()

Eg Buy lottery tickets. Every time you lose, buy twice as many next time. Would anyone want to do this?

At the stopping time $T = 1^("st")$ win we are sure to get rich --- but the process is still unfavorable (a super mg) $E(M_(n+1) | A_n) <= M_n$ for all (deterministic) times $n$. Can show directly (see [D]) --- also special case of:

#pagebreak()

*Theorem*. $(M_n)$ a super mg wrt $(X_n)$.
$H_n$ "predictable" (depends only on info available *before* time $n$: $X_(n-1), dots, X_0, M_0$) & bounded $0 <= H_n <= C_n$.
Then:
$
  underbrace(W_n, "wealth after n bets") = underbrace(W_0, "initial wealth") + sum_(m=1)^n underbrace(H_m, "our bet on value of " M_m - M_(m-1)) (M_m - M_(m-1))
$
is a super mg.

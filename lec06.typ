== Lecture 6

== Continuing [D] §1.3 — Classification of States

*Main Idea*

- State space $S$ can be split into "communication classes".
- $x, y$ in the same class if possible to get from $x$ to $y$ and back again.
- States in the same class have many of the same properties — we call these "class properties".

#pagebreak()

*Note:*
$ rho_(x y) = P_x (T_y < oo) $
// Greek letter Rho

This is what is used in Durrett. It can look like a $p$ in handwriting. I'll do my best — usually clear by context (ask me if not).

#pagebreak()

*Def*: We say that $x$ and $y$ *communicate*, $x <-> y$, if $x -> y$ and $y -> x$. We trivially define all $x <-> x$.

"$<->$ " is an *equivalence relation* on $S$. This means:
a. $x <-> x$ for all $x$ (Reflexive)
b. $x <-> y => y <-> x$ for all $x, y$ (Symmetric)
c. $x <-> y$ & $y <-> z => x <-> z$ for all $x, y, z$ (Transitive)

#pagebreak()

Consequently, the state space $S$ of any MC ($X_n$) is the disjoint union of "communication classes".

$ C_x = "Communication class of" x = { y in S: x <-> y }. $

*Note*: $x <-> x$ and $x <-> y => y <-> x$ are trivial.

#pagebreak()

We need only check that:
$<->$ is transitive:

*Lemma*: Suppose $x -> y$ & $y -> z$. Then $x -> z$.

*Proof*.
$ x -> y => p_(x y)^m > 0 $ for some $m$.
$ y -> z => p_(y z)^n > 0 $ for some $n$.
$ therefore p_(x z)^(n+m) >= p_(y z)^n p_(x y)^m > 0 $. $qed$

#pagebreak()

== Eg: Gambler's Ruin

3 communication classes.
$ C_0 = {0}, C_N = {N} $
$ C_1 = ... = C_(N-1) = {1, 2, ..., N-1} $

*Note*: $x in C_x$ for any $x$.
If $x$ is absorbing then $C_x = {x}$.

#pagebreak()

We will see in the lectures to come that many important properties of states in a MC are "class properties" --- meaning if $x$ has this property, then so do *all* $y in C_x$.

#pagebreak()

The following result is useful, especially when $abs(S) = oo$.

*Theorem.* If $x -> y$ but $p_{y,x} < 1$ then $x$ is transient.

Intuitively, there is a chance that the MC will visit $y$ before returning to $x$. And once at $y$, there is a chance it may never visit $x$ in the future.

$ therefore p_{x,x} < 1 ==> x $ is transient.

#pagebreak()

== Proof

Let $l = min{m: p_{x,y}^m > 0}$ be the length of the shortest path from $x$ to $y$. $l < oo$ since $x -> y$.

Note: by minimality, $x$ is not visited on this path.

$ therefore 1 - rho_{x,x} >= p_{x,y}^l (1 - p_{y,x}) > 0 $

$ ==> rho_{x,x} < 1 ==> x $ is transient. $square$

#pagebreak()

== Eg: Gambler's Ruin

3 communication classes.

$ C_0 = {0} $ (Rec.)
$ C_N = {N} $ (Rec.)
$ C_1 = dots = C_{N-1} = overbrace({1, 2, ..., N-1}, "Trans") $

Note: $x in C_x$ for any $x$.
If $x$ is absorbing then $C_x = {x}$.

== Lecture 6

Continuing [D] §1.3 --- Classification of States

*Main Idea*
- State space $S$ can be split into "communication classes".
- $x,y$ in the same class if possible to get from $x$ to $y$ and back again.
- States in the same class have many of the same properties --- we call these "class properties".

#pagebreak()

Def: We say that $y$ is *accessible* from $x$, and we write $x -> y$, if $rho_(x y)=P_x (T_y < oo) > 0$#footnote[Time of first return to $y$.].

In other words,

$
  p_(x y)^m > 0, quad "for some" m > 0
$

- [D]urrett instead say "$x$ comunicates with $y$" --- we wouldn't do this, because the following definition is standard in probability:

#pagebreak()

Note:

$
  rho_(x y) = P_x (T_y < oo)
$

$rho$: Greek letter Rho \
This is what is used in [D]urrett.
It can look like a $p$ in handwriting.
I'll do my best --- usually clear by context (ask me if not).

#pagebreak()

Def: We say that $x != y$ *communicate*, $x <-> y$, if $x -> y$ and $y -> x$.
We trivially define all $x <-> x$.

"$<->$" is an *equivalence relation* on $S$.
This means:
- a. $x <-> x$ for all $x$ *(Reflexive)*
- b. $x <-> y => y <-> x$ for all $x, y$ *(Symmetric)*
- c. $x <-> y$ & $y <-> z => x <-> z$ for all $x, y, z$ *(Transitive)*

#pagebreak()

Consequently, the state space $S$ of any MC ($X_n$) is the disjoint union of "communication classes".

$
  C_x & = "Communication class of" x #footnote[It is possible some $C_x = C_y$. In fact, $C_x = C_y$ if $x <-> y$.] \
  & = { y in S: x <-> y }
$

Note: $x <-> x$ and $x <-> y => y <-> x$ are trivial.

#pagebreak()

We need only check that:
$<->$ is transitive:

Lemma: Suppose $x -> y$ & $y -> z$. Then $x -> z$. #footnote[Same holds for $<->$.]

Proof:

$
  x -> y & => p_(x y)^m > 0 "for some" m \
  y -> z & => p_(y z)^n > 0 "for some" n
$

$
  therefore p_(x z)^(n+m) >=#footnote[There may be many way from $x$ to $z$ in $n+m$ steps. But one ways is to first go to $y$ in $n$ steps and then go to $z$ in $m$ steps.] p_(y z)^n p_(x y)^m > 0 quad square
$

#pagebreak()

Eg: Gambler's Ruin

3 communication classes.
$
  C_0 & = {0}, C_N = {N} \
  C_1 & = dots = C_(N-1) = {1, 2, ..., N-1}
$

Note: $x in C_x$ for any $x$. \
If $x$ is absorbing then $C_x = {x}$.

#pagebreak()

We will see in the lectures to come that many important properties of states in a MC are "class properties" --- meaning if $x$ has this property, then so do *all* $y in C_x$.

#pagebreak()

The following result is useful, especially when $abs(S) = oo$.

Theorem. If $x -> y$ but $rho_(y x) < 1$ then $x$ is transient.

Intuitively, there is a chance that the MC will visit $y$ before returning to $x$.
And once at $y$, there is a chance it may never visit $x$ in the future.

$
  therefore rho_(x x) < 1 => x "is transient."
$

#pagebreak()

Proof \
Let $l = min{m: p_(x y)^m > 0}$ be the length of the shortest path from $x$ to $y$.
$l < oo$ since $x -> y$.

Note: by minimality, $x$ is not visited on this path.

$
  & therefore 1 - rho_(x x) >= underbrace(p_(x y)^l, > 0) (1 - underbrace(rho_(y x), < 1)) > 0 \
  & => rho_(x x) < 1 => x "is transient." square
$

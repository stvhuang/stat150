#import "@preview/fletcher:0.5.8": diagram, edge, node

== Lecture 7

Def: We say that $y$ is *accessible* from $x$, and we write $x -> y$, if
$rho_(x y) = P_x (T_y#footnote[Tiem of the fist return to $y$] < oo) > 0$.

In other words,

$
  p_(x y)^m > 0 " for some " m > 0.
$

- Durrett instead say "x communicates with y" --- we won't do this, because the following definition is standard in probability:

#pagebreak()

Def: We say that $x$ and $y$ *communicate*, $x <-> y$, if $x -> y$ and $y -> x$.
We trivially define all $x <-> x$.

"$<->$" is an *equivalence relation* on S. This means:
- a. $x <-> x$ for all $x$ *(Reflexive)*
- b. $x <-> y => y <-> x$ for all $x, y$ *(Symmetric)*
- c. $x <-> y$ and $y <-> z => x <-> z$ for all $x, y, z$ *(Transitive)*

#pagebreak()

Consequently, the state space S of any MC $(X_n)$ is the disjoint union of "communication classes".

$
  C_x & = "Communication class of " x \
      & = {y in S: x <-> y}.
$

Note: $x <-> x$ and $x <-> y => y <-> x$ are trivial.

#pagebreak()

The following result is useful, especially when $|S| = oo$.

Theorem. If $x -> y$ but $rho_(y x) < 1$, then $x$ is transient.

Intuitively, there is a chance that the MC will visit $y$ before returning to $x$. And once at $y$, there is a chance it may never visit $x$ in the future.

$
  therefore rho_(x x) < 1 => x "is transient."
$

#pagebreak()

From now on: \
Transient $equiv$ Trans \
Recurrent $equiv$ Rec.

This theorem immediately implies:

Corollary. If $x$ is Rec and $x -> y$, then $rho_(y x) = 1$.

(By theorem $rho_(y x) = 1$, or else $x$ is Trans.)

#pagebreak()

As you might expect:

Theorem. Trans/Rec is a class property i.e. all states in the same class are trans or rec.

We begin now working towards a proof of this.

#pagebreak()

Do example 1.14, p14 on your own.
- Draw tr. diagram.
- Find comm. classes.
- Determine rec/trans for each state (& notice that it is the same within classes).

#pagebreak()

In order to prove the theorem, we show:

Lemma. If $x$ is rec and $x <-> y$ then $y$ is rec.

Note: Lemma $=>$ Theorem.

Why?

#pagebreak()

This lemma follows by a useful characterization of recurrence:

A state $y$ is Rec $<=>$

$
  E_y N_y & =^"(1)" sum_(n=1)^oo p_(y y)^n =^"(2)" oo \
          & "where" N_y = "# visits to" y "after time" 0 \
          & = \#{ n >= 1: X_n = y }.
$

#pagebreak()

To see why: (1)
$
  N_y = sum_(n=1)^oo bold(1)_(X_n = y), quad bold(1)_(X_n = y) = cases(
    1 " if " X_n=y,
    0 " if " X_n != y
  )
$
By LoE, $E_x N_y = sum_(n=1)^oo P_x (X_n = y) = sum_(n=1)^oo p_(x y)^n$

In particular, if $x=y$,
$
  E_y N_y = sum_(n=1)^oo p_(y y)^n
$

#pagebreak()

(2) For this, we use the SMP.
$
  E_x N_y &= sum_(k=1)^oo P_x (N_y>=k)#footnote[Review: Tail formula for a RV with values in $0, 1, 2, dots$] \
  &= rho_(x y)#footnote[Visit 1st time] sum_(k=1)^oo rho_(y y)^(k-1)#footnote[Return k-1 more times (at least)] \
  &= rho_(x y) / (1 - rho_(y y))#footnote[Geometric sum]
$

If $x <-> y$:

$
  E_y N_y = rho_(y y) / (1 - rho_(y y))
$

#pagebreak()

Recall $rho_(y y) = 1 <=> "Rec"$.

$
  therefore E_y N_y = sum_(n=1)^oo p_(y y)^n = rho_(y y) / (1 - rho_(y y)) = oo \
  <=> "Rec".
$

#pagebreak()

With this, we can finally prove our lemma:

Lemma. If $x$ is Rec and $x <-> y$ then $y$ is Rec.

If $x$ is Rec and $x <-> y$, we already know from earlier that $rho_(y x) = 1$.

$
  therefore "some" k, l "such that" \
  p_(x y)^k > 0 \
  p_(y x)^l > 0
$

#pagebreak()

To show $y$ is Rec, we show $sum_(n=1)^oo p_(y y)^n = oo$.

$
  sum_(n=1)^oo p_(y y)^n & >= sum_(n=1)^oo p_(y y)^(l+n+k) \
  & >= sum_(n=1)^oo underbrace(p_(y x)^l)_(>0) p_(x x)^n underbrace(p_(x y)^k)_(> 0) \
  & = p_(y x)^l p_(x y)^k underbrace(sum_(n=1)^oo p_(x x)^n)_(=oo "since x is rec") \
  & = oo \
$

$therefore y "is Rec." quad square$


#pagebreak()

[D]urrett p15-17 prove these previous results + more:

Def: A subset $C subset S$ of the state space is *closed* if you can't get out once in:
$
  i in C, j in.not C => p_(i j) = 0
$

Def: A set $A subset S$ is *irreducible* if for all $i,j in A => i <-> j$.

#pagebreak()

Durrett (see Theorem 1.7) shows:

If $C$ is *finite*, *closed* and *irreducible*, then all states in $C$ are Rec.

To prove this now, using what we already know, we just need to make the following observation:

#pagebreak()

Obs: Suppose $C subset S$ is *finite* and *closed*.
Then at least one state is recurrent.

This is sort of obvious.
Once in $C$ you are stuck there forever.
There are only $|C| < oo$ states.
So if the MC runs forever ($oo$ many steps), at least one state must be visited $oo$ many times.
(See p17 for formal proof.)

#pagebreak()

Another class property

Def: The *period* of a state $x$ is

$
  "g.c.d."#footnote[greatest common divisor] { m >= 1 : p_(x x)^m > 0 }
$

- A state $x$ is *aperiodic* if its period is $1$.
- An MC is *aperiodic* if all of its states are aperiodic.

#pagebreak()


- #diagram(edge-stroke: 1pt, node-stroke: 1pt, {
    let (A, B) = ((0, 0), (1, 0))

    node(A, $1$)
    node(B, $2$)
    edge(A, B, "->", bend: 20deg)
    edge(B, A, "->", bend: 20deg)
  }) $1$, $2$ have period 2
- #diagram(edge-stroke: 1pt, node-stroke: 1pt, {
    let (A, B) = ((0, 0), (1, 0))

    node(A, $1$)
    node(B, $2$)
    edge(A, A, "->", bend: -135deg, loop-angle: -90deg)
    edge(A, B, "->", bend: 20deg)
    edge(B, A, "->", bend: 20deg)
  }) $1$, $2$ aperiodic
- #diagram(edge-stroke: 1pt, node-stroke: 1pt, {
    let (A, B, C) = ((0, 1), (0.8, 0), (1.6, 1))

    node(A, $1$)
    node(B, $2$)
    node(C, $3$)
    edge(A, B, "->", bend: 45deg)
    edge(B, A, "->")
    edge(B, C, "->")
    edge(C, A, "->")
  }) $1$, $2$, $3$ aperiodic, $p_(3 3)^3>0, p_(3 3)^5>0, gcd{3, 5, dots} = 1$

#pagebreak()

Theorem
Aperiodicity is a class property.

I.e. all states in the same comm. class have the same period.

Proof. Think about it yourself. Might be on HW or in workshop.

#pagebreak()

A useful observation

If in the tr. diagram there is a "loop" at $x$:
// A diagram showing a state x with a loop back to itself.

$
  #diagram(edge-stroke: 1pt, node-stroke: 1pt, {
    let (A) = (0, 0)

    node(A, $1$)
    edge(A, A, "->", bend: -135deg, loop-angle: -90deg)
  }) quad "[i.e." p_(x x) > 0"]"#footnote[Pos. entry on diagonal of $P$.]
$

Then $C_x =$ class of $x$ is aperiodic.

Why?

#pagebreak()

[D] §1.4 --- Stationary distributions

The main result here is that if $(X_n)$ on $|S| < oo$:
1. Aperiodic
2. Irreducible (only 1 class)

Then $(X_n)$ has a SD $pi$:

$
  lim_(n->oo) p_(i j)^n = pi_j#footnote[$pi = (pi_1, pi_2, dots, pi_m), |S|=m$]#footnote[=LR prop. of time spent in state $j$, does not depends on $X_0$.]
$

We'll prove this later. For now we just assume it.

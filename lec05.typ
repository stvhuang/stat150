== Lecture 5

From last class:

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 4pt,
  [*Theorem.* Let $(X_n)$ be a (time-hom.) MC on state space $S$. Then, for any $m$ and $i,j in S$,
    $ p_(i j)^m = P(X_(n+m) = j | X_n = i) = (P^m)_(i j) $
  ],
)

*Proof:*

#pagebreak()

This essentially follows by the Law of Total Probability (LoTP).

In this context, we call it the *Chapman-Kolmogorov equations*
$ p_(i j)^(m+n) = sum_k p_(i k)^m p_(k j)^n $
For all $n, m >= 0$ & $i,j in S$.

#pagebreak()

== CK Equations

$ p_(i j)^(m+n) = sum_k p_(i k)^m p_(k j)^n $

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 4pt,
  [
    (1.) Why is it true? \
    (2.) How does it prove the theorem?
  ],
)

#pagebreak()

(1.) If MC transitions from $i$ to $j$ in $n+m$ steps, then it is at some state $k$ at time $n$ on its way there. By LoTP
$ P(X_(n+m) = j | X_0 = i) = sum_k P(X_(n+m) = j, X_n = k | X_0 = i) $

#pagebreak()

// using P(A, B | C) = P(A | B, C) P(B | C)
$
  & = sum_k P(X_(n+m) = j | X_n = k, X_0 = i) P(X_n = k | X_0 = i) \
  & "by Markov property" \
  & = sum_k P(X_(n+m) = j | X_n = k) P(X_n = k | X_0 = i) \
  & "by time homogeneity" \
  & = sum_k p_(k j)^m p_(i k)^n
$

#pagebreak()

(2.) Theorem follows by induction:
$
  P^m = P^(m-1) P \
      (P^m)_(i j) & = sum_k p_(i k)^(m-1) p_(k j)^1 \
                  & = p_(i j)^((m-1)+1) quad "by CK-Eqn." \
                  & = p_(i j)^m
$

#pagebreak()

== [P] §1.3: Classification of states

Many interesting questions about MC's involve their long-run (LR) behavior. We saw some examples last class.

Another such question is:
#block(
  inset: 8pt,
  fill: luma(230),
  radius: 4pt,
  [
    Which states are visited $oo$ many times, which only $< oo$ times?
  ],
)

#pagebreak()

First, we set up some notation:

$(X_n)$ a MC on state space $S$.

- For $x in S$ and an event $A$,
  $ P_x(A) = P(A | X_0 = x) $
  the prob. of $A$ starting at $x$.

- For $y in S$, $T_y = min {n >= 1: X_n = y}$, time of first visit (*after* time 0) to state $y$.

#pagebreak()

We let, $rho$
#block(
  inset: 8pt,
  fill: luma(230),
  radius: 4pt,
  [
    $ rho_(y y) = P_y(T_y < oo) $
  ],
)
be prob. the MC ever returns to $y$, having started at $y$.

*Def.* $y$ is *transient* if $rho_(y y) < 1$
*recurrent* if $rho_(y y) = 1$

#pagebreak()

Intuitively, by Markov property, each time $(X_n)$ visits $y$ it starts afresh.

So
$
    rho_(y y) & = P("ever visit " y) \
              & = P("visit " y " at least once") \
  rho_(y y)^2 & = P("visit " y " at least twice") \
              & dots \
  rho_(y y)^k & = P("at least " k " visits")
$

#pagebreak()

To formalize this reasoning, we introduce the idea of a *stopping time*, which will play an important role in this course.

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 4pt,
  [
    *Def.* $T$ is a *stopping time* (ST) if only the values of $X_0, X_1, ..., X_n$ are needed to determine if the event ${T=n}$ has occurred.
  ]
)

#pagebreak()

== Eg SRW. $X_0 = 0$.

- $T = T_1 = 1^(st)$ visit to 1.
  Is a ST.

- $T = min {n >= 1: X_(n+1) = 1}$
  = time just before first visit to 1.
  Is *not* a ST, since eg. knowing $(X_0, X_1) = (0, -1)$ is not enough to determine if $T=1$.

#pagebreak()

The *strong Markov property* is the fact that the Markov property also holds at ST's.

*Note* this is not trivial, since ST's can be *random*.

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 4pt,
  [
    *Theorem.* $(X_n)_(n>=0)$ a MC, $T$ a ST. Given $T=n$ and $X_T=y$, $(X_(T+k))_(k>=0)$ is a MC started at $y$.
  ]
)

#pagebreak()

This is quite intuitive, so we won't prove it. --- See [P] p 11-12, where it is shown
$ P(X_(T+1) = z | X_T=y, T=n) = p_(y z). $

#pagebreak()

By the strong MP, indeed
$ P_y(T_y^k < oo) underbrace(, "time of " k^"th" " visit after time 0") = P("at least " k " visits") = rho_(y y)^k. $

#block(
  inset: 8pt,
  fill: luma(230),
  radius: 4pt,
  [
    If $rho_(y y) < 1$, $P_y(T_y^k < oo) -> 0$
  ]
)

As $k -> oo$. So total \# visits to $y$ is $< oo$ (w.p. 1).

#pagebreak()

*Why?* # visits to $y$ after time 0 is Geometric($1-rho_(y y)$):
$ P("#visits" = k) = rho_(y y)^k (1-rho_(y y)), k=0,1,... $
$ therefore E("#visits") = rho_(y y) / (1-rho_(y y)) < oo $

If $P("#visits"=oo)>0$, then $E("#visits")=oo$ (contradiction).

#pagebreak()

On the other hand,
#block(
  inset: 8pt,
  fill: luma(230),
  radius: 4pt,
  [
    If $rho_(y y)=1$, then if started from $y$ the MC will visit $y$ $oo$ many times (wp 1).
  ]
)

#pagebreak()

All other states $0 < i < N$ are *transient*.

*Note:* This means (wp 1) the game will eventually end (either $0=$ bankrupt or $N=$ jackpot).

*Why?*

#pagebreak()

First note if $p=0$ or $p=1$ the result is obvious since starting at $0 < i < N$, the MC will never return to $i$.

If $p in (0,1)$, then
$
  P(T_1 = oo) >= q > 0 => 1 " trans." \
  P(T_2 = oo) >= q^2 > 0 => 2 " trans." \
  dots \
  P(T_(N-1) = oo) >= q^(N-1) > 0 => N-1 " trans."
$

#pagebreak()

A more surprising fact --- which we'll prove later on --- is that for SRW on $ZZ$, all states are recurrent.

* Also true on $ZZ^2$.
* But all states transient for SRW on $ZZ^d, d >= 3$.

"A wandering walker finds their way home, but not so for a bird".

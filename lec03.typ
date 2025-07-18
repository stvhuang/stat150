#import "misc.typ": FIXME

== Lecture 3

Markov Chains (MC)

Most stochastic processes we'll study this semester have a special property called the *Markov Property*.

Informally, conditioned on the present state, the *past & future* behavior of a MC are *independent*.

#pagebreak()

Recall: A discrete stochastic process is a collection of RV's evolving in discrete time steps!

$
  (X_n)_(n=0)^infinity = (X_0, X_1, X_2, dots)
$

Recall: Conditional probability of B given A

$
  P(A|B) = (P(A inter B)) / (P(B))
$

#pagebreak()

Def: $(X_n)$ is a (discrete time) Markov Chain (MC) if

$
  P(X_(n+1) = x_(n+1) | X_n = x_n, dots, X_0 = x_0) \
  = P(X_(n+1) = x_(n+1) | X_n = x_n)
$

for *all* $n >= 1$ and $x_(n+1), dots, x_0$

#pagebreak()

Discrete Time Markov Chains are discussed in:

- Durrett §1
- Pinsky-Karlin §3-4

Reading, looking at the examples, & doing exercises here is encouraged!

#pagebreak()

In other words, when asking what the MC will do next, all that matters is its current state (not how it got there, etc.).

Def: $P(X_(n+1) = x_(n+1) | X_n = x_n)$ is called the *transition probability* from $x_n$ to $x_(n+1)$ at time $n+1$.

#pagebreak()

In this course, we will almost only study MC's that have *time-homogenous* transition prob.'s.

This means that, for all $i$ & $j$, $P(X_(n+1) = j | X_n = i)$ is the *same* for all times $n$.

So we write

$
  p_(i,j) & = P(X_1=j | X_0=i) \
          & = P(X_2=j | X_1=i) \
          & = P(X_3=j | X_2=i) \
          & = dots
$

#pagebreak()

- We write either $p_(i,j) = p(i,j)$.
- $p_(i,j)$ = prob. the MC transitions from $i$ to $j$, supposing it is currently at $i$.

Def: The *state space* $S$ is the collection of all possible states that the MC can visit.

$arrow$ Sometimes $Omega$ instead of $S$.

#pagebreak()

For a time-homogenous MC with finite state space $|S| < oo$, we can put the transition probabilities in a matrix:

Def: Transition Matrix

$
  underline(P) = (p_(i,j))_(i,j)
$

i.e. $underline(P)$ is a matrix whose $i,j$'th#footnote[$i$'th row and $j$'th column] entry is
$
  p_(i,j) = P(X_(n+1)=j | X_n=i)
$
(for all $n$)

#pagebreak()

- If $|S| = oo$ but countable, e.g. $S = {0, 1, 2, dots}$ then $underline(P)$ is an infinite matrix.
- For now, we'll mainly focus on MC's with finite state spaces.

Note: in this case we can always encode $S$ by ${0, 1, dots, N}$ or ${1, 2, dots, N}$ --- often it is convenient to do so.

#pagebreak()

Many nice examples of MC's in:

- [D] §1.1
- [PK] §3.3

Please take a look. We'll do some today --- but not all of them.

#pagebreak()

Examples: \
(1) Simple Random Walk (SRW) on integers $ZZ = {0, plus.minus 1, plus.minus 2, ...}$, $p in (0,1)$.

#figure[
  #image(
    "./figs/p03_18m.png",
    width: 40%,
  )
]

$
  p_(i,j) = cases(
    p & quad j=i+1,
    q & quad j=i-1 quad (q=1-p),
    0 & quad "o/w",
  )
$

- If $p=1/2$, *symmetric* SRW.

#pagebreak()

I.e. each step of walk, we flip a coin that is heads w.p. $p$, tails w.p. $q=1-p$. If heads we step right, if tails we step left.

$
  S_n = sum_(k=0)^n xi_k, quad S_0 = 0
$

$
  xi_1, xi_2, dots "IID" cases(
    +1 & quad "w.p." p,
    -1 & quad "w.p." q,
  )
$

#pagebreak()

For any $n$,

$
  & P(S_(n+1) = j | S_n=i, S_(n-1)=s_(n-1), ..., S_0=s_0) \
  & = P(S_(n+1)=j | S_n=i) \
  & = P(xi_(n+1) = j-i) \
  & = cases(
      p & quad "for" j=i+1,
      q & quad "for" j=i-1,
      0 & quad "o/w"
    )
$

$therefore$ $(X_n)$ is a time-hom. MC.

#pagebreak()

State space $ZZ$ is infinite:

#figure[
  #image(
    "./figs/p03_26m.png",
    width: 80%,
  )
]

$i,j$'th entry = $p_(i,j)$ for $i,j in ZZ$.

#pagebreak()

(2) Gambler's Ruin

SRW with *absorbing states* at $0$ and $N$.

Def: A state $i in S$ is absorbing if $p(i,i) = 1$.

I.e. once in state $i$, MC will stay there forever.

#pagebreak()

#figure[
  #image(
    "./figs/p03_28m.png",
    width: 80%,
  )
]

$
  & p_(0,0) = p_(N,N) = 1 \
  & p_(i, i+1) = p, quad 1 <= i < N \
  & p_(i, i-1) = q, quad 1 <= i < N \
  & p_(i,j) = 0, quad "o/w."
$

#pagebreak()

Called Gambler's Ruin because:
- Start with $\$X_0$.
- Each step bet $\$1$. Win $\$1$ w.p. $p$, lose $\$1$ w.p. $q$.
- Until either win jackpot $\$N$ or go bust $\$0$ --- and then stop playing either way.

#pagebreak()

Interesting Questions:

$
  T & = min { n >= 1: X_n in {0, N} } \
    & = "# bets until game over"
$

For a given $1 <= x_0 < N$,

$
  & "Question:" E_(x_0)(T)#footnote[Expected value conditioned on starting point being $x_0$.] = E(T|X_0=x_0) \
  & "Question:" P_(x_0)(T=N) = P(T=N|X_0=x_0)
$

I.e. expected \# bets & prob. of jackpot, starting with $\$x_0$.

#pagebreak()

- These questions will be investigated in the workshops & later this semester.
- SRW & Gambler's Ruin will be important examples which we'll come back to often.

#pagebreak()

#figure[
  #image(
    "./figs/p03_37m.png",
    width: 85%,
  )
]

$i,j$'th entry = $p_(i,j)$ for $0 <= i,j <= N$.

== Lecture 9

Eg: Recall the Ehrenfest chain:

$N$ molecules separated by a thin membrane into 2 chambers.
Sometimes a molecule slips through.

$X_n$ = \# molecules in 1st chamber.

Each step pick a random molecule and move through.
$
  p_(i j) = cases(
    i/N & quad "for" j = i-1,
    1 - i/N & quad "for" j = i+1,
    0 & quad "o/w"
  )
$

#pagebreak()

Intuition: In the long run as $n -> oo$, any given particle should be approximately equally likely to be in either chamber.

$
  & therefore X_n = #"# in 1st chamber" approx "Bin"(N, 1/2) \
  & therefore P(X_n = i) approx binom(N, i) (1/2)^i (1/2)^(N-i) = binom(N, i) / 2^N \
  & therefore "Expect " pi_i = lim_(n->oo) P(X_n=i) = binom(N, i)/2^N#footnote[Prob. a uniform random subset is size $i$.]
$

#pagebreak()

It is somewhat involved to solve $pi = pi underline(P)$ for this Markov chain.
It is easier to use the DBE.

*But* why should we Expect

$
  pi_i p_(i j) = pi_j p_(j i) quad forall i,j
$

to hold for this MC?

#pagebreak()

$pi_i$ = long-run prop. of time spent in state $i$

$pi_i p_(i j)$ = long-run prop. of transitions made by MC from $i -> j$

$pi_j p_(j i)$ = long-run prop. of transitions made by MC from $j -> i$

*Note:* only possible transitions are $i -> i plus.minus 1$ (all other $p_(i j)=0$)

#pagebreak()

*Also:* every time the MC transitions $i -> i+1$, it must first make a transition $i+1 -> i$ before it can make another $i -> i+1$ again.

$therefore$ At all times $n$, the number of transitions from $i -> j$ and the number of transitions from $j -> i$ made by time $n$ are equal up to $plus.minus 1$.

#pagebreak()

That is, for any $n$,

$
  \#(i -> j "by time" n)/n = (\#(j -> i "by time" n) plus.minus 1)/n#footnote[$(plus.minus 1) / n -> 0$]
$

Taking $n -> oo$,

$
  pi_i p_(i j) = pi_j p_(j i) quad "(DBE)"
$

#pagebreak()

Next we use the DBE to verify that $pi = (pi_1, dots, pi_N)$ is the SD ($pi = pi P$) where#footnote[Last class: DB $=>$ SD]

$
  pi_i = binom(N, i) / 2^N
$

Check:#footnote[Can assume $|i-j|=1$, since otherwise $p_(i j)=p_(j i)=0$. So can assume $j=i+1$]

$
  binom(N, i)/2^N p_(i,i+1) =^? binom(N, i+1)/2^N p_(i+1,i)
$

#pagebreak()

$
  binom(N, i)/cancel(2^N) p_(i,i+1) &=^? binom(N, i+1)/cancel(2^N) p_(i+1,i) \
  binom(N, i) (1-i/N) &=^? binom(N, i+1) (i+1)/N \
  cancel(N!)/(i!(N-i)!) (N-i)/cancel(N) &=^? cancel(N!)/((i+1)!(N-i-1)!) (i+1)/cancel(N) \
  1/(i!(N-i-1)!) &= 1/(i!(N-i-1)!) quad checkmark
$

#pagebreak()

$therefore$ Since DB $=>$ SD, we know therefore

$
  pi = pi underline(P)
$

where

$
  pi = ( binom(N, 1)/2^N, binom(N, 2)/2^N, dots, binom(N, N)/2^N )
$

#pagebreak()

$
  pi_i & = binom(N, i) / 2^N \
       & = lim_(n->oo) P(X_n = i) \
       & = "long-run proportion of time spent in state" i \
       & quad (i "molecules in 1st chamber")
$

#pagebreak()

For a gas, $N approx 10^24$ \
PMF of $pi ~ "Bin"(10^24, 1/2)$:

#figure[
  #image(
    "./figs/p09_32m.png",
    width: 60%,
  )
]

\# molecules in 1st chamber (large $n$)

$
  = 500,000,000,000,dots,dots,dots,dots#footnote[As $n->oo$, $X_n/N approx 1/2$. Small fluctuations in here.]
$

#pagebreak()

Reversible MC's

The MP is symmetric in time:
"Given current state, past & future are independent."

However, convergence to a stationary distribution is not.
Typically, as $n->oo$, organized $->$ disorganized state.

Eg. Ehrenfest chain: $X_0=N$ (all in 1st chamber).
As $n->oo$, molecules in 1st or 2nd chambers wp $1/2, 1/2$.

#pagebreak()

This suggests that if we want to get time symmetry, we must start from the stationary distribution: $X_0 ~ pi$.

*Def*: Let $(X_n)_(n=0)^N$ be a MC run up to time $N$.
Then $Y_n = X_(N-n)$ is called the *backwards chain*.

$
  (Y_n)_(n=0)^N = ( & Y_0, quad quad &      Y_1, & dots dots dots, &  Y_N) \
                    & = X_N          & = X_(N-1) &                 & = X_0
$

#pagebreak()

*Theorem* Suppose $(X_n)$ has SD $pi$.
$X_n ~ pi$.
Then the backwards chain

$
  (Y_n = X_(N-n))_(n=0)^N
$

1. Is a MC
2. Has SD $pi$
3. Has transition probabilities

$
  q_(i j) = p_(j i) pi_j/pi_i
$

#pagebreak()

Proof: Will be on HW \#2.

Note: If $(X_n)$ satisfies the DBE,

$
  q_(i j) = p_(j i) pi_j/pi_i = p_(i j)
$

In this case, we call $(X_n)$ *time reversible*.

If you watch a movie of $(X_n)$ started from equilibrium $X_0 ~ pi$, you won't be able to tell if time is moving forward or backward.

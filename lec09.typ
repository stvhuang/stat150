== Lecture 9

Eg: Recall the Ehrenfest chain

$N$ molecules separated by a thin membrane into 2 chambers. Sometimes a molecule slips through.

$X_n$ = \# molecules in 1st chamber.

Each step pick a random molecule and move through.

$
  P_(i,j) = cases(
    i/N & "for " j=i-1,
    1-i/N & "for " j=i+1,
    0 & "o/w"
  )
$

#pagebreak()

Intuition

In the long run as $n -> oo$, any given particle should be approximately equally likely to be in either chamber.

$ therefore X_n = #"# in 1st chamber" $
$ tilde "Bin"(N, 1/2) $

$
  therefore P(X_n = i) approx binom(N, i) (1/2)^i (1/2)^(N-i) = binom(N, i) / 2^N
$

$ therefore "expect " pi_i = lim_(n->oo) P(X_n=i) = binom(N, i)/2^N $
// Prob. a uniform random subset is size i.

#pagebreak()

It is somewhat involved to solve $pi = pi P$ for this Markov chain. It is easier to use the detailed balance equations.

*But* why should we expect $pi_i P_(i,j) = pi_j P_(j,i) forall i,j$ to hold for this Markov chain?

#pagebreak()

$pi_i$ = long-run prop. of time spent in state $i$

$pi_i P_(i,j)$ = long-run prop. of transitions made by mc from $i -> j$

$pi_j P_(j,i)$ = long-run prop. of transitions made by mc from $j -> i$

*Note:* only possible transitions are $i -> i plus.minus 1$ (all other $P_(i,j)=0$)

#pagebreak()

*Also:* every time the Markov chain transitions $i -> i+1$, it must first make a transition $i+1 -> i$ before it can make another $i -> i+1$ again.

$therefore$ At all times $n$, the number of transitions from $i -> j$ and the number of transitions from $j -> i$ made by time $n$ are equal up to $plus.minus 1$.

#pagebreak()

That is, for any $n$,

// TODO #
//
$ (i -> j " by time " n)/n = (j -> i " by time " n)/n plus.minus 1/n $

Taking $n -> oo$,

$ pi_i P_(i,j) = pi_j P_(j,i) quad "(DBE)" $

#pagebreak()

Next we use the detailed balance equations to verify that $pi = (pi_1, ..., pi_N)$ is the stationary distribution ($pi = pi P$) where

$ pi_i = binom(N, i) / 2^N . $

Checks:

$ binom(N, i)/2^N P_(i,i+1) "TODO"(?) = binom(N, i+1)/2^N P_(i+1,i) $

#pagebreak()

$
  binom(N, i)/cancel(2^N) P_(i,i+1) "TODO"(?) = binom(N, i+1)/cancel(2^N) P_(i+1,i)
$

$ binom(N, i) (1-i/N) "TODO"(?) = binom(N, i+1) (i+1)/N $

$ (N!)/(i!(N-i)!) (N-i)/N "TODO"(?) = (N!)/((i+1)!(N-i-1)!) (i+1)/N $

$ 1/(i!(N-i-1)!) = 1/(i!(N-i-1)!) $ $checkmark$

#pagebreak()

$therefore$ Since detailed balance implies stationary distribution, we know therefore

$ pi = pi P $

where

$ pi = ( binom(N, 1)/2^N, binom(N, 2)/2^N, ..., binom(N, N)/2^N ) $

#pagebreak()

$ pi_i = binom(N, i) / 2^N $

$ = lim_(n->oo) P(X_n = i) $

$ = "long-run proportion of time spent in state " i $
$ (i " molecules in 1st chamber") $

#pagebreak()

For a gas, $N approx 10^24$.

pmf of $pi tilde "Bin"(10^24, 1/2)$:

// A plot showing the distribution centered at $10^24/2$.
// The distribution has small fluctuations of size $O(10^12)$.

\# molecules in 1st chamber (large $n$)
$ = 500,000,000, ... $

As $n->oo$, $X_n/N approx 1/2$. Small fluctuations in here.

#pagebreak()

Reversible mc's

The Markov process is symmetric in time:
"Given current state, past & future are independent."

However, convergence to a stationary distribution is not. Typically, as $n->oo$, organized $->$ disorganized state.

Eg. Ehrenfest chain: $X_0=N$ (all in 1st chamber). As $n->oo$, molecules in 1st or 2nd chambers with probability $1/2, 1/2$.

#pagebreak()

This suggests that if we want to get time symmetry, we must start from the stationary distribution: $X_0 tilde pi$.

*Def*: Let $(X_n)_(n=0)^N$ be a Markov chain run up to time $N$. Then $Y_n = X_(N-n)$ is called the *backwards chain*.

$ Y_n = (Y_0, Y_1, ..., Y_N) $
$ quad X_N quad X_(N-1) X_0 $

#pagebreak()

Theorem
Suppose $(X_n)$ has stationary distribution $pi$. Then the backwards chain
$ (Y_n = X_(N-n))_(n=0)^N $

1. is a Markov chain
2. has stationary distribution $pi$
3. has transition probabilities
$ q_(i,j) = P_(j,i) pi_j/pi_i $

#pagebreak()

*Proof*: Will be on HW #2.

*Note*: If $(X_n)$ satisfies the detailed balance equations,
$ q_(i,j) = P_(j,i) pi_j/pi_i = P_(i,j) $

In this case, we call $(X_n)$ *time reversible*.

If you watch a movie of $(X_n)$ started from equilibrium $X_0 tilde pi$, you won't be able to tell if time is moving forward or backward.

== Lecture 27

Last class, we began discussing continuous time MC's.

For these processes, there is no "1st step" after any given time. But we still have transition probabilities
$
  P_t(i, j) = P(X_(s+t) = j | X_s = i).
$

#pagebreak()

Recall that for discrete time MC's the 1-step probabilities $p_(i j)$ in $P$ held all info we needed to study it.

There is no 1st step in continuous time, so instead we take $t -> 0$ to distill info needed to study a continuous time MC:

#pagebreak()

More specifically, the derivative at $t=0$ gives us the "jump rate."

$
  q_(i j) = lim_(t -> 0) (P_t(i, j)) / t quad (i != j)
$

This is the *rate* at which $(X_t)$ jumps from $i$ to $j$.

#pagebreak()

Example:

E.g. Poisson process $(N_t)$ with rate $lambda$. Here:
$
  q_(i, i+1) = lambda quad "for" i >= 0.
$
Because new points appear in time at rate $lambda$.

#pagebreak()

E.g. M/M/s Queue

$s$ servers.
Arrivals are iid $"Exp"(lambda)$.
Service times iid $"Exp"(mu)$.

$X_t = \#$ customers in system (in queue or being served) at time $t$.

$
  cases(
    q_(i, i+1) = lambda,
    q_(i, i-1) = min(i, s) mu
  )
$
// At most s can be served at once.

#pagebreak()

E.g. Branching process:

A population where particles die at rate $mu$ & give birth at rate $lambda$.
(Yule process if $mu=0$.)

$
  cases(
    q_(i, i+1) = lambda,
    q_(i, i-1) = mu
  )
$

#pagebreak()

Often it is simple/natural to write down jump rates for a given MC, as in previous examples.

*But how to actually construct the MC, given the $q_(i j)$?*
// $ downarrow $

#pagebreak()

Suppose we know:
$
  q_(i j) = "Rate" i -> j
$

Then put:
$
  lambda_i = sum_(j != i) q_(i j) = "Rate leave" i.
$

// $
//   r_(i j) = cases(
//     (q_(i j)) / lambda_i, "if" lambda_i > 0;
//     0, "if" lambda_i = 0
//   )
// $

#pagebreak()

If $lambda_i = 0$ then MC never leaves if it hits $i$. I.e. state $i$ is absorbing.

To construct MC $(X_t)$, we proceed as follows:

*Case 1:* If ever MC reaches an absorbing state ($lambda_i = 0$) then MC stays forever, & so construction is done.

#pagebreak()

Otherwise:

*Case 2:* If MC most recently jumped to some $i$ with $lambda_i > 0$, then select an $"Exp"(lambda_i)$ RV. After this amount of time, jump to some other state $j$ with prob. $r_(i j) = (q_(i j)) / lambda_i$.

#pagebreak()

Another way of thinking of this is:

\#sym.circled[1] Start with a discrete MC $(Y_n)$ with transition probabilities $r_(i j)$.

$
  Y = i_0, i_1, i_2, i_3, i_4
$
// Timeline with points 0, 1, 2, 3, 4

#pagebreak()

Then stretch/pull the unit intervals according to independent exponentials.

// Y_n timeline:
$ Y_n = i_0, i_1, i_2, i_3, i_4 $ at times $0, 1, 2, 3, 4$.

// X_t timeline:
$
  X_t = i_0, i_1, i_2, i_3, dots
$
// Intervals are stretched by Exp(lambda_(i_0)), Exp(lambda_(i_1)), Exp(lambda_(i_2)), ...

#pagebreak()

$(Y_n)$ is sometimes called the "skeleton" of $(X_t)$.

[D] p.151 explains how you can simulate this on a computer:
1. Get iid $T_0, T_1, dots "Exp"(1)$.
2. Start at $i_0$ at time 0. Jump to $j$ w.p. $r_(i_0, j)$ after time $t_1 = T_0 / lambda_(i_0)$.

#pagebreak()

Why is this the right construction?

Good question --- but beyond scope of Stat 150.

Briefly: it can be shown that the definition of the Poisson process given before:

#pagebreak()

// $
//   cases(
//     1., N_0 = 0;
//     2., "All" N_(t+s) - N_s tilde "Poisson"(lambda t);
//     3., "Indep. Incr.";
//   )
// $

is equivalent to:

// $
//   cases(
//     1., N_0 = 0;
//     2., P(N_(t+h) - N_t = 1 | N_t = i) = lambda h + o(h) " as " h -> 0;
//     3., P(N_(t+h) - N_t = 0 | N_t = i) = 1 - lambda h + o(h) " as " h -> 0;
//   )
// $

#pagebreak()

I.e. $N_0 = 0$ & $q_(i, i+1) = lambda$ defines the Poisson process.

Now, recall that the Poisson process is constructed using iid $"Exp"(lambda)$ inter-arrival times.

#pagebreak()

$therefore$ It is natural to expect that the above construction will give a process $(X_t)$ with

$
  P(X_(t+h) = j | X_t = i) = q_(i j) h + o(h) quad (i != j) " as " h -> 0
$

$
  P(X_(t+h) = i | X_t = i) = 1 - lambda_i h + o(h) " as " h -> 0
$
$
  (lambda_i = sum_j q_(i j))
$

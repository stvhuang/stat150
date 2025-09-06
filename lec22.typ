= Renewal Processes

== Lecture 22

A renewal process is a generalization of the Poisson point processes.

Recall that the inter-arrival times between points in a $"PP"(lambda)$ are IID $"Exp"(lambda)$.

#pagebreak()

The Exp distribution is nice because it has the lack-of-memory property. This makes many exact calculations possible for the PP.

*However*, often Exp inter-arrival times are not present in real-world situations. We will see applications to *queues*.

#pagebreak()

Def: ($N_t$) is a renewal process (RP) if the inter-arrivals between points are IID.#footnote[not necessarily Exp.]

#pagebreak()

- Times at which points arrive are called "renewal times."
  This is because the process starts afresh at such times with another IID seq of inter-arrival times.
- By LoM, this in fact holds at *any* time in a PP (not only at arrival times).

#pagebreak()

Since no other distribution (other than Exp) has LoM, it is often difficult to do exact calculations about events at finite times of an RP.

*But* we can still study its LR behavior/equilibrium precisely, due to IID inter-arrival times.

#pagebreak()

The key to studying the LR behavior of an RP is the Law of Large Numbers (LLN).

*Notation:*
- $tau_1, tau_2, dots$ IID with common CDF $F(x) = P(tau <= x)$.
- $T_n = sum_(i=1)^n tau_i = n^"th" "arrival time"$.
- $N_t = max { n: T_n <= t } = "# of arrivals by time" t$.

#pagebreak()

*Eg* \
($X_n$) a MC, $X_0 = x$.
Let $T_n = "time of" n^"th" "return to" x$. \
By SMP#footnote[strongg Markov Property], $N_t#footnote[\# of returns to $x$ by time $t$] = max { n: T_n <= t }$ is a RP (times between visits are IID).

#pagebreak()

The first important result:

*Theorem.*
Let ($N_t$) be a RP with mean inter-arrival time $mu = "E"tau$. #strike[(Assume $P(tau > 0) > 0$, o/w process is degenerate.)]
Then
$
  P(lim_(t -> oo) N_t / t = 1 / mu) = 1
$

#pagebreak()

Notice that, in particular, this proves that for a MC
$
  lim_(n -> oo) (N_n (j)#footnote[\# of visits to $j$ by time $n$]) / n = 1 / ("E"_j tau_j)
$
I.e. LR prop. of time spent in $j$ is equivalent to inverse mean return time.

#pagebreak()

This theorem follows by the strong LLN (SLLN):

If $X_1, X_2, dots$ IID with $mu = "E"X$ and $S_n = sum_(i=1)^n X_i$, then
$ P(S_n / n ->_(n -> oo) mu) = 1 $

#pagebreak()

Proof of theorem using SLLN:

Let $tau_i = X_i$.
Then $S_n = T_n$. \
So by SLLN, $T_n / n -> mu$ as $n -> oo$ (w.p. 1).

Next, observe $T_(N_t) <= t < T_(N_t + 1)$.
(we discussed this during PP lectures.)

#figure[
  #image(
    "./figs/p22_20m.png",
    width: 60%,
  )
]

#pagebreak()

$
  therefore T_(N_t) / N_t <= t / N_t & <= T_(N_t + 1) / N_t \
                                     & = T_(N_t + 1) / (N_t + 1) (N_t + 1) / N_t
$
As $t -> oo$, $N_t -> oo$.

So $(N_t + 1) / N_t -> 1$,
$T_(N_t) / N_t ->_("SLLN") mu$ & $T_(N_t + 1) / (N_t + 1) ->_("SLLN") mu$.

#pagebreak()

$
  & therefore "letting" t -> oo \
  & mu <= lim_(t->oo) t / N_t <= mu \
  & => lim_(t->oo) N_t / t = 1 / mu
$

#pagebreak()

Most applications involve instead the following extension (cf. *Compound* PPs).

*Def:*
($N_t$) a RP with inter-arrival times (sometimes also called "holding times") $tau_1, tau_2, dots$.
Let $r_1, r_2, dots$ be an IID seq of "rewards" indep. of holding times.

#pagebreak()

Then
$
  R_t = sum_(i=1)^(N_t) r_i
$
is called a *Renewal-Reward Process*.

- Each time a point arrives, a reward (possibly negative) is collected. $R_t = "total reward by time" t$.

#pagebreak()

*Theorem*
$
  P(lim_(t -> oo) R_t / t = ("E"r) / ("E"tau)) = 1
$

I.e.
$
  "LR" "Reward" / "Time" = ("E"("Reward/Cycle")) / ("E"("Time/Cycle"))
$

#pagebreak()

*Proof*
$
  R_t / t = overbrace(N_t / t, 1/mu "by prev. thm.") (underbrace(1 / N_t sum_(i=1)^(N_t) r_i, "E"r "by SLLN"))
$
$
  therefore lim_(t -> oo) R_t / t = ("E"r) / ("E"tau)
$

#pagebreak()

*Eg* Long run car costs.

Lifetime of car is random with PDF $h$.
Suppose we buy a new car when it breaks down or after $T$ years, whichever comes first.
Suppose new car costs $\$A$ and if a car breaks down this costs $\$B$ (towing costs, etc).
What is our LR cost per time?

#pagebreak()

$
  &"E"tau = integral_0^T t h(t) d t + T underbrace(integral_T^oo h(t) d t, P("car lasts" > T)) \
  &"E"r = A + B underbrace(integral_0^T h(t) d t, P("car breaks before time" T)) \
$

(Additional $\$B$ if car breaks down, $\$A$ spent for new car either way.)

#pagebreak()

$therefore$ LR cost per unit time is
$
  lim_(t->oo) R_t / t &= ("E"r) / ("E"tau) \
  &= (A + B integral_0^T h(t) d t) / (integral_0^T t h(t) d t + T integral_T^oo h(t) d t)
$

Eg: If $A=10, B=3$ (in thousands of \$), $tau ~ "Uniform"(0,10)$ years,

#pagebreak()

$
  lim_(t -> oo) R_t / t = (10 + .3 T) / (T - .05 T^2)
$

Optimal $T$ (by calculus) is
$
  T_* = (1 + sqrt(1.6)) / 0.03 approx 8.83 "years"
$

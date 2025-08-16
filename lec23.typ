== Lecture 23

Recall:

A *renewal process* ($N_t, t >= 0$) has IID inter-arrival times $T_1, T_2, dots$ with $mu = E T_i$.

*Main theorem*:
$
  N_t / t -> 1 / mu quad "as" quad t -> oo
$

(On average, wait $mu$ for next point, so $1/mu$ points per unit time.)

#pagebreak()

*Renewal-reward process*

IID seq. of "rewards" $r_1, r_2, dots$
Indep. of $T_1, T_2, dots$ Reward $r_n$ is received at time $T_n = sum_(i=1)^n T_i$.

$
  R_t = sum_(i=1)^(N_t) r_i
$
= Total reward by time $t$.

*Main theorem*
$
  R_t / t -> (E r) / mu
$

#pagebreak()

[p] § 3.2: Applications of renewal processes to queueing theory

*1st example: G/G/1 queue*

GI = General input
G = General service times
1 = One server.

#pagebreak()

$T_1, T_2, dots$ inter-arrival times with some cdf $F(x) = P(T <= x)$ and $E T = 1/lambda$.

By previous theorem,
$
  N_t / t -> lambda quad "as" quad t -> oo
$
where $N_t$ = \# arrivals by time $t$.

#pagebreak()

Next, suppose service times $S_1, S_2, dots$ are IID with cdf $G(x) = P(S <= x)$ and $E S = 1/mu$.

$therefore$ customers arrive at rate $lambda$
$----$ served $----$ $mu$.

Our first result is very intuitive:
Namely, if $lambda < mu$ then server can handle the customers well:

#pagebreak()

*Theorem.* If $lambda < mu$ then the long run proportion of time the server is busy is $<= lambda/mu < 1$.

*Proof.* $T_n = sum_(i=1)^n T_i$ = arrival time of $n$-th customer.

By SLLN, $T_n / n -> 1/lambda$.

Similarly, let $S_n = sum_(i=1)^n S_i$ = total time in service after $n$ customers served.

#pagebreak()

By SLLN $S_n / n -> 1/mu$. Also, at time $T_n$, server has been busy $<= S_n$ time.

& $S_n / T_n -> lambda / mu$.

Skipping some details (see p. 131)
We'll see this another way later on $dots$

#pagebreak()

*Cost equations* (Any queue)

Let $X_s$ = \# customers in system at time $s$ (being served or waiting in queue).

Then LR average \# customers in system is
$
  L = lim_(t -> oo) 1/t integral_0^t X_s d s
$

#pagebreak()

LR average amount of time a customer spends in system:
$
  W = lim_(n -> oo) 1/n sum_(i=1)^n W_m
$
where $W_m$ = amount of time spent in system by $m$th customer.

#pagebreak()

Finally, LR average rate at which customers arrive:
$
  lambda_a = lim_(t -> oo) (N_a (t)) / t = lambda
$
(if G/G/1 queue)

where $N_a (t)$ = \# customers by time $t$.

*Little's formula*
$
  L = lambda_a W
$

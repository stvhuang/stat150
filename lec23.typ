== Lecture 23

Recall:

A *Renewal Process* ($N_t, t >= 0$) has IID inter-arrival times $tau_1, tau_2, dots$ with $mu = "E"tau$.

*Main theorem*:
$
  N_t / t -> 1 / mu "as" t -> oo
$

(On average, wait $mu$ for next point, so $1/mu$ points per unit time.)

#pagebreak()

*Renewal-reward process*

IID seq. of "rewards" $r_1, r_2, dots$ indep. of $tau_1, tau_2, dots$.
Reward $r_n$ is received at time $T_n = sum_(i=1)^n tau_i$.

$
  R_t & = sum_(i=1)^(N_t) r_i \
      & = "total reward by time" t
$

*Main theorem*
$
  R_t / t -> (E r) / mu
$

#pagebreak()

[D] § 3.2: Applications of Renewal Processes to queueing theory

1st example: GI/G/1 queue

GI = General input \
G = General service times \
1 = One server.

#pagebreak()

$tau_1, tau_2, dots$ inter-arrival times with some CDF $F(x) = P(tau <= x)$ and $"E"tau = 1/lambda$.

By previous theorem,
$
  N_t / t -> lambda "as" t -> oo
$
where $N_t = "# arrivals by time" t$.

#pagebreak()

Next, suppose service times $s_1, s_2, dots$ are IID with CDF $G(x) = P(S <= x)$ and $"E"S = 1/mu$.

$therefore$ customers arrive at rate $lambda$ \
and customers are served at rate $mu$

Our first result is very intuitive:
Namely, if $lambda < mu$ then server can handle the customers well:

#pagebreak()

*Theorem.* If $lambda < mu$ then the long run proportion of time the server is busy is $<= lambda/mu < 1$.

*Proof.* $T_n = sum_(i=1)^n tau_i = "arrival time of" n^("th") "customer"$

By SLLN, $T_n / n -> 1/lambda$.

Similarly, let $S_n = sum_(i=1)^n s_i$ = total time in service after $n$ customers served.

#figure[
  #image(
    "./figs/p23_22m.png",
    width: 60%,
  )
]

#pagebreak()

By SLLN $S_n / n -> 1/mu$. Also, at time $T_n$, server has been busy $<= S_n$ time.

& $S_n / T_n -> lambda / mu$.

Skipping some details (see p. 131).
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

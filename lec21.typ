== Lecture 21

Theorem

Suppose we have a Poisson process with rate $lambda$, however we keep a point arriving at time $tau$ only with probability $p(tau)$ (and otherwise delete the point).
Then the resulting process is a non-homogeneous Poisson process with rate $(lambda p(tau), tau >= 0)$.

#pagebreak()

Example 2.9 (M/G/infinity Queue)

Calls arrive at a call center with infinitely many agents according to a Poisson Process $"PP"(lambda)$. The duration of any given call follows some distribution with cdf $G$ with $G(0)=0$ and mean $mu$.

$
  G(y) = P("call time" <= y)
$

#pagebreak()

By the previous theorem, for any $t$, the number of ongoing calls at time $t$ is Poisson with mean

$
  integral_0^t lambda[1 - G(t-s)] d s = lambda integral_0^t [1 - G(t-s)] d s
$
$
  = lambda integral_0^t [1 - G(u)] d u
$

Change of variables: $u = t-s$.

#pagebreak()

Taking $t -> oo$, this converges to

$
  lambda integral_0^oo [1-G(s)] d s = lambda mu
$

*Tail rule:* $E[X] = integral_0^oo P(X>x) d x$

Therefore in the long run/equilibrium, the number of calls in the system will be Poisson with mean $lambda mu$.

#pagebreak()

Example

Customers arrive at a store at a rate of 10/hour. 60% men, 40% women. Men stay for an Exp(2) duration, women for a Uniform(0, 1/2) duration. What is the probability that in equilibrium (i.e. after the store has been open for a long time) there are 4 men and 2 women in the store?

#pagebreak()

Example

Customers arrive at a store at a rate of 10/hour. 60% men, 40% women. Men stay for an $"Exp"(2)$ duration, women for a $"Uniform"(0, 1/2)$ duration. What is the probability that in equilibrium (i.e. after the store has been open for a long time) that there are 4 men and 2 women in the store?

#pagebreak()

By thinning, men and women arrive according to independent Poisson processes with rates 6 and 4 per hour. Since $mu_m = 1/2$ and $mu_w = 1/4$, by the previous result, in equilibrium the \# men and \# women are independent Poissons with means $3 = 6 dot 1/2$ and $1 = 4 dot 1/4$.

#pagebreak()

$
  P(M=4, W=2) = e^(-3) 3^4 / (4!) dot e^(-1) 1^2 / (2!)
$

#pagebreak()

Superposition of Poisson Processes

Instead of thinning, we can also add independent PPs to get another PP. Rates are added!

Theorem
$N_1, dots, N_m$ independent $"PP"(lambda_i)$. Then $N_t = sum_(i=1)^m N_i(t)$ is a Poisson process, rate $sum_(i=1)^m lambda_i$.

#pagebreak()

Example: "Poisson Race"

2 independent Poisson processes: one red rate $lambda$, one blue rate $mu$. What is the probability we see 6 reds before 4 blues?

#pagebreak()

- Equivalently, we need at least 6 reds in the first 9 arrivals.

- Red + Blue is a $"PP"(lambda + mu)$.

- Each arrival is Red w.p. $lambda / (lambda + mu)$ and Blue w.p. $mu / (lambda + mu)$.

#pagebreak()

$
  P("6 reds before 4 blues") = sum_(k=6)^9 binom(9, k) (lambda / (lambda + mu))^k (mu / (lambda + mu))^(9-k)
$

#pagebreak()

Last Section on Poisson Processes: Conditioning

Theorem
Let $(N_t)$ be a $"PP"(lambda)$. Let $s < t$ and $n >= 0$. The conditional distribution of $N_s | N_t=n$ is $"Binomial"(n, s/t)$. That is,
$
  P(N_s = k | N_t = n) = binom(n, k) (s/t)^k (1 - s/t)^(n-k)
$

#pagebreak()

This follows by the following remarkable fact:

Theorem
Let $(N_t)$ be a $"PP"(lambda)$. The conditional on $N_t = n$, the arrival times $T_k = sum_(i=1)^k T_i$, $1 <= k <= n$, are distributed as the order statistics of $n$ IID $"Uniform"(0, t)$ random variables.

#pagebreak()

Example
Supposing $N_t = 4$, i.e. 4 points by time $t$:

The arrival times $T_1, T_2, T_3, T_4$ are the order statistics $U_(1), U_(2), U_(3), U_(4)$ of four IID random variables $U_1, dots, U_4$ drawn from a $"Uniform"(0, t)$ distribution.

$ U_1, dots, U_4 $ IID Uniform on $[0, t]$.
$ U_(1) = $ smallest $U_i = T_1$ (1st arrival time), dots

#pagebreak()

First, note that the 2nd theorem implies the 1st:

Conditional on $N_t=n$, $n$ IID $"Uniform"(0,t)$ points are placed on $[0,t]$. Each has probability $s/t$ of landing in $[0,s]$. So,

$
  P(N_s=k|N_t=n) = binom(n, k) (s/t)^k (1-s/t)^(n-k)
$
$
  #rect()
$

#pagebreak()

Proof of 2nd Theorem

First note that the joint PDF of $(U_(1), U_(2), dots, U_(n))$ is
$
  f(t_1, dots, t_n) = cases(
    (n!)/t^n "if" 0 < t_1 < dots < t_n < t,
    0 "otherwise"
  )
$

This is a Stat 134 fact. Easy to see since $1/t^n$ is the joint PDF of $(U_1, U_2, dots, U_n)$ and there are $n!$ ways to order them.

#pagebreak()

So to prove the theorem, we show that $n!/t^n$ is also the joint PDF of the arrival times $(T_1, dots, T_n)$ conditional on $N_t=n$. To see this:

$
  P(N_t=n) = e^(-lambda t) (lambda t)^n / (n!)
$

To have $T_1=t_1, dots, T_n=t_n$, the joint density of the inter-arrival times is:
$
  P("Exp"(lambda)=t_1) P("Exp"(lambda)=t_2-t_1) dots P("Exp"(lambda)>t-t_n)
$

#pagebreak()

$
  = lambda e^(-lambda t_1) lambda e^(-lambda (t_2-t_1)) dots lambda e^(-lambda (t_n-t_(n-1))) e^(-lambda(t-t_n))
$
$ = lambda^n e^(-lambda t) $ (Telescoping)

Therefore the conditional joint density of $(T_1, dots, T_n)$ is
$
  (lambda^n e^(-lambda t)) / (e^(-lambda t)(lambda t)^n/(n!)) = (n!)/t^n
$
$
  #rect()
$

#pagebreak()

The conditioning property is very useful for calculations. See examples and exercises in [G] & [PK]. We'll do one example from [PK]:

#pagebreak()

Example

Customers arrive at a party according to a $"PP"(lambda)$. The entrance fee depends on the time of arrival. At time $t$, the cover charge is $e^(-beta t)$, $beta > 0$. I.e. cover charge decays exponentially with rate $beta$.

Find the mean revenue by time $t$.

#pagebreak()

$
  R_t = sum_(k=1)^(N_t) e^(-beta T_k)
$

$
  E[R_t] = sum_(n=0)^oo E[sum_(k=1)^n e^(-beta T_k) | N_t=n] P(N_t=n)
$
$
  = sum_(n=0)^oo n E(e^(-beta U)) P(N_t=n) ", " U ~ "Uniform"(0, t)
$
$
  = E(e^(-beta U)) sum_(n=0)^oo n P(N_t=n)
$
$
  = E(e^(-beta U)) E(N_t)
$
$
  = (lambda t) (1/t integral_0^t e^(-beta s) d s) = lambda/beta (1 - e^(-beta t))
$

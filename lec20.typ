== Lecture 20

Last week we defined & constructed the 1-dimensional, rate $lambda$
Poisson process:

Definition
($N_t, t >= 0$) is a PP($lambda$) if
1. $N_0 = 0$
2. *Poisson increments*: $N_(t+s) - N_s ~ "Poisson"(lambda t)$, for any $s, t$.
3. *Independent increments*: $N_(t_1) - N_(t_0), ..., N_(t_n) - N_(t_(n-1))$
are independent for any $t_0 < t_1 < ... < t_n$.

#pagebreak()

Construction
"Point process" on $[0, oo)$
with IID Exponential($lambda$) inter-arrival times between points.

$
  N_t = "# of points in " [0, t].
$
$
  = max { n: T_n <= t }.
$

#pagebreak()

Exponential RVs are very special: *only* continuous RV with Lack of Memory (LoM) property:

$
  P(T > t+s | T > s) = P(T > t)
$

"given it survives to $s$, it starts afresh at time $s$."

*This is key to many interesting/important properties of PP($lambda$) — the subject of sect. 2.4 in [D].*

#pagebreak()

We also studied compound Poisson processes, where each point is given an IID value $Y_i$:

$
  S_t = sum_(i=1)^(N_t) Y_i
$

*Note:* Standard PP($lambda$) is the case where $Y_i equiv 1$
(as then $S_t = sum_(i=1)^(N_t) 1 = N_t$).

#pagebreak()

Thinning of Poisson Processes
*Theorem.* Let ($N_t, t >= 0$) be a PP($lambda$). Suppose $Y$
is a RV on ${1, 2, ..., m}$, with $P(Y=j) = p_j$. Then the compound processes
$
  N_j(t) = sum_(i=1)^(N_t) bb(1)_({Y_i=j})
$
are *independent* rate $lambda p_j$
Poisson processes.

#pagebreak()

Proof
For any $s, t$
& $k_1, ..., k_m$
$
  P(N_1(t+s) - N_1(s) = k_1, ..., N_m(t+s) - N_m(s) = k_m)
$
$
  = binom(k_1 + ... + k_m, k_1, ..., k_m) p_1^(k_1) ... p_m^(k_m) P(N_(t+s) - N_s = k_1 + ... + k_m)
$
$
  = ((k_1+...+k_m)!) / (k_1! ... k_m!) p_1^(k_1) ... p_m^(k_m) e^(-lambda t) ((lambda t)^(k_1+...+k_m)) / ((k_1+...+k_m)!)
$
$
  = product_(j=1)^m e^(-lambda p_j t) ((lambda p_j t)^(k_j)) / (k_j!) = product_(j=1)^m P(N_j(t+s) - N_j(s) = k_j)
$

#pagebreak()

This proves independence of the $N_j(t)$
processes & shows that they each satisfy condition (2.) in the definition of PP.

Conditions (1.) & (3.) are immediately inherited from ($N_t$).
$
  square
$

#pagebreak()

Example 2.8: "Poissonization"
- Some problems become easier if \# of objects is Poisson rather than a fixed (non-random) number.

*Eg:* \# of spectators at a game is Poisson ($lambda=2763$). What is the prob. that for all 365 days of year, at least one person in crowd has this b-day?

#pagebreak()

*Hint* Supposing uniformly random b-days (not so realistic):
$
  N_j = "# born on day " j " of 365"
$
Are IID Poisson ($lambda_j = 2763/365 = 6.2$)
$
  P("all " N_j > 0) = (1 - e^(-6.2))^365
$
$
  ~.op 47.6%
$

#pagebreak()

§2.2.2 [D]: Non-homogeneous Poisson Processes
We skipped this last week:
This is a point process on $[0, oo)$
with Poisson increments --- but rate of arrival of points changes with time.

- More realistic in many applications.

#pagebreak()

Definition
($N_t, t >= 0$) is a Poisson process with rate ($lambda_r, r >= 0$) if
1. $N_0 = 0$
2. $N_t - N_s ~ "Poisson"(integral_s^t lambda_r d r)$
3. *Independent increments*.

If $lambda_r = lambda$
then regular PP($lambda$), since $ integral_s^t lambda d r = lambda integral_s^t d r = lambda(t-s) $.

#pagebreak()

*Note:* Inter-arrival times no longer independent or exponential.

See p.106 in [D].

---

Thinning property can be generalized to non-hom. case:

#pagebreak()

*Theorem.* Suppose we have a Poisson process with rate $lambda$, however keep a point arriving at time $r$
only with prob. $p(r)$
(and otherwise delete point). Then the resulting process is a non-hom. Poisson process with rate ($lambda p(t), t >= 0$).

#pagebreak()

Example 2.9 (M/G/infinity Queue)
Calls arrive at a call center with so many agents according to a PP($lambda$). The duration of any given call follows some distribution with CDF $G$
with $G(0)=0$
& mean $mu$.

$
  G(y) = P("call time" <= y)
$

#pagebreak()

By the previous theorem, for any $t$, the \# of ongoing calls at time $t$
is Poisson with mean
$
  lambda integral_0^t overbrace([1 - G(t-s)], "prob. call placed at time s is still ongoing") d s = lambda integral_0^t [1 - G(t-s)] d s
$

Taking $t -> oo$, this converges to
$
  lambda underbrace(integral_0^oo [1 - G(s)] d s, "Tail rule: " E[X] = integral_0^oo P(X>x) diff x) = lambda mu
$

#pagebreak()

$therefore$
In the long run/equilibrium, the \# of calls in system will be Poisson with mean $lambda mu$.

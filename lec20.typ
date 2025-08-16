== Lecture 20

Last week we defined & constructed the 1-dimensional, rate $lambda$
Poisson Process:

Definition
($N_t, t >= 0$) is a $"PP"(lambda)$ if
1. $N_0 = 0$
2. Poisson increments: \ $N_(t+s) - N_s ~ "Poisson"(lambda t#footnote[length of $= (s, t+s]$])$, for any $s, t$
3. Indep. increments: \ $N_(t_1) - N_(t_0), dots, N_(t_n) - N_(t_(n-1))$ indep for any $t_0 < t_1 < dots < t_n$

#pagebreak()

Construction: \
"Point process" on $[0, oo)$ \
with IID $"Exponential"(lambda)$ inter-arrival times between points.

#figure(
  image(
    "./figs/p20_04m.png",
    width: 100%,
  ),
)

$
  N_t & = "# of * in" [0, t] \
      & = max { n: T_n <= t }
$

#pagebreak()

Exponential RVs are very special: *only* continuous RV with Lack of Memory (LoM) property:

$
  P(T > t+s | T > s) = P(T > t)
$

"Given it survives to $s$, it starts afresh at time $s$."

\* This is key to many interesting/important properties of $"PP"(lambda)$ -- the subject of  §2.4 in [D].

#pagebreak()

We also studied compound Poisson Processes, where each point is given an IID value $Y_i$.
Then

$
  S_t = sum_(i=1)^(N_t) Y_i
$

Note:
Standard $"PP"(lambda)$ is the case where $Y_i equiv 1$ (as then $S_t = sum_(i=1)^(N_t) 1 = N_t$).

#pagebreak()

(§2.4 in [D])
Thinning of Poisson Processes

*Theorem.* Let ($N_t, t >= 0$) be a $"PP"(lambda)$.
Suppose $Y$ is a RV on ${1, 2, dots, m}$, with $P(Y=j) = p_j$.
Then the compound processes
$
  N_j (t) = sum_(i=1)^(N_t) bb(1)_({Y_i=j})#footnote[\# of type $j$ pts arrving by time $t$]
$
are *independent* rate $lambda p_j$ Poisson Processes.

#pagebreak()

Proof. For any $s, t$ & $k_1, dots, k_m$#footnote[$k_i$: \# of type $i$ pts. arriving in $(s, t+s]$]

#text(size: 11pt)[
  $
    & P(N_1 (t+s) - N_1 (s) = k_1, dots, N_m (t+s) - N_m (s) = k_m) \
    & = binom(k_1 + dots + k_m, k_1, dots, k_m) p_1^(k_1) dots p_m^(k_m) dot P(underbrace(N_(t+s) - N_s, #text[$"Poisson"(lambda t)$]) = k_1 + dots + k_m) \
    & = cancel((k_1+dots+k_m)!) / (k_1 ! dots k_m !) p_1^(k_1) dots p_m^(k_m) dot e^(-lambda t) ((lambda t)^(k_1+dots+k_m)) / cancel((k_1+dots+k_m)!) \
    & = product_(j=1)^m e^(-lambda p_j t) ((lambda p_j t)^(k_j)) / (k_j !) = product_(j=1)^m P("Poisson"(lambda p_j) = k_j)
  $
]

#pagebreak()

This proves independence of the $N_j (t)$ processes & shows that they each satisfy condition (2.) in the definition of $"PP"$.

Conditions (1.) & (3.) are immediately inherited from ($N_t$).

#pagebreak()

Example 2.8: "Poissonization"
- Some problems become easier if \# of objects is Poisson rather than a fixed (non-random) number.

*Eg:*
\# of spectators at a game is Poisson ($lambda=2263$).
What is the prob. that for all 365 days of year, at least one person in crowd has this B-day?

#pagebreak()

*Ans*
Supposing uniformly random B-days (not so realistic):

$
  N_j = "# born on day" j "of 365"
$

are IID Poisson ($lambda_j = 2263/365 = 6.2$)

$
  P("all" N_j > 0) & = (1 - e^(-6.2))^365 #footnote[$P("Poisson"(lambda) = 0) = e^(-lambda)$] \
  & approx 47.6%
$

#pagebreak()

§2.2.2 [D]: Non-homogeneous Poisson Processes

We skipped this last week:

This is a point process on $[0, oo)$ with Poisson increments --- but rate of arrival of points changes with time.

- More realistic in many applications.

#pagebreak()

*Def*
($N_t, t >= 0$) is a Poisson Process with rate ($lambda_r#footnote[rate at which points arrive at time $r$], r >= 0$) if
1. $N_0 = 0$
2. $N_t - N_s ~ "Poisson"(integral_s^t lambda_r d r)$
3. Indep. increments

If $lambda_r = lambda$ then regular $"PP"(lambda)$, since

$
  integral_s^t lambda d r = lambda integral_s^t d r = lambda(t-s)#footnote[length of $(s, t]$]
$

#pagebreak()

Note: Inter-arrival times no longer independent or exponential.

See p.106 in [D].

#line(length: 100%)

Thinning property can be generalized to non-hom.

Case:

#pagebreak()

*Theorem.*
Suppose we have a Poisson Process with rate $lambda$, however keep a point arriving at time $r$ only with prob. $p(r)$ (and otherwise delete point).
Then the resulting process is a non-hom. Poisson Process with rate ($lambda p(r), r >= 0$).

#pagebreak()

Example 2.9 (M/G/$oo$ Queue#footnote[for future reference.])

Calls arrive at a call center with so many agents according to a $"PP"(lambda)$.
The duration of any given call follows some distribution with CDF $G$ with $G(0)=0$ & mean $mu$.

$
  G(y) = P("call time" <= y)
$

#pagebreak()

By the previous theorem, for any $t$, the \# of ongoing calls at time $t$ is Poisson with mean

$
  integral_0^t lambda [1 - G(t-s)]#footnote[prob. call placed at time s is still ongoing] d s = lambda integral_0^t [1 - G(t-s)] d s
$

Taking $t -> oo$, this converges to

$
  lambda integral_0^oo [1 - G(s)] d s =#footnote["Tail rule:" $E[X] = integral_0^oo P(X>x) d x$, for non-negative RV $X$] lambda mu
$

#pagebreak()

$therefore$ In the long run/equilibrium, the \# of calls in system will be Poisson with mean $lambda mu$.

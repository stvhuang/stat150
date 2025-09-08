== Lecture 25

[D] §3-3 -- Age & Residual Life.

$(N_t)$ a RP with inter-arrival times IID $tau_1, tau_2, dots$

In a RP we have to deal with inter-arrival times that *do not* have lack of memory.

#pagebreak()

$N_t$ = \# points by time $t$

*Recall*
each time a point arrives is a *renewal time*:

$
  (N_t, t >= 0) =^d (N_(T_n + t) - N_(T_n), t >= 0)
$

[For $"PP"(lambda)$ this is true at *any* point $s$, not only arrival times $s = T_n$]

#pagebreak()

#figure[
  #image(
    "./figs/p25_05m.png",
    width: 80%,
  )
]

$
  A_t & = t - T_(N_t) \
      & = "Age of lightbulb in use at time" t \
  Z_t & = T_(N_t + 1) - t \
      & = "Residual lifetime of lightbulb in use at time" t
$

#pagebreak()

*Discrete case*

Assume inter-arrival times $tau_1, tau_2, dots$ IID only taking values in ${1, 2, 3, dots}$.

#figure[
  #image(
    "./figs/p25_10m.png",
    width: 100%,
  )
]

$therefore$ Enough to study one of $(A_k)$ or $(Z_k)$.

#pagebreak()

We choose $(Z_k)$.

Note: $Z_k = i > 0 => Z_(k+1) = i - 1$

If $Z_k = 0$ this is a renewal time.

$(Z_k)$ is a MC:

$
  cases(
    p_(0, j) = f_(j+1)#footnote[PMF of inter-arrival times] quad j >= 0,
    p_(i, i-1) = 1 quad i > 0,
    p_(i, j) = 0 quad "o/w"
  )
$

#pagebreak()

We can find the SD of this MC using the "cycle trick".
(We discussed this in §1 -- see Theorem 1.24 3rd ed [D]).

Starting from 0, one visits any $i > 0$ at most once before returning and this happens $<=>$ first jump from 0 is to some $j >= i$.

$therefore mu_i = P(T > i)$ is a stationary measure.

#pagebreak()

Note $sum_i underbrace(P(T > i), mu_i) =#footnote[tail formula for expectation] "E"tau$.

$therefore pi_i = (P(tau > i)) / ("E"tau)$ is SD.

[Assuming $"E"tau < oo$].

So by MC theory

#pagebreak()

*Theorem*
(Assuming $(Z_n)$ is *IRR* & *APER*) we have
$
  lim_(n->oo) P(Z_n = i) = (P(tau >= i)) / ("E"tau)
$

This gives the limiting distribution of the $(Z_n)$ in terms of distribution of inter-arrival times $tau$.

#pagebreak()

*Continuous Case*

Done in detail in [D].
We'll just touch on it briefly.

In discrete case, we showed $pi_i = (P(tau > i)) / ("E"tau)$ is limiting distribution for $(Z_k)$ [& also $(A_k)$].

#pagebreak()

Similarly, in the continuous case, one can show that
$
  g(x) = (P(tau > x)) / ("E"tau)
$
is limiting distribution for $(Z_s, s >= 0)$ & $(A_s, s >= 0)$.

Using this

#pagebreak()

*Inspection Paradox*
$
  integral_0^oo z g(z) d z & = integral_0^oo z (P(tau > z)) / ("E"tau) d z \
  & = 1 / ("E"tau) integral_0^oo z P(tau > z) d z \
  & =#footnote[Recall: $"E"tau = integral_0^oo P(tau > z) d z$. Similarly, $"E"(tau^k) = integral_0^oo k z^(k-1) P(tau > z) d z$] 1 / ("E"tau) ("E"(tau^2)) / 2
$

#pagebreak()

$therefore$ For large $t$,
$
  L_t#footnote[Lifetime of bulb in use at time $t$] & = A_t + Z_t \
  therefore "E"(L_t)& approx cancel(2) dot 1 / ("E"tau) E(tau^2) / cancel(2) \
  & = ("E"(tau^2)) / ("E"tau) > "E"tau
$

(since $"E"(tau^2) - ("E"tau)^2 = "Var"tau > 0$#footnote[If $"Var"tau = 0$, then all $tau_i equiv c$. This case isn't interesting.])

#pagebreak()

This is an (*apparent*) paradox, since each lightbulb has mean $"E"tau$.

*However*, lightbulbs with longer lifetimes are more likely to be the ones in use when we happen to make an inspection.

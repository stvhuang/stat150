== Lecture 25

[CD] §3-3 -- Age & Residual Life.

$(N_t)$ a RP with inter-arrival times IID $T_1, T_2, dots$

In a RP we have to deal with inter-arrival times that *do not* have lack of memory.

#pagebreak()

$N_t$ = \# points by time $t$

*Recall*: each time a point arrives is a "renewal time":

$
  (N_t, t >= 0) ?(d)(=) (N_(T_n + t) - N_(T_n), t >= 0)
$

[For PP($lambda$) this is true at *any* point s, not only arrival times]

#pagebreak()

$ A_t = t - T_(N_t) $ = Age of lightbulb in use at time $t$

$ Z_t = T_(N_t + 1) - t $ = Residual lifetime of lightbulb in use at time $t$.

#pagebreak()

*Discrete case.*

Assume inter-arrival times $T_1, T_2, dots$ IID only taking values in {$1, 2, 3, dots$}.

$A_k$: 0 1 2 0 1 0 1 2 3 0 $dots$
$Z_k$: 0 2 1 0 1 0 3 2 1 0 $dots$

$therefore$ enough to study one of $(A_k)$ or $(Z_k)$.

#pagebreak()

We choose $(Z_k)$.

Note: $Z_k = i > 0 => Z_(k+1) = i - 1$.

If $Z_k = 0$ this is a renewal time.

$(Z_k)$ is a MC: PDF of inter-arrival times

$
  p_(0 j) = f_(j+1) quad j >= 0
$
$
  p_(i, i-1) = 1 quad i > 0
$

#pagebreak()

We can find the SD of this MC using the "cycle trick".
(We discussed this in §1 --- see Theorem 1.24 3rd ed [CD]).

Starting from 0, one visits any $i > 0$ at most once before returning and this happens $<=>$ first jump from 0 is to some $j >= i$.

$therefore mu_i = P(T > i)$ is a stationary measure.

#pagebreak()

We can find the SD of this MC using the "cycle trick".
(We discussed this in §1 --- see Theorem 1.24 3rd ed [CD]).

Starting from 0, one visits any $i > 0$ at most once before returning and this happens $<=>$ first jump from 0 is to some $j >= i$.

$therefore mu_i = P(T > i)$ is a stationary measure.

#pagebreak()

Note $sum_i P(T > i) = E T$.

$therefore pi_i = (P(T > i)) / (E T)$ is SD.

[Assuming $E T < oo$].

So by MC theory

#pagebreak()

*Theorem*. (Assuming $(Z_n)$ is *irr* & *aper*) we have
$
  lim_(n->oo) P(Z_n = i) = (P(T >= i)) / (E T)
$

This gives the limiting distribution of the RP in terms of distribution of inter-arrival times.

#pagebreak()

*Continuous Case*

Done in detail in [CD]. We'll just touch on it briefly.

In discrete case, we showed
$ pi_i = (P(T > i)) / (E T) $ is limiting distribution
for $(Z_k)$ [& also $(A_k)$].

#pagebreak()

Similarly, in the continuous case, one can show that
$
  g(x) = (P(T > x)) / (E T)
$
is limiting distribution for $(Z_s, s >= 0)$ & $(A_s, s >= 0)$.

Using this

#pagebreak()

*Inspection Paradox*
$
  integral_0^oo z g(z) d z = integral_0^oo z (P(T > z)) / (E T) d z
$
$
  = 1 / (E T) integral_0^oo z P(T > z) d z
$
$
  = 1 / (E T) (E (T^2)) / 2
$

Recall: $E T = integral_0^oo P(T > z) d z$
Similarly, $E T^k = integral_0^oo k z^(k-1) P(T > z) d z$

#pagebreak()

$therefore$ For large $t$,
Lifetime of bulb in use at time $t$
$
  L_t = A_t + Z_t
$
$
  approx (E(T^2)) / (E T) > E T
$

(since $E(T^2) - (E T)^2 = "Var" T > 0$)

If $"Var" T = 0$, then all $T_i equiv c$. This case isn't interesting.

#pagebreak()

This is an (*apparent*) paradox, since each lightbulb has mean $E T$.

*However*, lightbulbs with longer lifetimes are more likely to be the ones in use when we happen to make an inspection.

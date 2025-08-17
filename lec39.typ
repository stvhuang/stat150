== Lecture 39

*§8.2: Maximum of BM & the Reflection Principle.*
#line(length: 100%)

- Many useful properties follow just from continuity of BM + symmetry of Normal PDF.

#pagebreak()

*Theorem (Reflection Principle)*

For any $x > 0$:

$
  P(max_(0 <= s <= t) B_s > x) = 2 P(B_t > x)
$

#pagebreak()

$ therefore P(B_t > x) $ is only $1/2$ the probability that $P(max_(0 <= s <= t) B_s > x)$.
$
  square
$

#pagebreak()

The RP has many important consequences.

Eg *Zeros of Brownian motion*
#line(length: 100%)

$
  P(B_u = 0, "some " t <= u <= t+s) = 2/pi arctan sqrt(s/t)
$

#pagebreak()

*Proof.*

$ T_x = $ hitting time of $x$.

By RP:
$
  P(T_x <= t) & = P(max_(0 <= u <= t) B_u >= x) \
              & = 2 P(B_t >= x) \
              & = 2 / sqrt(2 pi t) integral_x^oo e^(-y^2 / (2t)) d y
$

#pagebreak()

$
  = sqrt(2/pi) integral_(x/sqrt(t))^oo e^(-u^2/2) d u quad (u = y/sqrt(t))
$

$
  therefore f_(T_x)(t) = (x t^(-3/2)) / sqrt(2 pi) e^(-x^2/(2t))
$

Now, let $H_t(z, x) = P_z(T_x in t)$.

Clearly $H_t(0, x) = H_t(x, 0)$
(Symm. of Normal)

#pagebreak()

$
  therefore H_t(0, x)
$
$
  = H_t(x, 0)
$
$
  = integral_0^t (x xi^(-3/2)) / sqrt(2 pi) e^(-x^2/(2 xi)) d xi
$

$
  P(B_u = 0, "some " t <= u <= t+s)
$
$
  = 2 integral_0^oo H_s(x, 0) 1/sqrt(2 pi t) e^(-x^2/(2t)) d x
$
by sym.

#pagebreak()

$
  = 2 integral_0^oo [ integral_0^s (x xi^(-3/2))/sqrt(2 pi) e^(-x^2/(2 xi)) d xi ] 1/sqrt(2 pi t) e^(-x^2/(2t)) d x
$

$
  = 1/(pi sqrt(t)) integral_0^s (integral_0^oo x e^(-x^2/(2 xi) - x^2/(2t)) d x) xi^(-3/2) d xi
$

Calc.
Change of variables
p. 409

Trig: Exercise 8.2.2.

$
  = 2/pi arccos sqrt(t/(t+s)) = 2/pi arctan sqrt(s/t)
$
$
  square
$

#pagebreak()

It can be shown (more advanced classes in prob. or see Mörters-Peres) that the set

$
  Z = {t: B_t = 0}
$

is
- *Infinite* by RP
- *Uncountable*
- *No isolated points*
- *Measure zero*
- *Fractal (Hausdorff) dimension 1/2.*

#pagebreak()

Other useful extensions discussed in §8.3-8.4.

* Reflected BM: $abs(B_t)$
* Absorbed: $B_0=x$, stopped at 0.
$
  A_t = cases(
    B_t & "if " t <= T_x,
    0 & "if " t > T_x
  )
$
- With drift $mu$: $X_t = mu t + sigma B_t$
Incr. Normal($mu s, sigma^2 s$).

#pagebreak()

- Brownian Bridge:
($B^0, 0 <= t <= 1$) is BM conditioned on ${B_0 = B_1 = 0}$.

A slick way of obtaining this is:
$
  B_t^0 = B_t - t B_1
$

#pagebreak()

*Application* (used in e.g. Non-parametric Stats)
$X_1, X_2, dots$ IID

*Empirical CDF*
$
  F_N(t) = 1/N sum_i^N xi_i(t), xi_i = 1_({X_i <= t})
$

Use this to estimate (unknown) CDF $F(t) = P(X <= t)$.

#pagebreak()

Eg if $X_i$ IID Uniform(0,1)
$
  E xi_i(t) = P(X <= t) = t
$
$
  X_N(t) = (sum_1^N (xi_i(t) - t)) / (sqrt(N))
$
$
  = sqrt(N) (F_N(t) - t)
$
$
  -> B_t^0
$

$
  therefore F_N(t) = t + B_t^0 / sqrt(N)
$
So error is a Brownian bridge, scaled by $sqrt(N)$.

#pagebreak()

It is an important, but somewhat tricky, matter to show that Brownian motion exists --- i.e. it is possible to construct a process ($B_t, t >= 0$) satisfying conditions 1-3 above.

#pagebreak()

*Paul Lévy's Construction*
#line(length: 100%)

Dyadic Rationals
$
  D_n = { k/2^n : 0 <= k <= 2^n }.
$

Are dense in $[0,1]$.

Select IID $Z_t ~ "Normal"(0, 1)$, one for each $t in D_n$.

#pagebreak()

Fig. 1.2. The first three steps in the construction of Brownian motion

*See Mörters-Peres p 9-12.*

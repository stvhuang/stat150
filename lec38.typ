== Lecture 38

Einstein:

Let $(B_t, t >= 0)$ be position of particle evolving in time.

Let $p_t(x,y)$ be PDF, the density with which particle moves from $x$ to $y$ in time $t$.

He argued, by physics, that
$
  ("del" p) / ("del" t) = sigma^2 / 2 ("del"^2 p) / ("del" x^2)
$
for some "diffusion coefficient" $sigma^2$.

#pagebreak()

This implies (see [PK] Exercise 8.1.3) that
$
  p_t(x,y) = 1 / sqrt(2 pi t sigma) e^(-(y-x)^2 / (2 t sigma^2)) ,
$
a normal density. // Note in handout: PDF of Normal(0,1)

- If $sigma^2 = 1$, $p_t(x,y) = phi(y-x)$,
and we call $(B_t, t >= 0)$ *standard* Brownian motion.

#pagebreak()

Mathematical definition of Brownian motion:

*Definition* \
$(B_t, t >= 0)$ is BM with diffusion coeff. $sigma^2$ started from $x$ if
- a) All increments normal: $B_(s+t) - B_s ~ "Normal"(0, sigma^2 t)$
- b) Indep. increments
- c) $B_0 = x$ & $t -> B_t$ is a continuous function.

#pagebreak()

Unless otherwise stated, we'll always assume $(B_t, t >= 0)$ is standard, $sigma^2 = 1$.

#pagebreak()

Brownian Motion & Random Walk (Donsker's Invariance Principle)

- Brownian motion is the "scaling limit" of random walk.

Let $X_1, X_2, dots$ be iid. $E X = 0$, $"Var" X = 1$.

$ S_m = sum_i^n X_i $: SRW.

#pagebreak()

Let $B_n$ be the linear interpolation of $S_n$, scaled by $1 / sqrt(n)$.

// The page includes two plots.
// The first plot shows a simple random walk (S_n) over n steps.
// The second plot shows the scaled process B_n(t) on the interval [0, 1].
// The formula for the scaled process is given as:
$
  B_n(t) = S_(n t) / sqrt(n)
$

#pagebreak()

*Theorem (Donsker)*

$
  (B_n(t) = S_(n t) / sqrt(n), 0 <= t <= 1)
$
$
  "longrightarrow.b"(n -> oo) (B_t, 0 <= t <= 1)
$

#pagebreak()

This is a very substantial improvement upon the CLT:
// #enum(
//   "LLN says:", $S_n / n -> 0$,
//   "CLT says:", $S_n / sqrt(n) -> "Normal"(0,1)$,
//   "Donsker says:", $(S_(n t) / sqrt(n)) -> (B_t)$.
//   In particular, for any $t$, $S_(n t) / sqrt(n) -> "Normal"(0, t)$.
// )

#pagebreak()

That is,
// #enum(
//   "LLN says", $S_n ll n$,
//   "CLT gives distribution of end point of path:", $"Normal"(0,1):$ so $S_n = O(sqrt(n))$.
//   "Donsker gives control over the whole path over", $ C[0,1] $, "not only at end point", $t=1$.
// )

#pagebreak()

Some results about BM can be anticipated due to connection with SRW.

*Eg* $X_i$ iid $P(X = +-1) = 1/2$. $a < 0 < b$.
$ P_0 ( "hit" a " before " b ) = b / (a+b) $.

Therefore:
$ P_0 ( B_t " hits " a " before " b ) = lim_(n->oo) (b sqrt(n)) / (a sqrt(n) + b sqrt(n)) = b/(a+b) $.

#pagebreak()

§8.2: Maximum of BM & The Reflection Principle.

- Many useful properties follow just from continuity of BM + symmetry of Normal PDF.

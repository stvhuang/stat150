== Lecture 29

(1) To construct ($X_t$):

The inductive procedure works as follows: If last jump was to $i$, then hold the MC at $i$ for an $"Exp"(lambda_i)$ time then jump to $j$ w.p. $q_(i j) / lambda_i$ [Assuming $lambda_i > 0$, o/w if $lambda_i = 0$ the MC stays at $i$ forever, i.e. $i$ is absorbing].

#pagebreak()

(2) We can use the jump rates $q_(i j)$ to find $p_t(i, j)$:

K-BE $P'_t = Q P_t$
K-FE $P'_t = P_t Q$

where $(Q)_(i j) = cases(-lambda_i & "if " i=j, q_(i j) & "if " i != j)$

$(P_t)_(i j) = p_t(i, j)$ & $(P'_t)_(i j) = p'_t(i, j)$

#pagebreak()

Eg 2-state MC.

Jump $1 -> 2$ rate $lambda$
$2 -> 1$ rate $mu$

$q_(12) = lambda$
$q_(21) = mu$

$Q = mat(-lambda, lambda; mu, -mu)$

To find $p_t(i, j)$ we solve
$
  P'_t = Q P_t
$

#pagebreak()

I.e. $ mat(p'_t(11), p'_t(12); p'_t(21), p_t(22)) = mat(-lambda, lambda; mu, -mu) mat(p_t(11), p_t(12); p_t(21), p_t(22)) $

$
  => p'_t(11) = -lambda(p_t(11) - p_t(21))
$
$
  p'_t(21) = mu(p_t(11) - p_t(21))
$

$
  (p_t(11) - p_t(21))' = -(lambda + mu)(p_t(11) - p_t(21))
$

#pagebreak()

$
  => p_t(11) - p_t(21) = e^(-(lambda + mu)t)
$

(Using I.C.s $p_0(11) = 1$ & $p_0(21) = 0$)

Plugging back into above:
$
  p'_t(11) = -lambda e^(-(lambda+mu)t)
$

$
  => p_t(11) - p_0(11) = -lambda integral_0^t e^(-(lambda+mu)s) d s
$
$
  = lambda / (lambda + mu) (e^(-(lambda+mu)t) - 1)
$

#pagebreak()

$
  => p_t(11) = lambda / (lambda + mu) e^(-(lambda+mu)t) - lambda/(lambda+mu) + 1
$
$
  = lambda / (lambda + mu) e^(-(lambda+mu)t) + mu/(lambda+mu)
$

Similarly,
$
  p_t(21) = -lambda/(lambda+mu) e^(-(lambda+mu)t) + mu/(lambda+mu)
$

#pagebreak()

Note that both

$
  lim_(t->oo) p_t(11) = mu / (lambda + mu)
$
$
  lim_(t->oo) p_t(21) = mu / (lambda + mu)
$

LR behavior of continuous time mc's will be our next topic --- after slides.

#pagebreak()

Eg Branching Processes

First we consider the special case of no death:
Yule Process $q_(i, i+1) = beta i$

Here particles split into two at rate $beta$. Particles live forever, so population will continue to grow exponentially.

$Y_t =$ \# particles at time $t$.

#pagebreak()

Theorem. For Yule Process ($Y_t$):

$
  p_t(1, j) = e^(-beta t) (1 - e^(-beta t))^(j-1) quad (j >= 1)
$
$
  = P("Geo"(e^(-beta t)) = j)
$

&

$
  p_t(i, j) = binom(j-1, i-1) (e^(-beta t))^i (1 - e^(-beta t))^(j-i)
$

#pagebreak()

Note that by $p_t(1, j) = e^(-beta t) (1-e^(-beta t))^(j-1)$,

$
  P(e^(-beta t) Y_t > x) = P(Y_t > x e^(beta t))
$
$
  = (1 - e^(-beta t))^(x e^(beta t))
$
$
  -> e^(-x) " as " t->oo
$

$
  therefore e^(-beta t) Y_t ->^d "Exp"(1) " as " t->oo
$

So starting with 1 particle, the pup. grows exponentially, $Y_t approx "Exp"(1) e^(beta t)$.

#pagebreak()

We won't prove the theorem in detail, but note by K-FE:
$
  "only " q_(j-1,j) != 0
$
$
  p'_t(1, j) = sum_(k!=j) p_t(1, k) q_(k j) - p_t(1, j) lambda_j
$
$
  = p_t(1, j-1) beta(j-1) - p_t(1, j) beta j
$

You can check that this is satisfied by $p_t(1, j) = e^(-beta t) (1 - e^(-beta t))^(j-1)$.

#pagebreak()

Once $p_t(1, j)$ is proved, it is easy to get $p_t(i, j)$.

By independence, we can study the "family trees" of the initial $i$ particles separately:

$
  p_t(i, j) = sum_(n_1 + dots + n_i = j, n_k >= 1) "prod"_(k=1)^i p_t(1, n_k)
$

#pagebreak()

For any such $n_1, dots, n_i$

$
  "prod"_(k=1)^i p_t(1, n_k) = "prod"_(k=1)^i e^(-beta t) (1 - e^(-beta t))^(n_k-1)
$
$
  = (e^(-beta t))^i (1 - e^(-beta t))^(j-i)
$

There are $binom(j-1, i-1)$ such $n_1, dots, n_i$.

* *v* $dots$ *v* *
$1$ $2$ $dots$ $j$

Choosing $i-1$ of these $j-1$ v's determines $n_1, dots, n_i >= 1$ & $sum n_i = j$.

#pagebreak()

$
  therefore p_t(i, j) = binom(j-1, i-1) (e^(-beta t))^i (1-e^(-beta t))^(j-i)
$

See also p159 of Durrett for proof of $p_t(1, j) = e^(-beta t) (1 - e^(-beta t))^(j-1)$ using LoM property of exponentials.

#pagebreak()

General case BP with birth & death (called a B&D chain)
$
  q_(i, i+1) = lambda i
$
$
  q_(i, i-1) = mu i
$

Think: particles split into two at rate $lambda$, however die at rate $mu$.

#pagebreak()

This case is much more complicated.

Theorem. $Z_t =$ \# particles in general BP, birth rate $lambda$, death rate $mu$. Suppose $lambda > mu$. Then $Z_t$ has "generalized geometric distribution".
$
  p_0 = alpha,quad p_n = (1-alpha)(1-rho)rho^(n-1) quad (n>=1)
$

#pagebreak()

Where

$
  alpha = (mu e^((lambda-mu)t) - mu) / (lambda e^((lambda-mu)t) - mu)
$

$
  rho = (lambda e^((lambda-mu)t) - lambda) / (mu e^((lambda-mu)t) - mu)
$

See Durrett (p 159-162) if interested.

== Lecture 28

Recall from last class, we discussed how to construct continuous time MC's.

$
  p_t(i,j) = P(X_(s+t) = j | X_s = i)
$

$
  q_(i j) = lim_(t -> 0) (p_t(i, j)) / t quad i != j
$
$
  = "jump rate" i -> j
$

$
  lambda_i = sum_(j != i) q_(i j) = "jump rate" "out of" i
$

#pagebreak()

It turns out (we will not prove this in Stat 150) the way to do this is as follows:

If currently in state $i$, hold MC in $i$ for an $"Exp"(lambda_i)$ amount of time, and then jump to some $j$ w.p. $r_(i j) = q_(i j) / lambda_i$.

--- Unless $lambda_i = 0$, then MC stays in $i$ forever (absorbing state).

#pagebreak()

To see why this is the correct construction, it may be helpful to consider the following simple example:

#pagebreak()

Birds visit a feeder according to independent Poisson processes:

$ (N_t^R) $ Robins rate $lambda_R$
$ (N_t^B) $ Blackbirds rate $lambda_B$

$
  (X_t) = (N_t^R, N_t^B)
$

1st coord at rate $lambda_R$
2nd coord at rate $lambda_B$

#pagebreak()

Times between birds are iid $"Exp"(lambda_R + lambda_B)$. And

$
  P("Robin") = lambda_R / (lambda_R + lambda_B)
$

$
  & P("Blackbird") = lambda_B / (lambda_R + lambda_B)
$

So hold $(X_t)$ for $"Exp"(lambda_R + lambda_B)$ time & then increase 1st or 2nd co-ord w.p. $lambda_R / (lambda_R + lambda_B)$ and $lambda_B / (lambda_R + lambda_B)$.

#pagebreak()

[D] §4.2 --- Transition Probabilities

For discrete MC's we could find n-step $p_(i j)^n$ by multiplying $P$ $n$ times: $p_(i j)^n = (P^n)_(i j)$.

This was proved by CK-eqns.

For continuous MC, how to find $p_t(i, j)$ probabilities from $q_(i j)$?

#pagebreak()

For continuous MC, how to find $p_t(i, j)$ probabilities from $q_(i j)$?

Recall jump rates
$
  q_(i j) = lim_(h -> 0) (p_h(i, j)) / h
$
play the role of $p_(i j)$ in the discrete case.

Once again, the answer is to use the CK-eqns, *but* more complicated:

#pagebreak()

By CK-eqns:

$
  p_(t+h)(i, j) - p_t(i, j)
$
$
  = [ sum_k p_h(i, k) p_t(k, j) ] - p_t(i, j)
$
$
  = [ sum_(k != i) p_h(i, k) p_t(k, j) ] + (p_h(i, i) - 1) p_t(i, j)
$

Now divide by $h$, then take $h -> 0$:

#pagebreak()

$ (p_(t+h)(i, j) - p_t(i, j)) / h -> p'_t(i, j) $ as $h -> 0$

$
  = [ sum_(k != i) p_h(i, k)/h p_t(k, j) ] - ( (p_h(i, i) - 1)/h ) p_t(i, j)
$

As $h -> 0$, $p_h(i, k)/h$ becomes $q_(i k)$.

As $h -> 0$, what is $(p_h(i, i) - 1)/h$?

#pagebreak()

$
  p_h(i, i) = 1 - sum_(j != i) p_h(i, j)
$

$
  therefore (p_h(i, i) - 1)/h = - sum_(j != i) p_h(i, j) / h
$

As $h -> 0$, the sum on the right becomes $lambda_i = sum_(j != i) q_(i j)$.

Hence, altogether,

$
  p'_t(i, j) = sum_(k != i) q_(i k) p_t(k, j) - lambda_i p_t(i, j)
$

#pagebreak()

If we define matrix $Q$ with entries

$
  Q_(i j) = cases(
    q_(i j) & "if" i != j,
    -lambda_i & "if" i = j
  )
$

Then previous equations can be written as:

Kolmogorov's Backward Equation: $ P'_t = Q P_t $

#pagebreak()

$
  p_h(i,i) = 1 - sum_(j != i) p_h(i,j)
$

$ therefore (p_h(i,i) - 1)/h = -sum_(j != i) p_h(i,j)/h -> -lambda_i $ as $h -> 0$

Hence, altogether,

DE for $P_t(i,j)$
$
  p'_t(i,j) = sum_(k != i) q_(i k) p_t(k,j) - lambda_i p_t(i,j)
$

#pagebreak()

If we define matrix $Q$ with entries

$
  Q_(i j) = cases(
    q_(i j) & "if" i != j,
    -lambda_i & "if" i = j
  )
$

Then previous equations can be written as:

Kolmogorov's Backward Equation: $ P'_t = Q P_t $

#pagebreak()

By the same argument, *but*

$
  p_(t+h)(i,j) - p_t(i,j) = [ sum_k p_t(i,k) p_h(k,j) ] - p_t(i,j)
$

instead of

$
  p_(t+h)(i,j) - p_t(i,j) = [ sum_k p_h(i,k) p_t(k,j) ] - p_t(i,j)
$

#pagebreak()

Kolmogorov's Forward Equation: $ P'_t = P_t Q $

Note: By Kolmogorov Forward & Backward (K-eqns)

$
  Q P_t = P_t Q
$

#pagebreak()

This is remarkable, since $A B != B A$ in general for matrices $A, B$.

The reason why $P_t Q = Q P_t$ is that these matrices are made up of powers of $Q$:

#pagebreak()

Recall $y' = a y => y = e^(a x) = sum_(k=0)^oo ((a x)^k)/(k!)$

Here we have $P'_t = Q P_t$. These are matrices, but still natural to expect

$
  P_t = e^(Q t) := sum_(k=0)^oo ((Q t)^k)/(k!)
$

#pagebreak()

Indeed,

$
  d/(d t) sum_(k=0)^oo ((Q t)^k)/(k!) = sum_(k=1)^oo (Q^k t^(k-1))/((k-1)!)
$
$
  = Q sum_(k=0)^oo ((Q t)^k)/(k!)
$
$
  = (sum_(k=0)^oo ((Q t)^k)/(k!)) Q
$

#pagebreak()

The rest of §4.2 is devoted to examples of MC's where K-eqns can be solved to find $P_t(i,j)$ explicitly.

We'll do *some* of these.

#pagebreak()

Eg Poisson Process.

We know
$
  p_t(i,j) = P("Poi"(lambda t) = j - i)
$
$
  = e^(-lambda t) ((lambda t)^(j - i)) / ((j - i)!)
$

By BKE we should have:
$
  p'_t(i,j) = lambda p_t(i, j+1) - lambda p_t(i,j)
$

#pagebreak()

This is easy to check!

$
  p_t(i,j) = e^(-lambda t) ((lambda t)^(j-i)) / ((j-i)!)
$

$
  p'_t(i,j) = lambda e^(-lambda t) ((lambda t)^(j-i-1))/((j-i-1)!) - lambda e^(-lambda t) ((lambda t)^(j-i))/((j-i)!)
$

$
  = lambda p_t(i, j+1) - lambda p_t(i,j)
$

$
  checkmark
$

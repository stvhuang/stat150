== Lecture 30

[D] §4.3 -- Limiting behavior of continuous time MC's.

*Good News:* Much of the theory for discrete time MC's carries over. Also due to Exp holding times, we do not need to worry about periodicity issues.

#pagebreak()

In continuous time, we extend the notion of irreducibility as follows:

Def: $(Y_t)$ is irr if for any $i, j$ there are $k_0 = i, k_1, dots, k_n = j$ with all $q_(k_(m-1), k_m) > 0$. In other words it is possible to get from $i$ to $j$ in a finite \# of jumps.

#pagebreak()

This implies $P_t(i, j) > 0$ for some $t > 0$. (See p162 in Durrett for proof.)

*Stationary distributions of continuous time MC's*

In discrete time, $pi$ is SD if $pi = pi P$. Recall that this implies $pi = pi P^n$ for all $n$.

#pagebreak()

I.e. if MC is in SD, then stays in SD forever.

$ P(X_0 = i) = pi_i => P(X_n = i) = pi_i $ any $n >= 1$.

In continuous time there is no first step. So we extend the notion of SD as follows:

#pagebreak()

Def: $pi$ is a SD if for all $t > 0$ $pi = pi underbrace(P_t)$, where $(underbrace(P_t))_(i j) = P_t(i, j)$.

However, this is difficult to check since it involves *all* $t$.

Fortunately,

#pagebreak()

*Theorem.*

$
  pi " SD" <=> pi = pi underbrace(Q)
$

where

$
  (underbrace(Q))_(i j) = {
    -lambda_i " if " i = j;
    q_(i j) " if " i != j;
  }
$

(This is another instance of the $q_(i j)$ playing role of $p_(i j)$ in continuous time.)

#pagebreak()

"Proof."

Think of $pi_i$ as proportion of sand at $i$ in equilibrium.

$
  pi underbrace(Q) = 0 <=> underbrace(sum_(k!=j) pi_k q_(k j), "Rate at which sand arrives at j") = underbrace(pi_j lambda_j, "Rate at which sand leaves j")
$

Equilibrium if Rate in = Rate out.

#pagebreak()

Proof. See p163.

It can be shown, as for discrete time MC's:

*Theorem.*
If $(X_t)$ is irr & has SD $pi$, then

$
  lim_(t -> oo) P_t(i, j) = pi_j
$

#pagebreak()

An important special case where easier to find $pi$ than $0 = pi Q$ is

*Detailed balance:*
If $pi_i q_(i j) = pi_j q_(j i) quad forall i != j$
Then $0 = pi underbrace(Q)$. $=> pi$ SD

#pagebreak()

Thinking of sand again, DB implies flow of sand between any two states is balanced.

$
  underbrace(pi_i q_(i j), "Rate of sand moved " i -> j) = underbrace(pi_j q_(j i), "Rate of sand moved " j -> i)
$

#pagebreak()

Not all MC's have DB, but many important ones do,
e.g. B&D chain
$
  q_(i, i+1) = lambda_i
$
$
  q_(i, i-1) = mu_i
$

Jump Rates: A process on ${0, dots, N}$ with jumps only to adjacent states.
// $dots leftright.arrow i-1 leftright.arrow i leftright.arrow i+1 dots$
The rate of jumping $i -> i+1$ is $lambda_i$ and $i -> i-1$ is $mu_i$.

$
  \#("jumps " i -> i+1) = \#("jumps " i+1 -> i) +- 1
$
For all times $t$.

#pagebreak()

Using DB can show for B&D on ${0, 1, dots, N}$,

$
  pi_i = pi_0 (lambda_(i-1) lambda_(i-2) dots lambda_0) / (mu_i mu_(i-1) dots mu_1)
$

[ Can find $pi_0$ using $sum pi_i = 1$. ]

#pagebreak()

Proof that DB $=>$ SD:

Suppose $pi_i q_(i j) = pi_j q_(j i) quad forall i != j$.

Then $sum_(i!=j) pi_i q_(i j) = pi_j sum_(i!=j) q_(j i) = pi_j lambda_j$

$
  => (pi underbrace(Q))_j = sum_(i!=j) pi_i q_(i j) - pi_j lambda_j = 0
$

$
  => pi underbrace(Q) = 0 => pi " SD."
$
$
  square
$

#pagebreak()

There are many worked examples in §4.2 for you to look at where you can find SD by either (1) $pi Q = 0$ or (2) DB.

#pagebreak()

Recall:

E.g. 2-State MC.
$
  q_(12) = lambda
$
$
  q_(21) = mu
$
$
  Q = mat(
    -lambda, lambda;
    mu, -mu
  )
$

$
  (pi_1, pi_2) Q = (0, 0) => pi = (mu/(lambda+mu), lambda/(lambda+mu))
$

Recall: We found $P_t(1, 1)$ & $P_t(2, 1)$ $-> mu/(lambda+mu)$ as $t -> oo$.

#pagebreak()

E.g. M/M/$oo$ queue.
$
  q_(i, i+1) = lambda
$
$
  q_(i, i-1) = i mu
$

DB $=> pi_i = pi_0 (lambda/mu)^i / (i!)$

Normalizing:
$
  pi_i = e^(-lambda/mu) ((lambda/mu)^i)/(i!) = P("Poi"(lambda/mu) = i).
$

#pagebreak()

E.g. LA weather chain.

1 = Sunny
2 = Smoggy
3 = Rainy

- Sunny for $"Exp"(1/3)$ amount of day then smoggy.
- Smoggy for $"Exp"(1/4)$ days until rain.
- Rain for $"Exp"(1)$ days then sun.

#pagebreak()

$
  Q = mat(
    -1/3, 1/3, 0;
    0, -1/4, 1/4;
    1, 0, -1
  )
$

$
  pi Q = 0 => pi = 1/8 (3, 4, 1)
$

$therefore$ LR prop. of day that are sunny is $3/8$.

#pagebreak()

Alternatively, consider the discrete skeleton chain
$
  P = mat(
    0, 1, 0;
    0, 0, 1;
    1, 0, 0
  ), " SD" = 1/3 (1, 1, 1)
$

When in state 1, 2, 3 held on average 3, 4, 1 days. So LR prop. of days in 1, 2, 3 should be $( (3/3, 4/3, 1/3) ) / ( (3+4+1)/3 ) = pi$.

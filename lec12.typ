== Lecture 12

$
  sum_i pi_i bb(E)_i N_j = sum_i pi_i sum_(n=1)^infinity P_(i j)^n \
  = sum_(n=1)^infinity sum_i pi_i P_(i j)^n \
  = sum_(n=1)^infinity (pi P^n)_j \
  = sum_(n=1)^infinity pi_j \
  = infinity
$
(since $pi = pi P => pi = pi P^n$ and $pi_j > 0$)

Recall: $bb(E)_i N_j = rho_(i j) / (1 - rho_(j j))$ where $rho_(i j) = P_i(T_j < infinity)$

#pagebreak()

$
  therefore sum_i pi_i rho_(i j) / (1 - rho_(j j)) = 1 / (1 - rho_(j j)) sum_i pi_i rho_(i j)
$

However,
$ sum_i pi_i rho_(i j) <= sum_i pi_i = 1 $

$ therefore 1 / (1 - rho_(j j)) = infinity => rho_(j j) = 1 $
$ => j " is recurrent." $ $square$

#pagebreak()

== We are ready to prove:

*Theorem 1.19* Suppose $(X_n)$ is irreducible, aperiodic and has a stationary distribution $pi = pi P$. Then $lim_(n -> infinity) p_(i j)^n = pi_j$ for all $i, j$.

[Proof is long but beautiful. We'll split it into several parts]

*Proof.* $(X_n)$ a MC on $S$ with tr. prob. $P_(i j)$. We define $(Y_n) = (X_n, X'_n)$ on $S^2 = S times S$ with tr. prob $q$ as follows:

#pagebreak()

$ q_((i_1, j_1), (i_2, j_2)) = P_(i_1 i_2) P_(j_1 j_2) $

i.e. the 2 co-ordinates transition independently according to $P$.

*Step 1.* $(Y_n)$ is irreducible.

Lemma 1.16 in [S] shows that if state $x$ is aperiodic, $P_(x x)^n > 0$ for all sufficiently large $n$. We'll use this without proof.

#pagebreak()

Since $(X_n)$ irreducible,
$ P_(i_1 i_2)^k > 0 $ for some $k, l$
$ P_(j_1 j_2)^l > 0 $

Since $(X_n)$ aperiodic, so $i_2, j_2$ are aperiodic,
$ P_(i_2 i_2)^n, P_(j_2 j_2)^n > 0 $ for all large $n$.

$
  therefore q_((i_1, j_1), (i_2, j_2))^(k + l + n) = P_(i_1, i_2)^(k+l+n) P_(j_1, j_2)^(k+l+n) \
  >= (P_(i_1 i_2)^k P_(i_2 i_2)^(l+n)) (P_(j_1 j_2)^l P_(j_2 j_2)^(k+n)) > 0
$
for all large $n$.

#pagebreak()

$therefore (Y_n)$ is irreducible.

*Step 2* $hat(pi)_(i j) = pi_i pi_j$ is a SD for $(Y_n)$.

This is because, recall, the coordinates move independently like $(X_n)$.
So by lemma, all states $(i, j) in S^2$ are recurrent for $(Y_n) = (X_n, X'_n)$.

Let $T = "min"{ n >= 0: X_n = X'_n } = 1^"st"$ time co-ordinates equal.

Note: $P(T < infinity) = 1$. (All states $(x,x)$ is recurrent.)

#pagebreak()

*Step 3* $P(X_n = x, T <= n) = P(X'_n = x, T <= n)$

$
  P(X_n = x, T <= n) \
  = sum_(m=1)^n sum_y P(T=m, X_m=y, X_n=x) \
  = sum_(m=1)^n sum_y P(T=m, X_m=y) P(X_n=x | X_m=y) \
  = sum_(m=1)^n sum_y P(T=m, X'_m=y) P(X'_n=x | X'_m=y) \
  = P(X'_n = x, T <= n)
$
// First arrow: by def of T
// Second arrow: X_n, X'_n iid.
// Third arrow: by 1st two lines of reasoning instead applied to (X'_n).

#pagebreak()

Finally,

*Step 4* By previous step, the distributions of $X_n$ and $X'_n$ agree on ${T <= n}$. So,

$
  | P(X_n=x) - P(X'_n=x) | \
  = | P(X_n=x, T>n) - P(X'_n=x, T>n) | \
  <= P(X_n=x, T>n) + P(X'_n=x, T>n)
$

#pagebreak()

$ therefore sum_x | P(X_n=x) - P(X'_n=x) | <= 2 P(T > n) $
$ -> 0 " as " n -> infinity $

Now, let $X_0 = i$ & $X'_0 ~ pi$. Then,
$ sum_j | p_(i j)^n - pi_j | -> 0 " as " n -> infinity $
// Arrow points to X'_0 ~ pi, indicating X'_n ~ pi

$ => lim_(n->infinity) p_(i j)^n = pi_j quad forall i, j. $ $square$

#pagebreak()

Next, we prove:

*Theorem 1.20* Suppose $(X_n)$ is irreducible and recurrent. Then it has a *stationary measure* $mu >= 0$ : $sum_i mu_i P_(i j) = mu_j$ for all $j$.

Recall: if $abs(S) < infinity$ we can use $mu$ to find SD: $pi_i = mu_i / (sum_j mu_j)$.

#pagebreak()

*Sketch Proof.* Fix $i in S$. Let
$ T_i = "min"{ n >= 1 : X_n = i } $

We show
$ mu_i(j) = sum_(n=0)^infinity P_i(X_n = j, T_i > n) $
$ = "expected # visits to j before time " T_i ", starting from i" $
is a stationary measure.

#pagebreak()

This is called the "cycle trick".

$ mu_i(j) = bb(E)_i ["# visits to j during" {0, 1, ..., T_i - 1} ] $
$ = bb(E)_i ["# visits to j during" {1, 2, ..., T_i} ] $
$ = (mu_i P)(j) $
// $P$ moves us ahead on time unit.

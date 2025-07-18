== Lecture 11

== Metropolis-Hastings Algorithm

Used in bayesian statistics, image reconstruction, for studying complicated statistical physics models, etc...

Suppose we want to sample from some distribution $pi$ on a set $S$.

#pagebreak()

We can construct a MC $(X_n)$ with s.d. $pi$. If we run $(X_n)$ for a long time, $P(X_n = i) approx pi_i$, so the position of $(X_n)$ after a long time is close to a sample from the distribution $pi$.

Metropolis-hastings gives us a method of constructing such a mc $(X_n)$:

#pagebreak()

Let $(Y_n)$ be a mc on $S$ with tr. prob. $q_(i j)$.

Then let $(X_n)$ be the mc on $S$ with tr. prob.

$ p_(i j) = q_(i j) r_(i j) $, where

$ r_(i j) = min { (p_(i_j) q_(j i)) / (pi_i q_(i j)) , 1 } $

#pagebreak()

In other words, if $(X_n)$ is currently at $i$, we select a possible next transition according to what $(Y_n)$ would do ($i -> j$ w.p. $p_(j i)$), *however* we accept this transition only with probability

$ r_(j i) = min { (pi_j q_(j i)) / (pi_i q_(j i)) , 1 } $

Otherwise, we stay at $i$ in this step.

#pagebreak()

Then $(X_n)$ has s.d. $pi$.

To see this we check DB:
$ pi_i p_(j i) = pi_j p_(j i) quad forall i, j $

Recall $p_(j i) = q_(j i) r_(j i) = q_(j i) min { (pi_j q_(j i)) / (pi_i q_(j i)) , 1 }$.

*Case 1:* Suppose $ (pi_j q_(j i)) / (pi_i q_(j i)) <= 1 $. Then

$ r_(j i) = (pi_j q_(j i)) / (pi_i q_(j i)) $ and $r_(j i) = 1$.

#pagebreak()

$ therefore pi_i p_(j i) = pi_i q_(j i) r_(j i) $
$ = pi_i q_(j i) (pi_j q_(j i)) / (pi_i q_(j i)) $
$ = pi_j q_(j i) $

$ pi_j p_(j i) = pi_j q_(j i) r_(j i) $
$ = pi_j q_(j i) $

$ => pi_i p_(j i) = pi_j p_(j i) $.

#pagebreak()

*Case 2:* $ (pi_j q_(j i)) / (pi_i q_(j i)) >= 1 $ is symmetric, and follows similarly.

Therefore $(X_n)$ satisfies DB with $pi$. Hence $pi = pi P$.

$ therefore lim_(n -> oo) P(X_n = i) = pi_i $, as desired.

#pagebreak()

== Example: Generating samples from Geometric($lambda$), $lambda in (0,1)$, using SRW.

Then $pi_i = P("Geometric"(lambda) = i)$
$ = lambda^i (1-lambda) $, $i=0,1,...$

$(X_n)$ SRW: $ q_(j i) = { 1/2 " if " j = i+-1; 0 " o/w" $

$ r_(j i) = min {1, (pi_j q_(j i)) / (pi_i q_(j i))} = min {1, lambda^(j-i)} $

#pagebreak()

[D] §1 .7 — Proof of main theorems

Recall from last week:

*Main MC Theorem*
If $(X_n)$ is aperiodic, irreducible and $|S| < oo$, then there is a s.d. $pi$ ( i.e. $pi = pi P$ & $sum pi_i = 1$) and
1. $ lim_(n->oo) p_(i j)^n = pi_j $; for any $i$.
2. $ lim_(n->oo) (N_n(j)) / n = 1/E_j[T_j] = pi_j $


  We'll prove this theorem this week. Along the way we'll prove some more general results:

*Theorem 1 .19*
Suppose $(X_n)$ is irreducible, aperiodic and has a s.d. $pi=pi P$.
Then $lim_(n->oo) p_(i j)^n = pi_j$ for all  $i,j$.

*Theorem 1.20*
Suppose $(X_n)$ is irreducible and  rec. Then it has a stationary measure $mu >= 0$: $sum_i mu_i p_(j i) = mu_j$; for all $j$.


*Note:* We don't assume $|S| < oo$ above.

However, if $|S| < oo$ then the stationary measure $mu$ can be normalized to get a s.d.:
$ pi_i = mu_i / (sum_j mu_j) $

Then $pi >= 0$, $sum_i pi_i = 1$, & $pi = pi P$.

$therefore$ Theorems 1.19 & 1. 20 $=>$ Part (1.) in the main theorem.

#pagebreak()

However, if $|S| = oo$, we may not be able to normalize.

E.g. $(X_n)$ symmetric SRW on $Z$.
$ mu_i "identical" 1 $. $sum_j mu_j = oo$

$therefore$ $pi$ would have to be $pi=0$ which is *not* a prob. dist. (does not add to 1.)

#pagebreak()

To prove theorem 1.19, we need:

*Lemma*
If $(X_n)$ has a s.d. $pi$ (i.e. $pi=pi P$ & $sum_i pi_i = 1$) then all states with $pi_j > 0$ are rec.

*Proof.* From previous lectures,
$ E_i N_j = sum_(n=1)^oo p_(i j)^n $

$ therefore sum_i pi_i E_i N_j = sum_i pi_i sum_(n=1)^oo p_(i j)^n $

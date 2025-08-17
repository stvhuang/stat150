== Lecture 31

[D] §4.4 --- Exit distributions & exit times

We can extend the results of §1.9--1.10 to the continuous setting.

The key is to consider the discrete skeleton MC with transition probs. $ r_(i j) = q_(i j) / lambda_i $.

#pagebreak()

Notation

$
  V_a = "Time of 1st visit to a"
$
$
  = min { t >= 0 : X_t = a }
$

$
  T_a = "Time of 1st return to a"
$
$
  = min { t >= 0 : X_t = a " & " X_s != a " for some " s < t }
$

#pagebreak()

Exit distributions:

$
  h(i) = P_i( V_A < V_B )
$
$
  = P("Hit A before B" | X_0 = i)
$

Note $V_A < V_B$ in $X_t <=> V_A < V_B$ in discrete skeleton. So by FSA

$
  h(i) = sum_(j != i) h(j) r_(i j) quad i "notin" A union B.
$

#pagebreak()

$
  h(i) = sum_(j != i) h(j) r_(i j) quad i "notin" A union B.
$

Multiplying both sides by $lambda_i$, we find

$
  sum_j Q_(i j) h(j) = 0. quad i "notin" A union B
$

where $Q_(i j) = cases(-lambda_i, & i=j, q_(i j), & i!=j)$

#pagebreak()

Eg Branching process
$
  q_(i, i+1) = lambda i
$
$
  q_(i, i-1) = mu i
$

State space = $ { 0, 1, 2, dots } $
0 is absorbing. Suppose $X_0 = 1$.

If $mu >= lambda$ extinction (i.e. hit 0) occurs w.p. 1.

For $lambda < mu$, $rho = P("extinction") = ?$

#pagebreak()

$
  rho = overbrace(mu / (lambda + mu))^(
  "Initial particle" \
  "dies before giving" \
  "branching" -> 0
  ) + overbrace(lambda / (lambda + mu) rho^2)^(
  "Initial particle" \
  "branches" -> "These 2 family" \ "trees evolve" \ "independently." \ "Both eventually" \ "die out w.p. " rho "."
  )
$

Solving: $ rho = mu/lambda $.

#pagebreak()

Exit times:

$
  g(i) = E_i V_A
$
$
  = E( "time of 1st visit to A" | X_0=i )
$

If $i in A$, then $g(i) = 0$, since in A at time 0. Otherwise, mean time held in $i$ is $1/lambda_i$ before 1st jump. So by FSA
// $ downarrow $

#pagebreak()

$
  g(i) = 1/lambda_i + sum_(j!=i) r_(i j) g(j).quad i "notin" A
$

Again, multiplying by $lambda_i$, we find

$
  sum_j Q_(i j) g(j) = -1 quad i "notin" A
$

#pagebreak()

[D] §4.5 - Markovian queues.

Eg M/M/1 Queue.
$ -> $ Customer inter-arrivals IID $"Exp"(lambda)$
$ -> $ Service times IID $"Exp"(mu)$
$ -> $ Only 1 server.

$
  q_(i, i+1) = lambda
$
$
  q_(i, i-1) = mu
$
// annotation
Simple B&D MC.

#pagebreak()

By detailed balance:
$
  pi_n = (lambda/mu)^n pi_0
$

$
  sum_(n=1)^oo (lambda/mu)^n = 1 / (1 - lambda/mu)
$ // Geometric.

$
  ==> pi_n = (1 - lambda/mu)(lambda/mu)^n, quad n >= 0
$

(Recall in §3, we found $pi_0 = 1 - lambda/mu$.)

// $ therefore L = stack(
//   "LR AVE. \#",
//   "CUSTOMERS IN",
//   "SYSTEM"
// ) = lambda / (mu - lambda). $

#pagebreak()

By Little's formula ($L = lambda W$),

// $ W = stack(
//   "LR AVE AMOUNT OF",
//   "TIME A CUSTOMER",
//   "SPENDS IN SYSTEM"
// ) $
// $ = L/lambda = 1/(mu - lambda). $

#pagebreak()

Eg M/M/1 queue with a waiting room

Same as above, but system has capacity N. If N people in system (1 being served, N-1 in queue) then if a new customer arrives they cannot enter system, so they leave never to return.

#pagebreak()

Theorem. Suppose $(X_t)$ satisfies DB with SD $pi$. Let $(X_t^A)$ be the same MC, but not allowed to leave A. I.e.
$
  q_(i j)^A = cases(
    q_(i j), & i, j in A,
    0, & "o/w."
  )
$

Then $ pi_i^A = pi_i / (sum_(j in A) pi_j) $

#pagebreak()

It turns out, for this MC

$
  pi_n = ((1 - lambda/mu)(lambda/mu)^n) / (1 - (lambda/mu)^(N+1)) .
$

This follows by previous example + the following useful observation:

#pagebreak()

Proof.

$
  (X_t) "DB" ==> pi_i q_(i j) = pi_j q_(j i)
$

$ therefore $ Same holds for $pi^A$:

If $i$ or $j "notin" A$ then $0 = 0$.

o/w $ pi_i^A q_(i j) = pi_j^A q_(i j) $. $ square $

#pagebreak()

Theorem. Suppose $(X_t)$ satisfies DB with SD $pi$. Let $(X_t^A)$ be the same MC, but not allowed to leave A. I.e.
$
  q_(i j)^A = cases(
    q_(i j), & i, j in A,
    0, & "o/w."
  )
$

Then $ pi_i^A = pi_i / (sum_(j in A) pi_j) $

#pagebreak()

Proof.

$
  (X_t) "DB" ==> underline(pi_i q_(i j) = pi_j q_(j i))
$

$ therefore $ Same holds for $pi^A$:

If $i$ or $j "notin" A$ then $0 = 0$.

o/w $ pi_i^A q_(i j) = pi_j^A q_(i j) $. $ square $

#pagebreak()

Eg Barber cuts hair rate 3
Customers arrive rate 2.
Only 2 waiting chairs.
$N=3$ in previous example, so

$
  pi = 1/65 (27, 18, 12, 8).
$

$
  L = "LR ave. \# people" = (1 * 18 + 2 * 12 + 3 * 8) / 65
$
$
  "in system"
$
$
  = 66/65 .
$

#pagebreak()

It turns out, for this MC

$
  pi_n = ((1-lambda/mu)(lambda/mu)^n) / (1 - (lambda/mu)^(N+1)) .
$

This follows by previous example + the following useful observation:

#pagebreak()

Eg Barber cuts hair rate $3=mu$
Customers arrive rate $2=lambda$
Only 2 waiting chairs.
$N=3$ in previous example, so

$
  pi = 1/65 (27, 18, 12, 8).
$

$
  L = "LR ave. \# people" = (1 dot 18 + 2 dot 12 + 3 dot 8)/65
$
$
  "in system"
$
$
  = 66/65 .
$

#pagebreak()

Little's formula : $ L = lambda_a W $

where $lambda_a$= LR ave. rate customer join system.

Here $lambda_a = 2(1 - pi_3) = 114/65$

$
  therefore W = "LR ave time customers"
$
$
  "spend at barber shop"
$
$
  = L/lambda_a = 66/114 approx .58 " hours."
$

#pagebreak()

Eg M/M/s multiple servers.

For instance: Bank with s tellers.

$
  q_(i, i+1) = lambda
$
$
  q_(i, i-1) = mu min{i, s}.
$

If $lambda < s mu$ there is a SD $pi$. Use DB, but a little messy, see p181.

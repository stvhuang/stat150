= Poisson Processes

== Lecture 18 (PP)

New chapter, §2 in [D]

#pagebreak()

- In Stat 134 (or equivalent course) you have already seen Poisson Processes.
- In Stat 150, we'll study this fundamental process more rigorously.

#pagebreak()

- The (1-dimensional) Poisson Process is a point process on the line $[0, oo)$ with IID exponential "inter-arrival times" between points.

#figure[
  #image(
    "./figs/p18_16m.png",
    width: 100%,
  )
]

#pagebreak()

The Poisson Process is important because:

- Many real-world situations can be modeled using them:
  - Cars arriving at a toll booth
  - Galaxies in some region of the universe (3-D#footnote[$R^3$] Poisson Process)

#pagebreak()

- But also, many calculations work out nicely for the Poisson Process because exponential RVs have the "lack of memory" property.

- The exponential RV is, in fact, the *only* continuous RV with this property.

#pagebreak()

- In §3, we'll study "Renewal Processes" --- which have IID inter-arrival times, which need not be exponential.

- These processes are more complicated, so it is crucial we understand the Poisson Process well first.

#pagebreak()

§2.1 --- Exponential RVs

- This section is Stat 134 review.
  *Please* read on your own to refresh your memory.

- We'll just quickly summarize here:

#pagebreak()

Recall: "Survival function" of a RV $X$ is
$
  P(X > x) = 1 - F(x)#footnote[CDF]
$
*Def* $X ~ "Exp"(lambda)$, Exponential RV with *rate* $lambda$ if
$
  P(X > x) = e^(-lambda x) , quad x >= 0.
$

#pagebreak()

To get PDF,
$
  f(x) & = F'(x) = d/(d x) (1 - e^(-lambda x)) \
       & = lambda e^(-lambda x).
$
Can show:
$
    "E" X & = 1/lambda \
  "Var" X & = 1/lambda^2
$

#pagebreak()

Other useful properties:

1. Lack of Memory (LoM):
$
  P(X > t+s | X > t) = P(X > s)
$
$
  ["Proof: LHS" = (e^(-lambda (t+s)))/(e^(-lambda t)) = e^(-lambda s) = "RHS"]
$

$therefore$ Conditional on $X > t$, RV starts afresh at time $t$, as though it were a brand new $"Exp"(lambda)$.

// >>

#pagebreak()

2. Sum of $n$ IID $"Exp"(lambda)$ RVs is called a $"Gamma"(n, lambda)$.
$
  T_n = sum_(i=1)^n T_i, quad T_i quad "IID" "Exp"(lambda).
$
$
  f#footnote[PDF] _(T_n)(t) = lambda e^(-lambda t) ((lambda t)^(n-1))/((n-1)!) , quad t >= 0
$

- Proof: Induction (see [D]).
- Note: If $n=1$, $f(t) = lambda e^(-lambda t)$, so $"Gamma"(1, lambda) = "Exp"(lambda)$.

#pagebreak()

3. Minimum of independent exponential RVs is exponential. Its rate is the sum of rates:

Theorem. $X_i ~ "Exp"(lambda_i)$, and all $X_i$ independent. Then

i) $M = min{X_1, dots, X_n} =^d "Exp"(sum_(i=1)^n lambda_i)$

Moreover, let $I =$ index of smallest $X_i$, $M = X_I$. Then,

#pagebreak()

ii) $P(I=i) = (lambda_i) / (sum_(j=1)^n lambda_j)$ \
iii) $I, M#footnote[$= X_I$]$ are independent.

Part (iii) is perhaps the most surprising.

#pagebreak()

Proof:

i)

$
  P(M > t) & = P("all" X_i > t) \
           & = product_(i=1)^n P(X_i > t) "(indep.)" \
           & = product_(i=1)^n e^(-lambda_i t) \
           & = e^(-t sum_(i=1)^n lambda_i)
$

#pagebreak()

ii) Can be proved easily by induction --- see [D].

iii)

$
  f_(I, M)(i, t) &= lambda_i e^(-lambda_i t) product_(j != i)#footnote[All other RVs must be bigger than $t$, i.e., survival function.] e^(-lambda_j t) \
  &= (lambda_i)/(sum_j lambda_j) dot underbrace((sum_j lambda_j) e^(-(sum_j lambda_j)t), "PDF of a rate" sum lambda_i "Exp. RV.") \
  &= P(I=i)#footnote[By part ii).] f_M (t)
$

#pagebreak()

§2.2 --- Defining the Poisson Process

Recall: $X tilde "Poisson"(mu)$ if

$
  P(X=k) = e^(-mu) (mu^k)/(k!) , quad k=0, 1, 2, dots
$

Can show:

$
      E X & = mu \
  "Var" X & = mu
$

See [D].

#pagebreak()

Also easy to show:

*Theorem.*
If $X_i tilde "Poisson"(lambda_i)$ and all $X_i$ indep. Then

$
  sum_(i=1)^n X_i tilde "Poisson"(sum_(i=1)^n lambda_i).
$

*Proof:* Stat 134. See [D], by induction. $quad square$

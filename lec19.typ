== Lecture 19

The Poisson Process

*Def*
$(N_t : 0 <= t < oo)$ is a rate $lambda$ Poisson Process — $"PP"(lambda)$ — if

1. $N_0 = 0$
2. $N_(t+s) - N_s =^d "Poisson"(t lambda)$, *for any* $t,s >= 0$
3. Indep. increments:
$
  N_(t_1) - N_(t_0), N_(t_2) - N_(t_1), dots, N_(t_n) - N_(t_(n-1))
$
indep. for *any* $t_0 < t_1 < dots < t_n$.

#pagebreak()

#text(size: 10pt)[
  $
    N_(t_1) - N_(t_0) & = "# points in" (t_0, t_1] \
    & =^d "Poisson"(lambda (t_1 - t_0)#footnote[length of $[t_0, t_1]$])
  $

  $
    "*Indep.* of" N_(t_2) - N_(t_1) & = "# points in" (t_1, t_2] \
    & =^d "Poisson"(lambda (t_2 - t_1)#footnote[length of $[t_1, t_2]$])
  $

  #figure[
    #image(
      "./figs/p19_06m.png",
      width: 50%,
    )
  ]

  $N_0 = 0$ because no points yet at time 0.
]

#pagebreak()

In particular,
$
  N_t#footnote[$=N_t - N_0$] & = "# points in" (0, t] \
                             & = "# points by time" t \
                             & =^d "Poisson"(lambda t).
$

This is why it is called a Poisson Process.

#pagebreak()

Constructing a rate $lambda$ Poisson Process:

$
  tau_1, tau_2, dots " iid Exp"(lambda).
$

Let

$
  T_n = sum_(i=1)^n tau_i =^d "Gamma"(n, lambda).
$

If we think of $tau_i =$ lifetime of $i$th lightbulb, then $T_n$ is the time at which we have gone through $n$ lightbulbs in total.

#figure[
  #image(
    "./figs/p19_12m.png",
    width: 32%,
  )
]

#pagebreak()

$
  "Let" N_t & = max {n: T_n <= t} \
            & = "# of * to left of" t
$

#figure[
  #image(
    "./figs/p19_15m.png",
    width: 40%,
  )#footnote[Poisson is discrete in values but continuous in time.]
]

#pagebreak()

We will show that $(N_t)_(t>=0)$ is a $"PP"(lambda)$.

Clearly $N_0 = max{n>=0: T_n <= 0} = 0$.

So we need to check (2.) & (3.) in definition above.

First step:

*Lemma.*

$
  N_t ~ "Poisson"(lambda t)
$

#pagebreak()

*Proof.* ${ N_t = n } = { T_n <= t < T_(n+1) }.$

I.e., to have exactly $n$ points by time $t$, we need $n$th point to arrive by time $t$ & $(n+1)^"th"$ point to arrive at some later time $>t$.

$
  therefore P(N_t = n)#footnote[$T_n$, $T_(n-1)$ indep, why?] = integral_0^t f_(T_n)(s) P(T_(n+1) > t-s) d s
$

#figure[
  #image(
    "./figs/p19_21m.png",
    width: 54%,
  )
]

#pagebreak()

$
  & T_n ~ "Gamma"(n, lambda). quad f_(T_n)(s) = lambda e^(-lambda s) ((lambda s)^(n-1)) / ((n-1)!) \
  & T_(n+1) ~ "Exp"(lambda) quad P(T_(n+1) > t-s) = e^(-lambda(t-s))
$

$
  therefore P(W_t = n) & = integral_0^t lambda e^(-lambda s) ((lambda s)^(n-1))/((n-1)!) e^(-lambda(t-s)) d s \
  & = e^(-lambda t) lambda^n/((n-1)!) integral_0^t s^(n-1) d s = e^(-lambda t) ((lambda t)^n)/(n!) \
  & = P("Poisson"(lambda t) = n).
$

#pagebreak()

We now check parts (2.) & (3.) in definition of $"PP"(lambda)$.

The key is LoM & Lemma.

Proof of (2): $N_(t+s) - N_s ~ "Poisson"(lambda t).$

#figure[
  #image(
    "./figs/p19_30m.png",
    width: 60%,
  )
]

By LoM the lightbulbs burning at time $s$
starts afresh.

#pagebreak()

So if we ignore $*$ to left of $s$, & start counting $*$ starting at time $s$, we have another iid sequence of $"Exp"(lambda)$ inter-arrival times.

So by Lemma, the \# of $*$ between $s$ & $s+t$ is $"Poisson"(lambda t)$.
Note the \# of such $*$
is $N_(s+t)#footnote[\# of $*$ to left of $t+s$] - N_s#footnote[\# of $*$ to left of $s$]$.

#pagebreak()

Moreover, observe that

$
  (N_(t+s) - N_s)_(t>=0) quad \& quad (N_r)_(r<=s)
$

are independent.

This is because the length of time until a \* after $s$ is indep. of whatever happened before time $s$ (again by LoM).

#pagebreak()

Finally, we check (3.)

Proof of indep. increments:
This follows by induction.
The previous slide shows
$(N_(t+t_(n-1)) - N_(t_(n-1)))_(t>=0) & (N_r)_(r<=t_(n-1))$
indep.

$therefore$ In particular, $ N_(t_n) - N_(t_(n-1)), N_(t_(n-1)) - N_(t_(n-2)), dots, N_(t_1) - N_(t_0) $
are indep.

#pagebreak()

We'll skip §2.2.2
on "more realistic models" for now.

The non-homogeneous Poisson Process on p.105 is interesting.
We may put something on HW \#3 about this --- take a look yourself.

#pagebreak()

§2.3 -- Compound Poisson Processes.

It is often useful to add one more layer of randomness.

*Eg* $(N_t)_(t>=0)$ is a $"PP"(lambda)$ modelling occurrences of earthquakes over time on Hayward fault.

Moreover, suppose each earthquake

#pagebreak()

Has an iid magnitude $Y_i$ which is also indep. of $(N_t)$.

Then

$
  S_t = sum_(i=1)^(N_t) Y_i#footnote[Compound Poisson Process.]
$

is the total magnitude felt along fault by time $t$.

#pagebreak()

Note: For a regular $"PP"(lambda)$, all $Y_i = 1$.

\* More examples of compound Poisson Processes in §2.2.

#pagebreak()

*Theorem.* $(N_t)$ a $"PP"(lambda)$.
$(Y_i)$ an iid sequence indep. of $(N_t)$.
Let

$
  S_t = sum_(i=1)^(N_t) Y_i
$

denote the compound Poisson Process.

Then

$
      E S_t & = lambda t E Y \
  "Var" S_t & = lambda t E(Y^2).
$

#pagebreak()

In a similar way, we can calculate 2nd moment:

$
  E(S_t^2) &= sum_(n=0)^oo P(N_t = n) E(S_t^2 | N_t = n) \
  &= sum_(n=0)^oo P(N_t = n) [n "Var"Y + (n E Y)^2#footnote[$"Var"X = E(X^2) - (E X)^2$]] \
  &= "Var"Y E(N_t) + (E Y)^2 E(N_t^2) \
  &= lambda t ( "Var"Y + (E Y)^2 ) \
  &= lambda t E(Y^2) quad square
$

#pagebreak()

#text(size: 10pt)[
  Proof

  $
    E(S_t) &= sum_(n=0)^oo P(N_t = n) E(S_t | N_t = n) \
    &= sum_(n=0)^oo P(N_t = n) n E Y#footnote[$S_t | (N_t=n) = sum_(i=1)^n Y_i$] \
    &= E Y sum_(n=0)^oo n P(N_t = n) \
    &= E Y dot E(N_t) \
    &= lambda t E Y#footnote[$N_t ~ "Poisson"(lambda t)$]
  $
]

#pagebreak()

*Eg* Customers arrive at a store according to a rate $lambda = 81$ Poisson Process.

Suppose each customer spends an IID amount of money with mean \$8 and SD \$6. Find the mean revenue after 1 day, i.e. at time $t=1$. Also find its SD.

#pagebreak()

$
  R = sum_(i=1)^(N_1) Y_i, quad E Y = 8, quad "Var" Y = 36, quad N_1 ~ "Poisson"(81)
$

By theorem, $E R = 81 dot 8 = \$648$

$
  \& "Var" R & = 81 E(Y^2) \
             & = 81 ("Var" Y + (E Y)^2) \
             & = 81 (36 + 64) = 8,100
$

therefore $"SD"(R) = sqrt(8100) = \$90$

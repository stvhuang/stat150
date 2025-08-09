== Lecture 19

$
  N_(t_1) - N_(t_0) = "# points in" (t_0, t_1]
$

$
  (d)(=) "Poisson"(lambda (t_1 - t_0))
$
"length of" $ [t_0, t_1] $

*Indep.* of $ N_(t_2) - N_(t_1) = "# points in" (t_1, t_2] $
$
  (d)(=) "Poisson"(lambda (t_2 - t_1))
$
"length of" $ [t_1, t_2] $

// Timeline
$
  underbrace(t_0 " * " t_1)_("N_(t_1) - N_(t_0) = 2") " * " t_2 underbrace(" * " t_3)_("N_(t_2) - N_(t_1) = 1")
$

$
  N_0 = 0
$
because no points yet at time 0.

#pagebreak()

In particular,
$
  N_t = "# points in" (0, t]
$
$
  = "# points by time" t
$
$
  (d)(=) "Poisson"(lambda t).
$

This is why it is called a Poisson process.

#pagebreak()

Constructing a rate $lambda$

Poisson process:

$
  T_1, T_2, ... " iid Exp"(lambda).
$
Let $ T_n = sum_(i=1)^n T_i (d)(=) "Gamma"(n, lambda). $

If we think of $T_i$
\= lifetime of $i$th lightbulb, then $T_n$
is the time at which we have gone through $n$
lightbulbs in total.

// Timeline
// $
//   0 mark(.. T_1 ..) " * " mark(.. T_2 ..) " * " mark(.. T_3 ..)
// $

#pagebreak()

Let $ N_t = max {n: T_n <= t} $
$
  = "# of * to left of" t
$

// Timeline example
$
  T_1 " * " T_2 " * " t " * " T_3
$
$
  N_t = 2
$
since $ T_2 < t < T_3 $

#pagebreak()

Let $ N_t = max {n: T_n <= t} $
$
  = "# of * to left of" t
$

// Timeline example
$
  T_1 " * " T_2 " * " t " * " T_3
$
$
  N_t = 2
$
since $ T_2 < t < T_3 $

This corresponds to a step function graph that is 0 until $T_1$, 1 from $T_1$
to $T_2$, 2 from $T_2$
to $T_3$, and so on. It jumps by 1 at each $T_i$.
We will show that $ (N_t)_(t>=0) $
is a $PP(lambda)$.
Clearly $ N_0 = max{n>=0: T_n <= 0} = 0 $
So we need to check (2.) & (3.) in definition above.

First step:
*Lemma.* $ N_t ~ "Poisson"(lambda t) $

#pagebreak()

*Proof.* $ { N_t = n } = { T_n <= t < T_(n+1) }. $

I.e., to have exactly $n$
points by time $t$, we need $n$th point to arrive by time $t$
& $(n+1)$th point to arrive at some later time $>t$.
$
  T_n, T_(n+1)
$
indep. Why?

$
  therefore P(N_t = n) = integral_0^t f_(T_n)(s) P(T_(n+1) > t-s) diff s
$

// Timeline
$
  0 " * " ... " * " s " --- " t " --- " (n+1) "th * somewhere to right of t"
$

#pagebreak()

$
  T_n ~ "Gamma"(n, lambda).
$
$
  f_(T_n)(s) = lambda e^(-lambda s) ((lambda s)^(n-1)) / ((n-1)!)
$

$
  T_(n+1) ~ "Exp"(lambda)
$
$
  P(T_(n+1) > t-s) = e^(-lambda(t-s))
$

$
  therefore P(W_t = n) = integral_0^t lambda e^(-lambda s) ((lambda s)^(n-1))/((n-1)!) e^(-lambda(t-s)) diff s
$
$
  = e^(-lambda t) lambda^n/((n-1)!) integral_0^t s^(n-1) diff s = e^(-lambda t) ((lambda t)^n)/(n!)
$

#pagebreak()

We now check parts (2.) & (3.) in definition of $PP(lambda)$.

The key is LoM & Lemma.

*Proof of (2):* $ N_(t+s) - N_s ~ "Poisson"(lambda t). $

// Timeline
$
  0 " * * " s
$

By LoM the lightbulbs burning at time $s$
starts afresh.

#pagebreak()

So if we ignore $ * $
to left of $s$, & start counting $ * $
starting at time $s$, we have another iid sequence of $ "Exp"(lambda) $
inter-arrival times.

So by Lemma, the \# of $ * $
between $s$
& $s+t$
is $ "Poisson"(lambda t) $. Note the \# of such $ * $
is $ N_(s+t) - N_s $

$
  N_(s+t) - N_s
$
// Annotations below the formula
// #h(2em) $
// uparrow $
// #h(4em) $
// uparrow $
// #h(1em) # of $
// * $
// to left of $s+t$. #h(1em) # of $
// * $
to left of $s$.

Moreover, observe that $ (N_(t+s) - N_s)_(t>=0) & (N_r)_(r<=s) $
are independent.

This is because the length of time until a \* after $s$
is indep. of whatever happened before time $s$
(again by LoM).

#pagebreak()

Finally, we check (3.)

*Proof of indep. increments:*
This follows by induction.
The previous slide shows $ (N_(t+t_(n-1)) - N_(t_(n-1)))_(t>=0) & (N_r)_(r<=t_(n-1)) $
indep.

$
  therefore
$
In particular, $ N_(t_n) - N_(t_(n-1)) & N_(t_(n-1)) - N_(t_(n-2)), ..., N_(t_1) - N_(t_0) $
are indep.

#pagebreak()

We'll skip $ inter. 2.2.2 $
on "more realistic models" for now.

The non-homogeneous Poisson process on p.105 is interesting. We may put something on HW #3 about this --- take a look yourself.

#pagebreak()

$
  inter. 2.3
$
-- Compound Poisson Processes.

It is often useful to add one more layer of randomness.

*Eg* $ (N_t)_(t>=0) $
is a $PP(lambda)$
modelling occurrences of earthquakes over time on Hayward fault.

Moreover, suppose each earthquake

#pagebreak()

has an iid magnitude $ Y_i $
which is also indep. of $ (N_t) $.

Then
$
  S_t = sum_(i=1)^(N_t) Y_i
$
"Compound Poisson Process."

is the total magnitude felt along fault by time $t$.

#pagebreak()

Note: For a regular $PP(lambda)$, all $Y_i = 1$.

\* More examples of compound Poisson processes in $inter. 2$.

#pagebreak()

*Theorem.* $ (N_t) $
a $PP(lambda)$. $ (Y_i) $
an iid sequence indep. of $(N_t)$. Let
$
  S_t = sum_(i=1)^(N_t) Y_i
$
denote the compound Poisson process.

Then
$
  E S_t = lambda t E Y
$
$
  "Var" S_t = lambda t E(Y^2).
$

#pagebreak()

*Eg* Customers arrive at a store according to a rate $lambda=81$
Poisson process.

Suppose each customer spends an iid amount of money with mean `$8` & SD `$6`. Find the mean revenue after 1 day, i.e. at time $t=1$. Also find its SD.

#pagebreak()

$
  R = sum_(i=1)^(N_1) Y_i, quad E Y = 8, quad "Var" Y = 36, quad N_1 ~ "Poisson"(81)
$

By theorem, $ E R = 81 dot 8 = $648 $$
& Var R = 81 E(Y^2) $$
\= 81 (Var Y + (E Y)^2) $$
\= 81 (36 + 64) = 8100. $$
therefore SD(R) = sqrt(8100) = $90$

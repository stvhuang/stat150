== Lecture 35

Final chapter on MGs

[D] § 5.4 --- Applications of MGs

We apply previous results about MGs to get quicker solutions to questions about
- Exit distributions
- Exit times
- Extinction probabilities.

#pagebreak()

eg Gambler's ruin, $p=1/2$.

$ S_n = S_0 + sum_(i=1)^n X_i $ is a MG.
$
  T = min { n >= 0 : S_n = a " or " b }.
$
$ a <= S_(n and T) <= b $ is bounded.
Saw REC so $P_x(T < oo) = 1$. $therefore$ By OST,

$
  x = E_x S_T = a P_x(S_T = a) + b P_x(S_T = b) ==>
$

#pagebreak()

$
  x = a P_x(S_T=a) + b(1-P_x(S_T=a))
$
$ ==> P_x(S_T=a) = (b-x)/(b-a) $.

When $a=0$, $b=N$,
$ P_x("Jackpot") = x/N $.

So much easier than by recurrence relations!

#pagebreak()

eg Asymmetric case, $p != 1/2$.
$
  P(X_i = +-1) = cases(p, q=1-p)
$
$ M_n = (q/p)^(S_n) $ is a MG.
$ M_(n and T) $ is bounded, and since SRW transient $P_x(T < oo) = 1$.
$ => $ by OST,
$
  (q/p)^x = (q/p)^a P_x(S_T=a) + (q/p)^b P_x(S_T=b)
$

#pagebreak()

$
  ==> underline(P_x(S_T=a)) = ((q/p)^b - (q/p)^x) / ((q/p)^b - (q/p)^a)
$

For $a=0$, $b=N$,
$ P_x("Jackpot") = (1 - (q/p)^x) / (1 - (q/p)^N) $.

Recall!

#pagebreak()

eg B&D MC. Birth & Death
// Diagram of a birth-death process
// States: 0, 1, ..., i-1, i, i+1, ...
// From i: to i+1 with prob p_i, to i-1 with prob q_i, stay with prob 1-p_i-q_i

In order to find a MG, recall:
$ (X_n) $ MC with $p_(i j)$'s. If
$
  f(x) = sum_y p_(x y) f(y) = E_x f(X_1)
$
then $f(X_n)$ is a MG.

#pagebreak()

We need to find $f$ so that
$
  f(i) = q_i f(i-1) + p_i f(i+1) + (1-q_i-p_i)f(i)
$
$
  ==> (q_i + p_i)f(i) = q_i f(i-1) + p_i f(i+1)
$
$
  ==> f(i+1) - f(i) = q_i/p_i (f(i) - f(i-1))
$
$
  ==> f(i) = sum_(j=1)^i product_(k=1)^(j-1) q_k/p_k
$

#pagebreak()

$ f(X_n) $ is a MG.

Then, using OST,
$
  P_x(V_a < V_b) = (f(x) - f(a)) / (f(b) - f(a)).
$

#pagebreak()

Similarly, MGs useful for calculating mean exit times.

eg Gambler's ruin, $p=1/2$.
$ T = $ time game over.

By translation, we can assume
// Diagram: Ruin at a, Jackpot at b
$
  a < 0
$
$
  b > 0
$

We'll show $E_0 T = -a b$.

#pagebreak()

This implies if $a < b in Z$
// Diagram: line from a to b with x in between.
// segment a-x is labeled x-a
// segment x-b is labeled b-x
then $E_x T = (x-a)(b-x)$.

$ M_n = S_n^2 - n $ is a MG.
However, $ M_(n and T) = S_(n and T)^2 - (n and T) $ is not bounded. So can not

#pagebreak()

apply OST. But, we always have $E M_(n and T) = E M_0 = 0$. We'll use this (just have to work a bit harder).
// Diagram: line from a to b with 0 in between

$
  0 = E_0(S_(T and n)^2 - (T and n))
$
$
  = a^2 P_0(S_T=a, T<=n) + b^2 P_0(S_T=b, T<=n) + E_0(S_n^2 1_(T>n)) - E_0(T and n)
$

#pagebreak()

$ S_n^2 $ is bounded & $P(T < oo) = 1$, so $E_0(S_n^2 1_(T>n)) -> 0$ as $n->oo$.
Also $E_0(T and n) -> E_0(T)$ as $n->oo$.
$therefore$ Taking $n->oo$,
$
  E_0 T = a^2 underbrace(P_0(S_T=a))_(= b/(b-a)) + b^2 underbrace(P_0(S_T=b))_(= -a/(b-a))
$
$
  = (a^2 b - b^2 a)/(b-a) = -a b
$

#pagebreak()

#underline("Wald's Equation")

$
  S_n = S_0 + sum_1^n X_i
$
$ S_0 in R $, not random.
$ T $ a ST, $ E T < oo $.

Then,
$
  E(S_T - S_0) = mu E T
$

Note: This doesn't just follow by LOE, because $T$ & $(X_i)$ *not* indep.

#pagebreak()

Informal proof:
$ M_n = S_n - n mu $ is a MG
OST: $ E M_T = E M_0 $
$
  ==> S_0 = E S_T - mu E T
$
$
  ==> E(S_T - S_0) = mu E T
$

*However* $M_n$ not bounded, so OST does not apply.

#pagebreak()

But this can be made rigorous by using
$ E M_(T and n) = E M_0 $ _Always holds_
instead, as we did in previous example.

See p 215 for details.

#pagebreak()

Applying this to Gambler's Ruin, $p != 1/2$.

Suppose $p<1/2$. $V_0 =$ Time of 1st visit to 0.
Recall $M_n = S_n - overbrace((p-q), mu) n$ is a MG.
$
  therefore x = E_x(S_(V_0 and n) - (p-q)(n and V_0))
$
$
  >= (q-p) E_x(n and V_0)
$

#pagebreak()

Taking $n -> oo$,
$ E_x V_0 <= x/(q-p) < oo $.

$ therefore $ By Wald's Equation
$
  ( -> E(S_T - S_0) = mu E T)
$

$
  E_x(S_(V_0) - x) = (p-q)E_x V_0
$
$ ==> E_x V_0 = x/(q-p) $.

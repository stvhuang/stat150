== Lecture 13

Next, we aim to prove part (2) of the main MC theorem. This follows by:

*Theorem 1.21* If $(X_n)$ is Irr and Rec, then

$
  lim_(n -> oo) (N_n (j)) / n = 1 / (E_j T_j)
$

And

#pagebreak()

*Theorem 1.22* If $(X_n)$ is Irr and has a SD $pi$ (i.e., $pi = pi underline(P)$ and $sum_i pi_i = 1$), then

$
  pi_j = 1 / (E_j T_j)
$

Therefore, if $(X_n)$ is Irr, Aper, and $|S| < oo$, we know $(X_n)$ is Rec and so a SD $pi$ exists. So,
$
  lim_(n -> oo) (N_n (j)) / n =^(1.21) 1 / (E_j T_j) =^(1.22) pi_j
$

#pagebreak()

- Also note that Theorem 1.22 implies that if $(X_n)$ is Irr and has a SD $pi$, then the SD is *unique*. (i.e., if $pi' = pi' underline(P)$, then $pi' = pi$)
- If an Irr MC has an equilibrium, it is unique!

#pagebreak()

Note that Theorem 1.21 does not require aperiodicity.

Eg. $0 <-> 1$
$
  P = mat(
    0, 1;
    1, 0;
  )
$

Irreducible, recurrent and has a stationary distribution, although period = 2. $pi = (1/2, 1/2)$ (doubly stochastic.)

$1/2 = E_1 T_1 =$ long-run proportion of time spent in state 1.

#pagebreak()

First, we note that Thm 1.21 $arrow$ Thm 1.22:

Proof of Thm 1.22

Suppose $(X_n)$ is irreducible and has a stationary distribution $pi$.

By a previous lemma, if there is a stationary distribution $pi$, then all $i$ with $pi_i > 0$ are recurrent. Therefore, since $(X_n)$ is irreducible, all states are recurrent (recurrence is a class property). Hence, by Thm 1.21,
$
  lim_(n -> oo) (N_n (j)) / n = 1 / (E_j T_j)
$

#pagebreak()

This holds no matter what $X_0$ is.

Assuming $X_0 ~ pi$, and taking expectations on both sides,
$
  E_pi [(N_n (j)) / n] -> 1 / (E_j T_j) quad "as" quad n -> oo
$

But since $pi$ is a stationary distribution,

$
  E_pi [N_n (j)] = sum_(m=1)^n overbrace(P_pi (X_m = j), = pi_j) = n pi_j
$

Therefore, $1 / (E_j T_j) = pi_j quad square$

#pagebreak()

Finally,

Proof of Thm 1.21
Suppose $(X_n)$ is irreducible & recurrent. We show

$
  (N_n (j)) / n -> 1 / (E_j T_j)
$

(no matter what $X_0$ is).

First, if $X_0 = j$, then the times $t_1, t_2, dots$ between visits to $j$ are iid.

#pagebreak()

Let

$
  T_k & = min { n >= 1 : N_n (j) = k } \
      & = "time of "k^"th" "return." \
      & = sum_(l=1)^k t_l
$

By LLN,

$
  T_k / k -> E_j T_j quad "as" quad k -> oo
$

since $T_k$ = sum of k iid rvs with mean $E_j T_j$.

#pagebreak()

If $X_0 != j$, it doesn't make a difference in the limit:
$t_1 < oo$ since $(X_n)$ is irreducible & recurrent.
Then $t_2, t_3, dots$ are iid with mean $E_j T_j$.

$therefore$, no matter what $X_0$ is,

$
  lim_(k -> oo) T_k / k = E_j T_j
$

#pagebreak()

To finish the proof, note

$
  T_(N_n (j)) <= n < T_(N_n (j) + 1)
$

- $N_n (j) =$ \# visits by time $n$.
- $T_(N_n (j)) = n$ if $X_n=j$, or else $T_(N_n (j)) < n$.
- At time $n$, have visited $N_n (j)$ times. So $n <$ time of $(N_n (j)+1)^"th"$ visit $= T_(N_n (j)+1)$.

#pagebreak()

#figure[
  #image(
    "./figs/p13_32m.png",
  )
]

#pagebreak()


Hence,

$
  underbrace((T_(N_n (j))) / (N_n (j)), -> E_j T_j) <= n / (N_n (j)) &< (T_(N_n (j)+1)) / (N_n (j)) \
  &= underbrace((T_(N_n (j)+1)) / (N_n (j)+1), -> E_j T_j) underbrace((N_n (j)+1) / (N_n (j)), -> 1)
$

Since $j$ is recurrent, $N_n (j) -> oo$ as $n -> oo$. (Will visit $oo$ many times.)

Therefore, $lim_(n->oo) n / (N_n (j)) = E_j T_j quad square$

#pagebreak()

The following generalization is proved in Durrett:

*Theorem 1.23*
Suppose $(X_n)$ is irreducible, has a stationary distribution $pi$, & $sum_x |f(x)| pi_x < oo$.
Then

$
  1/n sum_(m=1)^n f(X_m) -> sum_x f(x) pi_x
$

Taking $f(x) = bold(1)_(x=j)$, we recover

$
  (N_n (j)) / n -> pi_j quad "as" quad n -> oo.
$

#pagebreak()

See §1.5 for some applications of Theorem 1.23.

Eg Repair chain \
Machine has 3 parts: 1, 2, 3.
Working as long as $>= 2$ parts working.
Otherwise, parts are replaced, then machine working next day.

$
  S = { 0, 1, 2, 3, 12, 13, 23 } \
  cases(
    "0" & quad "None broken",
    "1, 2, 3" & quad "Part i broken",
    "12, 13, 23" & quad "Parts i,j broken",
  )
$

#pagebreak()

#figure[
  #image(
    "./figs/p13_47m.png",
  )
]

#pagebreak()

Q: Operate system for 5 years ($approx 1,800$ days).
About how many parts 1,2,3 will we use?

A: Can show

$
  pi = 1/8910 (underbrace(3000, 0), underbrace(500, 1), underbrace(1200, 2), underbrace(4000, 3), underbrace(22, 12), underbrace(60, 13), underbrace(128, 23))#footnote[by solving $pi = pi underline(P)$]
$

#pagebreak()

Therefore, over 1800 days, will use about

$
  1800 (pi_12 + pi_13) = 1800 * 82/8910 approx 16.5
$

parts of type 1.

- Here we are using Thm 1.23 where

$
  f_x = bb(1)_(x in {12, 13}) = cases(
    1 & quad x in {12, 13},
    0 & quad x in.not {12, 13},
  )
$

#import emoji: face

== Lecture 4

Recall: $(X_n)_(n=0)^(oo)$ is a (time-homogenous) MC if

$
  & P(X_(n+1)=j | X_n=i, X_(n-1)=x_(n-1), dots X_0=x_0) \
  & = P(X_(n+1)=j | X_n=i) \
  & = p_(i j) quad ("i.e., doesn't depend on" n)
$

for *all* $n$ and states $i, j, x_(n-1), dots, x_0$.

- $underline(P) = underbrace(p_(i j), "tr. prob. from" i "to" j) = "transition matrix"$

#pagebreak()

We did a couple examples ((1) SRW & (2) Gambler's ruin). Let's see one more:

(3) Ehrenfest model: \
Physicists (wife & husband): \
Tatiana & Paul Ehrenfest proposed this model to explain the 2nd law of thermodynamics: \
In particular, an isolated system will naturally evolve toward max entropy (least ordered).

#pagebreak()

#figure[
  #image(
    "./figs/p04_06m.png",
    width: 50%,
  )
]

$N$ molecules in a chamber divided by a thin membrane. Sometimes a molecule slips through.

Let $X_n =$ \# molecules on the left side.

#pagebreak()

To get a mathematical model:

- Each step, select a molecule uniformly at random (amongst all $N$) and then move it to the other side.

$
  p(i, i-1) & = P("pick mol. from left") \
            & = i/N \
  p(i, i+1) & = P("pick mol. from right") \
            & = (N-i)/N = 1 - i/N
$

(& all other $p_(i j)=0$)

#pagebreak()

- We are often interested in the long run (LR) behavior of MC's.

- E.g., for the Ehrenfest chain, does $P(X_n=i) ->^(n->oo) ???$

By the 2nd law of thermodynamics, you might expect this *equilibrium distribution* to be:

$
  lim_(n->oo) P(X_n=i) = (overbrace(binom(N, i), "# subsets size" i)) / (underbrace(2^N, "# subsets")), quad 0 <= i <= N#footnote[$sum_(i=0)^N binom(N, i)=2^n$ Binomial Theorem]
$

#pagebreak()

We'll come back to this problem and LR behavior of MC's in depth, starting in [D] §1.4 and [PK] §4.

Homework: \
Take a look at the other examples in [D] §1.1.

#pagebreak()

[D] §1.2: Multi-step transition prob.'s

$
  P = (p_(i j)), quad p_(i j) = P(X_(n+1) = j | X_n = i)
$

E.g., $X_n = cases(
  0 & quad "Rainy",
  1 & quad "Sunny",
)$ on day $n$.

Suppose $underline(P) = mat(
  .4, .6;
  .7, .3;
)$

I.e., given rainy today, the probability of sunny tomorrow is 60%.

#pagebreak()

$
  0 equiv "Rainy", quad 1 equiv "Sunny"
$

$
  underline(P) = mat(
    .4, .6;
    .7, .3;
  )
$

$
  & P("Sunny 2 days from now" | "Rainy today") \
  & = P(X_(n+2) = 1 | X_n = 0) \
  & = P(X_(n+2)=1, X_(n+1)=0 | X_n=0) \
  & quad quad + P(X_(n+2)=1, X_(n+1)=1 | X_n=0)#footnote[LoTP] \
  & = p_(00) p_(01) + p_(01) p_(11) = .4(.6) + .6(.3)
$

#pagebreak()

But what is $p_(00) p_(01) + p_(01) p_(11)$?

$ underline(P) = mat(.4, .6; .7, .3) = mat(p_(00), p_(01); p_(10), p_(11)) $

$
  underline(P)^2 = mat(
    p_(00) p_(00) + p_(01) p_(10), p_(00) p_(01) + p_(01) p_(11);
    p_(10) p_(00) + p_(11) p_(10), p_(10) p_(01) + p_(11) p_(11)
  )
$

$ (underline(P)^2)_(i j) = sum_k p_(i k) p_(k j) $

$ p_(00) p_(01) + p_(01) p_(11) = (underline(P)^2)_(01) $

#pagebreak()

This holds in general: \
To get $m$ step transition prob.'s

$
  p_(i j)^(m) = p^(m)(i,j) = P(X_(n+m)=j | X_n=i)
$

We simply take $P$ to the $m$th power $P^m$.

#pagebreak()

Theorem \
Let $(X_n)$ be a (time-hom.) MC on state space $S$. \
Then, for any $m$ and $i, j in S$,
$
  p_(i j)^(m) & = P(X_(n+m)=j | X_n=i) \
              & = (P^m)_(i j)
$

#pagebreak()

Useful if $P$ can be diagonalized:

$
  underline(P) = U^(-1) D U
$

- $D$ = Diagonal matrix of eigenvalues
- $U$ = Rows are corr. left eigenvectors
- $U^(-1)$ = Columns are corr. right eigenvectors

Then $underline(P)^m = U^(-1) D^m U$

$
  D = mat(
    lambda_1, , , ;
    , dots.down, ;
    , , , lambda_N;
  ), quad
  D^m = mat(
    lambda_1^m, , , ;
    , dots.down, ;
    , , , lambda_N^m;
  )
$

#pagebreak()

// TODO

Eg: 2-State MC

$
  P & = mat(
        1-p, p;
        q, 1-q
      ) \
    & = mat(
        1, p/(p+q);
        1, -q/(p+q)
      ) mat(
        1#footnote[Leading eigenvalue], 0;
        0, 1-p-q
      ) mat(
        q/(p+q), p/(p+q);
        1, -1
      )
$

Note: $|1-p-q| < 1$ unless MC is trivial:

#figure[
  #image(
    "figs/p04_40m.png",
    width: 40%,
  )
]

#pagebreak()

Otherwise, $(1-p-q)^m ->0$ as $m -> oo$.

$
  P^m & = mat(
          1, p/(p+q);
          1, -q/(p+q)
        ) mat(
          1, 0;
          0, (1-p-q)^m
        ) mat(
          q/(p+q), p/(p+q);
          1, -1
        ) \
      & ->^(m->oo) mat(
          1, p/(p+q);
          1, -q/(p+q)
        ) mat(
          1, 0;
          0, 0
        ) mat(
          q/(p+q), p/(p+q);
          1, -1
        ) \
      & = mat(
          q/(p+q), p/(p+q);
          q/(p+q), p/(p+q)
        ) = mat(
          pi;
          pi
        )
$

Where $pi = (pi_0, pi_1)$ is the left eigenvector for the leading eigenvalue $lambda = 1$.

#pagebreak()

This suggests that — regardless of the initial state $X_0$ — the limiting distribution of this 2-state MC is

$
  lim_(n->oo) P(X_n = i) = pi_i
$

- We'll come back to this later (Main MC Theorem)

#pagebreak()

Eg: $0 equiv "Rainy", quad 1 equiv "Sunny"$

$
  P = mat(
    .4, .6;
    .7, .3
  ), quad p = 0.6, q = 0.7
$

$
  pi = (pi_0, pi_1) & = (q/(p+q), p/(p+q)) \
                    & = (.7/1.3, .6/1.3)
$

$
  therefore "About" & "53.8% of days rainy," face.smile \
                    & "46.2% days sunny." face.sad
$

#import "misc.typ": *

= Continuous Time Markov Chains

== Lecture 26

Recall that discrete time MC's ($X_n$) have "Markov Property":

$
  P(X_(n+m) = j | X_n=i, X_(n-1)=i_(n-1), dots, X_0=i_0) \
  = P(X_(n+m)=j | X_n=i)
$

for all $n, m$ & $j, i, i_(n-1), dots, i_0 in S$.

I.e. given present, past & future are independent.
Only need to know present to determine probability of future behavior.

#pagebreak()

In §4, we extend this to processes ($X_t, t >= 0$) evolving continuously in time.
We still assume, however, that the state space (possible values of $X_t$) is discrete.

We extend the MP as follows:

#pagebreak()

*Def* \
($X_t, t >= 0$) is a *continuious* itime MC on $Omega subset Z$ if
$
  P(X_(t+s)=j | X_s=i, X_(s_n)=i_n, dots, X_(s_0)=i_0) \
  = P(X_(t+s)=j | X_s=i)
$
For all $0 <= s_0 < s_1 < dots < s$ & $0 <= t$ & $j, i, i_n, i_(n-1), dots, i_0 in Omega$.

#pagebreak()

In fact, we have already seen some examples of such processes, e.g. the Poisson Process.

#pagebreak()

E.g. ($N_t$) a PP($lambda$) & ($Y_n$) a discrete time MC with TR probs $r_(i j)$.
Let $X_t = Y_(N_t)$. The ($X_t$) is a continuous time MC.

(For instance, if $r_(i,i+1)=1$ & $r_(i j)=0$ o/w, we see ($N_t$) itself is a continuous time process.)

#pagebreak()

*Proof* \
#figure[
  #image(
    "./figs/p26_15m.png",
    width: 100%,
  )
]

If $X_t = i$, then by LOM & MP of ($Y_n$), the next transition will occur after an Exp($lambda$) amount of time to some $j$ w.p. $r_(i j)$, independently of anything at times $s < t$.

#pagebreak()

For discrete time MC everything we wanted to know came from the "1-step transition probabilities" $p_(i j)=P(X_(n+1)=j|X_n=i)$.

In continuous time, there is no first step, *but* we still have $p_t (i,j) = P(X_t=j | X_0=i)$.

#pagebreak()

E.g. in previous example:

$
  p_t (i,j) =^("LoTP") sum_(n=0)^oo underbrace(e^(-lambda t)(lambda t)^n / (n!), P(n "*'s in" (0, t])) underbrace(r_(i j)^n, n"-step pr." \ P(Y_n=j | Y_0=i))
$

#pagebreak()

And we still have the Chapman-Kolmogorov Equations:

$
  sum_k p_s (i,k) p_t (k,j) \
  = p_(s+t)(i,j)
$

*Proof* \
Again by MP + LoTP, at time $s in [0, t+s]$, the MC has to be a some $k$.

#figure[
  #image(
    "./figs/p26_24m.png",
    width: 20%,
  )
]

#pagebreak()

Although there is no 1st step, it is intuitive that in this continuous context we should instead take a limit $t -> 0$ to distill all relevant info about the transition probabilities of a continuous MC.

#pagebreak()

More specifically, the derivative at $t=0$ gives us the "jump rates".

$
  q_(i j) = lim_(t -> 0) (p_t (i,j)) / t quad (i != j)
$

This is the *rate* at which ($X_t$) jumps from $i$ to $j$.

#pagebreak()

E.g. in the previous examples:

$
  & P(>= 1 "*'s in" (0, t]) \
  & = P(=1 "* in" (0, t]) + o(t)#footnote[Some function going $-> 0$ as $t -> 0$] \
  & therefore q_(i j) = lim_(t->0) (p_t (i,j)) / t = lambda r_(i j)#footnote[we will do this in more detail in §4.2]
$

(since $e^(-lambda t) -> 1$ as $t -> 0$)

#pagebreak()

This makes sense:

\*'s appear in PP($lambda$) at rate $lambda$ & $i -> j$ happens w.p. $r_(i j)$. Therefore, in ($X_t$), transitions $i -> j$ occur at rate $lambda r_(i j)$.

E.g. in PP($lambda$) itself, we just have $q_(i,i+1) = lambda$.

#pagebreak()

Other simple (but important) examples:

E.g. M/M/s Queue $s$ servers \
Arrivals are IID $Exp(lambda)$ \
Service times IID $Exp(mu)$

$
  q_(i, i+1) & = lambda \
  q_(i, i-1) & = min{i, s} mu
$

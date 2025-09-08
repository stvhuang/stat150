== Lecture 24

[D] § 3.2: Applications of Renewal Processes to queueing theory

1st example: GI/G/1 queue

GI = General input \
G = General service times \
1 = One server

#pagebreak()

Customers arrive at rate $lambda$ ($"E"tau = 1/lambda$) \
Customers served at rate $mu$ ($"E"s = 1/mu$)

*Theorem.* If $lambda < mu$ then the long run proportion of time the server is busy is $<= lambda/mu < 1$.

#pagebreak()

*Cost Equations (any queue)*

Let $X_s$ = \# customers in system at time $s$ (being served or waiting in queue).

Then LR average \# customers in system is

$
  L = lim_(t -> oo) 1/t integral_0^t X_s d s
$

#pagebreak()

LR average amount of time a customer spends in system:

$
  W = lim_(n -> oo) 1/n sum_(i=1)^n W_m
$

Where $W_m$ = amount of time spent in system by $m$th customer.

#pagebreak()

Finally, LR average rate at which customers arrive:

$
  lambda_a = lim_(t -> oo) (N_a (t)) / t = lambda#footnote[if GI/G/1 Queue]
$

Where $N_a(t)$ = \# customers by time $t$.

*Little's Formula*#footnote[holds for any queue]

$
  L = lambda_a W
$

#pagebreak()

*Proof.* Suppose customers pay \$1/min while in system.

Then in LR, system earns \$L/min.

Seen another way, each customer on average spends \$W.
Therefore, since customers arrive at a rate $lambda_a$, system earns $\$W lambda_a slash min$.

#pagebreak()

*An application:*

Let $W_Q$ = average time spent in queue (waiting to be served).

Note $W_Q = underbrace(W, "ave. time in system") - underbrace(E S, "ave. time being served")$

#pagebreak()

Let $L_Q$ = LR average queue length (not counting customer being served).

If instead, only pay \$1 when in queue, then
$
  L_a = lambda_a W_Q
$

The length of queue is 0 if no customers, and otherwise 1 less than \# customers in system.

#pagebreak()

$
  therefore L_Q & = (L-1)(1-pi_0) + L pi_0 \
                & = L - 1 + pi_0
$

where $pi_0$ = LR prob. of no customers altogether.

Altogether,

#pagebreak()

$
  W_Q & = W - "E"S \
  L_Q & = lambda_a W_Q quad \& quad L = lambda_a W \
  L_Q & = L - 1 + pi_0
$

$
  => pi_0 & = L_Q - (L-1) \
          & = 1 + L_Q - L \
          & = 1 + lambda_a (W_Q - W) \
          & = 1 - lambda_a "E"S
$

#pagebreak()

$therefore$ if GI/G/1 Queue, $pi_0 = 1 - lambda/mu$

$therefore 1 - pi_0 =$ LR prop. busy $= lambda/mu$

This shows result of previous theorem (LR prop. busy $<= lambda/mu$) is sharp.

#pagebreak()

Important special case of a GI/G/1 queue is

M/G/1 where we assume customers arrive according to a $"PP"(lambda)$. ($"M" equiv "Markovian"$).

$X_n$ = \# customers in queue when $n^"th"$ customer starts being served.

#pagebreak()

Thus MC can be constructed as follows:

Prob. exactly $k$ customers arrive during any given service time is:

$
  a_k = integral_0^oo underbrace(e^(-lambda t) ((lambda t)^k) / (k!), #footnote[Prob. k more customers arrive during this service time]) underbrace(d G(t), #footnote[$G$ = CDF of service time, $g$ = PDF, $d G(t) = g(t) d t$])
$

#pagebreak()

Let $xi_1, xi_2, dots$ be IID RVs.
$
  P(xi = k) = a_k
$

$xi_n$ = \# customers arriving during $n^"th"$ service time.

If $X_n = xi_n = 0$#footnote[$X_n = 0$, there is no people in the queue when the $n^"th"$ people starts to be served], then $X_(n+1) = 0$. \
Otherwise:
$X_(n+1) = X_n + xi_n - 1$

#pagebreak()

Therefore,

$
  p = mat(
    a_0+a_1, a_2, a_3, a_4, dots;
    a_0, a_1, a_2, a_3, dots;
    0, a_0, a_1, a_2, dots;
    0, 0, a_0, a_1, dots;
    dots.v, dots.v, dots.v, dots.v, dots.v
  )
$

#pagebreak()

*Theorem.* In M/G/1 Queue,

$X_n$ = \# in queue when $n$th customer starts service

$ lambda < mu: (X_n) $ Pos Rec & $ E_0 T_0 = mu / (mu-lambda) $

$ lambda = mu: (X_n) $ Null Rec

$ lambda > mu: (X_n) $ Trans

#pagebreak()

*Proof.* Consider the customers that arrive during $n$th service time the "children" of this customer. Then we can compare $(X_n)$ with a BP with offspring distribution
$ P(xi = k) = a_k $.

#pagebreak()

$
  E xi = sum_k k a_k
$
$
  = sum_k k integral_0^oo e^(-lambda t) ((lambda t)^k)/(k!) d G(t)
$
$
  = integral_0^oo lambda t d G(t)
$
$
  = lambda E S
$
$
  = lambda/mu
$

#pagebreak()

$ therefore $ Trans, Pos Rec, Null Rec follow by BP theory.

Only remains to show $ E_0 T_0 = mu/(mu-lambda) $ in Pos Rec case.

Note BP transitions in discrete

#pagebreak()

steps, whereas $(X_n)$ transitions in varying continuous steps $T_1, T_2, dots$ of the underlying PP($lambda$).

This did not matter for determining Trans, Pos Rec, Null Rec. But for $E_0 T_0$ we need to look at time $T_0$,

#pagebreak()

which is different in $(X_n)$ than in BP.

Recall that for GI/G/1 we showed $pi_0 = 1 - lambda/mu = (mu-lambda)/mu$ if customers arrive rate $lambda$. That is case here for PP($lambda$).
$ therefore E_0 T_0 = 1/pi_0 = mu/(mu-lambda) $. $qed$

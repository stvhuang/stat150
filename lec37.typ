== Lecture 37

*New Topic: Brownian Motion*

§8 [PK]

- A random, continuous path in time & space.

- Here in $RR^2$

#pagebreak()

*Background*

- Roman Philosopher Lucretius 60 BC observed Brownian motion, looking at dust particles dance in the light:

  Observe what happens when sunbeams are admitted into a building and shed light on its shadowy places. You will see a multitude of tiny particles mingling in a multitude of ways$dots$ their dancing is an actual indication of underlying movements of matter that are hidden from our sight$dots$ It originates with the atoms which move of themselves [i.e., spontaneously]. Then those small compound bodies that are least removed from the impetus of the atoms are set in motion by the impact of their invisible blows and in turn cannon against slightly larger bodies. So the movement mounts up from the atoms and gradually emerges to the level of our senses so that those bodies are in motion that we see in sunbeams, moved by blows that remain invisible.

#pagebreak()

- Botanist Robert Brown 1827 observed Brownian motion through a microscope, tracking the trajectory of a pollen grain in a container of water.

- Einstein 1905 began a more mathematical study of Brownian motion. Explained that this rough/random path is caused by continual bombardment in many directions by water molecules upon the grain of pollen.

#pagebreak()

- Einstein's work gave good evidence for the existence of atoms.
  #h(2em) $arrow.r$ 1908: Perrin explores this further & wins Nobel Prize (1926)

- The mathematical study then began to flourish, beginning with e.g. Wiener, Lévy.

#pagebreak()

- Brownian motion remains an area of active research. It is also an important building block used to construct more complicated processes in use today.

- Has many applications, perhaps most notably, mathematical finance.

#pagebreak()

*Plan*

- We'll cover *some* of §8 in [PK].

- See also "Brownian Motion" by Peter Mörters & Yuval Peres if you want to see proofs and many more facts about Brownian Motion (418 page book!)

#pagebreak()

Brownian motion has many interesting/beautiful properties. In particular, it is a *fractal*:

#grid(
  columns: (1fr, 1fr),
  [
    Lévy $arrow.b$
  ],
  [
    Paley, Wiener & Zygmund $arrow.b$
  ],
)

Continuous, but *nowhere* differentiable.

"It is a path, but very rough"

(Proofs in Mörters-Peres, beyond Stat 150 level.)

#pagebreak()

- If you zoom into *anywhere* along a polynomial, it looks like a straight line (the tangent line).

// A diagram shows a smooth curve f(x).
// A point x on the curve is circled.
// An arrow labeled "zoom" points from the circle to an expanded view.
// The expanded view shows a straight line segment, representing the tangent line.
// Below the expanded view is the text: "SLOPE = f'(x)".

#pagebreak()

- On the other hand, Brownian motion is "self-similar" (fractal). No matter how close you zoom in, it looks the similar to when you started!

$arrow.b$

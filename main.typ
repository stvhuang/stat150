#import "@preview/slydst:0.1.4": slides

#set footnote(
  numbering: "[1]",
)
#set text(
  font: "Libertinus Sans",
  size: 12pt,
)

#show: slides.with(
  authors: ("Curated by Steven Huang (stvhuang.me@gmail.com)",),
  layout: "small",
  ratio: 4 / 3,
  subtitle: [Last update: #datetime.today().display()],
  title: "UCBerkeley STAT150\nLecture Notes",
  title-color: rgb("#002676"),
)

#include "./lec03.typ"
#include "./lec04.typ"
#include "./lec05.typ"
#include "./lec06.typ"
#include "./lec14.typ"

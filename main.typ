#import "utils/core.typ": *

#show: notes.with(
  name: "Конспект лекций по математическому анализу за III семестр",
  short-name: "Математический анализ",
  lector: "Храбров Александр Игоревич",
  info: "СПБГУ МКН, Современное программирование, 2023-2024",
)

#show: show-references

#include "reminders.typ"

#if config.sem3 {
  include "sections/01-leftovers/!sec.typ"
  include "sections/02-measure-theory/!sec.typ"
  include "sections/03-lebesgue-integral/!sec.typ"
  
}
#include "sections/04-parametric-and-curves/!sec.typ"
#include "sections/05-complex-functions/!sec.typ"

#include "appendix.typ"

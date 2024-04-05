#import "utils/core.typ": *

#show: notes.with(
  name: "Конспект лекций по математическому анализу за " + {
    if config.sem3 and config.sem4 {
      "II курс"
    } else if config.sem3 {
      "III семестр"
    } else if config.sem4 {
      "IV семестр"
    } else {
      panic("empty conspect")
    }
  },
  short-name: "Математический анализ",
  lector: "Храбров Александр Игоревич",
  info: "СПБГУ МКН, Современное программирование, 2023-2024",
)

#show: show-references

#if config.reminders {
  include "reminders.typ"
}

#if config.sem3 {
  include "sections/01-leftovers/!sec.typ"
  include "sections/02-measure-theory/!sec.typ"
  include "sections/03-lebesgue-integral/!sec.typ"
  include "sections/04-parametric-and-curves/!sec.typ" 
}

// partially sem3, partially sem4
#include "sections/05-complex-functions/!sec.typ"

#if config.sem4 {
  include "sections/06-fourier-series/!sec.typ"
}

#include "appendix.typ"

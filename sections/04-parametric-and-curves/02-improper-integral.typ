#import "../../utils/core.typ": *

== Несобственные интегралы

#def(label: "def-improper-integral")[
  _Несобственным интегралом_ называется
  $ integral_a^(+oo) f dif lambda_1 := lim_(b -> +oo) integral_[a, b] f dif lambda_1, $
  если предел существует.
]

#th(label: "lebesgue-implies-improper")[
  Если $integral_[a, +oo) f dif lambda_1 in overline(RR)$, то $integral_a^(+oo) f dif lambda_1 = integral_[a, +oo) f dif lambda_1$.
]

#proof[
  Пусть $f >= 0$. 
  
  Докажем существование предела по Гейне: рассмотрим $b_n arrow.tr +oo$. Пусть $f_n := f dot bb(1)_[a, b_n]$. Тогда $0 <= f_1 <= f_2 <= ...$ и $f_n --> f$. Тогда 
  $
    integral_[a, +oo) f dif lambda_1 =_"Леви"^rf("levy")
    lim integral_[a, +oo) f_n dif lambda_1 =
    lim integral_[a, +oo) f dot bb(1)_[a, b_n] dif lambda_1 =
    lim integral_[a, b_n] f dif lambda_1 =
    integral_a^(+oo) f dif lambda_1,
  $

  Если $f$ суммируема, можно вычесть#rf("def-sfn").
]

#example[
  $integral_1^(+oo) (sin x)/x dif x$ --- сходящийся несобственный интеграл (мы выясняли это когда-то давно). Но интеграл Лебега
  $integral_[1, +oo) (sin x)/x dif x$ не определен, так как $integral_[1, +oo] ((sin x)/x)_(plus.minus) dif lambda_1 (x) = +oo$. Доказывается как обычно: побить на кусочки, уменьшить интегралы, оценить снизу, бла бла бла, не буду расписывать.
]

#th(label: "improper-times-exp-continious")[
  Пусть $f in C[a, +oo]$ непрерывна, $integral_a^(+oo) f(x) dif x$ сходится. Тогда $F(t) := integral_a^(+oo) e^(-t x) f(x) dif x$ непрерывна на $[0, +oo)$.

  Так как при положительных $t$ множитель $e^(-t x)$ хороший и быстро сходящийся к нулю, всякие свойства, которые могут быть неверны просто для $f$ становятся верны за счет одного сильного множителя.

  Этот факт аналогичен теореме Абеля для степенных рядов.
]

#proof[
  Пусть $F_b (t) = integral_a^b e^(-t x) f(x) dif x$. Для любого $b$, это непрерывная функция#rf("parametric-continious-compact").
  Из сходимости $integral_a^(+oo) f(x) dif x$,
  у нас существует $c$, такое, что для любых $y$ и $b$: $y > b > c$  верно $abs(integral_b^y f(x) dif x) < eps$ (критерий Коши). 
  
  Зафиксируем какое-нибудь $b$. Пусть $integral_b^y f(x) dif x = g(y)$. Это первообразная $f$#rf("barrow").

  Рассмотрим хвост нашего интеграла начиная с $b$:
  $
    integral_b^(+oo) e^(-t x) f(x) dif x = underbrace(lr(e^(- t x) g(x) |)_(x = b)^(x = +oo), 0) + integral_b^(+oo) g(x) dot t e^(-t x) dif x.
  $
  Оценим последний интеграл:
  $
    abs(integral_b^(+oo) e^(-t x) f(x) dif x) =
    abs(integral_b^(+oo) t g(x) e^(-t x) dif x) <= 
    t integral_b^(+oo) underbrace(abs(g(x)), < eps) e^(-t x) dif x <= \ <= eps t integral_b^(+oo) e^(-t x) dif x = lr(eps cancel(t) dot (e^(-t x) / (-cancel(t))) |)_(x = b)^(x = +oo) = eps dot e^(-b t) < eps
  $
  при больших $b$. А еще,
  $
    abs(F(t) - F(t_0)) <= underbrace(abs(F_b (t) - F(t)), integral_b^(+oo) ... < eps) + abs(F_b (t_0) - F_b (t)) + underbrace(abs(F(t_0) - F_b (t_0)), integral_b^(+oo) ... < eps) < 2 eps + underbrace(abs(F_b (t) - F_b (t_0)), "при" t "близких к" t_0 \ < eps) < 3 eps.
  $
]

#example[
  Если $f(x) = (sin x) / x$. Пусть $F(t) = integral_0^(+oo) e^(-t x) (sin x)/x dif x$. По теореме#rf("improper-times-exp-continious") $F(t) in C[0, +oo)$. Найдем $F'(t)$#rf("parametric-derivative"):
  $
    F'(t) = integral_0^(+oo) -x e^(-t x) (sin x) / x dif x = - integral_0^(+oo) e^(-t x) sin x dif x.
  $
  У нас есть локальное условие Лебега, так как $e^(-alpha x)$ для некоторого $0 < alpha < t_0$ --- суммируемая мажоранта#rf("parametric-derivative").

  Можно проинтегрировать:
  $
    integral_0^(+oo) e^(-t x) sin x dif x =
    integral_0^(+oo) dot e^(-t x) (e^(i x) - e^(-i x))/(2i) dif x =
    1/(2i) integral_0^(+oo) (e^(-t x + i x) - e^(-t x - i x)) dif x newline(=)
    1/(2i) dot (
      lr(e^((-t + i) x)/(-t + i) bar)_(x=0)^(x->+oo) -
      lr(e^((-t - i) x)/(-t - i) bar)_(x=0)^(x->+oo)
    ) =^(t > 0) 1/(2i) (1/(-t + i) - 1/(-t - i)) =
    1/cancel(2i) dot cancel(-2i)/(t^2 + 1)
  $

  Отсюда $F'(t) = -1/(1 + t^2)$, значит $F(t) = C - op("arctg") t$. Причем $lim_(t -> +oo) F(t) = 0 ==> C = pi / 2$. Отсюда знаем ответ, $F(t) = pi/2 - op("argtg") t$. Но это верно лишь при $t > 0$: мы воспользовались этим, пока брали интеграл. К счастью, $F$ непрерывна на $[0, +oo)$#rf("improper-times-exp-continious"), и можно сделать предельный переход. $F(0) = pi / 2$. Значит, $ integral_0^(+oo) (sin x)/x dif x = pi / 2. $
]

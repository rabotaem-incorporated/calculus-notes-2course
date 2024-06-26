#import "../../utils/core.typ": *

== Суммирование рядов Фурье

#ticket[Суммирование рядов по Чезаро. Ядро Фейера. Свойства.]

#def[
  Рассмотрим ряд $sum_(k = 0)^oo a_k$ и положим $A_n := sum_(k = 0)^n a_k$. Будем говорить, что $S$ --- сумма ряда по Чезаро, если $S = lim_(n -> oo) (A_0 + A_1 + ... + A_n)/(n + 1)$. Обозначается $(c) (sum a_k)$.
]

#example[
  Рассмотрим ряд $sum_(n = 0)^oo (-1)^n$, который расходится. Однако его сумма по Чезаро равна $1/2$:
  $
    A_n = cases(1\, n = 2k, 0\, n = 2k + 1) ==> alpha_n = (1 + 0 + 1 + 0 + ... + A_n)/(n + 1) = cases(
      1/2\, n = 2k + 1, (k + 1)/(2k + 1)\, n = 2k
    ) --> 1/2.
  $
]

#props[
  1. Если сходится ряд, то он сходится к своей сумме по Чезаро.
  2. Суммирование по Чезаро линейно.
  3. Если ряд сходится по Чезаро, то $a_n = o(n)$.
]

#proof[
  1. Теорема Штольца.
  2. Просто расписать.
  3. 
  $ 
    alpha_n = (A_0 + ... + A_(n - 1) + A_n)/(n + 1) = n/(n + 1) dot (A_0 + ... + A_(n - 1) + A_n)/n = n/(n + 1) (alpha_(n - 1) + A_n/n) ==> \
    ==> A_n = n underbrace(((n + 1)/n dot alpha_n - alpha_(n - 1)), --> 1 dot S - S = 0) = o(n) ==> \
    ==> a_n = n underbrace((A_n/n - A_(n - 1)/(n - 1) (n - 1)/n), --> 0 - 0 dot 1 = 0) = o(n)
  $
]

#notice[
  $
    alpha_n =
    (A_0 + A_1 + ... + A_n)/(n + 1) =
    sum_(k = 0)^n (1 - k/(n + 1)) a_k.
  $
  Доказывается по индукции.
]

#th(name: "Харди")[
  Если ряд сходится по Чезаро, и $a_n = O(1/n)$ (можно даже если $a_n >= -c/n$ --- достаточно подпереть ряд с одной стороны), то он сходится.
]

#proof[
  Без доказательства.
]

#notice[
  Есть и другие способы считать суммы расходящихся рядов. Например,
  $
    lim_(t -> 1-) sum_(n = 1)^oo a_n t^n.
  $
]

#example[
  Рассмотрим следующий ряд:
  $
    1/2 + sum_(k = 1)^oo cos k x.
  $
  Он расходится, так как члены ряда не стремятся к нулю.

  Пусть $D_n (t)$ --- его частичная сумма, а
  $
    Phi_n (t) := (D_0 (t) + D_1 (t) + ... + D_n (t))/(n + 1).
  $
  Такая штука называется _ядром Фейера_. Рассмотрим несколько свойств этой штуки в нашем примере:
  1. $Phi_n$ --- непрерывная четная $2pi$-периодическая функция.
  
  2. $Phi_n (0) = (n + 1)/2$.
  
  3. $1/pi integral_(-pi)^pi Phi_n (t) dif t = 1$, так как у $D_i$ интеграл $pi$. В силу четности, $1/pi integral_0^pi Phi_n (t) dif t = 1/2$.
  
  4. При $t != 2pi m$, 
    $
      Phi_n (t) = (sin^2 (n + 1)/2 t)/(2(n + 1) sin^2 t/2).
    $
    Действительно, 
    $
      sum_(k = 0)^n (sin^2 t/2) D_n (t) =
      sum_(k = 0)^n 1/2 sin(k + 1/2) t dot sin t/2 =
      1/4 sum_(k = 0)^n (cos k t - cos (k + 1) t) = 1/4 underbrace((1 - cos (n + 1) t), 2 sin^2 (n + 1)/2 t).
    $
  
  5. $Phi_n (t) > 0$ по предыдущему свойству.

  6. $lim_(n -> oo) max_(delta <= t <= pi) Phi_n (t) = 0$. Доказательство:
    $
      Phi_n (t) <= 1/(2(n + 1) sin^2 (delta/2)) --> 0.
    $

  Значит, если $t != 2pi m$, то $("c") (1/2 + sum_(k = 1)^oo cos k t) = 0$.
]

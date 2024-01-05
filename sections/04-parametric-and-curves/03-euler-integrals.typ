#import "../../utils/core.typ": *

== Эйлеровы интегралы

#def[

  $Gamma(p) = integral_0^(+oo) x^(p-1) e^(-x) dif x$, $p > 0$

  $Beta(p, q) = integral_0^1 x^(p-1) (1-x)^(q - 1) dif x$, $p, q > 0$
]

#notice[
  Интегралы сходятся.

  Гамма:

  В нуле: $x^(p-1)e^(-x) tilde x^(p-1)$ - сходится т. к. $p - 1 > -1$
  
  На бесконечности: $x^(p-1)e^(-x/2) --> 0$

  Бета: 
  
  В нуле: $x^(p-1)(1-x)^(q-1) tilde x^(p - 1)$

  В единице: $x^(p-1)(1-x)^(q-1) tilde (1-x)^(q - 1)$
]

#props[($Gamma$)
  + $
  Gamma(p + 1) = p Gamma(p)
  $
  + $
  Gamma(n) = (n-1)!
  $
  + $
  Gamma(1/2) = sqrt(pi)
  $
  + $
  Gamma(n + 1/2) = (2n-1)!!/2^n sqrt(pi)
  $
  + $
  Gamma(p) in C^(oo)(RR), Gamma^((n))(p) = integral_0^(+oo) x^(p-1) ln^n (x) e^(-x) dif x
  $
  + $Gamma(p)$ строго выпукла
  + $Gamma(p) -->_(p-->+oo) +oo$ и $Gamma(p) tilde_(p-->0) 1/p$
  + $
  Gamma(p) tilde_(p-->+oo) sqrt((2pi)/p) e^(-p) p^(p)
  $
]

#proof[
  + $Gamma(p + 1) = integral_0^(+oo) x^p e^(-x) dif x = -x^p e^(-x) |_(x=0)^(x=+oo) + integral_0^(+oo) p x^(p-1) e^(-x) = p Gamma(p)$
  + $Gamma(1) = integral_0^(+oo) e^(-x) dif x = 1$
  + $Gamma(1/2) = integral_0^(+oo) x^(-1/2) e^(-x) =^(y = sqrt(x)) 2 integral_0^ (+oo) e^(-y^2) = sqrt(pi)$
  + 1 + 3
  + По индукции:
  Нужно проверить локальное условие лебега:

  $0 < alpha < p < beta$

  На бесконечности: $ln(x) < x ==> x^(p-1) ln^n (x) e^(-x) <= x^(beta + n - 1) e^(-x)$

  В нуле: $x^eps ln(x) -->_(x-->0+) 0$

  $|ln(x)| <= c x^(-eps)$

  $x^(p - 1) ln^n (x) e^(-x) <= c^n x^(alpha - n eps - 1), space alpha - n eps - 1 > -1 ==>$ есть сходимость

  $==>$ можно дифференцировать под знаком интеграла, формулу проверяйте сами

  6. Вторая производная положительна
  7. $Gamma$ монотонна при больших $p$ и $p Gamma(p) = Gamma(p + 1) -->_(p --> 0) Gamma(1) = 1$

  $Gamma'(p) = integral_0^(+oo) x^(p-1) ln(x) e^(-x) dif x = underbrace(integral_0^1, "маленький при" \ "больших" p) + integral_1^(+oo) > 0$

  На самом деле возрастание начиная с $p = 1$ но это сложнее
  8. Потом.
]

#props[($Beta$)
  + $
  Beta(p, q) = Beta(q, p)
  $
  + $
  Beta(p, q) = integral_0^(+oo) t^(p-1)/(1+t)^(p+q) dif t
  $
]

#proof[
  + $
  Beta(p, q) = integral_0^1 x^(p-1) (1-x)^(q-1) dif x =^(y = 1-x) -integral_1^0 y^(q-1) (1-y)^(p-1) dif y = Beta(q, p)
  $
  + $
  Beta(p, q) = integral_0^1 x^(p-1) (1-x)^(q-1) dif x =^(x = t/(t + 1)) integral_0^(+oo) (t/(t+1))^(p-1) (1/(t + 1))^(q - 1) (dif t)/((1 + t)^2)
  $
]

#th[
  $
  Beta(p, q) = (Gamma(p) Gamma(q)) / Gamma(p + q)
  $
]

#proof[
  $
  Gamma(p) Gamma(q) = integral_0^(+oo) integral_0^(+oo) x^(p-1) y^(q - 1) e^(-x - y) dif x dif y =^(u = x + y) integral_0^(+oo) integral_y^(+oo) (u-y)^(p-1) y^(q - 1) e^(-u) dif u dif y = \ integral_0^(+oo) integral_0^u (u-y)^(p-1) y^(q-1) e^(-u) dif y dif u =^(y = v u) integral_0^(+oo) integral_0^1 (u- u v)^(p-1) (u v)^(q-1) e^(-u) u dif v dif u = \ integral_0^(+oo) u^(p+q-1) e^(-u) integral_0^1 (1-v)^(p-1) v^(q-1) dif v dif u = Beta(p, q) Gamma(p + q)
  $
]

#follow[
  + Формула дополнения $
  Gamma(p) Gamma(1 - p) = pi/sin(pi p), space 0 < p < 1
  $
]

#proof[
  + $
  Gamma(p) Gamma(1 - p) = Beta(p, 1 - p) Gamma(1) = integral_0^(+oo) t^(p-1)/(1 + t) dif t = pi/sin(pi p)
  $ - интеграл посчитаем потом
]

#follow[
  + Формула удвоения: $
  Gamma(p) Gamma(p + 1/2) = sqrt(pi)/2^(2p - 1) Gamma(2p)
  $
]

#proof[

  $
  Gamma(2p)/(Gamma(p) Gamma(p)) dot 1/2^(2p - 1) =^? Gamma(p + 1/2)/(Gamma(p) Gamma(1/2)) <==>\
  1/(2^(2p - 1) Beta(p, p)) = 1/Beta(p, 1/2) \
  Beta(p, p) = integral_0^1 (x(1-x))^(p-1) = 2 integral_0^(1/2) =^(y = 1/2 - x) 2 integral_0^(1/2) (1/2 - y^2)^(p-1) dif y =^(z = 2y) \ integral_0^1(1/4 - 1/4z^2)^(p-1) dif z =^(t = z^2) 1/(2^(2p-1)) integral_0^1 (1-t)^(p-1) t^(1/2 - 1) dif t = Beta(p, 1/2)/2^(2p - 1)
  $
]

#th[$
  Gamma(t + a) tilde t^a Gamma(t), space t --> +oo, a > 0
  $
]

#proof[$
  Beta(a, t + 1) = (Gamma(a) Gamma(t + 1))/Gamma(t + a + 1) tilde^? Gamma(a)/t^a \ 
  Beta(a, t) = integral_0^1 x^(a-1) (1-x)^(t - 1) dif x =^(y = t x) integral_0^t y^(a - 1) t^(1 - a) (1 - y/t)^(t-1) 1/t dif y = \ 1/t^a integral_0^(+oo) y^(a-1) (1-y/t)^(t-1) bb(1)_[0, t] dif y
  $

  Хотим перейти к пределу

  $
  y^(a-1) (1-y/t)^(t-1) bb(1)_[0, t] -->_(t-->+oo) y^(a-1) e^(-y)
  $ - суммируемая мажоранта

  Значит $
  integral_0^(+oo) y^(a-1) (1-y/t)^(t-1) bb(1)_[0, t] dif y -->_(t-->+oo)Gamma(a)
  $
]

#notice[
  Если $1 < a < 2$ то стремление равномерное

  $
  Gamma(t + a)/(t^a Gamma(t)) arrows.rr^? 1
  $

  $
  abs(integral_0^t y^(a-1) (1-(y/t))^t dif y - Gamma(a)) <= integral_t^(+oo) y^(a-1) e^(-y) dif y + integral_0^t y^(a-1) abs((1-y/t)^t - e^(-y)) dif y <=\ integral_t^(+oo) y e^(-y) dif y + integral_0^1 abs((1-y/t)^t - e^(-y)) dif y + integral_1^t y abs((1-y/t)^t - e^(-y)) dif y--> 0
  $
]

#follow[
  $Gamma(p) tilde_(p-->+oo) sqrt((2pi)/p) e^(-p) p^(p)$
]

#proof[
  $p = n + a, 1 < a < 2$

  $
  Gamma(p) = Gamma(n + a) tilde Gamma(n)n^a = n! n^(a-1) tilde sqrt(2 pi n) (n/e)^n n^(a-1) tilde^? sqrt((2pi)/(n + a)) e^(-n - a) (n + a)^(n + a) \
  (e^(-a) (n+a)^(n+a) 1/sqrt(n + a)) /(n^n sqrt(n) n^a 1/n) tilde e^(-a) ((n+a)/n)^(n + a) tilde e^(-a) (1 + a/n)^n tilde 1
  $
]

#follow[Формула Эйлера-Гаусса

  $
  Gamma(p) = limits(lim)_(n-->+oo) (n^p n!)/(p(p + 1)(p + 2)...(p + n))
  $
]

#proof[
  $
  (p(p+1)...(p+n))/n! = Gamma(p + n + 1)/(Gamma(p)Gamma(n + 1)) \
  n^p/Gamma(p) n!/(p(p + 1)...(p + n)) = n^p/Gamma(p) Gamma(p)/Gamma(n + p) Gamma(n) n/(n + p) tilde n^p/(n^p Gamma(n)) Gamma(n) tilde 1
  $
]

#follow[
  Формула Валлиса
]

#proof[
  $p = 1/2$

  $
  (sqrt(n) n!)/(1/2 dot 3/2 dot ... dot (n + 1/2)) --> sqrt(pi) <==> \ (2 sqrt(n)(2n)!!)/(2n+1)!! --> sqrt(pi)
  $
]

#examples[
  + $
  product_(k = 0)^n (3k + 1) = 1 dot 4 dot 7 dot ... dot (3n + 1) = 3^(n+1) dot 1/3 dot (1 + 1/3) dot ... dot (n + 1/3) tilde (3^(n+1) n^(1/3) n!)/Gamma(1/3)
  $

  + $
  integral_0^(+oo) e^(-x^p) dif x, p > 0 = ^(y = x^p) integral_0^(+oo) 1/p y^(1/p - 1) e^y dif y = 1/p Gamma(1/p) = Gamma(1 + 1/p)
  $
  + $
  integral_0^(pi/2) sin^(p-1) x cos^(q - 1) x dif x = 1/2 integral_0^1 x^((p-2)/2) (1-x)^((q-2)/2) dif y = 1/2 Beta(p/2, q/2)
  $
  В частности $
  integral_0^(pi/2) sin^(p-1) x dif x = 1/2 Beta(p/2, 1/2) = 1/2 (Gamma(p/2)sqrt(pi))/Gamma((p + 1)/2)
  $

  4. $V_n (r)$ - объем $n$-мерного шара радиуса $r$
  $
  V_n (r) = r^n C_n - "объем шара радиуса 1" \
  C_n = integral_(-1)^1 V_(n-1) (sqrt(1-x^2)) dif x = 2 integral_0^1 (1-x^2)^((n-1)/2) C_(n-1) dif x =^(x = sin phi) \ 2 C_(n-1) integral_0^(pi/2) cos^n (phi) dif phi = C_(n-1) (Gamma((n+1)/2)sqrt(pi))/Gamma((n + 2)/2) \
  C_n = C_1 (pi^((n-1)/2) Gamma(3/2))/Gamma((n+2)/2) = pi^(n/2)/Gamma(n/2+1) 
  $
]
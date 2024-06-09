#import "../../utils/core.typ": *

== Солянка а ля Фурье


#def[
  $L_(2pi)^1$ --- $2pi$ периодические функции, и $norm(f)_1 := integral_(-pi)^pi abs(f(t)) dif t < +oo$.
]

#def[
  Если $f, g in L_(2pi)^1$, то _сверткой функций_ $f * g$ называется функция $h$ такая, что
  $
    h(x) := integral_(-pi)^pi f(x - t) g(t) dif t.
  $
]

#props[
  1. $f * g = g * f$.
  
  2. $h in L_(2pi)^1$.
  
  3. $c_k (f * g) = 2pi c_k (f) c_k (g)$.

  4. $f in L_(2pi)^p$, $g in L_(2pi)^q$, и $1/p + 1/q = 1$. Тогда $f * g in C_(2pi)$, и $norm(f * g)_oo <= norm(f)_p norm(g)_q$.

  5. Если $1 <= p <= +oo$, то $norm(f * g)_p <= norm(f)_1 norm(g)_p$.
]

#proof[
  1. Доказывается.

  2. Рассмотрим $F(x, t) = f(x - t) g(t)$. Это измеримая функция ($RR^2 --> RR$).
    $
      integral_(-pi)^pi integral_(-pi)^pi abs(F(x, t)) dif t dif x &=
      integral_(-pi)^pi underbrace(integral_(-pi)^pi abs(f(x - t)) dif x, norm(f)_1) abs(g(t)) dif t =
      norm(f)_1 dot norm(g)_1. \
      &= integral_(-pi)^pi abs(integral_(pi)^pi f(x - t) g(t) dif t) dif x = integral_(-pi)^pi abs(h(x)) dif x = norm(h)_1.
    $
    Значит функция и правда суммируема в $L_(2pi)^1$ (теорема Фубини про суммируемость сечения или что-то типа того).
  
  3. 
    $
      c_k (h) =
      1/(2pi) integral_(-pi)^pi h(x) e^(-i k x) dif x =
      1/(2pi) integral_(-pi)^pi integral_(-pi)^pi f(x - t) g(t) dot e^(-i k (x - t)) e^(-i k t) dif t dif x
      newline(=)
      1/(2pi) integral_(-pi)^pi integral_(-pi - t)^(pi - t) f(y) e^(-i k y) dif y g(t) e^(-i k t) dif t =
      2pi c_k (f) dot c_k (g).
    $
    Впрочем, мы уже знали это. Коэффициенты Фурье --- это просто значения характеристических функций в целых точках. Плотность суммы независимых случайных величин --- свертка, а характеристическая функция --- произведение. Отсюда этот же факт.

  4. Рассмотрим $h = f * g$.
    $
      abs(h(x + y) - h(x)) =
      abs(integral_(-pi)^pi (f(x + y - t) - f(x - t)) g(t) dif t) newline(<=)
      integral_(-pi)^pi abs(f(x + y - t) - f(x - t)) abs(g(t)) dif t newline(<=^"Гельдер")
      underbrace((integral_(-pi)^pi abs(f(x + y - t) - f(x - t))^p dif t)^(1/p), (integral_(-pi)^pi abs(f(y + t) - f(t))^p dif t)^(1/p)) underbrace((integral_(-pi)^pi abs(g(t))^q dif t)^(1/q), norm(g)_q) newline(=)
      (integral_(-pi)^pi abs(f(y + t) - f(t))^p dif t)^(1/p) dot norm(g)_q =
      norm(f_y - f)_p dot norm(g)_q -->_(y -> 0) 0
    $
    по непрерывности сдвига.
  
  5. Без доказательства, но вообще делается. Надо пару раз нетривиально применить неравенство Гельдера.
]

#notice[
  Определение свертки
  $
    h(x) = (f * g)(x) := integral_(-pi)^pi f(x - t) g(t) dif t
  $
  вообще говоря уже встречалось, например, в формуле для частичных сумм ряда Фурье:
  $
    S_n (f, x) = 1/pi integral_(-pi)^pi f(x - t) D_n (t) dif t = 1/pi f * D_n.
  $
  А значит (по линейности свертки, которую мы не обсуждали, но которая есть)
  $
    sigma_n (f, x) = (S_0 (f, x) + S_1 (f, x) + ... + S_n (f, x))/(n + 1) = 1/pi f * Phi_n.
  $
]

#def[
  Пусть $D$ --- множество параметров, $h_0$ --- предельная точка $D$ (в примерах, $D = NN$, $h_0 = oo$). $K_h$ --- _аппроксимативная единица_, если
  1. $K_h in L_(2pi)^1$ и $integral_(-pi)^pi K_h (t) dif t = 1$ для любого $h in D$.
  2. $norm(K_h)_1 <= M$ для любого $h in D$.
  3. $integral_([-pi, pi] without (-delta, delta)) abs(K_h (t)) dif t -->_(h -> h_0) 0$ для любого $delta in (0, pi)$.

  $K_h$ называется _усиленной аппроксимативной единицей_, если также есть свойство
  4. $esssup_([-pi, pi] without (-delta, delta)) abs(K_h (t)) -->_(h -> h_0) 0$ для любого $delta in (0, pi)$.
  Это свойство сильнее свойства $3$.
]

#example[
  $1/pi Phi_n$ --- усиленная аппроксимативная единица.
]

#th(name: "об аппроксимативной единице")[
  $K_h$ --- аппроксимативная единица.

  1. Если $f in C_(2pi)$, то $f * K_h arrows_(h -> h_0) f$.

  2. Если $f in L_(2pi)^p$, $1 <= p < +oo$, то $norm(f * K_h - f)_p -->_(h -> h_0) 0$.

  3. Если $K_h$ --- усиленная, а $f$ суммируема и непрерывна в $x_0$, то $f * K_h (x_0) -->_(h -> h_0) f(x_0)$.
]

#proof[
  Для начала распишем:
    $
      f * K_h (x) - f(x) =
      integral_(-pi)^(pi) f(x - t) K_h (t) dif t - integral_(-pi)^pi f(x) K_h (t) dif t =
      integral_(-pi)^pi (f(x - t) - f(x)) K_h (t) dif t.
    $
  
  1. 
    $
      abs(integral_(-pi)^pi (f(x - t) - f(x)) K_h (t) dif t) <=
      integral_(-pi)^pi abs(f(x - t) - f(x)) abs(K_h (t)) dif t =
      underbrace(integral_(-delta)^delta, I_1) + underbrace(integral_([-pi, pi] without (-delta, delta)), I_2).
    $
    Оценим $I_1$:
    $
      integral_(-delta)^delta underbrace(abs(f(x - t) - f(x)), <= eps) abs(K_h (t)) dif t <=
      eps integral_(-delta)^delta abs(K_h (t)) dif t <= M eps.
    $
    Теперь $I_2$. Так как $f in C_(2pi)$, $abs(f) <= C$. Пусть $E = [-pi, pi] without (-delta, delta)$
    $
      integral_E underbrace(abs(f(x - t) - f(x)), <= 2C) abs(K_h (t)) dif t <=
      2C integral_E abs(K_h (t)) dif t --> 0.
    $
  
  3. Если взять $delta > 0$ по $eps > 0$ из определения непрерывности в $x$, то $I_1$ оценивается так же. $I_2$ оценим так:
    $
      integral_E abs(f(x - t) - f(x)) abs(K_h (t)) dif t <= esssup_(t in E) abs(K_h (t)) dot underbrace(integral_E abs(f(x - t) - f(x)) dif t, <= 2 integral_(-pi)^pi abs(f(t)) dif t).
    $
    Первый множитель стремиться к нулю так как $K_h$ --- усиленная аппроксимативная единица.

  2. Без доказательства. Надо рассмотреть функцию $g(t) = integral_(-pi)^pi abs(f(x - t) - f(x)) dif x$. Доказать, что $g in C_(2pi)$, затем сослаться на первый пункт, применив неравенство Гельдера, и все получиться. Но в интересах времени, Храбров доказательство не привел.
]

#th(name: "Фейера")[
  1. Если $f in C_(2pi)$, то $sigma_n (f) arrows f$ (где $sigma_n (f) = (S_0 (f) + ... + S_n (f))/(n + 1)$).
  
  2. Если $f in L_(2pi)^p$, $1 <= p < +oo$, то $norm(sigma_n (f) - f)_p --> 0$.

  3. Если $f in L_(2pi)^1$ и непрерывна в $x$, то $sigma_n (f, x) --> f(x)$.
]

#proof[
  #TODO[Кажется, у нас все это уже есть... но на всякий случай надо сослаться]
]

#follow(plural: true)[
  1. $f in L_(2pi)^1$, $f$ непрерывна в $x$. Если ряд Фурье для функции $f$ в точке $x$ сходится, то он сходится к $f(x)$.

  2. Если $f in C_(2pi)$ и ряд Фурье для функции $f$ сходится, то он сходится к $f$.

  3. (*Теорема единственности*) Если $f in L_(2pi)^1$, и все коэффициенту Фурье $f$ равны нулю, то $f = 0$ почти везде.

  4. Ряд Фурье для $f in L^2_(2pi)$ сходится к $f$ по норме в $L_(2pi)^2$. Равносильно: тригонометрическая система --- базис в $L_(2pi)^2$.
]

#proof[
  1. Пусть $S_n (f, x) --> a$, тогда $sigma_n (f, x) --> a$, но мы знаем, что $sigma_n (f, x) --> f(x)$.

  2. Вроде верно...

  3. $S_n (f) = 0$, то $sigma_n (f) = 0$, и $norm(sigma_n (f) - f)_1 = norm(f)_1 --> 0$.

  4. Будем доказывать, что тригонометрическая система --- базис. Достаточно понять, что система --- полная, то есть если функция $g$ ортогональна любому элементу тригонометрической системы, то $g = 0$ почти везде. А это равносильно тому, что $c_k (g) = 1/(2pi) integral_(-pi)^pi g(x) e^(-i k x) dif x = 1/(2pi) dotp(f, e^(-i k x)) = 0$. 
]

#th(name: "Вейерштрасса")[
  Пусть $f in C_(2pi)$, $eps > 0$. Тогда существует такой тригонометрический многочлен $T$, что $abs(T(x) - f(x)) < eps$ во всех точках $x in RR$.
]

#proof[
  Однажды Эрнест Хемингуэй поспорил, что напишет самый короткий рассказ, способный растрогать любого. Он выиграл спор показав лишь
  $ sigma_n (f) arrows f. $
]

#th(name: "Вейерштрасса (другая, но на самом деле та же самая)", label: "weierstrass2")[
  $f in C[a, b]$, $eps > 0$. Тогда существует многочлен $P$ такой, что $abs(P(x) - f(x)) < eps$ для любого $x in [a, b]$.
]

#proof[
  Пользуясь преобразованием $[0, pi] --> [a, b]$ вида $x arrow.bar.long a + (b - a)/pi x$ будем рассматривать функцию на $[0, pi]$. А потом замкнем ее до $2pi$-периодической:
  $
    g(x) = cases(f(x)\, x in [0, pi], f(-x)\, x in [-pi, 0]).
  $
  Приблизим $g in C_(2pi)$ тригонометрическим многочленом $T$ с точностью до $eps$:
  $
    T(x) = a_0 + sum_(k = 0)^n (a_k cos k x + b_k sin k x).
  $
  Разложим тригонометрические функции в ряд Тейлора, и приблизим префиксами с хорошей точностью.
]

#notice[
  Пусть $f in C[0, 1]$. Тогда
  $
    B_n (f, x) = sum_(k = 0)^n f(k/n) C_n^k x^k (1 - x)^(n - k) arrows f.
  $
  $B_n (f, x)$ называется _многочленом Бернштейна_. Вам это может напоминать какое-то распределение из теорвера... Собственно, это можно доказать в теорвере. Вот так можно явно выписывать эти многочлены.

  Частные случаи многочленов Бернштейна для $n = 2$ и $n = 3$ называются _кривыми Безье_.
]

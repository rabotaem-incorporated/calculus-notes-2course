#import "../../utils/core.typ": *

== Гипергеометрическая функция

#def[
  _Возрастающая факториальная степень_:
  $ a^(overline(k)) harpoons.ltrb (a)_k := a (a + 1) (a + 2) ... (a + k - 1) = (Gamma(a + k)) / (Gamma(a)). $
  Здесь $a in CC$.
]

#notice[
  $Gamma(a + k) tilde_(k -> oo) k^a Gamma(k)$, следовательно $a^overline(k) tilde_(k -> +oo) Gamma(k)/Gamma(a) k^a$
]

#example[
  $ 
    1/(1 - x)^a = sum_(k = 0)^oo ((-a)^overline(k))/(k!) x^k = \ = 1 + (-a)/(1!)(-x) + ((-a)(-a-1))/(2!)(-x)^2 + ... + ((-a)(-a - 1)...(-a-k + 1))/(k!)(-x)^k + ...
  $
]

#let hyperg(F: $F$, x: $x$, n: $$, m: $$, top, bot, var) = $
  attach(#F, bl: #m, br: #n) (lr(vec(delim: #none, top.join(sym.space), bot.join(sym.space)) space bar) space #var.join(sym.space))
$

#def[
  _Гипергеометрический ряд_ $a_1, ..., a_m$, $b_1, ..., b_n in CC$, где $b_j != 0, -1, -2, ...$:
  $
    hyperg(m: m, n: n, a_1, ..., a_m; b_1, ..., b_n; z) := sum_(k = 0)^oo (a_1^overline(k) ... a_m^overline(k))/(b_1^overline(k) ... b_n^overline(k)) (z^k)/(k!)
  $
  Альтернативное обозначение: $attach(F, bl: m, br: n) (a_1, ..., a_m; b_1, ..., b_n; z)$
]

#th[
  - Если $m <= n$, то радиус сходимости гипергеометрического ряда равен $oo$.
  - Если $m > n + 1$, то радиус сходимости гипергеометрического ряда равен $0$.
  - Если $m = n + 1$, то радиус сходимости гипергеометрического ряда равен $1$.
]

#proof[
  Обозначим члены ряда как $x_i$. Применим признак Даламбера:
  $
    lim abs(x_(k + 1))/abs(x_k) = lim (abs(a_1^overline(k+1)) ... abs(a_m^overline(k + 1)))/(abs(b_1^overline(k + 1)) ... abs(b_n^overline(k + 1))) abs(z^cancel((k + 1)))/((k + 1)cancel(!)) dot (abs(b_1^overline(k)) ... abs(b_m^overline(k)))/(abs(a_1^overline(k)) ... abs(a_m^overline(k))) (cancel(k!))/(cancel(abs(z)^k)) = \ = abs(z) lim abs(((a_1 + k)...(a_m + k))/((b_1 + k)...(b_n + k))) dot 1/(k + 1) = cases(
      0\, "если" m <= n,
      +oo\, "если" m > n + 1,
      abs(z)\, "если" m = n + 1
    ).
  $
]

#examples[
  Частные случаи:
  1. $ 1/(1 - x)^a = hyperg(m: 1, n: 0, a; space; x) = hyperg(a, 1; 1; x). $

  2. $ ln(1-x) = -sum_(k = 1)^oo (x^k)/(k) = -x dot sum_(k = 0)^oo (x^k)/(k + 1) = -x hyperg(1, 1; 2; x). $
  
  3. $ ln (1+x)/(1-x) = ln(1 + x) - ln(1 - x) = x sum_(k = 0)^oo ((-x)^k)/(k + 1) + x sum_(k = 0)^oo (x^k)/(k + 1) = 2x sum_(k = 0)^oo (x^2k)/(2k + 1) = 2x hyperg(1/2, 1; 3/2; x^2). $
  
  4. $ arcsin x = x hyperg(1/2, 1/2; 3/2; x^2). $
  
  5. $ arctan x = x hyperg(1/2, 1; 3/2; -x^2). $
  
  6. $ K(x) = integral_0^1 (dif t)/(sqrt(1-t^2)(1 - x^2 t^2)) = hyperg(1/2, 1/2; 1; x). $
    Эта функция называется _эллиптическим интегралом первого рода_.
]

#th[
  Степенной ряд $sum_(k = 0)^oo c_k z^k$ с ненулевыми коэффициентами является гипергеометрическим (то есть вида $c hyperg(...; ...; alpha z)$) тогда и только тогда, когда отношение его соседних коэффициентов $c_(k + 1)/c_k$ является рациональной функцией от $k$.
]

#proof[
  - "$==>$": очевидна: можно просто рассмотреть отношение соседних коэффициентов в гипергеометрическом ряде.

  - "$<==$": Знаем $c_(k + 1)/c_k = (P(k))/(Q(k))$. Пусть $-a_1, ..., -a_m$ --- корни $P$, $-b_1, ..., -b_n$ --- корни $Q$. Тогда
  $
    c_(k + 1)/c_k = (P(k))/(Q(k)) = alpha ((k + a_1)(k + a_2)...(k+a_m))/((k + b_1)(k + b_2)...(k + b_n)),
  $
  из чего можно вывести общую формулу для коэффициентов $c_k$:
  $
    c_k = c_0 alpha^(k + 1) (a_1^overline(k + 1)...a_m^overline(k + 1))/(b_1^overline(k + 1)...b_n^overline(k + 1)) dot (1^overline(k + 1))/((k + 1)!),
  $
  а это коэффициенты гипергеометрического ряда
  $
    c_0 hyperg(a_1, ..., a_m, 1; b_1, ..., b_n; alpha z)
  $
]

#th(name: "Интегральное представление для гипергеометрических функций")[
  $ hyperg(a, b; c; x) = Gamma(c)/(Gamma(b)Gamma(c - b)) integral_0^1 (t^(b - 1) (1 - t)^(c - b - 1))/(1 - x t)^a dif t $
  при $0 < b < c$ и $abs(x) < 1$.
]

#proof[
  Известно, что
  $ 1/(1 - x t)^a = sum_(k = 0)^oo (x t)^k/(k!) a^overline(k). $
  Подставим это в интеграл:
  $
    integral_0^1 (t^(b - 1) (1 - t)^(c - b - 1))/(1 - x t)^a dif t = integral_0^1 sum_(k = 0)^oo t^(k + b - 1) dot (1-t)^(c - b - 1) dot (x^k)/(k!) a^overline(k) dif t =^* \ =^* sum_(k = 0)^oo integral_0^1 t^(k + b - 1) dot (1-t)^(c - b - 1) dot (x^k)/(k!) a^overline(k) dif t = sum_(k = 0)^oo (x^k)/(k!) a^overline(k) dot underbrace(integral_0^1 t^(k + b - 1) dot (1-t)^(c - b - 1) dif t, B(k + b, c - b) = (Gamma(b + k)Gamma(c - b))/(Gamma(c + k))) = \ = Gamma(c - b) sum_(k = 0)^oo (a^overline(k) Gamma(b + k))/Gamma(c + k) dot (x^k)/(k!) = (Gamma(c - b) Gamma(b))/Gamma(c) sum_(k = 0)^oo (a^overline(k) b^overline(k))/c^overline(k) dot (x^k)/(k!)
  $
  Почему можно менять местами интеграл и сумму в $*$? Что такое сумма? Это интеграл по дискретной мере. Можно применить теорему Фубини, если покажем, что интегралы по мере Лебега сходятся абсолютно. Посмотрим, и получится.
]

#follow(name: "формула Гаусса")[
  $ hyperg(a, b; c; 1) = (Gamma(c) Gamma(c - a - b))/(Gamma(c - a) Gamma(c - b)) $
  при $c > a + b$ и $0 < b < c$. Вообще, условия можно ослабить, но у нас не хватает iq.
]

#proof[
  $ hyperg(a, b; c; 1) = sum_(k = 0)^oo (a^overline(k) b^overline(k))/(c^overline(k)) dot 1/(k!) $
  Заметили выше, что $a^overline(k) tilde_(k -> +oo) Gamma(k)/Gamma(a) k^a$. Тогда
  $
    (cancel(a^overline(k)) b^overline(k))/(c^overline(k)) dot (1/k!) tilde ((cancel(Gamma(k)) k^a) / Gamma(a) dot (cancel(Gamma(k)) k^b)/Gamma(b)) / ((cancel(Gamma(k)) k^c)/Gamma(c) dot cancel(Gamma(k)) dot k) = const / (k^(c - a - b + 1)).
  $
  А значит
  $
    hyperg(a, b; c; 1) = lim_(x -> 1-) hyperg(a, b; c; x) = lim_(x -> 1-) Gamma(c)/(Gamma(b) Gamma(c - b)) integral_0^1 (t^(b - 1) (1 - t)^(c - b - 1))/(1 - x t)^a dif t =^* \ =^* integral_0^1 lim_(x -> 1-) Gamma(c)/(Gamma(b) Gamma(c - b)) (t^(b - 1) (1 - t)^(c - b - 1))/(1 - x t)^a dif t = Gamma(c)/(Gamma(b) Gamma(c - b)) integral_0^1 t^(b - 1) (1 - t)^(c - a - b - 1) dif t = \ = Gamma(c)/(Gamma(b) Gamma(c - b)) Beta(b, c - a - b) = (Gamma(c) Gamma(c - a - b))/(Gamma(c - b) Gamma(c - a)).
  $
  Почему в $*$ можно менять местами предел с интегралом? Оказывается, что $t^(b - 1) (1 - t)^(c - a - b - 1)$ --- суммируемая мажоранта при $a > 0$, а $t^(b-1) (1 - t)^(c - b - 1)$ --- суммируемая мажоранта при $a <= 0$ (упражнение на внимательность). Поэтому можно применить теорему Лебега о мажорированной сходимости.
]

#th(name: "преобразование Пфаффа")[
  $0 < x < 1/2$ и $0 < b < c$.
  $
    hyperg(a, b; c; x) = (1 - x)^(-a) hyperg(a, c - b; c; x / (x - 1))
  $
]

#proof[
  $
    hyperg(a, b; c; x) = Gamma(c)/(Gamma(b) Gamma(c - b)) integral_0^1 (t^(b - 1) (1 - t)^(c - b - 1))/(1 - x t)^a dif t =^(t = 1 - s) (Gamma(c) (1 - x)^(-a))/(Gamma(b) Gamma(c - b)) integral_0^1 ((1 - s)^(b - 1) s^(c - b - 1)) / (1 - x/(x - 1) s)^a dif s = \ 
    = (1 - x)^(-a) dot underbrace((Gamma(c))/(Gamma(b) Gamma(c - b)) integral_0^1 ((1 - s)^(b - 1) s^(c - b - 1)) / (1 - x/(x - 1) s)^a dif s, hyperg(a, c - b; c; x / (x - 1))) = (1 - x)^(-a) hyperg(a, c - b; c; x / (x - 1)).
  $
]

#follow(name: "формула Эйлера")[
  $abs(x) < 1$, $0 < b < c$, $0 < a < c$.
  $ hyperg(a, b; c; x) = (1 - x)^(c - a - b) hyperg(c - a, c - b; c; x). $
]

#proof[
  Пока считаем $x <= 1/2$.
  $
    hyperg(a, b; c; x) = (1 - x)^(-a) hyperg(a, c - b; c; x / (x - 1)). \
    hyperg(c - a, c - b; c; x) = (1 - x)^(-(c - b)) hyperg(c - b, a; c; x/(x - 1))
  $
  Выражаем первое из второго, получаем что хотели.

  Что происходит при остальных $x$? У нас есть две функции, который совпадают на $(0, 1/2)$, и являются степенными рядами. Значит они совпадают на всей области определения.
]

#example[
  $ arctan x = x hyperg(1/2, 1; 3/2; -x^2) =^* x dot (1 - (-x^2))^(-1/2) hyperg(1/2, 1/2; 3/2; (x^2)/(x^2 + 1)) = \ = x/sqrt(1 + x^2) hyperg(1/2, 1/2; 3/2; (x/sqrt(x^2 + 1))^2) = arcsin(x / sqrt(x^2 + 1)). $
  Под $*$ мы применили преобразование Пфаффа. Опять, мы применили его только на $(0, 1/2)$, но как окажется в дальнейшем, можно помахать руками, и окажется, что это верно везде.
  #TODO[Возможно здесь где-то напутан знак, андрей разберись]
]



#import "../../utils/core.typ": *

== Тригонометрические ряды Фурье

#def[
  _Тригонометрическим многочленом_ назовем сумму вида
  $
    a_0/2 + sum_(k = 1)^n (a_k cos (k x) + b_k sin (k x)).
  $
  Его степень $n$, если $norm(a_n) + norm(b_n) != 0$.
]

#def[
  _Комплексная форма тригонометрического многочлена_ --- сумма вида
  $
    sum_(k = -n)^n c_k e^(i k x).
  $
  Его степень $n$, если $norm(c_n) + norm(c_(-n)) != 0$.
]

#notice[
  Это разные формы записи:
  $
    a_0/2 + sum_(k = 1)^n (a_k cos (k x) + b_k sin (k x)) =
    a_0/2 + sum_(k = 1)^n (a_k (e^(i k x) + e^(-i k x))/2 + b_k (e^(i k x) - e^(-i k x))/(2i)).
  $
  Положим $c_0 = a_0/2$, $c_k = (a_k - b_k i) / 2$ при $k >= 1$, $c_k = (a_k + b_k i)/2$ при $k <= -1$.
]

#def[
  _Тригонометрический ряд_ --- ряд вида
  $
    a_0/2 + sum_(k = 1)^oo (a_k cos (k x) + b_k sin (k x)).
  $
  или, в комплексной форме,
  $
    sum_(k = -oo)^oo c_k e^(i k x).
  $
  Сходимость ряда в комплексной форме означает существование предела $lim_(n -> oo) sum_(k = -n)^n c_k e^(i k x)$.
]

#lemma[
  Пусть тригонометрический ряд сходится к $f$ по норме $L^1 [-pi, pi]$. Тогда
  $
    a_n = 1/(pi) &integral_(-pi)^pi f(x) cos(n x) dif x,\
    b_n = 1/(pi) &integral_(-pi)^pi f(x) sin(n x) dif x,\
    c_n = 1/(2pi) &integral_(-pi)^pi f(x) e^(-i n x) dif x.
  $
]

#proof[
  Рассмотрим
  $
    abs(
      integral_(-pi)^pi f(x) cos (k x) dif x -
      integral_(-pi)^pi (a_0/2 + sum_(j = 1)^n (a_j cos (j x) + b_j sin (j x))) cos (k x) dif x
    ) newline(<=)
    integral_(-pi)^pi abs(f(x) - (a_0/2 + sum_(j = 1)^n (a_j cos (j x) + b_j sin (j x)))) underbrace(abs(cos (k x)), <= 1) dif x newline(<=)
    norm(f - (a_0/2 + sum ...))_(L^1[-pi, pi]) --> 0.
  $
  С другой стороны,
  $
    abs(
      integral_(-pi)^pi f(x) cos (k x) dif x -
      integral_(-pi)^pi (a_0/2 + sum_(j = 1)^n (a_j cos (j x) + b_j sin (j x))) cos (k x) dif x
    ) newline(=)
    abs(
      integral_(-pi)^pi f(x) cos (k x) dif x -
      pi a_k
    ).
  $
  при $n >= k$.

  Значит
  $
    a_k = 1/pi integral_(-pi)^pi f(x) cos (k x) dif x.
  $
]

#def[
  $
    a_k (f) := 1/pi &integral_(-pi)^pi f(x) cos (k x) dif x,\
    b_k (f) := 1/pi &integral_(-pi)^pi f(x) sin (k x) dif x,\
    c_k (f) := 1/(2pi) &integral_(-pi)^pi f(x) e^(-i k x) dif x
  $
  называются _коэффициентами Фурье_ функции $f$.
  
  Дальше, если мы будем писать в утверждениях теоремы эти коэффициенты, то подразумевается, что $f in L^1 [-pi, pi]$.
]

#notice[
  Если функция четная, то $b_k = 0$, если нечетная, то $a_k = 0$. Действительно, в первом случае в интеграле для $b_k$ стоит нечетная функция, и интеграл просто равен $0$. Аналогично для $a_k$.
]

#notice[
  Ограничив тригонометрические функции под интегралом единицей, можно грубо оценить коэффициенты:
  $
    abs(a_n (f)) < norm(f)_1/pi, quad abs(b_n (f)) < norm(f)_1/pi.\
    abs(c_k (f)) < norm(f)_1/(2pi).
  $
]

#denote[
  Обозначим
  $
    A_k (f, x) := cases(
      (a_0 (f))/2\, "при" k = 0,
      a_k (f) cos (k x) + b_k (f) sin (k x)\, "при" k > 0,
    )
  $
  Ряд Фурье тогда можно записать как
  $
    sum_(k = 0)^oo A_k (f, x).
  $
]

#notice(name: "представление членов ряда в виде свертки")[
  $
    A_0 (f, x) = 1/(2pi) integral_(-pi)^pi f(x - t) dif t
  $

  Это верно, так как $f$ -- это сумма каких-то синусов и косинусов, которые $2pi$-периодичны и по периоду дают интеграл $0$, и константы $a_0/2$, а значит интеграл будет какой нужно. Для $k$-го слагаемого формула такая:

  $
    A_k (f, x) = &1/pi integral_(-pi)^pi f(x - t) cos (k t) dif t newline(=)
    &1/pi integral_(-pi)^(pi) f(t) cos (k (x - t)) dif t newline(=)
    & 1/pi integral_(-pi)^pi (f(t) cos (k t) cos (k x) + f(t) sin (k t) sin (k x)) dif t. 
  $

  В этих формулах аргумент может вылезти за пределы $[-pi, pi]$. Чтобы больше не мучиться с этим, положим $f$ периодической с периодом $2pi$. В любом случае, раньше мы рассматривали $f: [-pi, pi] --> CC$, замкнув ее до периодической функции, мы ничего не потеряли. Ну, кроме, возможно, точки на границе отрезка, но на нее плевать: так как мы рассматриваем классы эквивалентности с точностью до равенства почти везде, можем положить значение там чем угодно. 
]

#denote[
  За $C_(2pi)$ обозначим непрерывные $2pi$-периодические функции.
]

#notice(name: "результаты о сходимости")[
  - *Дюбуа-Реймон*: существует $f in C_(2pi)$ такая, что ее ряд Фурье расходится в некоторой точке.
  - *Лебег*: существует $f in C_(2pi)$ такая, что ее ряд Фурье сходится во всех точках, но нет равномерной сходимости.
  - *Колмогоров*: существует $f in L^1 [-pi, pi]$ такая, что ее ряд Фурье расходится во всех точках (!).
  - *Карлесон*: для любой $f in L^2 [-pi, pi]$, ее ряд Фурье сходится почти везде.
  - *Рисс*: при $1 < p < +oo$, для любой функции $f in L^p [-pi, pi]$ ее ряд Фурье сходится по норме в $L^p [-pi, pi]$.
]

#lemma(name: "Римана-Лебега")[
  Если $E subset RR$ измеримое, $lambda in RR$, $f in L^1 (E)$, то
  1. $
    integral_E f (t) e^(i lambda t) dif t &--> 0 "при" lambda --> plus.minus oo,\
    integral_E f (t) cos(lambda t) dif t &--> 0 "при" lambda --> plus.minus oo,\
    integral_E f (t) sin(lambda t) dif t &--> 0 "при" lambda --> plus.minus oo.
  $

  2. Если $f in L^1 [-pi, pi]$, то
    $
      a_k (f) &--> 0 "при" k --> oo,\
      b_k (f) &--> 0 "при" k --> oo,\
      c_k (f) &--> 0 "при" k --> oo.
    $
]

#proof[
  Продолжим $f$ нулем. Теперь $f in L^1 (RR)$.
  $
    integral_RR f(t) e^(i lambda t) dif t =^(t = h + u)_((h in RR))
    integral_RR f(h + u) e^(i lambda h) e^(i lambda u) dif u =
    e^(i lambda h) integral_RR f(h + u) e^(i lambda u) dif u.
  $
  Равенство выше верно для любого $h$. Рассмотрим $h = pi/lambda$:
  $
    e^(i lambda h) integral_RR f(h + u) e^(i lambda u) dif u =
    -integral_RR f(pi/lambda + u) e^(i lambda u) dif u.
  $
  Значит
  $
    2 integral_RR f(t) e^(i lambda t) dif t =
    integral_RR f(t) e^(i lambda t) dif t - integral_RR f(pi/lambda + t) e^(i lambda t) dif t.
  $
  Вешаем модуль:
  $
    2 abs(integral_RR f(t) e^(i lambda t) dif t) =
    abs(integral_RR f(t) e^(i lambda t) dif t - integral_RR f(pi/lambda + t) e^(i lambda t) dif t) newline(<=)
    integral_RR abs(f(t) - f(t + pi/lambda)) dif t = norm(f - f_(pi/lambda))_1 --> 0
  $
  по теореме о непрерывности сдвига.
]

#remind[
  Модуль непрерывности
  $
    w_f (delta) = sup { abs(f(x) - f(y)) : abs(x - y) <= delta }.
  $
  Если $f$ непрерывна на компакте, то $w_f (delta) --> 0$ при $delta -> 0+$. В частности, это верно для $f in C_(2pi)$.
]

#remind[
  $f$ --- _липшицева_ с константой $M$, или $f in Lip_alpha M$ если $abs(f(x) - f(y)) <= M abs(x - y)^alpha$ для любых $x, y in RR$. Говорят, $f in Lip_alpha$ (без указания константы), если $f in Lip_alpha M$ для некоторого $M$.
]

#notice[
  $w_f (h) <= M h^alpha$ если $f in Lip_alpha M$.
]

#th[
  $
    abs(a_n (f)) &<= w_f (pi/n),\
    abs(b_n (f)) &<= w_f (pi/n),\
    abs(c_n (f)) &<= (w_f (pi/n))/2.
  $
  В частности, если $f in Lip_alpha M$, то $abs(a_n (f)), abs(b_n (f)), 2 abs(c_n (f)) <= M (pi/n)^alpha$.
]

#proof[
  $
    c_n (f) =
    1/(2pi) integral_(-pi)^pi f(t) e^(-i n t) dif t =^(t = u + pi/n)
    1/(2pi) integral_(-pi - pi/n)^(pi-pi/n) f(u + pi/n) e^(-i n u) e^(-i pi) dif u newline(=)
    -1/(2pi) integral_(-pi)^pi f(u + pi/n) e^(-i n u) dif u ==>
    2 c_n (f) = 1/(2pi) integral_(-pi)^pi (f(t) - f(t + pi/n)) e^(-i n t) dif t newline(==>)
    abs(2 c_n (f)) <= 1/(2pi) integral_(-pi)^pi underbrace(abs(f(t) - f(t + pi/n)), <= w_f (pi/n)) dif t <= w_f (pi/n).
  $
]

#lemma[
  Если $f in C^1$, то 
  $
    c_n (f') &= i n dot c_n (f),\
    b_n (f') &= -i n dot a_n (f),\
    a_n (f') &= i n dot b_n (f).
  $
]

#proof[
  Для остальных коэффициентов аналогично.
  $
    a_n (f') = 1/pi integral_(-pi)^pi f' (t) cos (n t) dif t =
    1/pi (
      lr(f(t) cos(n t) |)_(t = -pi)^(t = pi) +
      integral_(-pi)^pi f(t) dif n sin t dif t
    )
    newline(=)
    n/pi integral_(-pi)^pi f(t) sin (n t) dif t = n b_n (f).
  $
]

#follow[
  Если $f in C_(2pi)^r$ и $f^((r)) in Lip_alpha M$, и $0 < alpha <= 1$, то
  $
    abs(a_n (f)), abs(b_n (f)), 2 abs(c_n (f)) <= M (pi/n)^alpha dot 1/n^r.
  $
  В частности, если $f$ дважды дифференцируема, то ряд Фурье абсолютно сходится.
]

#proof[
  $
    abs(c_n (f)) = abs(c_n (f'))/n = ... = abs(c_n (f^((r))))/n^r <= 1/n^r dot M(pi/n)^alpha.
  $
]

#def[
  _Ядро Дирихле_ --- тригонометрический многочлен
  $
    D_n (t) = 1/2 + sum_(k = 1)^n cos (k t).
  $
]

#props[
  1. $D_n$ --- четная, $2pi$-периодическая функция.
  2. $D_n (0) = n + 1/2$.
  3. $integral_(-pi)^pi D_n (t) dif t = pi$, $integral_0^pi D_n (t) dif t = pi/2$.
  4. При $t != 2pi m$, $D_n (t) = (sin(n + 1/2) t)/(sin t/2)$.
]

#proof[
  1. Очевидно.
  
  2. Очевидно.

  3. Очевидно, +четность.

  4. 
    $
      sin (t/2) D_n (t) = (sin t/2)/2 + sum_(k = 1)^n underbrace(cos(k t) dot sin(t/2), sin(k + 1/2)t - sin (k - 1/2)t) = sin (n + 1/2) t.
    $
]

#denote[
  Пусть $S_n (f, x)$ --- частичная сумма ряда Фурье функции $f$ в точке $x$,
  $
    S_n (f, x) = (a_0 (f))/2 + sum_(k=1)^n (a_k (f) cos (k x) + b_k (f) sin (k x)) = sum_(k = 0)^n A_k (f, x).
  $
]

#lemma[
  $
    S_n (f, x) = 1/pi integral_(-pi)^pi f(x plus.minus t) D_n (t) dif t = 1/pi integral_0^pi (f(x + t) + f(x - t)) D_n (t) dif t.
  $
]

#proof[
  Знаем
  $
    A_k (f, x) = cases(
      1/pi integral_(-pi)^pi f(x - t) dif t\, "при" k = 0,
      1/pi integral_(-pi)^pi f(x - t) cos (k t) dif t\, "при" k > 0.
    )
  $
  Складываем,
  $
    S_n (f, x) = sum_(k = 0)^n A_k (f, x) = 1/pi integral_(-pi)^pi f(x - t) underbrace((1/2 + sum_(k = 1)^n cos (k t)), D_n (t)) dif t.
  $
  Получили формулу для плюса. Для минуса аналогично (или выводится из этой формулы). Из четности получаем второе равенство.
]

#follow[
  Если $f in L^1 [-pi, pi]$, $delta > 0$, то
  $
    S_n (f, x) = 1/pi integral_0^delta (f(x + t) + f(x - t)) D_n (t) dif t + o(1).
  $
]

#proof[
  Знаем
  $
    S_n (f, x) = 1/pi integral_0^pi (f(x + t) + f(x - t)) D_n (t) dif t = 1/pi (integral_0^delta ... + integral_delta^pi ...).
  $
  Надо доказать, что $integral_delta^pi ... --> 0$. Действительно,
  $
    integral_delta^pi (sin (n + 1/2) t)/(sin t/2) (f(x + t) + f(x - t)) dif t -->_(n-->oo) 0
  $
  по лемме Римана-Лебега.
]

#th(name: "принцип локализации")[
  Пусть $f, g in L^1 [-pi, pi]$ и $f$ совпадает с $g$ в $(x - delta, x + delta)$. Тогда ряды Фурье для функций $f$ и $g$ в точке $x$ ведут себя одинаково. Более того, $S_n (f, x) - S_n (g, x) -->_(n -> oo) 0$.
]

#proof[
  $
    S_n (f, x) &= 1/pi integral_0^delta D_n (f(x + t) + f(x - t)) dif t + o(1), \
    S_n (g, x) &= 1/pi integral_0^delta D_n (g(x + t) + g(x - t)) dif t + o(1).
  $
  Вычтем:
  $
    S_n (f, x) - S_n (g, x) = 1/pi integral_0^delta D_n (t) underbrace((f(x + t) - g(x + t) + f(x - t) - g(x - t)), 0) dif t + o(1).
  $
  Сумма под интегралом равна нулю, так как $f = g$ в окрестности $x$. Значит предел равен нулю.
]

#lemma[
  $f in L^1 [-pi, pi]$, $0 < delta < pi$. Тогда интегралы
  $
    integral_0^delta abs(f(t))/t dif t quad "и" quad integral_0^pi abs(f(t))/(2 sin t/2) dif t
  $
  ведут себя одинаково.
]

#proof[
  $integral_delta^pi abs(f(t))/t dif t$ сходится, так как $abs(f(t))/t <= abs(f(t))/delta$. Надо понять, что $integral_0^pi abs(f(t))/t dif t$ и $integral_0^pi abs(f(t))/(2sin t/2) dif t$ ведут себя одинаково. Посмотрим на $t in (0, pi)$. На нем синус можно подпереть снизу и сверху: $t/2 dot 2/pi <= sin t/2 <= t/2$. Значит можно оценить функции под интегралами друг через друга, с какими-то константами:
  $
    pi/2 abs(f(t))/t >= abs(f(t))/(2 sin t/2) >= abs(f(t))/t.
  $
  Значит если один сходится, то другой тоже точно сходится.
]

#denote[
  $
    f(x_0 + 0) &:= lim_(x -> x_0+) f(x),\
    f(x_0 - 0) &:= lim_(x -> x_0-) f(x).
  $ 
]

#def[
  $x_0$ --- регулярная точка функции $f$, если 
  $
    f(x_0)  = (f(x_0 + 0) + f(x_0 - 0))/2.
  $
]

#notice[
  Все точки непрерывности --- регулярные.
]

#def[
  $x_0$ --- точка непрерывности или разрыва первого рода (то есть разрыва, в котором есть левый и правый предел). Положим
  $
    f'_+ (x_0) &:= lim_(h -> 0+) (f(x_0 + h) - f(x_0 + 0))/h,\
    f'_- (x_0) &:= lim_(h -> 0-) (f(x_0 + h) - f(x_0 - 0))/h,\
  $
]

#notice[
  - Для дифференцируемой в $x_0$ функции, это обычная производная.
  - Для функции непрерывной в $x_0$ это левая и правая производные.
]

#denote[
  $f_x^* (t) = f(x + t) + f(x - t) - f(x + 0) - f(x - 0)$.

  В регулярной точке, это просто $f(x + t) - f(x - t) - 2f(x)$.
]

#th(name: "признак Дини")[
  $f in L^1 [-pi, pi]$, $x_0 in (-pi, pi)$ --- точка непрерывности или разрыва первого рода $f$, $0 < delta < pi$. Если 
  $
    integral_0^delta abs(f_(x_0)^* (t))/t dif t
  $
  сходится, то ряд Фурье функции $f$ в точке $x_0$ сходится к $(f(x_0 + 0) + f(x_0 - 0))/2$.
]

#proof[
  Рассмотрим
  $
    S_n (f, x_0) - (f(x_0 + 0) + f(x_0 - 0))/2 newline(=)
    1/pi integral_0^pi D_n (t) (f(x_0 + t) + f(x_0 - t)) dif t -
    1/pi integral_0^pi D_n (t) (f(x_0 + 0) + f(x_0 - 0)) dif t.
  $
  $S_n$ мы выражать умеем, а вторая шутка получилась такой, потому что мы просто ее креативно записали. $f(x_0 + 0) + f(x_0 - 0)$ это константа, ее можно вынести из интеграла, а интеграл ядра Дирихле --- это $pi/2$. Поэтому все сходится. Перепишем через наши обозначения, и распишем ядро Дирихле:
  $
    1/pi integral_0^pi D_n (t) (f(x_0 + t) + f(x_0 - t)) dif t -
    1/pi integral_0^pi D_n (t) (f(x_0 + 0) + f(x_0 - 0)) dif t newline(=)
    1/pi integral_0^pi D_n (t) f_(x_0)^* (t) dif t =
    1/pi integral_0^pi underbrace((f_(x_0)^* (t))/(sin t/2)) sin ((n + 1/2) t) dif t.
  $
  Теперь по лемме Римана-Лебега, это стремится к нулю, если штука над фигурной скобкой суммируема. То есть, если вот такой интеграл сходится:
  $
    integral_0^pi abs(f_(x_0)^* (t))/(sin t/2) dif t.
  $
  По предыдущей лемме, это равносильно тому, что сходится
  $
    integral_0^delta abs(f_(x_0)^* (t))/t dif t.
  $
  Это написано в условии. Доказали.
]

#follow(plural: true)[
  1. Если $x_0$ --- регулярная точка суммируемой $f$ (или, в частности, точка непрерывности), и $integral_0^delta abs(f^*_(x_0) (t))/t dif t < +oo$, то ряд Фурье в $x_0$ сходится к $f(x_0)$.

  2. Пусть $f in L^1 [-pi, pi]$, $x_0$ --- точка непрерывности или разрыва первого рода и существуют конечные $f'_plus.minus (x_0)$. Тогда ряд Фурье в $x_0$ сходится к $(f(x_0 + 0) + f(x_0 - 0))/2$.

  3. Если $f in L^1 [-pi, pi]$ и кусочно дифференцируема, то во всех точках $x in (-pi, pi)$ ряд Фурье сходится к $(f(x + 0) + f(x - 0))/2$. А в точке $pi$, к $(f(pi - 0) + f(-pi + 0))/2$. В частности, если функция непрерывна, то ряд Фурье сходится к $f$ на $(-pi, pi)$.
]

#proof[
  1. Просто частный случай теоремы.

  2. $
      integral_0^delta abs(f^*_plus.minus (t))/t dif t <= integral_0^delta (abs(f(x_0 + t) - f(x_0 + 0))/t + abs(f(x_0 - t) - f(x_0 - 0))/t) dif t.
    $
    Тогда для некоторого $delta$ подынтегральная функция просто ограничена. Значит интеграл сходится. По признаку Дини ряд Фурье сходится к $(f(x_0 + 0) + f(x_0 - 0))/2$.
  
  3. По предыдущему следствию.
]

#example[
  Пусть $f(x) = (pi-x)/2$ при $0 <= x < 2pi$, и переодически продолженная. В музыке такая функция называется Negative Ramp или Sawtooth. Это важно.
  #TODO[график]
  Посчитаем коэффициенты Фурье. Косинусные, очевидно, равны нулю (функция нечетная). Для синусных:
  $
    b_n =
    1/pi integral_0^(2pi) (pi - x)/2 sin (n x) dif x =
    -1/pi integral_0^(2pi) x sin (n x) dif x newline(=)
    -1/(2pi) (- lr(x (cos (n x))/n |)_0^(2pi) + integral_0^(2pi) (cos (n x))/n dif x) = 1/n.
  $
  Значит ряд Фурье это
  $
    sum_(n = 1)^oo (sin (n x))/n.
  $
  По следствию 3,
  $
    sum_(n = 1)^oo (sin (n x))/n = f(x)
  $
  при $x != 2pi m$.

  Еще из этого ряда очевидно следуют:
  $
    sum_(n = 1)^oo (sin (n x))/n = (pi - x)/2 "при" 0 < x < 2pi,\
    sum_(n = 1)^oo (sin (2 n x))/n = pi/2 - x "при" 0 < x < pi,\
    sum_(n = 1)^oo (sin (2 n x))/(2n) = pi/4 - x/2 "при" 0 < x < pi.
  $
  Можем найти знакочередующийся ряд для $f$:
  $
    sum_(n = 1)^oo (-1)^n (sin (n x))/n = 2(pi/4 - x/2) - (pi - x)/2 = -x/2.
  $
  Значит
  $
    2 sum_(n = 1)^oo (-1)^(n + 1) (sin (n x))/n = x
  $
  при $0 < x < pi$, а из нечетности получается, что и при $-pi < x < pi$.


  Это гениальное разложение $x$ в ряд иногда бывает полезно, так как, продолжив его периодически, получится что-то похожее на дробную часть. Это, например, можно использовать в формуле Эйлера-Маклорена.
]

#example(name: "эффект Гиббса")[
  $
    f(x) = sign x = cases(
      1\, "при" x > 0,
      0\, "при" x = 0,
      -1\, "при" x < 0.
    )
  $
  Продолжим ее по периоду на $(-pi, pi)$. Найдем ряд Фурье. Косинусные коэффициенты нулевые. Для синусных:
  $
    b_n = 1/pi integral_(-pi)^pi f(x) sin (n x) dif x = 2/pi integral_0^pi sin (n x) dif x = 2/pi lr(-(cos (n x))/n|)_0^pi = 2/pi (1/n - (-1)^n/n)
  $
  Значит $b_(2n) = 0$, $b_(2n + 1) = 4/(pi(2n + 1))$. Ряд Фурье:
  $
    4/n sum_(n = 1)^oo (sin (2n - 1)x)/(2n - 1) = sign x "при" -pi < x < pi "и " (x != 0).
  $
  #TODO[картинки этой красоты]

  Нетрудно заметить, что около точки разрыва наблюдается всплеск значений частичных сумм. Посмотрим на его величину. Берем производную частичной суммы:
  $
    S'_n (x) = 4/pi sum_(k = 1)^n cos(2k - 1) x = 2/pi (sin (2n x))/(sin x) ==> S'_n (pi/(2n)) = 0.
  $
  Теперь посмотрим на значения там:
  $
    S_n (pi/(2n)) =
    integral_0^(pi/(2n)) S'_n (x) dif x =
    2/pi integral_0^(pi/(2n)) (sin (2n x))/(sin x) dif x =^(y = 2n x)
    2/pi integral_0^pi (sin (y))/(2n sin(y/(2n))) dif y -->^* 2/pi integral_0^pi (sin y)/y dif y.
  $
  Переход к пределу под $*$ можно делать, потому что у нас есть суммируемая мажоранта (придумайте сами)... Этот интеграл равен примерно $1.178...$ Получается, что такой всплеск, величиной примерно в 18% (то есть 9%, если считать что разрыв у нас величины 2 в примере, а не 1), всегда возникает в частичных суммах.
]


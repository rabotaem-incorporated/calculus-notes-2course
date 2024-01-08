#import "../../utils/core.typ": *

== Эйлеровы интегралы

#def(label: "def-euler-integrals")[
  _Эйлеровым интегралом первого рода_, или _Гамма-функцией_, называется
  $ 
    Gamma(p) = integral_0^(+oo) x^(p-1) e^(-x) dif x,
    space p > 0 
  $

  _Эйлеровым интегралом второго рода_, или _Бета-функцией_, называется
  $
    Beta(p, q) = integral_0^1 x^(p-1) (1-x)^(q - 1) dif x,
    space p, q > 0
  $
]

#pr(label: "euler-integrals-converge")[
  Интегралы сходятся.
]

#proof[
  У $Gamma$-функции есть две особенности: в нуле, и на $+oo$.
  - В нуле: $x^(p-1)e^(-x) tilde x^(p-1)$ - сходится т. к. $p - 1 > -1$
  - На бесконечности: с некоторого места, можно подпереть интеграл $x^(p - 1) e^(-x/2)$, а $x^(p-1)e^(-x/2) --> 0$.

  У $Beta$-функции тоже две особенности: в нуле и в единице. 
  - В нуле: $x^(p-1)(1-x)^(q-1) tilde x^(p - 1)$
  - В единице: $x^(p-1)(1-x)^(q-1) tilde (1-x)^(q - 1)$
]

#props(name: [$Gamma$-функции], label: "gamma-props")[
  + #sublabel("plus-1")
    $Gamma(p + 1) = p Gamma(p)$
  + #sublabel("factorial")
    $Gamma(n) = (n-1)!$
  + #sublabel("1/2")
    $Gamma(1/2) = sqrt(pi)$
  + #sublabel("plus-1/2")
    $Gamma(n + 1/2) = (2n-1)!!/2^n sqrt(pi)$
  + #sublabel("inf-continious")
    #sublabel("derivative")
    $Gamma(p) in C^(oo)(RR)$, причем $ Gamma^((n))(p) = integral_0^(+oo) x^(p-1) ln^n (x) e^(-x) dif x. $
  + #sublabel("convex") 
    $Gamma(p)$ строго выпукла
  + #sublabel("limits") 
    $Gamma(p) -->_(p->+oo) +oo$ и $Gamma(p) tilde_(p->0) 1/p$
  + #sublabel("growth-speed")
    При $p --> +oo$,
    $ Gamma(p) tilde sqrt((2pi)/p) e^(-p) p^(p) $
]

#proof[
  + $
      Gamma(p + 1) =^rf("def-euler-integrals")
      integral_0^(+oo) x^p e^(-x) dif x =
      -x^p e^(-x) |_(x=0)^(x=+oo) + integral_0^(+oo) p x^(p-1) e^(-x) =^rf("def-euler-integrals")
      p Gamma(p).
    $

  + $ 
      Gamma(1) =^rf("def-euler-integrals")
      integral_0^(+oo) e^(-x) dif x = 1.
    $

  + $
      Gamma(1/2) =^rf("def-euler-integrals")
      integral_0^(+oo) x^(-1/2) e^(-x) dif x
      =^(y = sqrt(x)) 2 integral_0^ (+oo) e^(-y^2) dif y
      = 2 dot 1/2 integral_(-oo)^(+oo) e^(-y^2) dif y 
      =^rf("gaussian-integral")
      sqrt(pi).
    $
  + 1#rf("gamma-props", "plus-1") + 3#rf("gamma-props", "1/2")

  + По индукции. База --- определенение $Gamma$#rf("def-euler-integrals"). Переход:
    
    Продифференцируем штуку под интегралом из предположния индукции:
    $
      (x^(p-1) ln^n (x) e^(-x))'_p =
      (x^(p-1))'_p ln^n (x) e^(-x) =
      (e^(ln x dot (p-1)))'_p ln^n (x) e^(-x) newline(=)
      e^(ln x dot (p-1)) ln^(n + 1) (x) e^(-x) =
      x^(p-1) ln^(n + 1) (x) e^(-x).
    $
    Чтобы сказать, что производная из интеграла --- интеграл производной, нужно проверить локальное условие лебега#rf("parametric-derivative"). В качестве окрестности $p$ возьмем произвольный интервал $(alpha, beta)$, где $0 < alpha < p < beta$.

    Как и у самой $Gamma$, у производной есть особенности в $0$ и на бесконечноти, поэтому оценивать сверху интеграл будем только там. На произвольном отрезке не содержащем особенностей, функция и так суммируема, как ограниченная#rf("weierstrass").

    На бесконечности: $ln(x) < x ==> x^(p-1) ln^n (x) e^(-x) <= x^(beta + n - 1) e^(-x)$, а интеграл этой штуки не больше $Gamma(beta + n)$, поэтому она суммируема.

    В нуле: для любого $eps > 0$, $x^eps ln(x) -->_(x-->0+) 0$ (можете пролопиталить). Значит $abs(ln(x)) <= c x^(-eps)$ для какой-то константы $c$. Тогда 
    $ x^(p - 1) ln^n (x) e^(-x) <= c^n x^(alpha - n eps - 1), $
    Для любого $alpha > 0$ и $n$ можно выбрать $eps$ так, что $alpha - n eps - 1 > -1$. Значит есть сходимость.

    Нашли мажоранту, значит можно дифференцировать под интегралом, значит индукционных переход доказан.

  + Вторая производная#rf("gamma-props", "derivative") $integral_0^(+oo) x^(p-1) ln^2 (x) e^(-x) dif x$ положительна.

  + Предел при $p --> +oo$ очевиден,
    так как $Gamma$ ведет себя как факториал#rf("gamma-props", "factorial"),
    и монотонно возрастает начиная с какого-то $p$,
    потому что монотонно возрастает где-то ($24 = Gamma(5) > Gamma(3) = 2$, например),
    и выпукла#rf("gamma-props", "convex"). 
    На самом деле возрастание начиная с $p = 1$ но это сложнее.

    Чтобы оценить рост в нуле, оценим $Gamma$ через $Gamma(1)$.
    $
      p Gamma(p) = Gamma(p + 1) -->_(p -> 0) Gamma(1) = 1 ==> Gamma(p) tilde 1/p.
    $
  + Потом#rf("gamma-growth").
]

#props(name: [$Beta$-функции], label: "beta-props")[
  + #sublabel("symm")
    $ Beta(p, q) = Beta(q, p) $

  + #sublabel("zero-inf-integral")
    $ Beta(p, q) = integral_0^(+oo) t^(p-1)/(1+t)^(p+q) dif t  $
]

#proof[
  + $
    Beta(p, q) =^rf("def-euler-integrals")
    integral_0^1 x^(p-1) (1-x)^(q-1) dif x =^(y = 1-x)
    -integral_1^0 y^(q-1) (1-y)^(p-1) dif y =^rf("def-euler-integrals")
    Beta(q, p).
  $
  + $
    Beta(p, q) =^rf("def-euler-integrals")
    integral_0^1 x^(p-1) (1-x)^(q-1) dif x =^(x = t/(t + 1))
    integral_0^(+oo) (t/(t+1))^(p-1) (1/(t + 1))^(q - 1) (dif t)/((1 + t)^2).
  $
]

#th(label: "beta-through-gamma")[
  $
  Beta(p, q) = (Gamma(p) Gamma(q)) / Gamma(p + q)
  $
]

#proof[
  $
    Gamma(p) Gamma(q) =^rf("def-euler-integrals")
    integral_0^(+oo) x^(p - 1) e^(-x) dif x dot
    integral_0^(+oo) y^(q - 1) e^(-x) dif y
    =^rf("independent-2d-prod")
    integral_0^(+oo) integral_0^(+oo) x^(p-1) y^(q - 1) e^(-x - y) dif x dif y
    newline(=^(u = x + y))
    integral_0^(+oo) integral_y^(+oo) (u-y)^(p-1) y^(q - 1) e^(-u) dif u dif y 
    =^rf("tonelli")
    integral_0^(+oo) integral_0^u (u-y)^(p-1) y^(q-1) e^(-u) dif y dif u 
    newline(=^(y = v u))
    integral_0^(+oo) integral_0^1 (u - u v)^(p-1) (u v)^(q-1) e^(-u) u dif v dif u 
    = 
    integral_0^(+oo) integral_0^1 u^p (1 - v)^(p-1) u^(q-1) v^(q-1) e^(-u) dif v dif u
    newline(=^rf("independent-2d-prod"))
    integral_0^(+oo) u^(p+q-1) e^(-u) integral_0^1 (1-v)^(p-1) v^(q-1) dif v dif u 
    =^rf("def-euler-integrals")
    Beta(p, q) Gamma(p + q).
  $
]

#follow(name: "формула дополнения", label: "gamma-complement")[
  $
    Gamma(p) Gamma(1 - p) = pi/sin(pi p), space 0 < p < 1
  $
]

#proof[
  $
    Gamma(p) Gamma(1 - p) =
    Beta(p, 1 - p) Gamma(1) =^rf("beta-props", "zero-inf-integral")
    integral_0^(+oo) t^(p-1)/(1 + t) dif t =
    pi/sin(pi p).
  $
  Интеграл посчитаем потом. Андрей сказал, что нужен комплексный анализ, а нас пока травмировать не будут.
]

#follow(name: "формула удвоения", label: "gamma-double")[
  $
    Gamma(p) Gamma(p + 1/2) = sqrt(pi)/2^(2p - 1) Gamma(2p)
  $
]

#proof[
  Для начала рассмотрим $Beta(p, p)$:
  $
    Beta(p, p) 
    =^rf("def-euler-integrals")
    integral_0^1 (x(1-x))^(p-1) dif x 
    =
    2 integral_0^(1/2) (x(1-x))^(p-1) dif x 
    =^(y = 1/2 - x)
    2 integral_0^(1/2) (1/2 - y)^(p - 1) (1/2 + y)^(p - 1) dif y
    newline(=)
    2 integral_0^(1/2) (1/4 - y^2)^(p-1) dif y
    =^(z = 2y)
    integral_0^1(1/4 - 1/4z^2)^(p-1) dif z
    =^(t = z^2)
    1/(2^(2p-1)) integral_0^1 (1-t)^(p-1) t^(1/2 - 1) dif t 
    =^rf("def-euler-integrals")
    Beta(p, 1/2)/2^(2p - 1).
  $
  Тогда
  $
    (cancel(Gamma(p)) Gamma(p)) / Gamma(2p) =
    (cancel(Gamma(p)) overbrace(Gamma(1/2), sqrt(pi)))/(Gamma(p + 1/2) 2^(2p - 1)) 
    ==>
    Gamma(p) Gamma(p + 1/2) = sqrt(pi)/(2^(2p - 1)) Gamma(2p).
  $
]

#th(label: "gamma-plus-const-growth")[
  $
    Gamma(t + a) tilde t^a Gamma(t), space t --> +oo, a > 0
  $
]

#proof[
  Давайте снова начнем со случайного с виду факта:
  $
    Beta(a, t) = (Gamma(a) Gamma(t))/Gamma(t + a) tilde_(t -> +oo) Gamma(a)/t^a.
  $
  Докажем его:
  $
    Beta(a, t) =^rf("def-euler-integrals")
    integral_0^1 x^(a-1) (1-x)^(t - 1) dif x =^(y = t x)
    integral_0^t y^(a - 1) t^(1 - a) (1 - y/t)^(t-1) 1/t dif y newline(=)
    1/t^a integral_0^(+oo) y^(a-1) (1-y/t)^(t-1) bb(1)_[0, t] dif y.
  $

  Заметим, что подынтегральное выражение имеет предел:
  $
    y^(a-1) (1-y/t)^(t-1) bb(1)_[0, t] -->_(t-->+oo) y^(a-1) e^(-y)
  $
  При больших $t$, $y^(a-1) (1-y/t)^(t-1) < 2 y^(a-1) e^(-y)$ --- а это суммируемая мажоранта. Значит можно перейти к пределу:
  $
    lim_(t -> +oo) t^a Beta(a, t) 
    =
    lim_(t -> +oo) integral_0^(+oo) y^(a-1) (1-y/t)^(t-1) bb(1)_[0, t] dif y 
    =^rf("parametric-limit")
    integral_0^(+oo) y^(a-1) e^(-y) dif y
    =^rf("def-euler-integrals")
    Gamma(a).
  $
  Доказали случайный с виду факт.
  Теперь поймем, что
  $
    (cancel(Gamma(a)) Gamma(t))/Gamma(t + a) tilde_(t -> +oo) cancel(Gamma(a))/t^a
    ==>
    Gamma(t + a) tilde_(t -> +oo) t^a Gamma(t).
  $
]

#follow(label: "gamma-plus-const-growth-uniform")[
  Если $1 < a < 2$, то стремление равномерное (не зависимое от параметра $a$) 

  $
    Gamma(t + a)/(t^a Gamma(t)) arrows.rr 1.
  $
]
#proof[
  Судя по доказательству теоремы, для равномерной сходимости нужно, чтобы $Beta(a, t) dot t^a - Gamma(a)$ равномерно сходилось к нулю. Тогда равномерную сходимость можно будет дотянуть до конца доказательства. Рассмотрим модуль их разности, расписав $Gamma(a)$ по определению:
  $
    abs((integral_0^t y^(a-1) (1-(y/t))^(t-1) dif y) - Gamma(a)) =^rf("def-euler-integrals")
    abs(integral_0^t y^(a-1) (1-(y/t))^(t-1) dif y - integral_0^(+oo) y^(a - 1) e^(-y) dif y)
    newline(<=)
    integral_t^(+oo) y^(a-1) e^(-y) dif y + integral_0^t y^(a-1) abs((1-y/t)^(t-1) - e^(-y)) dif y.
  $
  Оценим интегралы еще сильнее. Первый интеграл не больше $integral_t^(+oo) y e^(-y) dif y$, так как $1 < a < 2$. Второй интеграл можно разбить на два: от $0$ до $1$, и от $1$ до $+oo$. В первом интеграле $y^(a - 1) <= 1$, а во втором, $y^(a - 1) <= y$. Получили слеюдущую оценку сверху, не зависющую от $a$:
  $
    integral_t^(+oo) y e^(-y) dif y + integral_0^1 abs((1-y/t)^(t-1) - e^(-y)) dif y + integral_1^t y abs((1-y/t)^(t-1) - e^(-y)) dif y.
  $
  Первый интеграл сходится к $0$, так как экспонента быстро убывает. Во втором и третьем интеграле под модулем записано определение экспоненты (без предела) минус экспонента, а оно стремиться к нулю, поэтому второй интеграл тоже стремиться к нулю. Ну а третий стремиться к нулю по той же причине, что и в доказательстве теоремы: домножим на $bb(1)_([1, t])$, сделаем предельный переход#rf("gamma-plus-const-growth") --- под интегралом окажется $y dot abs(e^(-y) - e^(-y)) = 0$.
]

#follow(label: "gamma-growth")[
  $ Gamma(p) tilde_(p-->+oo) sqrt((2pi)/p) e^(-p) p^(p). $
]

#proof[
  Для целых $p$ это просто формула Стирлинга#rf("stirling").
  Для остальных рассмотрим $p = n + a$, $1 < a < 2$:

  $
    Gamma(p) =
    Gamma(n + a) tilde^rf("gamma-plus-const-growth")
    Gamma(n) dot n^a =^rf("gamma-props", "factorial")
    (n-1)! dot n^a =
    n! dot n^(a-1) tilde^rf("stirling")
    sqrt(2 pi n) (n/e)^n n^(a-1) newline(=)
    sqrt(2 pi) dot n^(1/2 + n + (a - 1)) dot e^(-n) =
    sqrt(2 pi) dot n^(p - 1/2) dot e^(-n) =
    sqrt((2 pi)/n) dot n^p dot e^(-n) tilde
    sqrt((2 pi)/p) dot n^p dot e^(-n) newline(=)
    sqrt((2 pi)/p) dot (p^p dot (n/p)^p) dot (e^(-p) dot e^(p - n)) =
    sqrt((2 pi)/p) p^p e^(-p) dot ((n/p)^p dot e^a) =
    sqrt((2 pi)/p) p^p e^(-p) dot e^(p ln n/p + a).
  $
  Надо доказать, что $p ln n/p + a --> 0$. Действительно,
  $
    p ln n/p + a = p ln (1 - a/p) + a = p (-a/p + O(p^(-2))) + a = O(p^(-1)) arrows.rr 0.
  $
  Отмечу, что везде сходимость равномерная. В первом переходе по следствию#rf("gamma-plus-const-growth-uniform"), в конце так как получившееся выражение зависит только от $p$. Экспонента равномерно сходится к единице, так как показатель равномерно сходится к нулю. 
  
  Это важно, так как если бы скорость роста для разных $a$ была бы разной, мы бы не могли считать предельных переходы по $n$ по $p$ взаимозаменяемыми. Ну, то есть представьте себе, что чем меньше $a$, тем медленнее сходимость. Тогда если бы мы подставляли $p = n + (1 + 1/n)$, не факт, что предел был бы. Но благодаря равномерности, для любого $eps$ начиная с какого-то $n = N$ по всем $a$ можно оценить сверху через $eps$ значение любого выражения, а значит и для любого $p > n + 2$.
]

#follow(name: "формула Эйлера-Гаусса", label: "euler-gauss")[
  $
    Gamma(p) =
    lim_(n->+oo) (n^p n!)/(p(p + 1)(p + 2)...(p + n))
  $
]

#proof[
  По свойствам гамма-функции#rf("gamma-props", "factorial")#rf("gamma-props", "plus-1") знаем, что
  $
    n!/(p(p+1)...(p+n)) =
    (Gamma(p)Gamma(n + 1))/Gamma(p + n + 1)
  $
  Тогда
  $
    lim_(n->+oo) (n^p n!)/(p(p + 1)(p + 2)...(p + n)) =
    lim_(n->+oo) (n^p dot Gamma(p)Gamma(n + 1))/Gamma(p + n + 1) =^rf("gamma-props", "plus-1")
    lim_(n->+oo) (n^p dot Gamma(p)Gamma(n) dot n)/(Gamma(p + n)(n + p)).
  $
  Так как $n^p Gamma(n) tilde Gamma(n + p)$#rf("gamma-plus-const-growth") при $n -> +oo$:
  $
    lim_(n->+oo) (n^p dot Gamma(p)Gamma(n) dot n)/(Gamma(p + n)(n + p)) =
    lim_(n->+oo) (Gamma(n + p) Gamma(p) dot n)/(Gamma(n + p)(n + p)) =
    lim_(n->+oo) (Gamma(p) dot n)/(n + p) = Gamma(p) dot lim_(n -> +oo) n/(n + p) = Gamma(p).
  $
]

#follow(label: "wallis", name: "формула Валлиса")[
  $
    lim_(n -> +oo) (2n)!!/(2n - 1)!! 1/sqrt(2n + 1) = sqrt(pi / 2).
  $
]

#proof[
  Подставляем $p = 1/2$ в формулу#rf("euler-gauss"):
  $
    Gamma(1/2) =
    lim_(n -> +oo) (sqrt(n) dot n!)/(1/2 dot 3/2 dot ... dot (n + 1/2)) =
    lim_(n -> +oo) (sqrt(n) dot n! dot 2^(n + 1))/(1 dot 3 dot ... dot (2n + 1))
    =
    lim_(n -> +oo) (2 sqrt(n) dot (2n)!!)/(2n + 1)!! 
    newline(==>)
    Gamma(1/2) =^rf("gamma-props", "1/2") sqrt(pi) = lim_(n -> +oo) (2 sqrt(n) dot (2n)!!)/(2n + 1)!! =
    lim_(n -> +oo) (2n)!!/(2n - 1)!! dot (2sqrt(n))/(2n + 1) = \
    lim_(n -> +oo) (2n)!!/(2n - 1)!! dot sqrt(2)/sqrt(2n+1) dot sqrt((2n)/(2n+1)) ==>
    lim_(n -> +oo) (2n)!!/(2n - 1)!! dot 1/(sqrt(2n + 1)) = sqrt(pi/2).
  $
]

#examples[
  + $
    product_(k = 0)^n (3k + 1) =
    1 dot 4 dot 7 dot ... dot (3n + 1) =
    3^(n+1) dot 1/3 dot (1 + 1/3) dot ... dot (n + 1/3) tilde (3^(n+1) n^(1/3) n!)/Gamma(1/3).
  $

  + $
    integral_0^(+oo) e^(-x^p) dif x, p > 0 =^(y = x^p)
    integral_0^(+oo) 1/p y^(1/p - 1) e^y dif y =
    1/p Gamma(1/p) =
    Gamma(1 + 1/p).
  $
  + $
      integral_0^(pi/2) sin^(p-1) x cos^(q - 1) x dif x =^(y = sin^2 x)
      1/2 integral_0^1 y^((p-2)/2) (1-y)^((q-2)/2) dif y =
     1/2 Beta(p/2, q/2).
    $
    В частности 
    $
      integral_0^(pi/2) sin^(p-1) x dif x = 1/2 Beta(p/2, 1/2) = 1/2 (Gamma(p/2)sqrt(pi))/Gamma((p + 1)/2).
    $

  4. $V_n (r)$ - объем $n$-мерного шара радиуса $r$.

    Распишем объем через объем единичного шара $C_n$: $V_n (r) = r^n C_n$. Воспользуемся принципом Кавальери#rf("cavalieri") и "откусим" одну координату:
    $
      C_n = integral_(-1)^1 V_(n-1) (sqrt(1-x^2)) dif x =
      integral_(-1)^1 (1-x^2)^((n-1)/2) C_(n-1) dif x =
      2 integral_0^1 (1-x^2)^((n-1)/2) C_(n-1) dif x
      newline(=^(x = sin phi))
      2 C_(n-1) integral_0^(pi/2) cos^n phi dif phi =
      C_(n-1) (Gamma((n+1)/2)sqrt(pi))/Gamma((n + 2)/2).
    $
    Значит по индукции,
    $
      C_n = C_1 (pi^((n-1)/2) Gamma(3/2))/Gamma((n+2)/2) = pi^(n/2)/Gamma(n/2+1). 
    $
]
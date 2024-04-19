#import "../../utils/core.typ": *

== Гильбертовы пространства

#remind(name: "Скалярное произведение")[
  Если $X$ --- векторное пространство, то $dotp(dot, dot): X times X --> CC$ --- скалярное произведение, если
  1. $dotp(x, x) >= 0$, $dotp(x, x) = 0 <==> x = arrow(0)$
  2. $dotp(x, y) = cj(dotp(y, x))$
  3. $dotp(x + y, z) = dotp(x, z) + dotp(y, z)$
  4. $dotp(alpha x, y) = alpha dotp(x, y)$
  Следовательно,
  - $dotp(x, y + z) = dotp(x, y) + dotp(x, z)$.
  - $dotp(x, alpha y) = cj(alpha) dotp(x, y)$
]

#def[
  $H$ называется _Гильбертовым пространством_, если в $H$ есть скалярное произведение, и $H$ --- полное (то есть сходимость в нем равносильна фундаментальности).
]

#examples[
  + $RR^d$, $dotp(x, y) = sum_(k=1)^d x_k cj(y_k)$,
  + $CC^d$, $dotp(x, y) = sum_(k=1)^d x_k cj(y_k)$,
  + $l^2$: $dotp(x, y) = sum_(k=1)^oo x_k cj(y_k)$,
  + $L^2 (E mu)$: $dotp(x, y) = integral_E f cj(g) dif mu$.
]

#lemma[
  Если ряд $sum_(n=1)^oo x_n$ сходится, то 
  $
    dotp(sum_(n=1)^oo x_n, y) = sum_(n=1)^oo dotp(x_n, y).
  $
]

#proof[
  Рассмотрим $S_n := sum_(k=1)^n x_k --> S := sum_(k=1)^oo x_k$. Тогда
  $
    dotp(S, y) <-- dotp(S_n, y) = dotp(sum_(k=1)^n x_k, y) = sum_(k=1)^n dotp(x_k, y) --> sum_(k=1)^oo dotp(x_k, y)
  $
]

#def[
  Векторы $x$ и $y$ _ортогональны_, если их скалярное произведение 0. Обозначается $x perp y$.

  Ряд $sum_(n=1)^oo x_n$ назовем _ортогональным_, если $dotp(x_k, x_n) = 0$ для всех $n != k$.
]

#th[
  Пусть $H$ --- гильбертово пространсво, $sum_(n=1)^oo x_n$ --- ортогональный ряд в $H$. Тогда этот ряд сходится тогда и только тогда, когда числовой ряд $sum_(n=1)^oo norm(x_n)^2$ сходится. В этом случае, $norm(sum_(n=1)^oo x_n)^2 = sum_(n=1)^oo norm(x_n)^2$.
]

#proof[
  Пусть $S_n := sum_(k=1)^n x_k$, $C_n := sum_(k=1)^n norm(x_k)^2$.
  $
    sum_(n=1)^oo x_n "сходится" <==> S_n "сходится" <==> S_n "фундаментальна" newline(<==>)
    forall eps > 0 space exists N space forall n, m >= N space norm(S_n - S_m) < eps.
  $
  Оценим квадрат нормы разности:
  $
    norm(S_n - S_m)^2 = norm(sum_(k = m+1)^n x_k)^2 = dotp(sum_(k=m+1)^n x_k, sum_(j=m+1)^n x_j) newline(=) sum_(j,k=m+1)^n underbrace(dotp(x_k, x_j), 0 "если" k != k) = sum_(k = m+1)^n norm(x_k)^2 = C_n - C_m.
  $
  Получается, $S_n$ фундаментальна тогда и только тогда, когда $C_n$ фундаментальна. Это как раз равносильно тому, что $S_n$ сходится тогда и только тогда, когда $C_n$ сходится. Более того,
  $
    norm(sum_(n=1)^oo x_n)^2 = dotp(sum_(n=1)^oo x_n, sum_(k=1)^oo x_k) = sum_(n=1)^oo sum_(k=1)^oo underbrace(dotp(x_n, x_k), 0 "если" n != k) = sum_(n=1)^oo norm(x_n)^2.
  $
]

#follow[
  Если ортогональный $sum_(n=1)^oo x_n$ сходится, $phi: NN --> NN$ --- перестановка, то $sum_(n=1)^oo x_(phi(n))$ --- сходится к той же сумме.
]

#proof[
  Сходимость понятна:
  $
    sum_(n=1)^oo x_n "сходится" <==> sum_(n=1)^oo norm(x_n)^2 "сходится" <==> sum_(n=1)^oo norm(x_(phi(n)))^2 "сходится" <==> sum_(n=1)^oo x_(phi(n)) "сходится".
  $
  Найдем предел:
  $
    norm(sum_(n=1)^oo x_n - sum_(n=1)^oo x_(phi(n)))^2 =
    norm(sum_(n=1)^oo (x_n - x_(phi(n))))^2 =
    dotp(sum_(n=1)^oo (x_n - x_(phi(n))), sum_(k=1)^oo (x_k - x_(phi(k)))) newline(=)
    sum_(n=1)^oo sum_(k=1)^oo dotp(x_n - x_(phi(n)), x_k - x_(phi(n))) =
      sum_(k,n)^oo underbrace(dotp(x_n, x_k), 0 "если" k != n) -
      sum_(k,n=1)^oo underbrace(dotp(x_(phi(n)), x_k), 0 "если" k != phi(n)) -
      sum_(k,n=1)^oo underbrace(dotp(x_n, x_(phi(n))), 0 "если" n != phi(k))
    newline(=)
      sum_(n=1)^oo norm(x_n)^2
      - cancel(sum_(n=1)^oo norm(x_(phi(n)))^2)
      - sum_(k=1)^oo norm(x_(phi(k)))^2
      + cancel(sum_(n=1)^oo norm(x_(phi(n)))^2)
    = 0.
  $
]

#def[
  $x_1$, $x_2$, $x_3$, ... --- _ортогональная система_, если $norm(x_k) != 0$ и $dotp(x_k, x_n) = 0$ для всех $k != n$.
]

#def[
  $x_1$, $x_2$, $x_3$, ... --- _ортонормированная система_, если $norm(x_k) = 1$ и $x_k perp x_n$ для любого $k != n$.
]

#notice[
  Ортогональная система линейно независима:
  Пусть
  $
    sum_(k=1)^n c_k x_k = 0.
  $
  Тогда
  $
    0 = dotp(sum_(k=1)^n c_k x_k, x_j) = sum_(k=1)^n c_k underbrace(dotp(x_k, x_j), 0 "если" k != j) = c_j norm(x_j)^2 ==> c_j = 0.
  $
]

#examples(name: "огтогональных систем")[
  1. $e_n = (0, 0, ..., 0, 1, 0, 0, ...)$ --- орты в $l^2$ --- ортонормированная система в $l^2$.
  2. $1$, $cos t$, $sin t$, $cos 2t$, $sin 2t$, ... --- ортогональная система в#footnote[по умолчанию считаем, что пространство Лебега построено по мере Лебега] $L^2 [0, 2pi]$.
  3. $e^(i n t)$, $n in ZZ$ --- ортогональная система в $L^2 [0, 2pi]$:
    $
      dotp(e^(i n t), e^(i m t)) = integral_0^(2pi) e^(i n t) dot cj(e^(i m t)) dif t = integral_0^(2pi) e^(i (n - m) t) dif t = cases(2pi "при" n = m, 0 "иначе").
    $
  4. $1$, $cos t$, $cos 2t$, $cos 3t$, ... --- ортогональная система в $L^2 [0, pi]$.
  5. $sin t$, $sin 2t$, $sin 3t$, ... --- ортогональная система в $L^2 [0, pi]$.
]

#th[
  $e_1$, $e_2$, ... --- ортогональная система в гильбертовом пространстве $H$, $x = sum_(n=1)^oo c_n e_n$. Тогда $ c_n = dotp(x, e^n)/norm(e_n)^2. $
]

#proof[
  $
    dotp(x, e_n) = dotp(sum_(k=1)^oo c_k e_k, e_n) = sum_(k=1)^oo c_k underbrace(dotp(e_k, e_n), 0 "если" k != n) = c_n dot dotp(e_n, e_n) = c_n norm(e_n)^2.
  $
]

#def[
  $e_1$, $e_2$, ... --- ортогональная система в гильбертовом пространстве $H$, $x in H$. Тогда
  $
    c_n (x) = dotp(x, e_n)/norm(e_n)^2
  $
  называется _коэффициентом Фурье_ вектора $x$ по системе $e_1$, $e_2$, ....
  
  Ряд $sum_(n=1)^oo c_n (x) e_n$ назовем _рядом Фурье_ для вектора $x$ по системе $e_1$, $e_2$, .... Мы пока ничего не знаем про его свойства, например про то, сходится ли он вообще.
]

#notice(plural: true)[
  1. Если $x = sum_(n=1)^oo c_n e_n$, то это его ряд Фурье.
  2. $n$-е сгалаемое ряда Фурье --- проекция вектора $x$ на прямую натянутую на вектор $e_n$, то есть $x = c_n (x) e_n + z$, где $z perp e_n$. $z = x - c_n (x) e_n$, значит $dotp(z, e_n) = dotp(x, e_n) - c_n (x) dotp(e_n, e_n) = 0$.
]

#th(name: "свойства частичных сумм ряда Фурье")[
  Пусть $e_1$, $e_2$, ... --- ортогональная система, $x in H$, $S_n := sum_(k = 1)^n c_k (x) e_k$, $Ll_n := Lin {e_1, e_2, ..., e_n}$. Тогда
  1. $S_n$ --- ортогональная проекция $x$ на $Ll_n$, то есть $x = S_n + z$, где $z perp Ll_n$.
  2. $S_n$ --- наилучшее приближение к $x$ в $Ll_n$, то есть $norm(S_n - x) = min_(y in Ll_n) norm(y - x)$.
  3. $norm(S_n) <= norm(x)$.
]

#proof[
  1. $z = x - S_n$. Достаточно доказать, что $z perp e_k$ для всех $k = 1, ..., n$.
    $
      dotp(z, e_k) = dotp(x - sum_(j=1)^n c_j (x) e_j, e_k) = dotp(x, e_k) - sum_(j=1)^n c_j (x) underbrace(dotp(e_j, e_k), 0 "если" k != j) = dotp(x, e_k) - c_k (x) norm(e_k)^2.
    $
  2. $x - y = underbrace(S_n - y, in Ll_n) + underbrace(z, perp Ll_n)$. Значи это сумма двух ортогональных векторов, а тогда
    $
      norm(x - y)^2 = norm(S_n - y)^2 + norm(z)^2 >= norm(z)^2 = norm(x - S_n)^2
    $
    и равенство достигается при $S_n = y$. Значит это и правда минимум.

  3. $x = S_n + z$, $S_n in Ll_n$, $z perp Ll_n$. Тогда
    $
      norm(x)^2 = norm(z)^2 + norm(S_n)^2 >= norm(S_n)^2.
    $
]

#follow(name: "неравенство Бесселя")[
  $
    sum_(n = 1)^oo abs(c_n (x))^2 norm(e_n)^2 <= norm(x)^2.
  $
]

#proof[
  $
    norm(x)^2 >= norm(S_n)^2 = sum_(k=1)^n norm(c_k (x) e_k)^2 = sum_(k = 1)^n abs(c_k (x))^2 norm(e_k)^2
  $
  и устремляем $n$ в $oo$. 
]

#th(name: "Рисса-Фишера")[
  $H$ --- гильбертово пространсво, $x in H$, $e_1$, $e_2$, $e_3$, ... --- ортогональная система в $H$. Тогда
  1. Ряд Фурье для $x$ сходится.
  2. $x = sum_(n = 1)^oo c_n (x) e_n + z$, где $z perp e_n$ для всех $e_n$.
  3. $x = sum_(n = 1)^oo c_n (x) e_n$ тогда и только тогда, когда $norm(x)^2 = sum_(n = 1)^oo abs(c_n (x))^2 norm(e_n)^2$.
  Третий пункт известен как тождество Парсеваля.
]

#proof[
  1. Знаем $sum_(n=1)^oo norm(c_n (x) e_n)^2 <= norm(x)^2$ (неравенство Бесселя), значит $sum_(n=1)^oo c_n (x) e_n$ --- сходится.
  2. $z = x - sum_(k = 1)^oo c_k (x) e_k$.
    $
      dotp(z, e_n) = dotp(x, e_n) - sum_(k=1)^oo c_k (x) underbrace(dotp(e_k, e_n), 0 "если" k != n) = dotp(x, e_n) - c_n (x) dotp(e_n, e_n) = 0.
    $
  3. $z perp sum_(k = 1)^oo c_k (x) e_k$, $0 = dotp(z, S_n) --> dotp(z, S)$. Значит
    $
      norm(x)^2 = norm(z^2) + norm(sum_(k=1)^oo c_k (x) e_k)^2 = norm(z)^2 + sum_(k=1)^oo abs(c_k (x))^2 norm(e_k)^2.  
    $
]

#notice[
  1. $S = sum_(k=1)^oo c_k (x) e_k$ --- ортогональная проекция на $Cl Lin {e_1, e_2, ...}$.
  2. Если $sum_(k=1)^oo abs(c_k)^2 norm(e_k)^2 < +oo$, то найдется $x$ такой, что $sum_(k=1)^oo c_k e_k$ --- его ряд Фурье.
]

#def[
  $e_1$, $e_2$, ... --- ортогональная система в $H$.
  1. $e_1$, $e_2$, ... --- _базис_, если для любого $x in H$, $x = sum_(n=1)^oo c_n (x) e_n$.
  2. $e_1$, $e_2$, ... --- _полная система_, если не сущесвует $z perp e_n$ для любого $n$, то $z = 0$.
  3. $e_1$, $e_2$, ... --- _замкнутая система_, если для любого $x in H$, $norm(x)^2 = sum_(n=1)^2 sum_(n=1)^oo abs(c_n (x))^2 norm(e_n)^2$.
]

#th[
  Следующие условия равносильны:
  1. $e_1$, $e_2$, ... --- базис.
  2. $forall x, y in H space dotp(x, y) = sum_(n=1)^oo c_n (x) cj(c_n (y)) norm(e_n)^2$.
  3. $e_1$, $e_2$, ... --- замкнутая система
  4. $e_1$, $e_2$, ... --- полная
  5. $Cl Lin {e_n} = H$.
]

#proof[
  - "$1==>2$": $dotp(x, y) = dotp(sum_(k = 1)^oo c_k (x) e_k, sum_(n=1)^oo c_n (y) e_n)$. Надо раскрыть скобки и все получится.
  - "$2==>3$": Берем $y = x$.
  - "$3==>4$": Пусть $z perp e_n$ для любого $n$. Тогда $c_n (z) = 0$ для любого $n$, и по тождеству Парсеваля $norm(z)^2 sum_(n = 1)^oo abs(c_n (z))^2 norm(e_n)^2 = 0$.
  - "$4==>1$": $x = sum_(n=1)^oo c_n (x) e_n + z$, где $z perp e_n$ для любого $n$. Значит $z = 0$.
  - "$1==>5$": $x = sum_(n=1)^oo c_n (x) e_n <-- sum_(k = 1)^n c_k (x) e_k in Lin {e_n}$, значит любой $x$ лежит в замыкании, и $H subset Cl Lin {e_n}$.
  - "$5==>1$": $z perp e_n$ для любого $n$. Тогда $z perp Lin {e_n}$, значит $z perp Cl Lin {e_n} = H$, значит $z perp z$, значит $z = 0$.
]



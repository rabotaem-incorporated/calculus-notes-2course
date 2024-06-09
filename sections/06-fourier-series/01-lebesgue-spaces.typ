#import "../../utils/core.typ": *

== Пространства Лебега

#def[
  $(X, Aa, mu)$ --- пространство с мерой, $E in Aa$, $1 <= p < +oo$. Тогда _пространство Лебега $L^p$_ --- это
  $
    L^p (E, mu) := {
      f: E --> overline(RR) "или" overline(CC) "измеримые"
      space mid(|) space
      integral_E abs(f)^p dif mu < +oo
    }.
  $
  _Нормой_ в этом пространстве является
  $
    norm(f)_p = norm(f)_(L^p (E, mu)) := (integral_E abs(f)^p dif mu)^(1/p).
  $
]

#props[
  1. $norm(alpha f)_p = abs(alpha) norm(f)_p$.
  2. $norm(f + g)_p <= norm(f)_p + norm(g)_p$.
  3. $norm(f)_p >= 0$.
  4. Если $norm(f)_p = 0$, то $f = 0$ почти везде на $E$.
]

#notice[
  Есть только проблема: не выполняется свойство нормы о том, что норма равна нулю тогда и только тогда, когда функция равна нулю. Но это не так страшно.
  Будем рассматривать функции с точностью до совпадения почти везде. На таких классах эквивалентности такая норма --- и правда норма.
]

#notice[
  У такого класса эквивалентности не определено значение в точке.
]

#def[
  _Существенный супремум_ --- обозначается $esssup$ или $op("vrai sup")$ --- это
  $
    esssup f := inf { C in RR : f(x) <= C "при почти всех" x }.
  $
]

#props[
  1. $esssup f <= sup f$.
  2. $f(x) <= esssup f$ при почти всех $x$.
]

#proof[
  1. Очев.
  2. Пусть $a := esssup f$. Тогда $f(x) <= a + 1/n$ при почти всех $x$, то есть существует $e_n$, такие, что $f(x) <= a + 1/n$ при $x in E without e_n$. Тогда если $e := Union_(n = 1)^oo e_n$, то $mu e = 0$ и $f(x) <= a + 1/n$ для любого $x in E without e$. Переходим к пределу по $n$.
]

#def[
  $(X, Aa, mu)$ --- пространство с мерой, $E in Aa$. Тогда _пространство Лебега $L^oo$_ --- это
  $
    L^oo (E, mu) := {
      f: E --> overline(RR) "или" overline(CC) "измеримые"
      space mid(|) space
      esssup abs(f) < +oo
    }.
  $
  _Нормой_ в этом пространстве является
  $
    norm(f)_oo = norm(f)_(L^oo (E, mu)) := esssup abs(f)
  $
  на тех же классах эквивалентности.
]

#example(name: "важный частный случай")[
  При $E = NN$ получается, что $mu$ --- считающая мера.
  
  Такое пространство обозначается $l^p := L^p (NN, mu)$.
  
  Все функции в таком пространстве --- последовательности. Классы эквивалентности здесь не нужны, потому что мера любой точки равна $1$.

  Норма последовательности --- это
  $
    norm(x)_p := (sum_(n = 1)^oo abs(x_n)^p)^(1/p), quad
    norm(x)_oo := sup abs(x_n).
  $
]

#th(name: "неравенство Гельдера")[
  Пусть $1/p + 1/q = 1$, $1 <= p, q <= +oo$. Тогда для любых $f in L^p (E, mu)$ и $g in L^q (E, mu)$ верно
  $
    norm(f g)_1 <= norm(f)_p norm(g)_q.
  $
]

#proof[
  Если $p, q > 1$, то это просто неравенство Гельдера нам уже известное:
  $
    integral_E abs(f g) dif mu <= (integral_E abs(f)^p dif mu)^(1/p) (integral_E abs(g)^q dif mu)^(1/q).
  $
  Если $p = +oo$, то это неравенство вида
  $
    integral_E abs(f g) dif mu <= esssup abs(f) dot integral_E abs(g) dif mu,
  $
  что, очевидно, верно. Аналогично для $q = +oo$.
]

#th(name: "вложение в пространство Лебега")[
  Если $mu E < +oo$, то при $p < q$, $L^q (E, mu) subset L^p (E, mu)$, и норма вложения оценивается как
  $
    norm(f)_p <= norm(f)_q (mu E)^(1/p - 1/q).
  $
]

#proof[
  Достаточно доказать неравенство на нормы, так как из него следует вложение по определению.

  Воспользуемся неравенством Гельдера для $r = q / p$ и $s = r/(r - 1)$.

  $
    norm(f)_p^p =
    integral_E abs(f)^p dif mu =
    integral_E abs(f)^p norm(1)_s dif mu newline(<=)
    (integral_E (abs(f)^p)^r dif mu)^(1/r) dot (integral_E 1^s dif mu)^(1/s) =
    (integral_E abs(f)^q dif mu)^(p/q) dot (mu E)^(1 - p/q).
  $

  Отсюда получаем требуемое.
]

#notice[
  Если $mu E = +oo$, то вложения нет.
]

#exercise(plural: true)[
  1. Пусть $E = RR$, $mu = lambda_1$, $p < q$. Придумайте пример функции, что $f in L^q$, но $f in.not L^p$.
  2. Доказать, что если $p < q$, то $l^p subset l^q$.
]

#remind[
  Метрическое пространство называется _полным_, если в нем любая фундаментальная последовательность сходится. В полных метрических пространствах верна куча классных утверждений.
]

#th[
  Пространства $L^p (E, mu)$ --- полные.
]

#proof[
  Мы будем доказывать теорему для $p < +oo$, хотя для $p = +oo$ теорема тоже верна, просто доказывается противно. К тому же, мы не будем даже пользоваться этой теоремой в таком стремном случае.

  Рассмотрим фундаментальную последовательность $f_n$, то есть такую, что
  $
    forall eps > 0 space exists N space forall n, m >= N space norm(f_n - f_m)_p < eps.
  $
  Рассмотрим всякие $eps$:
  $
    eps &= 1/2: quad &&exists n_1 quad &forall n, m >= n_1 quad norm(f_m - f_n)_p &< 1/2, \
    eps &= 1/4: quad &&exists n_2 >= n_1 quad &forall n, m >= n_2 quad norm(f_m - f_n)_p &< 1/4, \
    eps &= 1/8: quad &&exists n_3 >= n_2 quad &forall n, m >= n_3 quad norm(f_m - f_n)_p &< 1/8, \
    #hide[$dots.v$] #place(dy: -0.15cm, stack(spacing: 1cm, dir: ltr, ..for _ in range(9) { ($dots.v$,) })) \
    eps &= 1/2^k: quad &&exists n_k >= n_(k - 1) quad &forall n, m >= n_k quad norm(f_m - f_n)_p &< 1/2^k.
  $

  Тогда $norm(f_(n_k) - f_(n_(k + 1)))_p < 1/2^k$ для любого $k$, а значит $ sum_(k = 1)^oo norm(f_(n_k) - f_(n_(k + 1)))_p < 1. $
  Обозначим
  $
    S(t) &:= sum_(k = 1)^oo abs(f_(n_k) (t) - f_(n_(k + 1)) (t)), \
    S_m (t) &:= sum_(k = 1)^m abs(f_(n_k) (t) - f_(n_(k + 1)) (t)).
  $
  Тогда
  $
    norm(S_m)_p = norm(sum_(k = 1)^m abs(f_(n_k) - f_(n_(k + 1))))_p <= sum_(k = 1)^m norm(f_(n_k) - f_(n_(k + 1)))_p < 1.
  $
  И
  $
    integral_E S^p dif mu = integral_E lim S_m^p dif mu <=^"л. Фату" liminf underbrace(integral_E S_m^p dif mu, norm(S_m)^p < 1) <= 1.
  $
  Значит $S$ почти везде конечна, $sum_(k = 1)^oo abs(f_(n_k) - f_(n_(k + 1)))$ сходится при почти всех $t$, а значит
  $
    f_(n_1) (t) + sum_(k = 1)^oo (f_(n_(k + 1)) (t) - f_(n_k) (t))
  $
  сходится при почти всех $t$. А частичная сумма этого ряда --- это $f_(n_m) (t)$, так как все остальные члены ряда сократяться при раскрытии телескопической суммы. Получается, существует
  $
    lim_(m -> oo) f_(n_m) (t) =: f(t)
  $
  при почти всех $t$.

  Проверим, что это на самом деле сходимость по норме. Мы знаем
  $
    norm(f_n - f_n_k) < 1/2^m "при всех" n >= n_m, k >= m,
  $
  или, если раскрыть определение нормы,
  $
    integral_E abs(f_n (t) - f_n_k (t))^p dif mu < 1/2^(k p),
  $
  Тогда рассмотрим разность $f_n (t) - f(t)$ и докажем, что ее норма стремится к нулю:
  $
    integral_E abs(f_n (t) - f(t))^p =
    integral_E lim_(k -> oo) abs(f_n (t) - f_n_k (t))^p dif mu newline(<=^"Фату")
    liminf_(k -> oo) integral_E abs(f_n (t) - f_n_k (t))^p dif mu <
    1/2^(m p) "при" n >= n_m and k >= m.
  $
  Тогда
  $
    norm(f_n - f)^p <= 1/2^(m p) "при" n >= n_m ==> norm(f_n - f) < 1/2^m.
  $
]

#def[
  Если $(X, rho)$ --- метрическое пространство, и $A subset X$, то $A$ называют _всюду плотным_, если $Cl A = X$.
]

#example[
  В $(RR, abs(x - y))$, $QQ$ --- всюду плотно.
]

#def[
  $f: E --> RR$ _ступенчатая_, если она принимает лишь конечное число значений#footnote[Отличие от простых в том, что иногда простыми считают только неотрицательные функции. Мы так не делали, но на всякий случай, чтобы было соответствие понятий с другими источниками, будем говорить так].
]

#lemma[
  Пусть $1 <= p < +oo$. Тогда ступенчатая функция $phi in L^p (E, mu)$ тогда и только тогда, когда $mu E {phi != 0} < +oo$.
]

#proof[
  Пусть $a_1$, $a_2$, ..., $a_n$ --- все ненулевые значения $f$. $A_1$, $A_2$, ..., $A_n$ --- множества, на которых они принимаются. Тогда
  $
    norm(f)_p^p = integral_E abs(f)^p dif mu = sum_(k = 1)^n abs(a_k)^p mu A_k < +oo <==> mu A_k < +oo "для всех" k.
  $
  Значит, $E{phi != 0} = Union_(k = 1)^n A_k$.
]

#th[
  Пусть $1 <= p <= +oo$. Тогда множество ступенчатых функций из $L^p (E, mu)$ всюду плотно в $L^p (E, mu)$.
]

#proof[
  - Если $p = +oo$, то берем представителя класса эквивалентности, у которого $abs(f) <= norm(f)_oo$. Про него мы знаем, что найдутся неотрицательные ступенчатые (простые) функции $phi_n arrows f_+$ и $psi_n arrows f_-$. Тогда $phi_n - psi_n arrows f_+ - f_- = f$. Тогда $sup abs((phi_n - psi_n) - f) --> 0$, а значит $esssup abs(...)$ нем более, и $norm((phi_n - psi_n) - f)_oo --> 0$.

  - Если $1 <= p < +oo$, то возьмем неотрицательные ступенчатые $phi_n arrow.tr f_+$ и $psi_n arrow.tr f_-$. Тогда $ norm(f_+ - phi_n)_p^p = integral_E (f_+ - phi_n)^p dif mu -->^"т. Лебега" 0, $
    где $f_+^p <= abs(f)^p$ --- суммируемая Мажоранта. Аналогично, $norm(f - phi_n) --> 0$, и
    $
      norm((f_+ - f_-) - (phi_n - psi_n))_p <= norm(f_+ - phi_n)_p + norm(f_- - psi_n)_p --> 0.
    $
]

#def[
  $f$ --- _финитная функция_, если $f = 0$ вне какого-то компакта.
]

#th[
  Пусть $1 <= p < +oo$ и $E subset RR^m$ измеримое.
  Тогда множество бесконечно дифференцируемых финитных функций плотно в $L^p (E, lambda_m)$.
]

#proof[
  Без доказательства. Но идея примерно такая: знаем, что ступенчатые функции плотны, поэтому надо приблизить ступенчатую функцию бесконечно дифференцируемой. Для этого надо приблизить одну ступеньку, а ее можно приблизить кучей открытых прямоугольников. Ну их мы придумаем как приближать: надо рассмотреть гладкие функции которые примерно как индикаторы, но на границах вместо скачка делают все более и более быстрый гладкий подъем. Короче, надо возиться, чтобы это формализовывать, мы не будем.
]

#def[
  Пусть $f: RR^d --> RR$, $h in RR^d$. Тогда $f_h (x) := f(x + h)$ --- _сдвиг функции_ на вектор $h$.
]

#th(name: "о непрерывности сдвига")[
  1. Если $f$ равномерно непрерывна на $RR^d$, то $norm(f - f_h)_oo -->_(h -> 0) 0.$
  2. Если $f in L^p (RR^d, lambda_d)$ при $1 <= p < +oo$, то $norm(f - f_h)_p -->_(h -> 0) 0.$
  3. Если $f in C(RR)$ и $2pi$-периодична, то $norm(f - f_h)_oo -->_(h -> 0) 0$.
]

#proof[
  1. $norm(f - f_h)_oo <= sup_(x in RR^d) abs(f(x) - f(x + h)) --> 0$ из определения равномерной непрерывности.
  3. На каждом периоде есть равномерная непрерывность, а значит и везде она есть.
  2. Возьмем $eps > 0$ и непрерывную финитную функцию $g$ такую, что $norm(f - g)_p < eps$. Тогда
    $
      norm(f - f_h)_p <= underbrace(norm(f - g)_p, < eps) + norm(g - g_h)_p + underbrace(norm(g_h - f_h)_p, < eps) = 2 eps + norm(g - g_h)_p.
    $
    Надо доказать, что $norm(g - g_h)_p < eps$ при малых $h$. Доказываем,
    $
      norm(g - g_h)_p^p = integral_(RR^d) abs(g (x) - g (x + h))^p dif mu (x).
    $
    Так как $g$ --- финитная, то $g = 0$ вне шара $B_R (0)$, а так как $g_h$ --- просто немного сдвинутая $g$, она тоже равна нулю вне $B_(R + 1) (0)$. Тогда
    $
      norm(g - g_h)_p^p =
      integral_(RR^d) abs(g (x) - g (x + h))^p dif mu (x) =
      integral_(B_(R+1) (0)) abs(g (x) - g (x + h))^p dif mu (x) newline(<=)
      lambda B_(R + 1) (0) dot underbrace(sup_(x in B_(R + 1) (0)) abs(g(x) - g(x + h)), --> 0).
    $
]

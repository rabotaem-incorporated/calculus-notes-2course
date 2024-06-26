#import "../../utils/core.typ": *

== Ряды Лорана

#ticket[Ряд Лорана. Кольцо сходимости. Единственность.]

#def[
    _Ряд Лорана_ --- ряд вида
    $
        sum_(n = -oo)^(oo) c_n (z - z_0)^n.
    $
    _Правильной частью_ ряда Лорана называется $sum_(n = 0)^oo c_n (z - z_0)^n$.
    _Главной частью_ ряда Лорана называется $sum_(n = -oo)^(-1) c_n (z - z_0)^n = sum_(m = 1)^oo c_(-m) (z - z_0)^(-m)$.

    Ряд _сходится_, если сходится его правильная и главная части.

    Далее мы будем писать все ряды при $z_0 = 0$.
]

#props[
    1. Существуют $0 <= r <= R  <= +oo$ такие, что ряд Лорана $sum_(n = -oo)^oo c_n z^n$ сходится при $r < abs(z) < R$ и расходится при $abs(z) < r$ или $abs(z) > R$.
]

#proof[
    1. $R$ --- радиус сходимости правильной части. Что с главной частью?
        $ sum_(m = 1)^oo c_(-m) (1/z)^m = sum_(m = 1)^oo c_(-m) w^m. $
        Это ряд, у которого есть радиус сходимости $tilde(R)$. Если $abs(w) < tilde(R)$, то ряд расходится, то есть если $abs(1/z) < tilde(R)$, или $abs(z) > 1/tilde(R)$. Аналогично, при $abs(w) > tilde(R)$ --- ряд расходится. $r = 1/tilde(R)$.

        Возможно, $r$ получилось больше $R$. Тогда положим $r = R$, чтобы было верно неравенство из свойства.

]

#def[
    Кольцо $r < abs(z) < R$ называется _кольцом сходимости_.
]

#props[
    2. В кольце строго внутри кольца сходимости $tilde(r) < abs(z) < tilde(R)$ сходимость равномерная.

    3. В кольце сходимости ряд можно дифференцировать сколь угодно много раз.
]

#proof[
    2. Из свойств степенных рядов, если уменьшить круг сходимости немного, сходимость будет равномерной. Сделаем это с кругами из доказательства свойства 1.

    3. Каждая точка строго внутри кольца лежит в каком-то уменьшенном кольце, а там есть бесконечная дифференцируемость.
]

#th(label: "loran-coefficient-formula")[
    Если $f(z) = sum_(n = -oo)^oo c_n z^n$ при $r < abs(z) < R$, то коэффициенты определены однозначно. Замечу, что кольцо не пустое, так как какое-то значение $z$ в нем лежит.

    Более того, есть формула для коэффициентов:
    $
        c_n = 1/(2pi i) integral_(abs(z) = rho) (f(z))/(z^(n + 1)) dif z,
    $
    где $rho$ --- любое значение $r < rho < R$: по всем окружностям значения интегралов будут совпадать как интегралы по гомотопным путям.
]

#proof[
    Считаем интеграл.
    $
        integral_(abs(z) = rho) (f(z))/(z^(n + 1)) dif z.
    $
    Параметризуем $z = rho e^(i t)$, $dif z = rho e^(i t) dot i dif t$:
    $
        integral_0^(2pi) sum_(k = -oo)^oo overbrace(c_k rho^k e^(i k t), f(z)) 1/underbrace(rho^(n + 1) e^(i (n + 1) t), z^(n + 1)) i rho e^(i t) dif t =
        i integral_0^(2pi) sum_(k = -oo)^(oo) c_k rho^(k - n) e^((k - n) i t) dif t newline(=^*) i sum_(k = -oo)^oo c_k rho^(k - n) integral_0^(2pi) e^(i (k - n) t) dif t.
    $
    Так как мы выбрали $rho$ строго внутри кольца, для любого $rho$ и у главной, и у правильной части есть равномерная сходимость, а значит в $*$ можно менять местами интеграл и сумму.

    Чему равен здесь интеграл?
    $
        integral_0^(2pi) e^(i m t) dif t = cases(
            2pi\, "при" m = 0,
            lr(e^(i m t)/(i m) bar)_(t = 0)^(t = 2pi) = 0\, "при" m != 0.
        )
    $

    Значит,
    $
        integral_(abs(z) = rho) (f(z))/(z^(n + 1)) dif z =
        2pi i c_n.
    $
    То есть если коэффициенты есть, то любые коэффициенты выражаются через наш интеграл. Значит, они определены однозначно.
]

#ticket[Ряд Лорана. Существование. Разложение голоморфной в кольце функции в сумму голоморфных функций.]

#th(name: "Лорана")[
    $f$ голоморфна в кольце $r < abs(z) < R$. Тогда она в этом кольце раскладывается в ряд Лорана, то есть
    $
        f(z) = sum_(n = -oo)^oo a_n z^n, "где"
        a_n = 1/(2pi i) integral_(abs(z) = rho) f(z) / z^(n + 1) dif z.
    $

]

#proof[
    Возьмем $r < r_1 < r_2 < R_2 < R_1 < R$. Возьмем множество $r_1 <= abs(z) <= R_1$ --- компакт $K$, и точку в его внутренности, $r_2 < abs(z) < R_2$. Напишем по границе множества интегральную формулу Коши:
    $
        f(z) = 1/(2 pi i) integral_(diff K) f(zeta) / (zeta - z) dif zeta = 1/(2 pi i) integral_(abs(zeta) = R_1) f(zeta) / (zeta - z) dif zeta - 1/(2pi i) integral_(abs(zeta) = r_1) f(zeta) / (zeta - z) dif zeta.
    $

    Считаем по отдельности интегралы, начнем с первого. Распишем знаменатель как ряд:
    $
        1/(zeta - z) = 1/zeta dot 1/(1 - z/zeta) = 1/zeta sum_(n = 0)^oo (z/zeta)^n = sum_(n = 0)^oo z^n / (zeta^(n + 1)).
    $
    Тогда
    $
        integral_(abs(zeta) = R_1) f(zeta) / (zeta - z) dif zeta =
        integral_(abs(zeta) = R_1) f(zeta) dot (sum_(n = 0)^oo z^n/(zeta^(n + 1))) dif z =^*
        sum_(n = 0)^oo z^n underbrace(integral_(abs(zeta) = R_1) f(zeta)/(zeta^(n + 1)) dif z, := c_n) =
        sum_(n = 0)^oo c_n z^n.
    $
    Как обычно, надо объяснить, почему можно переставлять в $*$ сумму с интегралом. Докажем равномерную сходимость. $f in H(r < abs(z) < R)$, значит $f in C(r_1 <= abs(z) <= R_1)$, то есть $f$ ограничена в кольце. $r_1 < r_2 < abs(z) < R_2 < R_1$, значит $abs(f(zeta)) <= M$ для каждого $zeta$. Тогда
    $
        abs(f(zeta)) abs(z)^n / (abs(zeta)^(n + 1)) <= M 1/R_1 (R_2 / R_1)^n,
    $
    а это сходящая геометрическая прогрессия. По признаку Вейерштрасса, сходится.


    Теперь другой интеграл. Здесь, чтобы была сходимость, уже нужно писать ряд по $zeta/z$:
    $
        1/(zeta - z) = -1/z dot 1/(1 - zeta/z) = - 1/z sum_(n = 0)^oo zeta^n / z^n = -sum_(n = 1)^oo zeta^(n - 1)/z^n.
    $
    Аналогично считаем интеграл, меняем его местами с суммой по аналогичным причинам.
    $

    integral_(abs(zeta) = r_1) f(zeta)/(zeta - z) dif zeta = integral_(abs(zeta) = r_1) -f(zeta) sum_(n = 1)^oo zeta^(n - 1)/z^n dif zeta = sum_(n = 1)^oo 1/(z^n) underbrace(integral_(abs(zeta) = r_1) -f(zeta) zeta^(n - 1) dif zeta, -c_(-n)).

    $
    Получаем разложение в ряд.
]

#notice[
    Неравенство Коши верно для $n in ZZ$:
    $
        abs(a_n) <= M_rho / rho^n, "где" M_rho = max_(abs(zeta) = rho)abs(f(zeta)).
    $
]

#follow[
    Если $f$ голоморфна в кольце $r < abs(z) < R$, то существует $g in H(abs(z) < R)$ и $h in H(abs(z) > r)$ такие, что $f = g + h$. Если $lim_(z -> oo) h(z) = 0$, то разложение единственно.
]

#proof[
    Пусть 
    $
        g(z) = sum_(n = 0)^oo a_n z^n, \
        h(z) = sum_(n = 1)^oo a_(-n) z^(-n).

    $
    Тогда $g$ сходится в кольце $r < abs(z) < R$, а значит и в $abs(z) < R$ (нет проблем со сходимостью около нуля), а значит $g in H(abs(z) < R)$. Тоже самое для $h$: она сходится при $abs(z) > r$, а значит голоморфна при $abs(z) > r$.

    Проверим единственность.
    Пусть $f = g + h = g_1 + h_1$, и $g, g_1 in H(abs(z) < R)$, и $h, h_1 in H(abs(z) > r)$. Тогда рассмотрим
    $
        F(z) := cases(
            g(z) - g_1 (z) "при" abs(z) < R,
            h(z) - h_1 (z) "при" abs(z) > r
        ) in H(CC).
    $
    Голоморфность следует из того, что голоморфны обе части в своих областях, и они совпадают в кольце. Значит $F$ является аналитическим продолжением каждой из функций. Кроме того, по условию, $F(z) --> 0$ при $z -> oo$. Значит эта функция меньше $1$ для всякого $abs(z) > A$, и ограничена при $abs(z) <= A$. Значит она ограничена везде, и по теореме Лиувилля, $F$ --- константа. Но $F$ стремится к нулю при $z -> oo$, значит $F = 0$.
]

#ticket[Особые точки голоморфных функций. Равносильные определения устранимой особой точки.]

#def[
    Если $f in H(0 < abs(z - a) < R)$, то $a$ называется _изолированной особой точкой_ функции $f$. Иными словами, функция не определена в точке $a$, но определена и голоморфна в некоторой окрестности этой точки.
]

#def[
    Определим бесконечные пределы: $ lim_(z -> a) f(z) = oo $ означает, что $abs(f(z)) -->_(z -> a) +oo$.
]

#notice[
    $ lim_(z -> a) f(z) = oo <==> lim_(z -> a) 1/(f(z)) = 0 $
]

#def[
    Пусть $a$ --- изолированная особая точка.
    - Если существует $lim_(z -> a) f(z) in CC$, то такая точка называется _устранимой особой точкой_.
    - Если $lim_(z -> a) f(z) = oo$, то такая точка называется _полюсом_.
    - Если не существует $lim_(z -> a) f(z)$, то такая точка называется _существенной особой точкой_.
]

#examples[
    + $f(z) = (sin z)/z$ имеет устранимую особую точку в нуле, так как при $z = 0$ предел равен $1$.
    + $f(z) = (e^z - 1)/z$ то же самое.
    + $f(z) = (cos z)/z$ имеет полюс в нуле.
    + $f(z) = tg(z)$ имеет полюсы в точках $pi/2 + pi n$.
    + $f(z) = e^(1/z)$ имеет существенную особую точку в нуле, так как если $z_n = 1/(2pi i n)$, то $f(z_n) = e^(2pi i n) = 1$, а если $z_n = 1/(2pi i n + pi i)$, то $f(z_n) = e^(2pi i n + pi i) = -1$.
]

#th(name: "характеристика устранимой особой точки")[
    $f = H(0 < abs(z - a) < R)$. Следующие условия равносильны:
    1. $a$ --- устранимая особая точка.
    2. $f$ ограничена в проколотой окрестности $a$.
    3. Существует $g in H(abs(z - a) < R)$ такая, что $f(z) = g(z)$ при $0 < abs(z - a) < R$.
    4. В главной части разложения Лорана $f$ в окрестности $a$ все коэффициенты равны нулю.
]

#proof[
    - "$1 ==> 2$": если существует предел, то есть локальная ограниченность.
    - "$4 ==> 3$": если в главной части ряда Лорана все коэффициенты нулевые, то возьмем все остальное в качестве $g$. Такая $g$ подходит.
    - "$3 ==> 1$": $lim_(z -> a) f(z) = lim_(z -> a) g(z) = g(a)$.
    - "$2 ==> 4$": Пусть $abs(f(z)) <= M$ при $0 < abs(z - a) < r$. Тогда для коэффициентов главной части ряда Лорана: $|c_n| <=  M_rho / rho^n <= M/rho^n --> 0$ при $rho -> 0$, где $M_rho = max abs(f(z)) < M$ при $abs(z - a) = rho$ (по формуле коэффициентов#rf("loran-coefficient-formula")).
]

#ticket[Характеристика полюса. Связь между нулями и полюсами.]

#th(name: "характеристика полюса")[
    $f in H(0 < abs(z - a) < R)$. Следующие условия равносильны:
    1. $a$ --- полюс.
    2. Существует $m in NN$ и $g in H(abs(z - a) < R)$, такая, что $g(a) != 0$ и $f(z) = g(z) / (z - a)^m$ при $0 < abs(z - a) < R$.
    3. В главной части ряда Лорана (в кольце $0 < abs(z - a) < R$) $f$ есть только конечное *ненулевое* (иначе устранимо) число ненулевых коэффициентов.
]

#proof[
    - "$1 ==> 2$": Заведем $h(z) = 1/(f(z))$. Тогда $lim_(z -> a) f(z) = oo$, а значит $abs(f(z)) > 1$ в некоторой окрестности $a$, и для $h(z)$ это устранимая особая точка (в ней предел $0$). Доопределим эту функцию в точке $a$. Такая $h$ голоморфна в окрестности $a$, и равна нулю в точке. Можем вынести из нее множитель $(z - a)^m$, тогда
        $
            h(z) = (z - a)^m dot tilde(h) (z), " где" tilde(h) in H(abs(z - a) < r) "и " tilde(h)(a) != 0.
        $
        Ну а $f$, соответственно, равна $1/h$:
        $
            f(z) = 1/(z - a)^m dot 1/(tilde(h)(z)).
        $
        Берем $g(z) = 1/(tilde(h) (z))$ в окрестности $a$. Правда, эта функция пока определена при $abs(z - a) < r$. Давайте доопределим:
        $
            g(z) = cases(
                1/(tilde(h) (a)) "при" z = a,
                (z - a)^m f(z) "при" z != a
            ).
        $
        Она голоморфна, так как точка $a$ --- устранимая особая точка $(z - a)^m f(z)$.

    - "$2 ==> 3$": Возьмем ряд Тейлора голоморфной в круге функции $g$ в точке $a$:
        $
            g(z) = sum_(n = 0)^oo c_n (z - a)^n.
        $
        Тогда 
        $
            f(z) = g(z) / (z - a)^m = sum_(n = -m)^oo c_(n + m) (z - a)^n.
        $
        В этом ряду действительно конечное ненулевое число ненулевых коэффициентов в главной части.
    - "$3 ==> 1$": $f(z) = sum_(n = -m)^oo c_n (z - a)^n$ и $c_(-m) != 0$. Значит $f(z) sim c_(-m)/(z - a)^m$.
]

#def[
    $m$ из этой теоремы называется _порядком полюса_.
]

#notice[
    В процессе доказательства поняли равносильность:
    1. $a$ --- полюс $f$ порядка $m$.
    2. $a$ --- нуль $1/f$ кратности $m$.
    3. $f(z) = sum_(n = -m)^oo c_n (z - a)^n$ и $c_m != 0$.
]

#ticket[Мероморфные функции. Свойства. Производные мероморфных функций. Характеристика существенной особой точки.]

#def[
    $f$ --- _мероморфная_ в $Omega$ функция, если $f in H(Omega without E)$, а $E$ --- множество всех полюсов $f$. Устранимые особые точки тоже годятся: их можно сразу устранить.
]

#notice[
    Рассмотрим ситуацию, когда у множества $E$ нет предельных точек в $Omega$. Пусть $a_n$ --- полюсы $a_n in E$, и $lim a_n = a in Omega$. Тогда ни в каком кольце $0 < abs(z - a) < R$ не может быть голоморфности. Значит $a$ --- не изолированная особая точка, и тем более не полюс: иначе в окрестности $a$ не могло бы быть полюсов. С другой стороны, в точке $a$ и голоморфности быть не может, так как
    $
        lim_(z -> a_n) f(z) = oo ==> exists z_n in U_(a_n): abs(f(z_n)) > n ==> z_n --> a "и " abs(f(z_n)) --> +oo. 
    $
    Получается предел --- не полюс, и не точка голоморфности. Значит эта точка не лежит в $Omega$, и не является предельной.
]

#example[
    $ctg 1/z$ мероморфная в $CC without {0}$, но не мероморфная в $CC$.
]

#th[
    $f$, $g$ мероморфны в $Omega$. Тогда
    1. $f plus.minus g$ мероморфна в $Omega$.
    2. $f g$ мероморфна в $Omega$.
    3. $f/g$ мероморфна в $Omega$, если $g equiv.not 0$.
    4. $f'$ мероморфна в $Omega$.
]

#proof[
    1.
        $
            f(z) + g(z) = sum_(n = -m_1)^oo c_n (z - a)^n + sum_(n = -m_2)^oo d_n (z - a)^n.
        $
        Это ряд такого же вида, поэтому $f + g$ мероморфна.
    2. Если $f$ и $g$ голоморфны в $a$, то $f g$ голоморфна в $a$. Только в таких точках $f(a) = 0$ или $g(a) = 0$. В остальных точках распишем (такое представление существует)
        $
            f(z) = (z - a)^(-m) phi(z),\
            g(z) = (z - a)^(-l) psi(z).
        $
        Тогда
        $
            f(z) g(z) = (z - a)^(-(m + l)) phi(z) psi(z).
        $
    3. Аналогично,
        $
            f(z) / g(z) = (z - a)^(-(m - l)) phi(z)/(psi(z)).
        $
        Если нули $g$ имеют предельную точку, то $g equiv 0$ по теореме о единственности, а такие функции не рассматриваются.
    4. Если $f$ голоморфна в окрестности $a$, то $f'$ тоже голоморфна в окрестности $a$. Если $a$ --- полюс, то
        $
            f'(z) = (-m phi(z) + phi'(z) (z - a))/(z - a)^(-m + 1).
        $
        Полюс не исчезает.
]

#th(name: "характеристика существенной особой точки")[
    $f in H(0 < abs(z - a) < R)$. Следующие условия равносильны:
    1. $a$ --- существенная особая точка.
    2. В главной части ряда Лорана $f$ в окрестности $a$ бесконечно много ненулевых коэффициентов.
]

#proof[
    Получается по принципу исключения: по двум предыдущим теоремам ничего больше не остается.
]

#ticket[Теорема Сохоцкого. Формулировка теоремы Пикара.]

#th(name: "Сохоцкого")[
    Пусть $a$ --- существенная особая точка $f$ и $eps > 0$. Тогда $ Cl {f(z): 0 < abs(z - a) < eps} = CC union {oo}. $
    Более того, для любого $A in CC union {oo}$ найдется такая последовательность $z_a -> a$, что $f(z_n) -> A$.
]

#proof[
    1. Случай $A = oo$.
        Если $f$ ограничена в окрестности $a$, то по характеристике устранимой особой точки, $a$ --- устранимая. А это не так. Значит в любой окрестности $a$, $f$ не ограничена, и найдется $z_n: abs(z_n - a) < 1/n$ такая, что $abs(f(z_n)) > n$.
    2. Случай $A in CC$.
        Если в каждой окрестности $0 < abs(z - a) < 1/n$ функция $f$ принимает значение $A$, то возьмем последовательность таких точек.

        Если в некоторой окрестности $0 < abs(z - a) < eps$ значение $A$ не достигается, то рассмотрим $g(z) = 1/(f(z) - A)$. В такой проколотой окрестности эта функция голоморфна --- в ней не обнуляется знаменатель. Значит $a$ --- изолированная особая точка $g$. Рассмотрим случаи:
        - $a$ --- устранимая. Тогда существует $lim_(z -> a) g(z) = b in CC$ и $lim_(z -> a) f(z) = lim_(z -> a) 1/(g(z)) + A$. Это либо бесконечность (если $b = 0$), либо комплексное число (если $b != 0$). Но такого быть не может: тогда $a$ --- либо устранимая особая точка, либо полюс $f$, но она должна быть существенной.
        - $a$ --- полюс $g$. Тогда $lim_(z -> a) g(z) = oo$ и $lim_(z -> a) f(z) = 1/oo + A = 0 + A = A$. Значит это устранимая особая точка, а не существенная. Снова противоречие.
        - $a$ --- существенная особая точка $g$. Тогда существует последовательность $g(z_n) -> oo$ по предыдущему пункту. А значит $f(z_n) = 1/(g(z_n)) + A --> A$.
]

#th(name: "Пикара")[
    Если $a$ --- существенная особая точка и $eps > 0$, то множество ${f(z): 0 < abs(z - a) < eps}$ это либо $CC$, либо $CC$ без одной точки.
]

#proof[
    Храбров сказал, что на доказательство уйдет пара или две, и мы доказывать ее не будем. Еще он сказал, что эту теорему иногда называют "большой теоремой Пикара", так как у нее есть ослабленный аналог, на доказательство которого уйдет всего лишь одна пара. Оно вам надо?
]

#example[
    Одно значение может отсутствовать. Например, при $f(z) = e^(1/z)$, $z = 0$ --- существенная особая точка, но экспонента не принимает значение $0$ никогда.
]

#ticket[Бесконечный предел и бесконечно удаленная точка. Особенность в бесконечно удаленной точке. Теорема Лиувилля в $overline(CC)$.]

#def[
    Предел в точке $oo$:
    $ lim_(z -> oo) f(z) = b $
    если
    $
        forall eps > 0 space exists R space forall abs(z) > R space abs(f(z) - b) < eps
    $
    или
    $
        forall z_n -> oo space f(z_n) -> b.
    $
]

#denote[
    $overline(CC) = CC union {oo}$.
]

#def[
    Пусть $f: Omega --> CC$, где $Omega subset overline(CC)$. Тогда если $lim_(z -> oo) f(z) = f(oo)$, то $f$ непрерывна в $oo$. 
]

#def[
    Пусть $f in H(abs(z) > R)$ ($f$ голоморфна в проколотой окрестности бесконечности).
    1. Если существует $lim_(z -> oo) f(z) in CC$, то $oo$ --- устранимая особая точка.
    2. Если $lim_(z -> oo) f(z) = oo$, то $oo$ --- полюс.
    3. Если не существует $lim_(z -> oo) f(z)$, то $oo$ --- существенная особая точка.
]

#notice[
    Можно смотреть на это в терминах функции от обратного аргумента.

    1. $oo$ --- устранимая особая точка $f$ тогда и только тогда, когда $0$ --- устранимая особая точка $f(1/z)$, что равносильно тому, что $f(z)$ ограничена в окрестности $oo$, что равносильно тому, что в разложении $f$ в ряд Лорана по степеням $z$ при положительных степенях все коэффициенты равны нулю.

    2. $oo$ --- полюс $f$ тогда и только тогда, когда $0$ --- полюс $f(1/z)$, что равносильно тому, что в разложении $f$ в ряд Лорана по степеням $z$ при положительных степенях есть конечное ненулевое число ненулевых коэффициентов.

    3. $oo$ --- существенная особая точка $f$ тогда и только тогда, когда $0$ --- существенная особая точка $f(1/z)$, что равносильно тому, что в разложении $f$ в ряд Лорана по степеням $z$ при положительных степенях бесконечно много ненулевых коэффициентов.
]

#def[
    $f$ --- голоморфная в $oo$, если $oo$ --- устранимая особая точка $f$.
]

#th(name: "Лиувилля")[
    Если $f in H(overline(CC))$, то $f = const$.
]

#proof[
    $f$ --- голоморфна в $oo$, значит существует $lim_(z -> oo) f(z) =: b$. Тогда существует $R$ такое, что $abs(f(z) - b) < 1$ при $abs(z) > R$, в частности $abs(f(z)) < abs(b) + 1$ при $abs(z) > R$. В круге $abs(z) <= R$ функция ограничена как непрерывная на компакте. Значит, она ограничена везде, и по теореме Лиувилля, $f = const$.
]

#ticket[Сфера Римана. Стереографическая проекция. Связь между расстояниями образов и прообразов.]

#def[
    _Стереографическая проекция_ --- отображение точек на плоскости точкам на сфере. Точке бесконечности соответствует северный полюс сферы.

    Северный полюс расположен в $N = (0, 0, 1)$, и рассматривается точка на плоскости $(x, y, 0)$. Южный полюс сферы лежит на плоскости в точке $(0, 0, 0)$.
    
    #figure[
        #image("../../images/riemann-sphere.svg", width: 10cm)
    ]

    Такая сфера называется _сферой Римана_.
]

#th[
    При стереографической проекции точке плоскости $z = x + i y$ соответствует точка на сфере с координатами
    $
        u = x/(1 + abs(z)^2), space
        v = y/(1 + abs(z)^2), space
        w = (abs(z)^2)/(1 + abs(z)^2).
    $
    Обратное отображение:
    $
        x = u/(1 - w), space
        y = v/(1 - w).
    $
]

#proof[
    Параметризуем прямую $N z$: $(t x, t y, 1 - t)$. Уравнение сферы $u^2 + v^2 + (w - 1/2)^2 = 1/4$, то есть $u^2 + v^2 + w^2 = w$. Подставляем параметризацию прямой:
    $
        t^2 x^2 + t^2 y^2 + (1 - t)^2 = (1 - t) <==>
        t^2 abs(z)^2 + cancel(1) - cancel(2)t + t^2 = cancel(1) - cancel(t) newline(<==>)
        t dot abs(z)^2 - 1 + t = 0 ==> t = 1/(1 + abs(z)^2).
    $
    Подставляем $t$ в параметризацию, получаем что требовалось. Обратное отображение выводится.
]

#follow(plural: true)[
    1. Расстояние между образами точек $z$ и $tilde(z)$ равно
        $
            abs(z - tilde(z))/(sqrt(1 + abs(z)^2) sqrt(1 + abs(tilde(z))^2)).
        $
    2. Расстояние между образом $z$ и $oo$ равно
        $
            1/(sqrt(1 + abs(z)^2)).
        $
]

#proof[
    1. $
        (u - tilde(u))^2 + (v - tilde(v))^2 + (w - tilde(w))^2 =
        underbrace(u^2 + v^2 + w^2, =w) +
        underbrace(tilde(u)^2 + tilde(v)^2 + tilde(w)^2, =tilde(w)) -
        2(u tilde(u) + v tilde(v) + w tilde(w)) newline(=)
            abs(z)^2/(1 + abs(z)^2) +
            abs(tilde(z))^2/(1 + abs(tilde(z))^2)
            -
            2 dot (x tilde(x) + y tilde(y) + abs(z)^2 abs(tilde(z))^2)/((1 + abs(z)^2)(1 + abs(tilde(z))^2))
        = 
            (abs(z)^2 + abs(tilde(z))^2 + 2abs(z)^2 abs(tilde(z))^2)/((1 + abs(z)^2)(1 + abs(tilde(z))^2))
            -
            2 dot (x tilde(x) + y tilde(y) + abs(z)^2 abs(tilde(z))^2)/((1 + abs(z)^2)(1 + abs(tilde(z))^2))
        newline(=)
        (abs(z)^2 + abs(tilde(z))^2 - 2x tilde(x) - 2 y tilde(y))/((1 + abs(z)^2)(1 + abs(tilde(z))^2)) =
        ((x - tilde(x))^2 + (y - tilde(y))^2)/((1 + abs(z)^2) (1 + abs(tilde(z))^2)) =
        abs(z - tilde(z))^2/((1 + abs(z)^2) (1 + abs(tilde(z))^2)).
    $
    2. Упражнение.
]

#follow(plural: true)[
    3. Предел в $overline(CC)$ и предел на сфере Римана --- одно и тоже, то есть $z_n --> z_*$ в $overline(CC)$ тогда и только тогда, когда образы $z_n$ сходятся к образу $z_*$ в $RR^3$ (не обязательно считать расстояния по дуге на сфере).
]

#proof[
    - "$==>$", $z_n --> z_* in CC$: Тогда $abs(z_n - z_*) --> 0$, а значит
        $
            abs(z_n - z_*)/(sqrt(1 + abs(z_n)^2) sqrt(1 + abs(z_*)^2)) < abs(z_n - z_*) --> 0.
        $
    - "$<==$":
        $
            (z_n - z_*)/(sqrt(1 + abs(z_n)^2) sqrt(1 + abs(z_*)^2)) --> 0 ==> abs(z_n - z_*)/sqrt(1 + abs(z_n)^2) --> 0.
        $
        Если $z_n$ --- ограничена, то $abs(z_n - z_*) --> 0$, и все доказано. Если $z_n$ не ограничена, то найдется $z_(n_k) --> oo$, и дробь
        $
            abs(z_(n_k) - z_*)/sqrt(1 + abs(z_(n_k))^2) --> 1,
        $
        что противоречит предположению: она должна стремиться к нулю.
    - $z_n --> oo$: сразу получается в обе стороны, так как
        $
            1/(sqrt(1 + abs(z_n)^2)) --> 0.
        $
]

#follow(plural: true)[
    4. $overline(CC)$ --- компакт (!). Надо только быть осторожным с тем, где именно. Метрики в $overline(CC)$ у нас нет (они не захватывают бесконечность), поэтому говорить надо о топологических пространствах. Короче, забейте, компакт и компакт. Вопросы?
]

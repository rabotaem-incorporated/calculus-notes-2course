#import "../../utils/core.typ": *

== Вычеты

#def[
    $a != oo$ --- изолированная особая точка $f$. Вычетами называются

    $
        res_(z = a) f := c_(-1)&, quad "где" f(z) = sum_(n = -oo)^oo c_n (z - a)^n,\
        res_(z = oo) f := -c_(-1)&, quad "где" f(z) = sum_(n = -oo)^oo c_n z^n.
    $
    В бесконечности вычет существует всегда.
]

#props[
    1. Если $f in H(0 < abs(z - a) < R)$ и $0 < r < R$, то 
    $
        res_(z = a) f = 1/(2 pi i) integral_(abs(z - a) = r) f(z) dif z.
    $
]

#proof[
    Считаем $a = 0$.

    $
        integral_(abs(z) = r) f(z) dif z =
        integral_(abs(z) = r) sum_(n = -oo)^oo c_n z^n dif z.
    $
    Параметризуем, $z = r dot e^(i t)$, $dif z = r e^(i t) dot i dif t$.
    $
        integral_(abs(z) = r) sum_(n = -oo)^oo c_n z^n dif z =
        i integral_0^(2 pi) sum_(n = -oo)^oo c_n (r e^(i t))^n r e^(i t) dif t =
        i integral_0^(2 pi) sum_(n = -oo)^oo c_n r^(n + 1) e^(i (n + 1) t) dif t.
    $
    Сумма абсоютно сходится, так как ряд лежит строго внутри кольца сходимости (у нас, правда, есть еще лишний множитель $e^(i t)$, но он не влияет на абсолютную сходимость). Тогда можем менять местами сумму и интеграл.
    $
        i integral_0^(2 pi) sum_(n = -oo)^oo c_n r^(n + 1) e^(i (n + 1) t) dif t =
        sum_(n = -oo)^oo c_n r^(n + 1) i integral_0^(2 pi) e^(i (n + 1) t) dif t.
    $
    Этот интеграл считается:
    $
        integral_0^(2 pi) e^(i (n + 1) t) dif t =
        cases(
            lr(e^(i (n + 1) t)/(i(n + 1)) |)_(0)^(2 pi) = 0\, quad &"при" n != -1,
            2 pi\, &"при" n = -1
        ).
    $
]

#props[
    2. Если $a$ полюс порядка $<= m$, то
        $ 
            res_(z = a) f = 1/(m - 1)! dot lim_(z -> a) dif^(m - 1)/(dif z^(m - 1)) ((z - a)^m f(z)).
        $
        В частности, для полюса первого порядка
        $
            res_(z = a) f = lim_(z -> a) (z - a) f(z).
        $
]

#proof[
    Считаем $a = 0$. Так это полюс,

    $
        f(z) = sum_(n = -m)^oo c_n z^n.
    $
    Посмотрим на
    $
        g(z) := z^m f(z) = sum_(n = 0)^oo c_(n - m) z^n.
    $
    Нужен коэффициент при $z^(m - 1)$ в этом ряде. Это просто формула Тейлора. Доопределим $g(z)$ в нуле, и выпишем коэффициент:
    $
        c_(-1) = (g^((m - 1))(0))/(m - 1)! = 1/(m - 1)! lim_(z -> 0) ((dif^(m-1))/(dif z^(m-1)) z^m f(z))(0).
    $
    Так как доопределенная $g$ голоморфна, в окрестности нуля можно сколько угодно брать производные и менять их местами с пределами.
]

#props[
    3. Пусть $f(z) = g(z)/h(z)$, где $g, h$ --- голоморфные в окрестности $a$, и $g(a) != 0$, $h(a) = 0$, $h'(a) != 0$. Тогда
    $
        res_(z = a) f = (g(a))/(h'(a)).
    $
]

#proof[
    $
        res_(z = a) f = lim_(z -> a) f(z) = lim_(z -> a) (z - a)/(h(z) - h(a)) dot g(z) = lim_(z -> a) 1/(h'(a)) dot g(z) = g(a)/(h'(a)).
    $
]

#props[
    4. Если $lim_(z -> oo) f(z) = A$, то $res_(z = oo) f = lim_(z -> oo) z dot (A - f(z))$.
]

#proof[
    По определению знаем, $res_(z = oo) f = -c_(-1)$. Ряд Лорана для устранимой точки $oo$ выглядит как
    $
        f(z) = sum_(n = -oo)^0 c_n z^n = A + sum_(n = 1)^oo c_n/z^n.
    $
    Тогда
    $
        z dot (A - f(z)) = -sum_(n = 1)^oo c_n/(z^n) dot z = -sum_(n = 1)^oo c_n/z^(n - 1) --> -c_(-1).
    $
]

#props[
    5. $ -res_(z = oo) f = res_(z = 0) 1/(z^2) dot f(1/z). $
]

#proof[
    $f(z) = sum_(n = -oo)^oo c_n z^n$, и
    $
        1/z^2 f(1/z) = 1/z^2 sum_(n = -oo)^oo c_n/z^n = sum_(n = -oo)^oo c_n/z^(n + 2).
    $
    Тогда
    $
        res_(z = 0) 1/z^2 f(1/z) = -res_(z = oo) f = -c_(-1).
    $
]

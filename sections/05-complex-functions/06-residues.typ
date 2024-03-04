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

#th(name: "Коши о вычетах")[
    $f$ --- голоморфна в $Omega$, за исключением конечного числа особых точек, $K subset Omega$ --- компакт, граница $K$ состоит из конечного числа непересекающихся закмнутых простых кусочно-гладких кривых, и особые точки $f$ не лежат на границе $K$. Тогда
    $
        integral_(diff K) f(z) dif z = 2 pi i sum_(a in Int K \ "особая") res_(z = a) f.
    $
]

#proof[
    #TODO[картинка]

    Окружаем особые точки кругами $B_r (a)$, так как $overline(B)_r (a) subset K$ и $overline(B)_r (a) sect overline(B)_r (b) = nothing$ для различных особых точек $f$. $tilde(K) := K without Union B_r (a)$ --- компакт, как замкнутое подмножество компакта, и $f$ голоморфна в $Omega \ tilde(K)$. Тогда по теореме Коши
    $
        0 = integral_(diff tilde(K)) f(z) dif z = integral_(diff K) f(z) dif z - sum_(a in Int K \ "особая") integral_(abs(z - a) = r) f(z) dif z.
    $
    Про каждую особую точку $a$ можно сказать, что
    $
        integral_(abs(z - a) = r) f(z) dif z = 2 pi i res_(z = a) f,
    $
    поэтому подставив это в предыдущее равенство, получим утверждение теоремы:
    $
        integral_(diff K) f(z) dif z - 2 pi i sum_(a in Int K \ "особая") res_(z = a) f = 0.
    $
]

#follow[
    Пусть $f$ голоморфна в $CC$ за исключением конечного числа особых точек. Тогда
    $
        sum_(a in CC \ "особая" \ "или " oo) res_(z = a) f = 0.
    $
]

#proof[
    Пусть $a_1, a_2, ..., a_n$ --- особые точки. Тогда возьмем $R > abs(a_1), abs(a_2), ..., abs(a_n)$. Можно посчитать интеграл по окружности $abs(z) = R$ двумя способами, во-первых, по теореме Коши:
    $
        integral_(abs(z) = R) f(z) dif z = 2 pi i sum_(k = 1)^n res_(z = a_k) f.
    $
    А во вторых, в кольце $abs(z) > R$ можно разложить $f$ в ряд Лорана, и тогда
    $
        integral_(abs(z) = R) f(z) dif z = 2 pi i c_(-1) = -2 pi i res_(z = oo) f.
    $
    При сложении этих равенств получается утверждение теоремы.

    Я здесь не очень внимательно уточнил знаки интегралов: надо быть осторожным с направлениями обхода окружностей, но понятно, что если выбрать направления правильно, все получится.
]

#example[
    Посчитаем
    $
        integral_(abs(z) = 4) z^2/(e^z + 1) dif z.
    $
    Нормальными методами это сделать сложно. Но сейчас мы раскатаем этот интеграл.

    По теореме Коши о вычетах,
    $
        integral_(abs(z) = 4) z^2/(e^z + 1) dif z = 2 pi i sum res.
    $
    Где у этой функции особые точки? Когда $e^z + 1 = 0$, то есть в $z = pi i + 2 pi i k$. Какие из этих точек попали в кольцо $abs(z) < 4$? Только $z = pi i$ и $z = -pi i$. Тогда
    $
        integral_(abs(z) = 4) z^2/(e^z + 1) dif z =
        2 pi i (res_(z = pi i) + res_(z = -pi i)).
    $
    Нули $e^z + 1$ имеют кратность 1, потому что производная равна $e^z$, и в 0 никогда не обращаются. Значит $pi i$ и $-pi i$ --- полюсы первого порядка, и можно вычислить вычеты по простой формуле $res = g/h'$:
    $
        res_(z = pi i) f &= z^2/(e^z + 1)' = (pi i)^2/(e^(pi i)) = pi^2\
        res_(z = -pi i) f &= z^2/(e^z + 1)' = (-pi i)^2/(e^(-pi i)) = pi^2.
    $
    Подставляем,
    $
        integral_(abs(z) = 4) z^2/(e^z + 1) dif z =
        2 pi i (res_(z = pi i) + res_(z = -pi i)) =
        2 pi i (pi^2 + pi^2) =
        2 pi^3 i.
    $
    Этот интеграл был не очень интересным, потому что интегралы каких-то странных функций по окружности считать странно. Попробуем посчитать что-нибудь более интересное.
]

#example[
    Пусть
    $
        I := integral_0^oo (dif x)/(1 + x^(2n)).
    $
    Пусть $f(z) = 1/(1 + z^(2n))$. Это четная функция --- $f(z) = f(-z)$, и поэтому можно вычислить не интеграл по лучу, а по всей вещественной прямой:
    $
        I = 1/2 integral_RR f(x) dif x.
    $
    Только прямая --- странный контур, поэтому мы посчитаем интеграл по полуокружности, а потом перейдем к пределу.
    
    Пусть $ Gamma_R = [-R; R] union underbrace((diff B_R (0) sect {z: Im z > 0}), C_R). $

    Тогда
    $
        integral_(Gamma_R) f(z) dif z = 2 pi i res f.
    $
    #TODO[картинка]
    Какие у этой функции особые точки? Это те, в которых обнуляется знаменатель, то есть $z^(2n) = -1$, или $z = e^(i phi)$, где $2 n phi = pi + 2 pi k$. Среди них нам нужны лишь те, что лежат в верхней полуплоскости. Это
    $
        a_k = e^(i phi_k), "где" phi_k = (pi + 2 pi k)/(2n), "при" k = 0, 1, ..., n - 1.
    $
    Все эти полюса имеют порядок один, так как производная знаменателя не обращается в нуль. Считаем вычеты:
    $
        res_(z = a_k) f =
        lr(1/(1 + z^(2n))' |)_(z = a_k) = 1/(2n a_k^(2n - 1)) = a_k/(2n dot underbrace(a_k^(2n), -1)) = -e^(i phi_k)/(2n).
    $
    Значит
    $
        integral_(Gamma_R) f(z) dif z =
        2 pi i sum_(k = 0)^(n - 1) res_(z = a_k) f =
        cancel(2) pi i sum_(k = 0)^(n - 1) (-e^(i phi_k)/(cancel(2)n)).
    $
    Это можно досчитать как сумму геометрической прогресии.

    Мы знаем, что
    $
        integral_(Gamma_R) f(z) dif z = integral_(-R)^R f(x) dif x + integral_(C_R) f(z) dif z.
    $
    Оценим второй интеграл.
    $
        abs(integral_(C_R) (dif z)/(1 + z^(2n))) <= pi R dot max_(abs(z) = R) 1/abs(1 + z^(2n)).
    $
    Оценим знаменатель: $abs(z^(2n) + 1) >= abs(z^(2n) - 1)$, поэтому
    $
        abs(integral_(C_R) (dif z)/(1 + z^(2n))) <= (pi R)/(R^(2n) - 1) -->_(R -> +oo) 0.
    $
    Значит в пределе этот интеграл $0$, и
    $
        I = 1/2 integral_(Gamma_R) f(z) dif z = 1/2 dot 2 pi i dot sum_(k=0)^(n - 1) -e^((i (2 π k + π))/(2 n))/n = (pi i e^((i π)/(2 n)))/((-1 + e^((i π)/n)) n).
    $
    Или как-то так, если я правильно посчитал геометрическую прогрессию (кажется нет). Но это не важно, можно считать даже меньше.

    #line(length: 100%)

    Альтернативный способ.

    Пусть теперь мы считаем интеграл по контуру сектора окружности величины $alpha$, то есть
    $
        Gamma_R = [0; R] union [0; R e^(i alpha)] union underbrace({R e^(i phi): 0 <= phi <= alpha}, C_R).
    $
    Найдем такое $alpha$, что на отрезке $[0; R e^(i alpha)]$ функция $f$ совпадает с $1/(1 + x^(2n))$:
    $
        f(t e^(i alpha)) = 1/(1 + t^(2n) e^(2n i alpha)) = 1/(1 + t^(2n))
    $ 
    при $e^(2pi i alpha) = 1$, то есть $alpha = pi / n$. Тогда особая точка в этой области всего одна: $z = e^(i pi/n)$.
    $
        integral_(Gamma_R) f(z) dif z = 2 pi i res f.
    $
    Интеграл есть
    $
        integral_(Gamma_R) f(z) dif z = integral_0^R f(x) dif x + integral_(C_R) f(z) dif z + integral_0^(R e^(i pi/n)) f(z) dif z.
    $
    Первый интеграл сходится к $I$, второй интеграл сходится к 0, как мы показали выше, а третий интеграл сходится к $I dot -e^((pi i)/n)$, так как мы просто подставляем $z = t e^(i pi/n)$ в интеграл. Через вычеты, интеграл равен
    $
        integral_(Gamma_R) f(z) dif z = 2 pi i res f = 2 pi i (-e^(i pi/n)/(2n)).
    $
    Отсюда
    $
        I (1 - e^((i π)/(n))) = -2 pi i dot e^((i π)/(n))/(2n) ==>
        I = (pi/n) e^((i π)/(n))/(e^((i π)/(n)) - 1) =
        pi/n dot i/(e^((pi i)/(2n)) - e^((-pi i)/(2n))) = pi/(2n) dot 1/(sin((pi)/(2n))).
    $
]

#lemma(name: "Жордана")[
    $C_(R_n) := {z in CC : abs(z) = R_n, Im z > 0}$, и $R_n --> oo$. Пусть $M_(R_n) := max_(z in C_(R_n)) abs(f(z)) --> 0$, и $lambda > 0$. Тогда
    $
        integral_(C_(R_n)) f(z) dot e^(i lambda z) dif z --> 0.
    $
]

#proof[
    Параметризуем $z = R_n dot e^(i t)$, $dif z = R_n e^(i t) i dif t$.
    $
        abs(integral_(C_(R_n)) f(z) e^(i lambda z) dif z) =
        abs(integral_0^pi f(R_n e^(i t)) R_n e^(i t) i e^(i lambda R_n e^(i t)) dif t) <=
        R_n dot M_(R_n) dot integral_0^pi abs(e^(i lambda R_n e^(i t))) dif t.
    $
    Посчитаем штуку под интегралом:
    $
        abs(e^(i lambda R_n e^(i t))) = abs(e^(i lambda R_n (cos t + i sin t))) = abs(e^(i lambda R_n cos t) dot e^(-lambda R_n sin t)) = e^(-lambda R_n sin t).
    $
    Тогда
    $
        abs(integral_(C_(R_n)) f(z) e^(i lambda z) dif z) <=
        R_n dot M_(R_n) dot integral_0^pi e^(-lambda R_n sin t) dif t =
        2 R_n dot M_(R_n) dot integral_0^(pi/2) e^(-lambda R_n sin t) dif t
    $
    так как теперь функция под интегралом симметрична относительно $pi / 2$. Оценим синус снизу как $2t / pi$, то есть отрезочком между $(0, 0)$ и $(pi/2, 1)$:
    $
        abs(integral_(C_(R_n)) f(z) e^(i lambda z) dif z) <=
        2 R_n dot M_(R_n) dot integral_0^(pi/2) e^(-lambda R_n sin t) dif t <=
        2 R_n dot M_(R_n) dot integral_0^(pi/2) e^(-2 lambda R_n t / pi) dif t.
    $
    Такой интеграл берется:
    $
        2 R_n dot M_(R_n) dot integral_0^(pi/2) e^(-2 lambda R_n t / pi) dif t =
        lr(2 R_n M_(R_n) e^(-lambda R_n (2t) / n)/(-lambda R_n 2/pi) |)_(t = 0)^(t = pi/2) =
        M_(R_n) (pi/lambda - pi/lambda e^(-lambda R_n)) --> 0.
    $
]

#example[
    Посчитаем
    $
        I := integral_0^(+oo) (cos x)/(1 + x^2) dif x = 1/2 integral_RR (cos x)/(1 + x^2) dif x.
    $
    Здесь нам будет очень сильно мешать косинус, если мы поробуем сделать ту же самую штуку с полуокружностью: косинус будет вести себя как экспонента, и мы не сможем оценить его сверху. Однако,
    $
        I = 1/2 Re integral_RR (e^(i x))/(1 + x^2) dif x.
    $
    И вот такую штуку, оказывается, вычислить можно. Положим
    $
        f(z) = e^(i z)/(1 + z^2).
    $
    и проинтегрируем по
    $
        Gamma_R = [-R; R] union C_R,
    $
    где $C_R$ --- верхняя полуоружность.

    Особая точка в полуокружности одна: $z = i$, и это полюс первого порядка, поэтому
    $
        integral_(Gamma_R) f(z) dif z = 2 pi i res_(z = i) f =
        2 pi i lr(e^(i z)/(1 + z^2)' |)_(z = i) =
        2 pi i e^(-1)/(2i) = pi/e.
    $
    А сам интеграл есть сумма
    $
        integral_(Gamma_R) f(z) dif z =
        integral_(-R)^R e^(i z)/(1 + z^2). dif x + integral_(C_R) e^(i z)/(1 + z^2). dif z.
    $
    По лемме Жордана, так как
    $
        max_(abs(z) = R) abs(1/(1 + z^2)) = 1/(R^2 - 1) --> 0,
    $
    то второй интеграл сходится к 0. Тогда
    $
        integral_(RR) f(z) dif z = pi/e = 2I,
    $
    откуда
    $
        I = pi/(2e).
    $
]

#def[
    _Главное значение интеграла_,
    $
        "v.p." integral_a^b f(x) dif x "или"
        "p.v." integral_a^b f(x) dif x 
    $
    это доопределение интеграла для функции, у которой сущесвует проблема в точке $c$. Первая запись типична для англоязычной литературы, вторая --- для русскоязычной.

    Обычно, мы очень хотим посчитать интеграл от функции с особенностью, то мы рассматриваем интеграл как на сумму несобственных интегралов, то есть
    $
        integral_a^b f(x) dif x = lim_(eps -> 0+) integral_a^(c - eps) f(x) dif x + lim_(eps -> 0+) integral_(c + eps)^b f(x) dif x,
    $
    но эта сумма не обязана сходиться.

    Поэтому мы вводим
    $
        "v.p." integral_a^b f(x) dif x = lim_(eps -> 0+) (integral_a^(c - eps) f(x) dif x + integral_(c + eps)^b f(x) dif x).
    $
    Если у интеграла есть несколько проблем, то мы делим область определения по непроблемным точкам, и считаем главные значения интегралов по каждому кусочку.
]

#example[
    $ "v.p." integral_(-1)^1 (dif x)/x = lim_(eps -> 0+) (integral_eps^1 (dif x) / x + integral_(-1)^(-eps) (dif x)/x) = 0. $
]

#props[
    1. Если сущесвует несобственный интеграл $integral_a^b$, то сущесвует и $"v.p." integral_a^b$, и они равны.
    2. $"v.p." integral_a^b$ линеен.
    3. Аддитивность по множеству, но резать по особым точкам нельзя.
]

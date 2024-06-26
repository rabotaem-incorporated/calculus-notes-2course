#import "../../utils/core.typ": *

== Вычеты

#ticket[Вычеты. Определения и свойства.]

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
    Сумма абсолютно сходится, так как ряд лежит строго внутри кольца сходимости (у нас, правда, есть еще лишний множитель $e^(i t)$, но он не влияет на абсолютную сходимость). Тогда можем менять местами сумму и интеграл.
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
    Считаем $a = 0$. Так как это полюс,

    $
        f(z) = sum_(n = -m)^oo c_n z^n.
    $
    Посмотрим на
    $
        g(z) := z^m f(z) = sum_(n = 0)^oo c_(n - m) z^n.
    $
    Нужен коэффициент при $z^(m - 1)$ в этом ряде. Это просто формула Тейлора. Доопределим $g(z)$ в нуле, и выпишем коэффициент:
    $
        c_(-1) = (g^((m - 1))(0))/(m - 1)! = 1/(m - 1)! lim_(z -> 0) ((dif^(m-1))/(dif z^(m-1)) z^m f(z)).
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
        res_(z = a) f = lim_(z -> a) (z - a) f(z) = lim_(z -> a) (z - a)/(h(z) - h(a)) dot g(z) = lim_(z -> a) 1/(h'(a)) dot g(z) = g(a)/(h'(a)).
    $
]

#props[
    4. Если $lim_(z -> oo) f(z) = A$, то $res_(z = oo) f = lim_(z -> oo) z dot (A - f(z))$.
]

#proof[
    По определению знаем $res_(z = oo) f = -c_(-1)$. Ряд Лорана для устранимой точки $oo$ выглядит как
    $
        f(z) = sum_(n = -oo)^0 c_n z^n = A + sum_(n = 1)^oo c_(-n)/z^n.
    $
    Тогда
    $
        z dot (A - f(z)) = -sum_(n = 1)^oo c_(-n)/(z^n) dot z = -sum_(n = 1)^oo c_(-n)/z^(n - 1) --> -c_(-1).
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
        res_(z = 0) 1/z^2 f(1/z) = -res_(z = oo) f = c_(-1).
    $
]

#ticket[Теорема о вычетах. Сумма вычетов. Пример.]

#th(name: "Коши о вычетах")[
    $f$ --- голоморфна в $Omega$, за исключением конечного числа особых точек, $K subset Omega$ --- компакт, граница $K$ состоит из конечного числа непересекающихся закмнутых простых кусочно-гладких кривых, и особые точки $f$ не лежат на границе $K$. Тогда
    $
        integral_(diff K) f(z) dif z = 2 pi i sum_(a in Int K \ "особая") res_(z = a) f.
    $
]

#proof[
    Окружаем особые точки кругами $B_r (a)$ так, чтобы $overline(B)_r (a) subset K$ и $overline(B)_r (a) sect overline(B)_r (b) = nothing$ для различных особых точек $f$. $tilde(K) := K without Union B_r (a)$ --- компакт, как замкнутое подмножество компакта, и $f$ голоморфна в $tilde(K)$. Тогда по теореме Коши
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
    Пусть $a_1, a_2, ..., a_n$ --- особые точки. Тогда возьмем $R > abs(a_1), abs(a_2), ..., abs(a_n)$. Можно посчитать интеграл по окружности $abs(z) = R$ (обходя против часовой стрелки) двумя способами, во-первых, по теореме Коши:
    $
        integral_(abs(z) = R) f(z) dif z = 2 pi i sum_(k = 1)^n res_(z = a_k) f.
    $
    А во вторых, в кольце $abs(z) > R$ можно разложить $f$ в ряд Лорана, и тогда
    $
        integral_(abs(z) = R) f(z) dif z = 2 pi i c_(-1) = -2 pi i res_(z = oo) f.
    $
    При вычитании этих равенств получается утверждение теоремы.
]

#example[
    Посчитаем
    $
        integral_(abs(z) = 4) z^2/(e^z + 1) dif z.
    $

    По теореме Коши о вычетах,
    $
        integral_(abs(z) = 4) z^2/(e^z + 1) dif z = 2 pi i sum res.
    $
    Где у этой функции особые точки? Когда $e^z + 1 = 0$, то есть в $z = pi i + 2 pi i k$. Какие из этих точек попали в кольцо $abs(z) < 4$? Только $z = pi i$ и $z = -pi i$.
    #figure[#image("../../images/integral-contour-1.svg", width: 7cm)]
    Тогда
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
        4 pi^3 i.
    $
    Этот интеграл был не очень интересным, потому что интегралы каких-то функций по окружности считать странно. Попробуем посчитать что-нибудь более интересное.
]

#ticket[Полтора способа для вычисления интеграла $(dif x)/(x^(2n) + 1)$.]

#example[
    Вычислим
    $
        I := integral_0^oo (dif x)/(1 + x^(2n)).
    $
    Пусть $f(z) = 1/(1 + z^(2n))$. Это четная функция --- $f(z) = f(-z)$, и поэтому можно вычислить не интеграл по лучу, а по всей вещественной прямой:
    $
        I = 1/2 integral_RR f(x) dif x.
    $
    Только прямая --- странный контур, --- поэтому мы посчитаем интеграл по полуокружности, а потом перейдем к пределу.
    
    Пусть $ Gamma_R = [-R; R] union underbrace((diff B_R (0) sect {z: Im z > 0}), C_R). $
    #figure[
        #image("../../images/integral-contour-2.svg", width: 8cm)
    ]
    Тогда
    $
        integral_(Gamma_R) f(z) dif z = 2 pi i res f.
    $
    Какие у этой функции особые точки? Это те, в которых обнуляется знаменатель, то есть $z^(2n) = -1$, или $z = e^(i phi)$, где $2 n phi = pi + 2 pi k$. Среди них нам нужны лишь те, что лежат в верхней полуплоскости. Это
    $
        a_k = e^(i phi_k), "где" phi_k = (pi + 2 pi k)/(2n), "при" k = 0, 1, ..., n - 1.
    $
    Все эти полюса имеют порядок 1, так как производная знаменателя не обращается в нуль. Считаем вычеты:
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
    Оценим знаменатель: $abs(z^(2n) + 1) >= abs(z^(2n)) - 1$, поэтому
    $
        abs(integral_(C_R) (dif z)/(1 + z^(2n))) <= (pi R)/(R^(2n) - 1) -->_(R -> +oo) 0.
    $
    Значит в пределе этот интеграл $0$, и
    $
        I = 1/2 integral_(Gamma_R) f(z) dif z = 1/2 dot 2 pi i dot sum_(k=0)^(n - 1) -e^((i (2 π k + π))/(2 n))/n = (2 pi i e^((i π)/(2 n)))/((-1 + e^((i π)/n)) n).
    $
    Или как-то так, если я правильно посчитал геометрическую прогрессию. Но это не важно, можно считать даже меньше.

    #line(length: 100%)

    Альтернативный способ.

    Пусть теперь мы считаем интеграл по контуру сектора окружности величины $alpha$, то есть
    $
        Gamma_R = text(#green, [0; R]) union text(#blue, underbrace({R dot e^(i phi): 0 <= phi <= alpha}, C_R)) union text(#purple, [R dot e^(i alpha); 0]).
    $
    Найдем такое $alpha$, что на отрезке $[0; R dot e^(i alpha)]$ функция $f$ совпадает с $1/(1 + x^(2n))$:
    $
        f(t e^(i alpha)) = 1/(1 + t^(2n) e^(2n i alpha)) = 1/(1 + t^(2n))
    $ 
    при $e^(2n i alpha) = 1$, то есть, например, при $alpha = pi / n$. Тогда особая точка в этой области всего одна: $z = e^(i pi/(2 n))$.
    #figure[
        #image("../../images/integral-contour-3.svg", width: 8cm)
    ]
    $
        integral_(Gamma_R) f(z) dif z = 2 pi i res f.
    $
    Интеграл есть
    $
        integral_(Gamma_R) f(z) dif z = integral_0^R f(x) dif x + integral_(C_R) f(z) dif z + integral_(R dot e^(i pi/n))^0 f(z) dif z.
    $
    Первый интеграл сходится к $I$, второй интеграл сходится к 0, как мы показали в предыдущем решении, а третий интеграл сходится к $I dot -e^((pi i)/n)$, так как мы просто подставляем $z = t e^(i pi/n)$ в интеграл и разворачиваем отрезок. Через вычеты, интеграл равен
    $
        integral_(Gamma_R) f(z) dif z = 2 pi i res f = 2 pi i (-e^(i pi/(2n))/(2n)).
    $
    Отсюда
    $
        I (1 - e^((i π)/(n))) = -2 pi i dot e^((i π)/(2n))/(2n) ==>
        I = ((pi i)/n) e^((i π)/(2n))/(e^((i π)/(n)) - 1) =
        pi/n dot i/(e^((pi i)/(2n)) - e^((-pi i)/(2n))) = pi/(2n) dot 1/(sin((pi)/(2n))).
    $
]

#ticket[Лемма Жордана. Вычисление интеграла $(cos lambda x)/(x^2 + 1) dif x$.]

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
    так как функция под интегралом симметрична относительно $pi / 2$. Оценим синус снизу как $(2t) / pi$, то есть отрезочком между $(0, 0)$ и $(pi/2, 1)$:
    #figure[
        #image("../../images/sine-approx.svg", width: 8cm)
    ]
    $
        abs(integral_(C_(R_n)) f(z) e^(i lambda z) dif z) <=
        2 R_n dot M_(R_n) dot integral_0^(pi/2) e^(-lambda R_n sin t) dif t <=
        2 R_n dot M_(R_n) dot integral_0^(pi/2) e^(-2 lambda R_n t / pi) dif t.
    $
    Такой интеграл берется:
    $
        2 R_n dot M_(R_n) dot integral_0^(pi/2) e^(-2 lambda R_n t / pi) dif t =
        lr(2 R_n M_(R_n) e^(-lambda R_n (2t) / pi)/(-lambda R_n 2/pi) |)_(t = 0)^(t = pi/2) =
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
    #figure[
        #image("../../images/integral-contour-4.svg", width: 7cm)
    ]

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
        max_(abs(z) = R) abs(1/(1 + z^2)) <= 1/(R^2 - 1) --> 0,
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

#ticket[Лемма о полувычете. Интеграл в смысле главного значения.  Вычисление интеграла $(sin x)/x$.]

#def[
    _Главное значение интеграла_,
    $
        "v.p." integral_a^b f(x) dif x "или"
        "p.v." integral_a^b f(x) dif x 
    $
    это доопределение интеграла для функции, у которой существует проблема в точке $c$.

    Обычно, если мы очень хотим посчитать интеграл от функции с особенностью, то мы рассматриваем интеграл как сумму несобственных интегралов, то есть
    $
        integral_a^b f(x) dif x = lim_(eps -> 0+) integral_a^(c - eps) f(x) dif x + lim_(eps -> 0+) integral_(c + eps)^b f(x) dif x,
    $
    но эта сумма не обязана сходиться.

    Мы вводим новый интеграл, который иногда сходится, когда не сходится обычный несобственный:
    $
        "v.p." integral_a^b f(x) dif x = lim_(eps -> 0+) (integral_a^(c - eps) f(x) dif x + integral_(c + eps)^b f(x) dif x).
    $
    Если у интеграла есть несколько проблем, то мы делим область определения по непроблемным точкам, и считаем главные значения интегралов по каждому кусочку.
]

#example[
    $ "v.p." integral_(-1)^1 (dif x)/x = lim_(eps -> 0+) (integral_eps^1 (dif x) / x + integral_(-1)^(-eps) (dif x)/x) = 0. $
]

#props[
    1. Если существует несобственный интеграл $integral_a^b$, то существует и $"v.p." integral_a^b$, и они равны.
    2. $"v.p." integral_a^b$ линеен.
    3. Аддитивность по множеству, но резать по особым точкам нельзя.
]

#lemma(name: "о полувычете")[
    Пусть $f$ голоморфна в проколотой окрестности $a$, и $a$ --- полюс *первого* порядка. Пусть
    $
        C_eps = {z in CC: abs(z - a) = eps "и " alpha < arg(z - a) < beta}.
    $
    Тогда
    $
        lim_(eps -> 0+) integral_(C_eps) f(z) dif z = (beta - alpha) i res_(z = a) f.
    $
]

#proof[
    Пусть $a = 0$. Разложим $f$ в ряд Лорана: $f(z) = g(z) + c/z$, где $g(z)$ --- правильная часть, а $c/z$ --- главная. $g$ голоморфна в окрестности $a$, и поэтому $abs(g(z)) <= M$ в окрестности. Тогда
    $
        integral_(C_eps) f(z) dif z = integral_(C_eps) g(z) dif z + integral_(C_eps) c/z dif z.
    $
    Первый интеграл подпирается сверху:
    $
        abs(integral_(C_eps) g(z) dif z) <= M dot (beta - alpha) eps --> 0,
    $
    поэтому надо посчитать второй. Параметризуем $z = eps e^(i t)$, $dif z = eps e^(i t) i dif t$:
    $
        integral_(C_eps) c/z dif z = integral_alpha^beta c/(eps e^(i t)) eps e^(i t) i dif t = i c integral_alpha^beta dif t = i c (beta - alpha).
    $
    Что и требовалось.
]

#example[
    Пусть
    $
        I =
        integral_0^(+oo) (sin x)/x dif x =
        1/2 integral_RR (sin x)/x dif x =
        1/2 integral_RR (Im e^(i x))/x dif x =
        1/2 "v.p." integral_RR (Im e^(i x))/x dif x.
    $
    В таком интеграле можно вытащить мнимую часть из под знака интеграла, и тогда
    $
        I =
        1/2 Im ("v.p." integral_RR (e^(i x))/x dif x).
    $
    Посмотрим на следующую область
    $
        Gamma_(R, eps) =
            text(#green, [-R; -eps]) union
            text(#blue, underbrace({z: abs(z) = eps, 0 < arg(z) < pi}, C_eps)) union
            text(#purple, [eps; R]) union
            text(#orange, underbrace({z: abs(z) = R, 0 < arg(z) < pi}, C_R)).
    $
    #figure[
        #image("../../images/integral-contour-5.svg", width: 10cm)
    ]
    Тогда
    $
        integral_(Gamma_(R, eps)) e^(i z)/z dif z = 0,
    $
    так как внутри этого контура нет особых точек.

    С другой стороны, это сумма следующих интегралов:
    $
        integral_(Gamma_(R, eps)) e^(i z)/z dif z =
        underbrace(
            integral_(-R)^(-eps) e^(i x)/x dif x +
            integral_(eps)^R e^(i x)/x dif x,
            --> "v.p." integral_RR (e^(i x))/x dif x
        ) +
        underbrace(integral_(C_eps) e^(i z)/z dif z, --> -pi i res = -pi i) +
        underbrace(integral_(C_R) e^(i z)/z dif z, --> 0).
    $
    В третьем интеграле вычет равен $1$, так как можно разложить $e^(i x)$ в ряд как $1 + x + ...$, и коэффициент при минус первом члене ряда будет равен $1$. Знак минус там из-за того, что контур обходится по часовой стрелке. Значит по лемме о полувычете, третий интеграл равен $-pi i$.

    Четвертый интеграл сходится к 0 по Лемме Жордана, так как максимум модуля не больше $abs(1/z) = 1/R --> 0$.

    Значит,
    $
        "v.p." integral_RR (e^(i x))/x dif x = pi i.
    $
    и
    $
        I = 1/2 Im (pi i) = pi/2.
    $
]

#ticket[Вычисление интеграла $x^(p - 1)/(1 + x)$.]

#example[
    Когда-то, когда мы говорили про $Gamma$-функцию, мы замяли этот интеграл под ковер. Сейчас мы его возьмем:
    $
        I = integral_0^(+oo) x^(p - 1)/(1 + x) dif x = integral_0^(+oo) e^((p - 1) Ln z)/(1 + z) dif z
    $
    где $0 < p < 1$.

    Рассмотрим следующий контур:
    #figure[
        #image("../../images/integral-contour-6.png", width: 10cm)
    ]
    $
        Gamma_R = [eps; R] union diff B_R (0) union [R e^(2pi i); eps e^(2 pi i)] union diff B_eps (0).
    $
    В нем одна особая точка: $z = -1$, когда обнуляется знаменатель, и это полюс первого порядка (точки где у логарифма проблемы мы выкинули). Тогда
    $
        integral_(Gamma_R) e^((p - 1) Ln z)/(1 + z) dif z = 2 pi i res_(z = -1) e^((p - 1) Ln z)/(1 + z) = 2 pi i e^((p - 1) Ln (-1)) = 2 pi i e^(i pi (p - 1)).
    $
    Вычет просто считается как первый член ряда Тейлора (значение в точке), так как мы поделили его на $z + 1$. 

    С другой стороны, этот интеграл равен
    $
        integral_(Gamma_R) e^((p - 1) Ln z)/(1 + z) dif z =
        integral_(eps)^R e^((p - 1) Ln z)/(1 + z) dif z +
        integral_(C_R) e^((p - 1) Ln z)/(1 + z) dif z +
        integral_(R e^(2pi i))^(eps e^(2pi i)) e^((p - 1) Ln z)/(1 + z) dif z +
        integral_(C_eps) e^((p - 1) Ln z)/(1 + z) dif z.
    $
    Первый интеграл сходится к $I$. Третий интеграл это
    $
        integral_(R e^(2pi i))^(eps^(2pi i)) e^((p - 1) Ln z)/(1 + z) dif z =
        -integral_eps^R e^((p - 1) (Ln z + 2pi i))/(1 + z) dif z =
        -e^(2pi i (p - 1)) I.
    $
    Второй интеграл оцениваем:
    $
        abs(integral_(C_R) e^((p - 1) Ln z)/(1 + z) dif z) <=
        2pi R max_(abs(z) = R) abs(e^((p - 1) Ln z)/(1 + z)) <=
        2pi R dot (R^(p - 1))/(R - 1) = 2pi R^p/(R - 1) --> 0.
    $
    Последний интеграл оцениваем также:
    $
        abs(integral_(C_eps) e^((p - 1) Ln z)/(1 + z) dif z) <=
        2pi eps max_(abs(z) = eps) abs(e^((p - 1) Ln z)/(1 + z)) <=
        2pi eps dot (eps^(p - 1))/(1 - eps) = 2pi eps^p/(1 - eps) --> 0.
    $
    Значит,
    $
        I - e^(2pi i (p - 1)) I = 2pi i e^(i pi (p - 1)) ==>
        I = 
        2 pi i e^((p - 1) pi i)/(1 - e^(2pi i (p - 1))) newline(=)
        -2pi i 1/ (e^(pi i (1 - p)) - e^(-pi i (1 - p))) =
        -pi/(sin(pi (p - 1))) =
        pi/sin(pi p).
    $
]

#ticket[Две теоремы о разложении мероморфной функции в сумму.]

#th[
    $f$ мероморфна в $CC$, $a_1$, $a_2$, ..., $a_n$ --- ее полюсы. В $oo$ устранимая особая точка или полюс. Тогда 
    $
        f(z) = sum_(k = 1)^n G_k (z) + G(z),
    $
    где $G_k (z)$ --- главная часть ряда Лорана в $a_k$, а $G(z)$ --- правильная часть ряда Лорана в $oo$.

    В частности, $f$ --- рациональная функция.

    В частности, такая мероморфная функция полностью опеределяется своими особыми точками.
]

#proof[
    Пусть $g(z) := f(z) - G(z) - sum_(k = 1)^n G_k (z)$. У нее $a_j$ --- устранимая особая точка, потому что $G$ в $a_j$ голоморфна, все $G_k$ где $j != k$ голоморфны, и надо понять лишь $f(z) - G_j (z)$ --- это функция у которой главная часть ряда Лорана нулевая. Бесконечность тоже голомофная. Тогда $g(z)$ голоморфна в $overline(CC)$, и по теореме Лиувилля она постоянна. Пусть она равна $C$. Тогда
    $
        lim_(z -> oo) ((f(z) - G(z)) - sum_(k = 1)^n G_k (z)) = C,
    $
    но в сумме все слагаемые стремяться к нулю, и $f(z) - G(z)$ в ряде Лорана имеет нулевую правильную часть. Значит $C = 0$.
]

#th[
    Пусть $a_1$, $a_2$, $a_3$, ... --- полюсы мероморфной $f$, и имеются $R_n --> +oo$ такие, что $M_(R_n) = max_(abs(z) = R_n) abs(f(z)) --> 0$. Тогда
    $
        f(z) = lim_(n -> oo) sum_(k: abs(a_k) < R_n) G_k (z),
    $
    если $z != a_j$.
]

#proof[
    Пусть 
    $
        I_n = integral_(abs(zeta) = R_n) f(zeta)/(zeta - z) dif zeta = 2 pi i sum res f(zeta)/(zeta - z).
    $
    Докажем следующее:
    $
        res_(zeta = a_k) f(zeta)/(zeta - z) = res_(zeta = a_k) (f(zeta) - G_k (zeta))/(zeta - z) + res_(zeta = a_k) (G_k (zeta))/(zeta - z) =^? -G_k (z).
    $
    Поймем,
    $
        integral_(abs(zeta) = R) (G_k (zeta))/(zeta - z) dif zeta = 2pi i (res_(zeta = z) (G_k (zeta))/(zeta - z) + res_(zeta = a_k) (G_k (zeta))/(zeta - z)),
    $
    потому что у этой функции особые точки --- это особые точки $G_k$, и $z$ (и эти точки не совпадают). Первый вычет это значение в $z$, то есть $G_k (z)$. Оценим интеграл,
    $
        abs(integral_(abs(zeta) = R) (G_k (zeta))/(zeta - z) dif zeta) <=
        2pi R max_(abs(zeta) = R) abs((G_k (zeta))/(zeta - z)) = 2 pi R dot O(1/R^2) --> 0.
    $
    Значит
    $
        -G_k (z) = res_(zeta = a_k) (G_k (zeta))/(zeta - z).
    $
    Ну а 
    $
        (f (zeta) - G_k (zeta))/(zeta - z)
    $
    имеет устранимую особую точку в $a_k$, потому что $f - G_k$ голоморфна в окрестности $a_k$, и $zeta - z$ не обращается в нуль, из-за чего её вычет равен $0$. Значит
    $
        res_(zeta = a_k) f(zeta)/(zeta - z) = -G_k (z).
    $
    Доказали промежуточные равенства. Наконец,
    $
        0 <-- I_n =
        2 pi i sum res f(zeta)/(zeta - z) =
        2 pi i (res_(zeta = z) f(zeta)/(zeta - z) + sum_(k: abs(a_k) < R_n) res_(zeta = a_k) f(zeta)/(zeta - z))
        newline(=) 
        2 pi i (f(z) - sum_(k: abs(a_k) < R_n) G_k (z)) ==>
        f(z) = lim_(n -> oo) sum_(k: abs(a_k) < R_n) G_k (z).
    $
    Почему $I_n$ стремится к $0$? Потому что
    $
        abs(I_n) <= 2 pi R_n max_(abs(zeta) = R_n) abs(f(zeta)/(zeta - z)) <= 2 pi R_n M_(R_n)/(R_n - abs(z)) --> 0.
    $
]

#ticket[Разложение котангенса в ряд.]

#example[
    Положим $f(z) = (ctg z) / z$ и подставим в теорему (почему $(ctg z) / z$ стремиться к $0$? написано в следующем билете, но храбров, кажется, перепутал порядок билетов, поэтому я перепутаю порядок примеров),
    $
        (ctg z)/z = lim_(n -> oo) sum_(k: abs(a_k) < R_n) G_k (z).
    $
    Особые точки $(ctg z)/z = (cos z)/(z sin z)$ --- корни знаменателя, где $0$ --- полюс второго порядка, и $pi k$ --- полюсы первого. Поэтому
    $
        G_k (z) = res/(z - a_k) 
    $
    в полюсе первого порядка, и
    $
        res_(z = pi k) (cos z)/(z sin z) = res_(z = pi k) ((cos z)/z)/(sin z) = lr(((cos z)/z) / (sin z)' |)_(z = pi k) = 1/(pi k). 
    $
    А
    $
        (ctg z) / z = (cos z) / (z sin z) = (1 - O(z^2))/(z (z + O(z^3))) = 1/z^2 (1 - O(z^2)) (1 + O(z^2))^(-1) = (1 - O(z^2))^2/z^2 = 1/z^2 + O(1)
    $
    Поэтому
    $
        G_0 (z) = 1/z^2,
    $
    Мы поняли, что 
    $
        (ctg z)/z = 1/(z^2) + sum_(k = 1)^oo (1/(pi k) dot 1/(z - pi k) + 1/(-pi k) dot 1/(z + pi k)) = 1/z^2 + sum_(k = 1)^oo 2/(z^2 - pi^2 k^2).
    $
    Значит,
    $
        ctg z = 1/z + sum_(k = 1)^oo (2 z)/(z^2 - pi^2 k^2).
    $
    Это отличный ряд, который сходится во всех точках!
]

#ticket[Оценка котангенса на окружностях и разложение синуса в бесконечное произведение.]

#lemma[
    $ctg z$ ограничен на окружностях $abs(z) = pi (n + 1/2)$.
]

#proof[
    $abs(ctg z)$ --- четная функция, поэтому достаточно смотреть на нее на $Re z >= 0$. Еще $abs(ctg(z))$ --- $pi$-периодическая.

    Сдвинем все в полосу $0 <= Re z <= pi$. Как? сами разберитесь, я это писать не буду.
    #figure(caption: [автору этой картинки крайне повезло, что я не знаю, как в vscode открыть git blame, потому что прикреплять в конспект png, тем более $424 times 424$ пикселя --- преступление])[
        #image("../../images/ctg-limited.png", width: 10cm)
    ]

    Короче, потому говорим что на жопе у нас значения модуля котангенса не достигаются, потом говорим что из симметрии котангенса относительно $pi / 2$ можно не рассматривать все что ниже пояса, и затем надо разделить все остальное на трусы и все что выше, и тогда так как трусы --- компакт, то нам непрерывная функция ограничена, а в остальном стакане ${0 <= Re z <= pi "и " Im z >= 2}$ надо считать,
    $
        abs(ctg z) = abs((cos z)/(sin z)) = abs((e^(i z) + e^(-i z))/(e^(i z) - e^(-i z))) = abs((e^y + e^(-y))/(e^y - e^(-y))) = abs((1 + e^(-2y))/(1 - e^(-2y))) <= (1 + e^(-4))/(1 - e^(-4)).
    $

    $ #image("../../images/HUH.png") $
]

#follow[
    Для фукнции $f(z) = (ctg z)/z$ на окружностях $pi (n + 1/2)$, $M_(R_n) --> 0$.
]

#example[
    Попробуем понять что-то про синус. Знаем
    $ (ln (sin z))' = ctg z, space (ln (sin z)/z)' = ctg z - 1/z, $
    и, рассмотрев интеграл по любому пути из $0$ в $z$,
    $
        ln (sin z)/z = integral_0^z (ctg w  - 1/w) dif w =
        integral_0^z sum_(k = 1)^oo (2w)/(w^2 - k^2 pi^2) dif w =^?
        sum_(k = 1)^oo integral_0^z (2w)/(w^2 - k^2 pi^2) dif w newline(=)
        sum_(k = 1)^oo lr(ln(w^2 - pi^2 k^2) |)_0^z =
        sum_(k = 1)^oo ln ((z^2 - pi^2 k^2)/(-pi^2 k^2)) =
        sum_(k = 1)^oo ln(1 - z^2/(pi^2 k^2)).
    $
    Осталось объяснить, почему можно:
    1. Менять местами сумму с интегралом? Потому что у нас есть честная равномерная сходимость:
        $
            abs(2w/(w^2 - pi^2 k^2)) <= 2R/(pi^2 k^2 - R^2)
        $
    2. Не думать об аргументе логарифма? Ну, да, можно не думать, очев.

    Ладно, давайте засунем наш ряд в экспоненту, и получим,
    $
        sin z = z dot product_(k = 1)^oo (1 - z^2/(pi^2 k^2)).
    $
    Это _разложение синуса в бесконечное произведение_ бывает полезно.
]

#ticket[Вычисление сумм рядов (общая схема). Пример с рядом из обратных квадратов.]

#example[
    Давайте суммировать ряды --- что-то, что раньше мы почти не умели.

    Мы рассмотрим вот такой ряд, но идея будет работать и для многих других,
    $
        sum_(n = 1)^oo 1/n^2.
    $
    В общем случае, мы хотим смотреть на сумму как на сумму вычетов в каком-то комплексном интеграле. Сумма ищется по всем натуральным числам. У какой функции полюсы тоже находятся в натуральных числах? $ctg (pi z)$, например. И если мы считаем сумму голоморфной $f(n)$ в окрестности $z = n$, то так удачно получается, что
    $
        res_(z = n) ctg(pi z) dot f(z) = lr((cos (pi z) dot f(z))/(sin (pi z))' |)_(z = n) = f(n)/pi.
    $
    И, если мы суммируем по всем натуральным числам, то это как раз сумма вычетов в комплексном интеграле. То есть,
    $
        integral_(abs(z) = n+1/2) ctg(pi z) f(z) dif z = 2 pi i (sum_(k = -n)^n (f(k))/pi + res_"остальные\nточки\nкруга" f(z)).
    $
    Возвращаемся к $1/n^2$. Посчитаем интеграл по окружности $abs(z) = n+1/2$. Тогда полюсы у подынтегральной функцией в точках $k in ZZ$, и вычеты в $k$ и в $-k$ равны, поэтому
    $
        integral_(abs(z) = n+1/2) ctg(pi z)/z^2 dif z = 2pi i (2/pi sum_(k=1)^n 1/k^2 + res_(z = 0) ctg(pi z)/z^2).
    $
    Оценим интеграл, пользуясь ограниченностью котангенса:
    $
        abs(integral_(abs(z) = n + 1/2) ctg(pi z)/z^2 dif z) <= 2pi (n + 1/2) M/(n+1/2)^2 -->_(n -> +oo) 0.
    $
    Перейдя к пределу,
    $
        sum_(k=1)^oo 1/k^2 = - pi/2 dot res_(z = 0) ctg(pi z)/z^2.
    $
    Чтобы найти вычет, нужен коэффициент при $z$ у $ctg(pi z)$. Пишем ряды:
    $
        #box(width: 30pt) ctg(pi z) =
        cos(pi z)/sin(pi z) =
        (1-(pi z)^2/2 + O(z^4))/(pi z (1 - (pi z)^2/6 + O(z^4))) newline(=)
        1/(pi z) (1-(pi z)^2/2 + O(z^4)) dot (1 + (pi z)^2/6 + O(z^4)) =
        1/(pi z) (1 - pi^2/3 z^2 + O(z^4)).
    $
    воспользовавшишь тем, что до второго члена ряды делить легко:
    $
        1/(1+t + O(t^2)) = 1 - t + O(t^2).
    $
    Значит,
    $
        sum_(k=1)^oo 1/k^2 = - pi/2 dot res_(z = 0) ctg(pi z)/z^2 = (-pi/2) dot (-pi/3) = pi^2/6.
    $
]

#example[
    Рассмотрим ряд
    $
        sum_(k=1)^oo (-1)^k/k^2.
    $
    Здесь подойдет функция
    $
        1/(sin pi z) dot 1/(z^2).
    $
    Смотрим на вычеты:
    $
        res_(z = n) 1/(sin pi z) dot 1/z^2 = 
        lr(1/z^2 / (sin pi z)'|)_(z = n) =
        lr(1/z^2 / (pi cos pi z)|)_(z = n) =
        (-1)^n / (pi n^2). 
    $
    Считаем интеграл,
    $
        1/(2 pi i) integral 1/(sin pi z) 1/z^2 dif z = 2/pi sum_(k = 1)^n (-1)^k/k^2 + res_(z = 0).
    $
    Как обычно оцениваем интеграл, сделайте сами:
    $
        abs(integral 1/(sin pi z) 1/z^2 dif z) --> 0
    $
    Надо проверить, что $1/(sin pi z)$ ограничен на окружности $abs(z) = n + 1/2$. Давайте поверим в это наслово.

    Нужен коэффициент при $z$ у $1/(sin pi z)$:
    $
        1/(sin pi z) = 1/(pi z) dot 1/(1 - (pi z)^2/6 + O(z^4)) = (1 + (pi z)^2/6 + O(z^4))/(pi z).
    $
    Отсюда,
    $
       2/pi sum_(k = 1)^n (-1)^k/k^2 = -res_(z = 0) = -pi/6 ==>
       sum_(k = 1)^n (-1)^k/k^2 = -pi^2/12.
    $

    Для очень большого числа рядов этот метод подойдет. Но, вот для обратных кубов, скажем, нет, потому что это нечетная функция и вычеты друг друга сократят. А все четные степени посчитаются, хотя при больших степенях возиться с рядами придется больше.
]

#ticket[Теорема о числе нулей и полюсов.]

#th[
    $f equiv.not 0$ --- мероморфна в $Omega$, $C$ --- простой замкнутый контур в $Omega$, не проходящий через нули и полюсы $f$. Тогда
    $
        1/(2pi i) integral_C (f'(z))/(f(z)) dif z = Nn_f - Pp_f,
    $
    где $Nn_f$ --- количество нулей $f$, которые попали внутрь контура, с учетом кратности, и $Pp_f$ --- количество полюсов $f$, которые попали внутрь контура, с учетом порядка.
]

#notice[
    В контуре обязательно конечное число нулей и полюсов. В противном случае, так как внутренность контура (с его границей) --- компакт, можно найти сходящуюся последовательность из нулей или полюсов, внутри или на гранцице контура. Тогда в случае с нулями, по теореме о единственности, функция --- тождественный $0$, а в случае с полюсами, в предельной точке нет мероморфности (так как это не изолированная особая точка).
]

#proof[
    Считаем,
    $
        1/(2pi i) integral_C (f'(z))/(f(z)) dif z = sum res f'/f.
    $
    Особые точки $f'/f$ --- нули и полюсы $f$. Пусть $a$ --- такая точка. Тогда и в нуле, и в полюсе, можно сказать
    $
        f(z) = (z - a)^m g(z),
    $
    где $g(a) != 0$, и $g$ голоморфна в окрестности $a$. В нуле $m$ --- кратность, а в полюсе $-m$ --- порядок полюса. Можно посчитать производную,
    $
        f'(z) = m (z - a)^(m - 1) g(z) + (z - a)^m g'(z).
    $
    Получается наша функция, это
    $
        (f'(z))/f(z) = m/(z - a) + (g'(z))/g(z),
    $
    и второе слагаемое голоморфное, потому что знаменатель не обнуляется в точке $a$. Значит вычет в точке $a$ равен $m$.

    Просуммировав по всем особым точкам, получим ровно $Nn_f - Pp_f$.
]

#follow(plural: true)[
    1. Если $f in H(Omega)$, $C$ --- простой замкнутый контур, не проходящий через нули, то
        $
            1/(2pi i) integral_C (f'(z))/(f(z)) dif z = Nn_f.
        $
    2. Если $f in H(Omega)$, $C$ --- простой замкнутый контур, не проходящий через нули, то
        $
            Nn_f = 1/(2 pi) Delta_C arg f,
        $
        где $Delta_C arg_f$ --- изменение $arg f$ при движении по контуру.
]

#proof[
    1. Очевидно.
    2. $Ln f$ --- первообразная вдоль пути $C$ у $f'/f$, с параметризацией $gamma: [a, b] --> C$. То есть
        $
            integral (f'(z))/(f(z)) dif z =
            lr(size: #2em, Ln f(gamma(t)) |)_(t = a)^(t = b) =
            lr(size: #2em, space (ln abs(f(gamma(t))) + i arg f(gamma(t))) |)_(t = a)^(t = b) =
            lr(size: #2em, i arg f(gamma(t)) |)_(t = a)^(t = b) =
            i Delta_C arg f.
        $
]

#ticket[Теорема Руше. Пример локализации корней.]

#th(name: "Руше")[
    $f, g in H(Omega)$, $C$ --- простой замкнутый контур в $Omega$, и $abs(f) > abs(g)$ на $C$. В частности, на контуре $abs(f) > 0$. Тогда количество нулей внутри $C$ (с учетом кратности) у функций $f$ и $f + g$ одинаково.
]

#proof[
    Надо доказать $Nn_f = Nn_(f + g)$, или
    $
        1/(2pi) Delta_C arg f = 1/(2pi) Delta_C arg (f + g).
    $
    Оказывается,
    $
        arg(f + g) = arg f dot (1 + g/f) = arg f + arg (1 + g/f).
    $
    Надо доказать, что у $Delta_C arg(1 + g/f) = 0$. А мы знаем, что $abs(g/f) < 1$ на контуре. Поэтому $1 + g(z)/f(z)$ лежит на в круге $abs(w - 1) < 1$. Ну, двигаясь в таком круге по замкнутому контуру, мы точно полный оборот не сделаем. Значит, это и правда $0$.

    #TODO[картинка]
]

#example[
    Докажем, что уравнение $z + e^(-z) = lambda$ при $lambda > 1$ в правой полуплоскости имеет ровно одно решение.

    Проверим условие теоремы Руше в правом полукруге с центром в нуле.
    #TODO[картинка]

    Положим $f = z - lambda$, $g(z) = e^(-z)$. На мнимой оси 
    $ 
        abs(f(i y)) = abs(i y - lambda) = sqrt(y^2 + lambda^2) > lambda > 1,
        abs(g(i y)) = abs(e^(-i y)) = 1.
    $
    На половинке окружности
    $
        abs(f(R e^(i t))) = abs(R e^(i t) - lambda) >= R - lambda,\
        abs(g(R e^(i t))) = abs(e^(-R e^(i t))) = abs(e^(-R cos t - i R sin t)) = e^(-R cos t) <= 1.
    $
    Если $R > lambda + 1$, то нужное неравенство верно. Значит, по теореме Руше, количество нулей у $f + g$ равно количеству нулей в $f$, то есть 1. 
]

#exercise[
    Вывести основную теорему алгебры из теоремы Руше. Указание: надо рассмотреть $f(z) = z^n$, а $g(z)$ --- все остальное.
]

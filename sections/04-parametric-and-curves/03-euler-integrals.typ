#import "../../utils/core.typ": *

== Эйлеровы интегралы

#def[
    \
    $Gamma(p) = integral_0^(+oo)x^(p-1)e^(-x)d x space p > 0$

    $B(p, q) = integral_0^1 x^(p-1)(1-x)^(q-1) d x space p, q > 0$
]

#notice[
    При условии $p > 0$  и $q > 0$ интегралы сходящиеся. $Gamma(p)$ в нуле $x^(p-1)e^(-x) tilde 1/(x^(1-p))$ сходящиеся так как $1 - p < 1$, в бесконечности $x^(p-1)e^(-x/2) --> 0 ==> x^(p-1)e^(-x/2) <= c ==> x^(p-1) e^(-x) <= c e ^(-x/2)$
]

#TODO[про бета функцию надеюсь андрей успел у меня пальцы еще не согрелись]

#props(name: "Г-функции")[
    + $Gamma(p+1) = p Gamma(p)$
    + $Gamma(n) =(n-1)!$
    + $Gamma(1/2) = sqrt(pi)$
    + $Gamma(n + 1/2) = (2n - 1)!! / (2^n) sqrt(pi)$
    + $Gamma(p)$ --- бесконечно дифференцируема и формула для $n$-ой производной:
    $ Gamma^((n))(p) = integral_0^(+oo) x^(p-1)(ln x)^n e^(-x)d x $
    + $Gamma(p)$ строго выпукла.
    + $Gamma(p) -->_(p --> +oo) +oo$ и $Gamma(p) tilde_(p --> 0+) 1/p$.
]

#proof[
    + $Gamma(p + 1) = integral_0^(+oo) x^p e^(-x)d x = x^p dot (-e^(-x))|_(x=0)^(x = +oo) + integral_0^(+oo)p x^(p-1) e^(-x) d x = p Gamma(p)$.

    + $Gamma(n) = (n-1) Gamma (n - 1) = ... = (n-1)(n-2)...1 dot Gamma(1) = (n-1)!$.$ space Gamma(1) = integral_0^(+oo) e^(-x) d x = 1$.

    + $Gamma(1/2) = integral_0^(+oo) x^(1/2 - 1) e^(-x) d x = [y = sqrt(x)] = integral_0^(+oo) e^(-y^2) d y$.

    + $Gamma(n + 1/2) = (n - 1/2)Gamma(n - 1/2) = ... = (n-1/2)(n - 3/2) ... 1/2 Gamma(1/2) = (2n - 1)!! / (2^n) sqrt(pi)$.

    + Индукция по _n_: проверим локальное условие Лебега. \
        $0 < alpha < p < beta$, то есть берем некоторую окрестность точки _p_. Начнем с бесконечности: $ln x <= x ==> x^(p-1) (ln x)^n e^(-x) <= x^(beta + n - 1) e^(-x)$, то есть является мажорантой, сходится на $[1, +oo]$.

        Теперь посмотрим в нуле: $x^epsilon ln x -->_(x-->0+) 0$, если так, то $abs(ln x) <= c x^(-epsilon) ==> x^(p-1)abs(ln x)^n e^(-x) <= c^n x^(p - n epsilon - 1) e^(-x) <= c^n x^(alpha - n epsilon - beta) e^(-x) <= c^n x^(alpha - n epsilon - beta)$. Если $alpha - n epsilon > 0$, то сходится.
    
    + $Gamma^('')(p) = integral_0^(+oo) x^(p-1)ln^2 x e^(-x) d x > 0$, поэтому строго выпукла.

    + $p Gamma(p) = Gamma(p + 1) -->_(p --> 0) Gamma(1) = 1$. $Gamma(n + 1) = n! --> +oo$, поймем, что оно монотонно для больших _p_: $Gamma'(p) = integral_0^(+oo) x^(p-1) ln x e^(-x)d x = underbrace(integral_0^1, (*)) + integral_1^(+oo) > 0 ==> $ возрастает.

        $(*)$ маленький при больших _p_.
]

#notice[
    $Gamma(p) tilde_(p--> +oo) sqrt((2n)/p) e^(-p) p^p$
]

#props(name: "В-функции")[
    + $Beta(p, q) = Beta(q, p)$
    + $Beta(p, q) = integral_0^(+oo) (t^(p-1)/(1+t)^(p + 1)) d t$
]

#proof[
    + $Beta(p, q) = integral_0^1 x^(p-1)(1-x)^(q - 1)d x = [y = 1 - x] = -integral_1 ^0 y^(q - 1) (1- y)^(p - 1) d y = Beta(q , p)$

    + $Beta(p, q) = integral_0^1 x^(p-1)(1-x)^(q - 1)d x = [x = t/(1+t) space d x = (d t)/(1+t)^2] \ = integral_0^(+oo)(t/t+1)^(p-1)(1/(t+1))^(q-1) (d t) / (1+t)^2 = integral_0^(+oo) (t^(p-1)/(1+t)^(p+q) d t)$ 
]

#th[
    $Beta(p, q) = (Gamma(p) Gamma(q)) / Gamma(p + q) $
]

#proof[

    $Gamma(p) Gamma(q) = integral_0^(+oo) x^(p-1) e^(-x) d x dot integral_0^(+oo) y^(q - 1) e^(-y) d y = integral_0^(+oo) integral_0^(+oo) x^(p-1) y^(q - 1) e^(-x-y) d x d y = \ = [x = u - y space space d x = d u] = integral_0^(+oo) integral_y^(+oo)(u - y)^(p-1)y^(q-1) e^(-u)d u d y = integral_0^(+oo) integral_0^u (u - y)^(p-1)y^(q-1) e^(-u)d y d u = \ = [y = u v space space d y = u d v] = integral_0^(+oo) integral_0^(1) (u - u v)^(p-1) (u v)^(q-1) e ^(-u) u d v d u = \ =  integral_0^(+oo) u ^(p + 1 - 1) e^(-u) integral_0^(1) (1-v)^(p-1) v ^(q - 1) d v d u = Beta(p, q) integral_0^(+oo) (u^(p + q - 1) e^(-u))d u = Beta(p, q) dot Gamma(p + q)$ 
]

#follow[
    + _Формула дополнения_: $Gamma(p) Gamma(1 - p) = pi/(sin pi p)$ при $0 < p < 1$

    + _Формула удвоения_: $Gamma(p) Gamma(p + 1/2) = sqrt(pi)/2^(2p - 1) Gamma(2 p)$
]

#proof[
    + $Beta(p, 1 - p) Gamma(1) = integral_0^(+oo)(t^(p-1))/(1 + t)d t$, вычисление только в некст семестре.

    + $Beta(p, p) = (Gamma(p) Gamma(p)) / Gamma(2 p) = 1/2^(2p - 1) dot (Gamma(1 / 2) Gamma(p))/Gamma(p + 1/2) = Beta(1/2, p) dot 1/(2^(2p - 1))$
        $Beta(p ,p) = integral_0^(1)x^(p-1)(1-x)^(p - 1)d x = 2 integral_0^(1/2) (x (1-x))^(p - 1) d x = [x = 1/2 - y space space 1 - x = 1/2 + y] = \ = integral_0^(1/2) (1/4-y^2)^(p - 1) d y = [y = z / 2] = integral_0^(1) (1/4 - 1/4z^2)^(p - 1) d z = 1/2^(2p - 1) integral_0^(1) (1-t)^(p - 1) t ^(1/2 - 1) d t = Beta(p, 1/2)/2^(2p - 1) $
        Там где-то была замена $t = z^2$.
]

#th[
    $Gamma(t + 1) tilde_(t--> +oo) t^a Gamma(t)$ при $a > 0$.
]

#proof[
    Очень хотим понять, что $Beta(a, t + 1) = (Gamma(a) Gamma(t + 1)) / Gamma(a + t + 1) tilde^(?) Gamma(a)/t^a$.

    $Beta(a , t+ 1) = integral_0^1 x^(a - 1) (1 - x)^t d x = integral_0^t y^(a - 1) t ^(1 - a) (1-y/t)^t dot (d y) / t = 1/t^a integral_0^(+oo) y ^(a - 1) (1 - y/t)^t bb(1)_([0, t])(y) d y$. 
    
    Теперь хотим понять, что интеграл стремится к нужной константе:

    $y^(a - 1) (1 - y/t)^t bb(1)_[0, t] -->_(t --> +oo) y^(a-1)e^(-y)$ --- суммируемая мажоранта, где $1 - y/t <= e^(-y/t)$.
]

#notice[
    Если $a in [1, 2]$, то у нас есть равномерное стремление: $Gamma(t + 1)/(t^a Gamma(t)) arrows.rr 1$

    $abs(integral_0^(+oo) y^(a - 1) (1 - y / t)^t d y - Gamma(a)) <= integral_0^(+oo) y^(a - 1) e^(-y) d y + integral_0^(t) y^(a - 1) abs((1 - y/t)^(t) - e^(-t))d y <= \ <= integral_0^(+oo) y e ^(-y)d t + integral_0^(1) abs((1-y/t)^t - e^(-y))d t + integral_1^(t)y abs((1 - y/t)^t - e^(-y))d y --> 0,$\ где каждый из них стремится к нулю.
]
#follow[
    $Gamma(p) tilde_(p --> +oo) sqrt((2 pi ) / p) e^(-p) p^p$
]
#proof[
    $p = n + 1$, где $a in [1, 2]$. 
    $
        Gamma(p) = Gamma(n + a) tilde Gamma(n) n^a = Gamma(n + 1)/n n^a = n! n^(a-1) tilde \ tilde n ^n e^(-n) sqrt(2 pi n) dot n^(a-1)
        tilde^(?) sqrt((2 pi) / (n + a)) e^(- n - a)(n + a)^( n + a).
    $

    Тут мы делим одну часть на другую 
    
    $(e^(-a)(n+a)^(n+a) dot 1/ sqrt(n + a))/(n^n sqrt(n) n^a dot 1/n) tilde e^(-a) ((n+a)/n)^n (n+a)^a/a^a tilde e^(-a)(1 + a/n)^n --> 1$. И осталось проверить, что стремление равномерное как-нибудь прологорифмировав.
]

#follow(name: "Формула Эйлера-Гаусса")[
    $ Gamma(p) = lim_(n-->+oo)n^p (n!)/((p + 1)(p+2)...(p+n)), space p > 0. $
]

#proof[
    $(p(p+1)..(p+n))/(n!) = Gamma(p + n)/ Gamma(p) dot (p+n)/(Gamma(n) dot n)$

    $Gamma(p + n) = (p + n - 1) Gamma(p + n - 1) = (p + n - 1)(p + n - 2) dot ... dot p dot Gamma(p)$

    $n^p/Gamma(p) dot n!/(p (p + 1) ... (p + n)) = n^p / cancel(Gamma(p)) dot cancel(Gamma(p)) / Gamma(n + p) dot Gamma(n) dot n / (n + p) ==> Gamma(n + p) tilde n^p Gamma(n)$.
]

#follow(name: "Формула Валлиса")[
]

#proof[
    $p = 1/2$:
    $
        sqrt(n) dot n!/(1/2 dot 3/2 dot ... dot (n + 1/2)) --> Gamma(1/2) = sqrt(pi) ==> (2 sqrt(pi) dot (2n)!!)/((2n + 1)!!) --> sqrt(pi)
    $
]

#example[
    $ 1 dot 4 dot 7 dot 10 dot ... dot (3n + 1) = 3^(n+1) dot 1/3 dot (1/3 + 1) dot ... dot (1/3 + n) tilde_("по Э-Г") ((3^(n+1)) root(3, n) dot n!) / Gamma(1/ 3) $
]

#example[
    + $integral_0^(+oo)e^(-x^p) d x = [y = x^p] = integral_0^(+oo) 1/p y^(1/p - 1) e^(-y)d y = 1/p dot Gamma(1/p) = Gamma(1 + 1/p)$.

    + $integral_0^(pi / 2) sin^(p - 1) phi cos^(q - 1) phi d phi = [x = sin^2phi] = 1/2 integral_0^(1) x^((p - 2) / 2) (1-x)^((q - 2) / 2) d x = 1/2 Beta dot (p/2, q/2)$.
        
        В частности $integral_0^(pi / 2) sin^(p - 1) phi d phi = integral_0^(pi / 2) cos^(p - 1) phi d phi = 1/2 dot Beta(p / 2, 1/2) = 1/2 dot (Gamma(p / 2) Gamma(1 / 2)) / Gamma((p + 1) / 2)$

    + $V_n(r)$ --- _объем n-мерного шара с радиусом r_.
        #TODO[
            Вставить ебейшую картинку с треугольником внутри шара и теоремой Пифагора.
        ]

        $V_n(r) = r^n V_n (1) =: c_n r^n$. Найдем по принципу Кавальери:

        $
            V_n (1) = integral_(-1)^(1) V_(n - 1) (sqrt(1 - x^2))d x = 2 integral_0^(1) (1-x^2)^((n-1)/2) C_(n-1) d x = [x = sin phi] = \ = 2 C_(n-1) integral_0^(pi / 2)(cos phi)^(n) d phi = 2 dot C_(n-1) dot 1/2 dot (Gamma((n + 1) / 2) sqrt(pi)) / Gamma(n/2 + 1)
        $

        Так получаем, что 
        $
            C_n = C_(n-1) sqrt(pi) dot Gamma((n + 1) / 2)/Gamma(n/2 + 1) = C_(n-2) dot pi dot cancel(Gamma((n + 1)/2)) / Gamma(n/ 2 + 1) dot Gamma(n/2)/cancel(Gamma((n + 1)/2)) = \ = ... = C_1 dot pi^((n-1)/2) dot Gamma(3/2) / Gamma(n/2 + 1) = 2 dot sqrt(pi) / 2 dot pi ^((n-1)2) dot 1/ Gamma(n/2 + 1) = pi^(n / 2) / Gamma(n/2 + 1).
        $

]
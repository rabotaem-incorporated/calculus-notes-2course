#import "../../utils/core.typ": * 
== Мера Лебега

#th[
    Классический объем $lambda_m$ на ячейках $Pp^m$ --- $sigma$-конечная мера.
]

#proof[
    Надо проверить счетную полуаддитивность. $ (a, b] subset Union_(n = 1)^oo (a_n, b_n] ==>^? lambda_m (a, b] <= sum_(n = 1)^oo lambda_m (a_n, b_n], $
    где $a, b, a_n, b_n in RR^m$. Возьмем $eps > 0$ и 
    $(a, b] supset [a', b]$ так, чтобы $lambda_m (a', b] > lambda_m (a, b] - eps$.

    Возьмем $(a_n, b'_n) supset (a_n, b_n]$ и $lambda_m (a_n, b'_n] < lambda_m (a_n, b_n) + eps / 2^n$. $[a', b] subset (a, b] = Union_(n = 1)^oo (a_n, b_n] subset Union_(n = 1)^oo (a_n, b'_n)$.

    У нас написано какое-то покрытие компакта. Выберем конечное подпокрытие, $(a', b] subset [a', b] subset Union_(n=1)^N (a_n, b_n') subset Union_(n = 1)^N (a_n, b'_n]$.

    $
        lambda_m (a, b] - eps < lambda_m (a', b] <= sum_(n = 1)^N lambda_m (a_n, b'_n] < \ < sum_(n = 1)^N (lambda_m (a_n, b_n] + eps / 2^n) < sum_(n = 1)^N lambda_m (a_n, b_m] + eps <= sum_(n = 1)^oo lambda_m (a_n, b_n] + eps.
    $

    Значит $lambda_m (a, b] < 2 eps + sum_(n = 1)^oo lambda_m (a_n, b_n]$ и устремим $eps$ к нулю. Доказали.
]

#def[
    _Мера Лебега_ $lambda_m$ --- это стандартное продолжение классического объема с полукольца ячеек на $sigma$-алгебру $Ll^m$, где $Ll^m$ --- _лебеговская $sigma$-алгебра_
]

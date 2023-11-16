#import "../../utils/core.typ": * 

== Определение Интеграла

#lemma[
    Пусть $f >= 0$ простая, $A_i$ --- допустимое разбиение, $a_i$ --- значения $f$ на $A_i$. $B_j$ --- допустимое разбиение, $b_j$ --- значения $f$ на $B_j$. Тогда $sum_(i = 1)^m a_i mu (E sect A_i) = sum_(j = i)^n b_j mu(E sect B_j)$.    
]

#proof[
    $E sect A_i$ = $usb_(j = 1)^m E sect A_i sect B_j$.

    $ sum_(i = 1)^m a_i mu(E sect A_i) = sum_(i = 1)^m sum_(j = 1)^n underbrace(a_i mu(E sect A_i sect B_j), = b_j mu(E sect A_i sect B_j)) = sum_(j=1)^n sum_(i=1)^m b_j mu (E sect A_i sect B_j) = sum_(j=1)^m b_j mu(E sect B_j). $
    Если $E sect A_i sect B_j != nothing$, то $a_i = b_j$.

    Отметим, что $f >= 0$ нужно, так как меры могут быть бесконечными и в этом случае суммы бесконечностей с разными знаками начнут зависеть от порядка слагаемых (RIP ассоциативность).
]

#def[
    Пусть $f >= 0$ простая, $A_j$ --- допустимое разбиение, $a_i$ --- значения $f$ на $A_i$, $E$ --- измеримо (во всех дальнейших определениях $E$ также будет измеримо!). _Интегралом Лебега_ называется
    $
        integral_E f dif mu = integral_E f(x) dif mu(x) := sum_(i = 1)^m a_i mu(E sect A_i).
    $
]

#props[
    1. $ integral_E c dif mu = c mu E. $

    2. Если $f <= g$ --- неотрицательные простые функции, то $ integral_E f dif mu <= integral_E g dif mu. $

    3. Пусть $f, g >= 0$ простые:
        $
            integral_E (f + g) dif mu = integral_E f dif mu + integral_E g dif mu.    
        $

    4. Пусть $alpha in RR_(>= 0)$, $f >= 0$ --- простая. Тогда
        $
            integral_E alpha f dif mu = alpha integral_E f dif mu.
        $
]

#proof[
    1. Очевидно: $E$ --- допустимое разбиение себя, $c$ --- значение $f$ на $E$.

    2. Рассмотрим общее допустимое разбиение $A_i$ для $f$ и $g$. Тогда $a_i <= b_i$ и $sum_(i = 1)^m a_i mu(E sect A_i) <= sum_(i = 1)^m b_i mu(E sect A_i)$.

    3. Тоже самое, только надо сложить.

    4. Аналогично и тривиально.
]

#def[
    Пусть $f >= 0$ --- измеримая. _Интегралом Лебега_ называется
    $
        integral_E f dif mu = sup {integral_E phi dif mu : 0 <= phi <= f, phi #[--- простая]}
    $
]

#notice[
    Для простых $f$ определения совпадают.
]

#def[
    Пусть $f$ --- измеримая. _Интегралом_ называется
    $
        integral_E f dif mu = integral_E f_+ dif mu - integral_E f_- dif mu.
    $
    Если при вычитании, получается $(+oo) - (+oo)$, то интеграл не определен.
]

#notice[
    Для неотрицательных $f$ определения совпадают.
]

#props(name: "интеграла от неотрицательных функций")[
    1. $0 <= f <= g$ измеримые, тогда $ integral_E f dif mu <= integral_E g dif mu. $

    2. Если $mu E = 0$, то $ integral_E f dif mu = 0. $

    3. $ integral_E f dif mu = integral_X bb(1)_E dot f dif mu. $

    4. $f >= 0$ измеримая, $ A subset B ==> integral_A f dif mu <= integral_B f dif mu. $
]

#proof[
    1. Все подходящие в супремум функции для $f$, есть и в супремуме функции для $g$.

    2. Интеграл любой простой функции 0, значит в супремуме множесто только из нулей.

    3. Если $0 <= phi <= bb(1)_E f$, то такая функция подойдет для интеграла слева тоже, поэтому знак $>=$ есть. Если $0 <= phi <= f$, то $0 <= bb(1)_E phi <= bb(1)_E f$,
        $ integral_E phi dif mu = integral_E phi bb(1)_E dif mu. $
        Отсюда неравенство в другую сторону.

    4. $ integral_A f dif mu = integral_X bb(1)_A f dif mu <= integral_X bb(1)_B f dif mu = integral_B f dif mu. $
]

#th(name: "Беппо Леви")[
  Пусть $0 <= f_1 <= f_2 <= f_3 <= ...$, такие что $f_n$ поточечно сходится к $f$ на $E$. Тогда $ lim integral_E f_n dif mu = integral_E f dif mu. $
]

#proof[
    $f_n <= f_(n + 1)$, значит $integral_E f_n dif mu <= integral_E f_(n + 1) dif mu$. Тогда существует $lim integral_E f_n dif mu =: L$. $f_n <= f$, поэтому $integral_E f_n dif mu <= integral_E f dif mu ==> L <= integral_E f dif mu.$ Одно неравенство доказали.

    Надо доказать, что $L >= integral_E f dif mu = sup { integral_E phi dif mu bar 0 <= phi <= f, phi #[--- простая] }$. Достаточно доказать, что $L$ --- верхняя граница, то есть что $L >= integral_E phi dif mu$, где $phi$ --- простая $0 <= phi <= f$.

    Возьмем $theta in (0, 1)$ и докажем, что $L >= theta integral_E phi dif mu = integral_E (theta phi) dif mu$, потом перейдем к пределу. Пусть $E_n := E{f_n >= theta phi}$. Это растущая последовательность, $E_1 subset E_2 subset E_3 subset ...$ и $Union_(n = 1)^oo E_n = E$ (это следует из поточечной сходимости $f_n$ к $f > theta phi$). 
    
    По непрерывности меры снизу, $forall A - "измеримое" mu (A sect E_n) -->_(n-->oo) mu (A sect E)$, а значит
    
    $
        integral_E f_n dif mu >= integral_(E_n) f_n dif mu >= integral_(E_n) theta phi dif mu = theta integral_(E_n) phi dif mu = \ = theta sum_(k = 1)^m a_k mu(A_k sect E_n) -->_(n -> oo) theta sum_(k = 1)^m a_k mu(A_k sect E) = theta integral_E phi dif mu ==>\
        ==> lim_(n-->oo) integral_E f_n dif mu >= theta integral_E phi dif mu.
    $
]

#props[
    5. _Аддитивность_. Пусть $f, g >= 0$ измеримые. Тогда
        $ integral_E (f + g) dif mu = integral_E f dif mu + integral_E g dif mu. $

    6. _Однородность_. $alpha in RR_(>= 0)$, $f >= 0$ измеримая. Тогда
        $ integral_E (alpha f) dif mu = alpha integral_E f dif mu. $
]

#proof[
    Возьмем простые $phi_n$ такие что $0 <= phi_1 <= phi_2 <= ... --> f$ поточечно, $psi_n$ такие что $0 <= psi_1 <= psi_2 <= ... -> g$ поточечно. Тогда $0 <= phi_1 + psi_1 <= phi_2 + psi_2 <= ... --> f + g$ поточечно.

    5. $ underbrace(integral_E (phi_n + psi_n) dif mu, --> integral_E (f + g) dif mu) = underbrace(integral_E phi_n dif mu, --> integral_E f dif mu) + underbrace(integral_E psi_n dif mu, --> integral_E g dif mu). $

    6. $ underbrace(integral_E (alpha phi_n) dif mu, --> integral_E (alpha f) dif mu) = alpha underbrace( integral_E phi_n dif mu, --> integral_E f dif mu). $
]

#props[
    7. _Аддитивность по множеству_. Пусть $f >= 0$ Тогда $ integral_A f dif mu + integral_B f dif mu = integral_(A union.sq B) f dif mu. $

    8. Если $mu E > 0$ и $f > 0$ на $E$ то $integral_E f dif mu > 0$.
]

#proof[
    7. $bb(1)_A f + bb(1)_B f = bb(1)_(A union.sq B) f$. Выразим интегралы из условия через произведение на характеристическую функцию, все получится.

    8. $E_n := E{f >= 1/n}$. $E_1 subset E_2 subset ...$
        
        $ 
            Union_(n = 1)^oo E_n = E ==> mu E_n --> mu E > 0 ==> mu E_n > 0 "при больших" n ==> \ ==> 
            integral_E f dif mu >= integral_(E_n) f dif mu >= integral_(E_n) 1/n dif mu = 1/n mu E_n > 0.
        $
]

#example[
    Рассмотрим следующую меру: $T = {t_1, t_2, ...}$ --- не более чем счетное. $w_1, w_2, ... >= 0$. $mu A := sum_(t_i in A) w_i$.
    
    Пусть $f >= 0$. Тогда проверим, что
    $ integral_E f dif mu = sum_(t_i in E) f(t_i) w_i. $
    Напомню, $integral_E f dif mu = sup{integral_E phi dif mu : 0 <= phi <= f, phi #[--- простая]}$.

    - Шаг 1. $f = bb(1)_A$. $ integral_E bb(1)_A dif mu = mu(E sect A) = sum_(t_i in E sect A) w_i = sum_(t_i in E) f(t_i) w_i. $

    - Шаг 2. $f >= 0$ --- простая. По линейности доказано.

    - Шаг 3. $f >= 0$ --- измеримая. Будем проверять неравенства с супремумом:
        - "$sup >= sum$": $phi_n := f bb(1)_{t_1, t_2, ..., t_n} <= f$.
            $ integral_E phi_n dif mu = sum_(t_i in E \ i <= n) f(t_i) dot w_i -->_(n -> oo) sum_(t_i in E) f(t_i) w_i $

        - "$sup <= sum$": Доказываем $ integral_E phi dif mu <= sum_(t_i in E) f(t_i) w_i. $
            Можно записать для простых:
            $
                integral_E phi dif mu = sum_(t_i in E) phi(t_i) w_i <= sum_(t_i in E) f(t_i) w_i
            $
            так как $phi(t_i) <= f(t_i)$.
            
            Если $f$ --- произвольная измеримая, то
            $
                integral_E f dif mu = sum_(t_i in E) f(t_i) w_i
            $
            (если $integral_E f_(plus.minus) dif mu$ конечны, иначе интеграл не определен).
]

#def[
    Свойство $P(x)$ верно _при почти всех_ $x in E$ или _почти везде_ на $E$, если существует $e subset E$, $mu e = 0$ такое, что $P(x)$ верно при любом $x in E without e$.
]

#notice[
    Если имеется последовательность свойств $P_1(x), P_2(x), ...$ выполняющихся почти везде на $E$, то они все вместе тоже выполняются почти везде на $E$.
]

#proof[
    Возьмем все исключительные множества: $e_1, e_2, ...$ и рассмотрим $e = Union e_n$. Тогда $mu e = 0$. На $E without e$ все $P_n$ выполняются.
]

#th(name: "неравенство Чебышева (не путать с неравентсвом Чебышева из теорвера, где оно называется \"неравенство Маркова\", а неравенство Чебышева там другое)")[
    Пусть $f >= 0$ измеримая, $p, t in RR_(>= 0)$. Тогда $ mu E{f >= t} <= 1/(t^p) integral_E f^p dif mu. $
]

#proof[
    $
        integral_E f^p dif mu >= integral_(E{f >= t}) f^p dif mu >= integral_(E{f >= t}) t^p dif mu = t^p mu E{f >= t}.
    $
]

#props(name: "связанные с понятием \"почти везде\"")[
    1. Если $integral_E abs(f) dif mu < +oo$, то $f$ почти везде конечна на $E$.

    2. Если $integral_E abs(f) dif mu = 0$, то $f = 0$ почти везде на $E$.

    3. Если $A subset B$ и $mu (B without A) = 0$, то $integral_A f dif mu = integral_B f dif mu$.

    4. Если $f = g$ почти везде на $E$, то $integral_E f dif mu = integral_E g dif mu$.
]

#proof[
    1. $E{f = plus.minus oo} subset E {abs(f) >= n}$.
        $ mu E{abs(f) >= n} <=_"Чебышев" 1/n integral_E abs(f) dif mu -->_(n->oo) 0. $

    2. Если $mu E{abs(f) > 0} > 0$, то интеграл положительный (было выше). Значит $mu E{abs(f) > 0} = 0$.

    3. $ integral_B f dif mu = integral_A f dif mu + underbrace(integral_(B without A) f dif mu, 0). $

    4. Пусть $e subset E$ такое, что $mu e = 0$ и $f = g$ на $E without e$.
        $ integral_E f dif mu = integral_(E without e) f dif mu = integral_(E without e) g dif mu = integral_E g dif mu. $
]

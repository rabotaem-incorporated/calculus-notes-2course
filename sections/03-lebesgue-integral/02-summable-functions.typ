#import "../../utils/core.typ": * 

== Суммируемые функции

#def[
    Измеримая $f: E --> overline(RR)$ называется _суммируемой на $E$_, если оба следующих интеграла конечны:
    $
        integral_E f_plus.minus dif mu < +oo.
    $
]

#props[
    1. $f$ --- суммируема на $E$ тогда и только тогда, когда $integral_E abs(f) dif mu < +oo$.
    
    2. Если $f$ суммируема на $E$, то $f$ почти везде конечна на $E$
    
    3. Если $A subset B$ и $f$ суммируема на $B$, то $f$ суммируема на $A$.
    
    4. Ограниченая функция суммируема на множестве конечной меры.

    5. Если $f$ и $g$ суммируемы и $f <= g$, то $ integral_E f dif mu <= integral_E g dif mu. $

    6. _Аддитивность интеграла_. Если $f$ и $g$ суммируемы, то $f + g$ суммируема и $ integral_E (f + g) dif mu = integral_E f dif mu + integral_E g dif mu.$

    7. _Однородность интеграла_. Если $f$ --- суммируема, то $c f$ суммируема и $ integral_E (c f) dif mu = c integral_E f dif mu. $
    
    8. _Линейность интеграла_. Пусть $alpha_1, ... alpha_n in RR$, $f_1, ..., f_n$ --- суммируемые. Тогда $alpha_1 f_1 + alpha_2 f_2 + ... + alpha_n f_n$ суммируемая и $ integral_E (alpha_1 f_1 + alpha_2 f_2 + ... + alpha_n f_n) dif mu = alpha_1 integral_E f_1 dif mu + alpha_2 integral_E f_2 dif mu + ... + alpha_n integral_E f_n dif mu. $

    9. _Аддитивность по множеству_. Если $E = Union_(k = 1)^n E_k$, $f$ суммируема на $E_k$ при $k = 1, ... n$, то $f$ суммируема на $E$. В случае, когда объединение дизъюнуктно,
        $
            integral_E dif mu = integral_(E_1) f dif mu + ... + integral_(E_n) f dif mu.
        $

    10. _Интеграл по сумме мер_. Пусть $mu_1$ и $mu_2$ меры на $sigma$-алгебре $Aa$. Пусть $mu = mu_1 + mu_2$ в смысле $forall A space mu A = mu_1 A + mu_2 A$. Тогда $f$ суммируемо относительно $mu$ тогда и только тогда, когда $f$ суммируема относительно и $mu_1$, и $mu_2$ и $ integral_E f dif mu = integral_E f dif mu_1 + integral_E f dif mu_2 $ если $f >= 0$ или $f$ суммируема по $mu$ (хотя бы одно).
]

#let IE = $integral_E$

#proof[
    1. 
        - "$==>$": $abs(f) = f_+ + f_-$
        - "$<==$": $0 <= f_plus.minus <= abs(f)$

    2. См. предыдущий параграф

    3. $ bb(1)_A abs(f) <= abs(f) ==> integral_A abs(f) dif mu = integral_B bb(1)_A abs(f) dif mu <= integral_B abs(f) dif mu $
    
    4. Интеграл не превосходит констатнту на меру множества. 

    5. $ f_+ - f_- = f <= g = g_+ - g_- ==> f_+ + g_- <= g_+ + f_- ==> \ ==> integral_E f_+ dif mu + integral_E g_- dif mu <= integral_E g_+ dif mu + integral_E f_- dif mu ==> \ ==> integral_E f_+ dif mu - integral_E f_- dif mu <= integral_E g_+ dif mu - integral_E g_- dif mu. $

    6. $abs(f + g) <= abs(f) + abs(g)$, поэтому $f + g$ --- суммируемая. Пусть $h = f + g$. Тогда $h_+ + f_- + g_- = f_+ + g_+ + h_-$.
        $
            integral_E h_+ dif mu + integral_E f_- dif mu + integral_E g_- dif mu = integral_E f_+ dif mu + integral_E g_+ dif mu + integral_E h_- dif mu.
        $

    7. Если $c = 0$ --- очев. Пусть $c > 0$. Тогда $(c f)_+ = c f_+$, $(c f)_- = c f_-$. 
        $
            integral_E (c f)_plus.minus dif mu = c integral_E f_plus.minus dif mu.
        $
        Если $c < 0$, рассмотрим $c = -1 dot abs(c)$. Для минус единицы все очевидно.

    8. Просто 6) + 7) + индукция.

    9. $f_(E_k) f dif mu = integral_X bb(1)_(E_k) f dif mu$. $bb(1)_E abs(f) <= bb(1)_(E_1) abs(f) + ... + bb(1)_(E_n) abs(f)$. Если есть дизъюнктность, $bb(1)_E abs(f) = bb(1)_(E_1) abs(f) + ... + bb(1)_(E_n) abs(f)$. Ну и интегрируем.

    10. Пусть $f >= 0$. Докажем формулу по шагам.
        - Шаг 1. $f = bb(1)_A$:
            $ integral_E bb(1)_A dif mu = mu(E sect A) = mu_1(E sect A) + mu_2(E sect A) = integral_E bb(1)_A dif mu_1 + integral_E bb(1)_A dif mu_2. $
        - Шаг 2. $f$ --- неотрицательная простая. Очевидно верно по линейности.
        - Шаг 3. $f >= 0$ измеримая. Берем последовательность $0 <= phi_1 <= phi_2 <= ...$ простых функций, таких, что $phi_n --> f$ поточечно. Тогда $ integral_E phi_n dif mu = integral_E phi_n dif mu_1 + integral_E phi_n dif mu_2 ==>^"т. Беппо Леви" integral_E f dif mu = integral_E f dif mu_1 + integral_E f dif mu_2. $
            $integral_E abs(f) dif mu = integral_E abs(f) dif mu_1 + integral_E abs(f) dif mu_2$, поэтому есть равносительность.
        - Шаг 4. $f$ --- суммируемые. $integral_E f_plus.minus dif mu, integral_E f_plus.minus dif mu_1, integral_E f_plus.minus dif mu_2 < +oo$. Тогда $ IE f_plus.minus dif mu = IE f_plus.minus dif mu_1 + IE f_plus.minus dif mu_2 $ и вычтя из одного другое, получим что хотим.
]

#def[
    $f: E --> CC$ _измеримая_ если $Re f$ и $Im f$ измеримы.
]

#def[
    Пусть $f: E --> CC$. Тогда коплексно-значным _интегралом_ назовем $ IE f dif mu = IE Re f dif mu + i IE Im f dif mu $
    если $Re f$ и $Im f$ суммируемы. Такие функции назовем _суммируемыми_.
]

#props[
    1. $f$ --- суммируема тогда и только тогда, когда $IE abs(f) dif mu < +oo$.
    2. Все свойства интеграла сохраняются.
]

#proof[
    1. $abs(f) <= abs(Re f) + abs(Im f)$ и $0 <= Re f, Im f <= abs(f)$.

    2. По сути все очевидно, кроме комплексной линейности, где мы можем вынести не только положительное или отрицательное вещественное число, но и комплесное. Докажем его для $c = i$.
        $ IE (i f) dif mu = i IE f dif mu = -IE Im f dif mu + i IE Re f dif mu. $
]

#let INT(f, E: $E$, mu: $mu$) = $ integral_#E #f dif #mu $

#props[
    3. $f: E --> CC$. $ abs(INT(f)) <= INT(abs(f)) $
]

#proof[
    Возьмем $alpha in RR$ такое, что $ e^(i alpha) INT(f) = abs(INT(f)). $
    Тогда $c e^(i alpha) = abs(c)$ и $e^(-i alpha) = c / abs(c)$.
    $
        abs(INT(f)) = e^(i alpha) INT(f) = INT(e^(i alpha) f) = INT(Re (e^(i alpha) f)) + i underbrace(INT(Im(e^(i alpha) f)), = 0) =\
        = INT(Re(e^(i alpha) f)) <= INT(abs(Re(e^(i alpha) f))) <= INT(abs(e^(i alpha) f)) = INT(abs(f)).
    $
]

#th(name: "счетная аддитивность интеграла")[
    Пусть $f >= 0$ измеримая, $E = usb_(n = 1)^oo E_n$. Тогда
    $
        INT(f) = sum_(n = 1)^oo INT(f, E: E_n).
    $
]

#proof[
    $bb(1)_E = sum_(n = 1)^oo bb(1)_(E_n)$, $S_n := sum_(k = 1)^n bb(1)_(E_k) f arrow.tr bb(1)_E f$. Тогда по теореме Леви 
    $ INT(E: X, sum_(k = 1)^n bb(1)_(E_k) f)= INT(S_n, E: X) --> INT(bb(1)_E f, E: X) = INT(f). $
    Более того,
    $
        INT(E: X, sum_(k = 1)^n bb(1)_(E_k) f) = sum_(k = 1)^n INT(E: X, bb(1)_(E_k) f) = sum_(k = 1)^n INT(E: E_k, f) --> sum_(k = 1)^oo INT(E: E_k, f).
    $
]

#let INTX = INT.with(E: $X$)
#let pm = $plus.minus$

#follow(plural: true)[
    1. Если $f >= 0$, то $nu A := INT(E: A, f)$ --- мера.
    
    2. Если $E = usb_(n = 1)^oo E_n$ и $f$ суммируема на $E$, то $ INT(f) = sum_(n = 1)^oo INT(f, E: E_n). $
    
    3. Пусть $f$ суммируема на $X$. Если $E_1 supset E_2 supset E_3 supset ...$, то $ INT(E: E_n, f) --> INT(E: sect.big_(n = 1)^oo E_n, f), $ а если $E_1 subset E_2 subset E_3 subset ...$, то $ INT(E: E_n, f) --> INT(E: union.big_(n = 1)^oo E_n, f). $

    4. Если $INT(abs(f)) < +oo$, то $exists A space mu A < +oo$ и $ abs(INT(E: E without A, f)) < eps. $
]

#proof[
    2. $ INT(f_plus.minus) = sum_(n = 1)^oo INT(E: E_n, f_plus.minus) $
        Все конечно, поэтому можно вычесть.
    
    3. Пусть $nu_plus.minus A = INT(E: A, f_plus.minus)$ --- конечные меры. В первом случае $ nu_plus.minus -->^"непр. сверху" nu_plus.minus (sect.big_(n = 1)^oo E_n) ==> INT(E: E_n, f_pm) --> INT(E: sect.big_(n = 1)^oo E_n, f_pm). $
        Второй случай аналогичен.

    4. Рассмотрим $E_n := E{abs(f) <= 1/n}$. Тогда $E_1 supset E_2 supset E_3 supset ...$. Заметим, что $sect.big_(n = 1)^oo E_n = E{f = 0}$. По предыдущему свойству,
        $ INT(E: E_n, abs(f)) --> INT(E: E{f = 0}, abs(f)) = 0. $
        Найдется $E_n$ такое, что $INT(E: E_n, abs(f)) < eps$. Рассмотрим $A := E without E_n$, тогда $ abs(INT(E: E without A, f)) <= INT(E: E without A, abs(f)) < eps. $ Проверим меру $A = E{abs(f) > 1/n}$. По неравенству Чебышева, $ mu A <= (INT(abs(f))) / (1/n) < +oo. $
]

#th(name: "Абсолютная непрерывность интеграла")[
    Пусть $f$ суммируема. Тогда $ forall eps > 0 space exists delta > 0 space forall e subset E space mu e < delta ==> INT(E: e, abs(f)) < eps. $
]

#proof[
    $ INT(abs(f)) = sup{INT(phi): 0 <= phi <= abs(f) "простая"} $
    Рассмотрим такую простую $phi$, что $0 <= phi <= abs(f)$ и $INT(phi) > INT(abs(f)) - eps$. Здесь мы пользуемся суммируемостью $f$.

    $phi$ простая, значит ограниченая. Пусть $phi <= C$. Возьмем $delta = eps / C$. Пусть $e subset E$ такое, что $mu e < eps / C$. Тогда $ INT(E: e, abs(f)) = INT(E: e, phi) + INT(E: e, underbrace((abs(f) - phi), >= 0)) <= INT(E: e, phi) + underbrace(INT(abs(f) - phi), < eps) < \ < eps + INT(E: e, phi) <= eps + INT(E: e, C) < eps + eps = 2eps. $
]

#follow[
    Если $f$ суммируемая, а $e_n$ такова, что $mu e_n --> 0$, то $ INT(E: e_n, f) --> 0. $
]

#proof[
    Берем $eps > 0$, по нему $delta > 0$, по $delta$ номер $N$ такой, что при $n >= N$ получается $mu e_n < delta$. Тогда $INT(E: e_n, abs(f)) < eps$. 
]

#def[
    $mu$ и $nu$ --- меры, заданные на $sigma$-алгебре $Aa$. $w >= 0$ измеримая. $w$ --- _плотность меры $nu$ относитально меры $mu$_, если $nu A = INT(E: A, w)$ для любого $A in Aa$.
]

#notice[
    Если $nu$ имеет плотность относительно $mu$, то $mu e = 0 ==> nu e = 0$.
]

#def[
    Пусть $mu$ и $nu$ --- меры, заданные на одной $sigma$-алгебре $Aa$. $nu$ _абсолютно непрерывна_ относительно $mu$, если $mu e = 0 ==> nu e = 0$. Обозначается $nu << mu$ или $nu lt.curly mu$ (но не такой значок, а с кружочком слева, хз, в typst такого нет). #TODO[починить значок]
]

#th[
    Пусть $f$, $g$ --- суммируемы. Если для любого $A$ измеримого, $INT(E: A, f) = INT(E: A, g)$, то $f = g$ почти везде.
]

#proof[
    Пусть $h = f - g$. Тогда $INT(h, E: A) = 0$ для всех измеримых $A$. Если $A := {h >= 0}$ и $tilde(A) := {h < 0}$,
    $ INT(E: X, abs(h)) = underbrace(INT(E: A, h), = 0) + underbrace(INT(E: tilde(A), (-h)), = 0) = 0 ==> h = f - g = 0 "почти везде". $
]

#follow[
    Если $nu$ имеет плотность относительно $mu$ и $sigma$-конечна, то плотность единственна с точностью до равенства почти везде (различается только на множестве меры 0).
]

#proof[
    Если $nu X < +oo$, то $w$ --- суммируемая функция, и она определена однозначно почти везде по теореме:
    $ INT(E: A, w_1) = nu A = INT(E: A, w_2) ==> INT(E: X, w_1) = nu X < +oo. $ 
    
    Если $nu X = +oo$, нарежем $X$ на счетное количетство кусочков конечной меры и применим предыдущее. Если $w_1$ и $w_2$ две плотности, то $mu X_n {w_1 != w_2} = 0$.
]

#th(name: "об интегрировании по мере, имееющей плотность")[
    Пусть $w$ --- плотность меры $nu$ относительно меры $mu$. Тогда если $f >= 0$ или $f w$ суммируемо по мере $mu$ (что равносильно $f$ суммируемо по мере $nu$), то $ INT(f, mu: nu) = INT(f w). $
]

#proof[
    - Шаг 1. $f = bb(1)_A$. Тогда $ INT(bb(1)_A, mu: nu) = nu(E sect A) = INT(E: E sect A, w) = INT(bb(1)_A w). $
    
    - Шаг 2. По линейности, верно для простых.
    
    - Шаг 3. $f >= 0$ измеримые. Рассматриваем $0 <= phi_1 <= phi_2 <= ...$ простые, $phi_n --> f$ поточечно. Тогда $0 <= phi_1 w <= phi_2 w <= ...$ и $phi w --> f w$. $ INT(f, mu: nu) <--^"т. Леви" INT(phi_n, mu: nu) = INT(phi_n w) -->^"т. Леви" INT(f w) $

    - Шаг 4. $f w$ суммируема по $mu$ равносильно $f$ суммируема по $nu$. $ INT(abs(f), mu: nu) = INT(abs(f) w) $
        $ INT(f_pm, mu: nu) = INT(f_pm w) = INT((f w)_pm). $
]

#th(name: "Радона-Никодина")[
    Пусть $mu$ --- $sigma$-конечная на какой-то $sigma$-алгебре $Aa$. $nu$ --- мера на $Aa$. Тогда $nu$ имеет плотность относительно $mu$ равносильно $nu$ абсолютно непрерывна относительно $mu$.
]

#proof[
    - "$==>$": очевидно.
    - "$<==$": доказательство займет пару или две. Давайте не будем...
]


#th(name: "Неравенство Гельдера")[
    Пусть $p, q > 1$, $1/p + 1/q = 1$. Тогда
    $ INT(abs(f g)) <= (INT(abs(f)^p))^(1/p) (INT(abs(g)^q))^(1/q). $
]

#show "ПВ": "почти везде"

#proof[
    Считаем $f, g >= 0$ (неотрицательность, модуль --- одно и тоже). Пусть $A^p := INT(f^p)$, $B^q := INT(g^q)$. Если $mu E = 0$, то все интегралы нули. Иначе, если $A = 0$, то $f = 0$, значит $f g = 0$, значит $INT(f g) = 0$. Аналогично, если $B = 0$.
    
    Считаем $A, B > 0$. Если $A = +oo$, то правая часть это $+oo$ и неравенство очевидно. Аналогично если $B = +oo$.

    Остался случай $0 < A, B < +oo$. 
    
    Можно записать неравенство Юнга:
    $ u v <= u^p / p + v^q / q, "где" u, v in RR_(>= 0). $
    Доказывается такое неравенство через дифференцирование. Пусть $f(u) = u^p/p + v^q/q - u v$. Производная $f'(u) = u^(p - 1) - v$. Эта функция в начале убывает, потом возрастает. Можно подставить минимум и все получится.

    Имея это неравенство, все очевидно. Его можно записать в каждой точке и проинтегрировать:
    $ f / A dot g / B <= 1/p (f/A)^p + 1/q (g/B)^q ==> \ ==> 1/(A B) INT(f g) <= 1/p dot underbrace(1/A^p INT(f^p), = 1) + 1/q dot underbrace(1/B^q INT(g^q), =1) = 1/p + 1/q = 1 ==> \ ==> INT(f g) <= A dot B. $
]

#th(name: "неравенство Минковского")[
    Пусть $p >= 1$. Тогда 
    $
        (INT(abs(f + g)^p))^(1/p) <= (INT(abs(f)^p))^(1/p) + (INT(abs(g)
        ^p))^(1/p).
    $
]

#proof[
    Пусть
    $ A := (INT(abs(f)^p))^(1/p), quad B := (INT(abs(g)
        ^p))^(1/p), quad C := (INT(abs(f + g)^p))^(1/p). $
    
    Докажем, что $C <= A + B$, считаем $f, g >= 0$.

    Если $A = +oo$, $B = +oo$, $C = 0$ или $p = 1$, то очевидно.

    $ f + g <= 2 max{f, g} ==> (f + g)^p <= 2^p max{f^p, g^p} <= 2^p (f^p + g^p). $
    Проинтегрировав,
    $
        C^p <= 2^p (A^p + B^p) < +oo.
    $
    Значит $C != +oo$. Тогда $C in (0, +oo)$.
    $
        C^p = INT((f + g)^p) = INT((f + g) dot (f + g)^(p - 1)) = INT(f dot (f + g)^(p - 1)) + INT(g dot (f + g)^(p - 1)).
    $
    По неравенству Гельдера, если $q = p/(p - 1)$,
    $
        INT(f dot (f + g)^(p - 1)) <= underbrace((INT(f^p))^(1/p), A) dot underbrace((INT((f + g)^((p - 1)dot q)))^(1/q), C^(p/q)).
    $
    Тогда
    $
        C^p <= A C^(p/q) + B C^(p / q) ==> C^p <= (A + B) C^(p / q) ==> underbrace(C^(p - p/q), C^1) <= (A + B) ==> C <= A + B.
    $
]

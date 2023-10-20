#import "../../utils/core.typ": * 

== Произведение мер

#def[
    $(X, Aa, mu)$ и $(Y, Bb, nu)$ --- пространства с $sigma$-конечной мерой. Пусть $ P := {A times B: A in Aa, B in Bb, mu A < +oo, nu B < +oo}. $
    Такие множества $A times B$ назовем _измеримыми прямоугольниками_. Введем $m_0 (A times B) := mu A dot nu B$.
]

#th[
    $Pp$ --- полукольцо, а $m_0$ --- $sigma$-конечная мера на $Pp$.
]

#proof[
    ${A in Aa: mu A < +oo}$ и ${B in Bb : nu B < +oo}$ --- полукольца (и даже просто кольца). Декартово произведение полуколец --- полукольцо, поэтому $Pp$ --- полукольцо.

    Так как можно сказать, что $X = usb X_n$ и $Y = usb Y_k$, $mu X_n < +oo, nu Y_k < +oo$, то $X times Y = usb_(k, n) X_n times Y_k$, и $m_0 (X_n times Y_k) < +oo$. Отсюда следует $sigma$-конечность. Осталось проверить, что $m_0$ --- мера.

    #TODO[я сбился что происходит, надо написать нормально]

    $ 
        A times B = P = usb_(k = 1)^oo P_k = A_k times B_k ==>^? m_o P = sum_(k = 1)^oo m_0 P_k. \
        bb(1)_A dot bb(1)_B = bb(1)_P = sum_(k = 1)^oo bb(1)_(P_k) (x, y) = sum_(k = 1)^oo bb(1)_(A_k) (x) dot bb(1)_(B_k) (y). \
        integral_X bb(1)_A (x) bb(1)_B (y) dif mu(x) = integral_X sum_(k = 1)^oo bb(1)_(A_k) (x) bb(1)_(B_k) (y) dif mu (x) = sum_(k = 1)^oo integral_X bb(1)_(A_k) (x) bb(1)_(B_k) (y) dif mu(x) = sum_(k = 1)^oo mu A_k dot bb(1)_(B_k) (y). \
        mu A dot nu B = m_0 P = integral_Y mu A bb(1)_B (y) dif nu(y) = integral_Y sum_(k = 1)^oo mu A_k bb(1)_(B_k) (y) dif nu(y) = sum_(k = 1)^oo mu A_k dot u B_k = sum_(k = 1)^oo mu_0 P_k.
    $
]

#def[
    Стандартное продолжение меры $m_0$ с полукольца $Pp$ называется _произведением мер_ $mu$ и $nu$. Обозначается $mu times nu$ (обычно $m$). $Aa times.circle Bb$ --- $sigma$-алгебра, на которой определена $mu times nu$.
]

#props[
    1. Декартово произведение измеримых множеств --- измеримое.
    2. Если $mu e = 0$, то $m (e times Y) = 0$, где $m = mu times nu$.
]

#proof[
    1. $A = usb_(k = 1)^oo A_k$, $mu A_k < +oo$, $B = usb_(n = 1)^oo B_n$, $nu B_n < +oo$. $A times B = usb_(n, k = 1)^oo A_k times B_k$, $nu B_n < +oo$, $A_k times B_n in Pp$.

    2. $Y = usb_(n = 1)^oo Y_n$, $nu Y_n < +oo$. $m(e times Y_k) = 0$. $e times Y = usb_(k = 1)^oo e times Y_k$.
]

#denote[
    $C subset X times Y$. Обозначим
    $
        C_x &= {y in Y: (x, y) in C},\
        C^y &= {x in X: (x, y) in C}.
    $
    Это _сечения_ множества $C$.
]

#props[
    1. $(Union_(alpha in I) C_alpha)_x = Union_(alpha in I) (C_alpha)_x$.

    2. $(Sect_(alpha in I) C_alpha)_x = Sect_(alpha in I) (C_alpha)_x$.
]

#def[
    $f$ определенная почти везде на $E$, _измерима в широком смысле_, если найдется $e subset E$ ($mu e = 0$), такое, что $f bar_(E without e)$ измерима.

    Вскоре все функции, измеримые в широком смысле мы начнем называть измеримыми.
]

#def[
    Пусть $Ee$ --- семейство подмножеств в $X$. $Ee$ --- _монотонный класс_, если
    1. $E_1 subset E_2 subset E_3 subset ... in Ee ==> Union_(j = 1)^oo E_j in Ee$.
    2. $E_1 supset E_2 supset E_3 supset ... in Ee ==> Sect_(j = 1)^oo E_j in Ee$
]

#th[
    Если монотонный класс содержит алгебру $Aa$, то он содержит и ее Бореллевскую оболочку $Bb(Aa)$.
]

#proof[
    Без доказательства. Это делается чистой алгеброй, забьем делать аккуратно. Но основная мысль такая: надо рассмотреть минимум по включению мотононных классов, содержащих $Aa$, и показать, что он является $sigma$-алгеброй. Достаточно будет доказать, что это алгебра, так как есть свойство про объединение башни. Там возня с использованием минимальности, пофиг.
]

#th(name: "принцип Кавальери")[
    $(X, Aa, mu)$ и $(Y, Bb, nu)$ --- пространства с $sigma$-конечными мерами, $nu$ --- полная мера. $m = mu times nu$, $C in Aa times.circle Bb$. Тогда 
    1. $C_x in Bb$ при почти всех $x in X$.
    2. $phi(x) := nu C_x$ измерима в широком смысле.
    3. $m C = integral_X phi(x) dif mu = integral_X nu C_x dif mu(x)$.
]

#proof[
    good luck and godspeed

    Пусть $X$ и $Y$ конечной меры, $C in Bb(Pp) = {A times B : A in Aa, B in Bb}$.

    *Шаг 1.* Пусть $Ee$ --- система подмножеств в $X times Y$ такое, что $E in Ee$ если $E_x in Bb$ (все сечения измеримы) для любого $x in X$ и $phi(x) = nu E_x$.

    Тогда
    1. $E$ --- симметричная система.
        $ (X times Y without E)_x = Y without E_x in Bb. $
        $ nu((X times Y) without E)_x = underbrace(nu Y, const < +oo) - nu E_x #[--- измеримое]. $ 
    
    2. $E_j in Ee$. $E_1 subset E_2 subset ... =>^? Union_(j = 1)^oo E_j in Ee$. 
    
        $(Union_(j = 1)^oo E_j)_x = Union_(j = 1)^oo (E_j)_x in Bb$. $ (E_1)_x subset (E_2)_x subset ... ==> nu(Union_(j = 1)^oo (E_j)_x) = lim nu(E_j)_x, $
        по непрерывности меры снизу, предел измерим.
    
    3. $E_j in Ee$. $E_1 supset E_2 supset ... =>^? Sect_(j = 1)^oo E_j in Ee$. 
        
        Аналогично.

    4. Значит $Ee$ --- монотонный класс.

    5. $A sect B = nothing, A, B in Ee =>^? A union.sq B in Ee$. 

        $(A union.sq B)_x = A_x union.sq B_x in Bb$. $nu (A union.sq B)_x = nu (A_x union.sq B_x) = nu A_x + nu B_x$. Это сумма измеримых функций, функция измеримая.

    6. $Ee supset Pp$, а $Pp$ --- полукольцо, поэтому по предыдущему пункту, $Ee supset$ конечное объединение элементов в $Pp$. Это кольцо!

    7. $Ee$ --- симметричное и содержит кольцо, поэтому $Ee$ содержит алгебру. По теореме о монотонном классе, $Ee supset $ $sigma$-алгебра, натянутая на $Pp$, то есть $Ee supset Bb(Pp)$.

    То есть мы поняли, что для любого $C in Bb(Pp)$, $C_x in Bb$ и $x --> nu C_x$ измерима.

    *Шаг 2.* Рассмотрим $C in Bb(Pp)$. $m C = integral_X phi dif mu$. Рассмотрим на $Bb(Pp)$ функцию множеств $E --> integral_X nu E_x dif mu(x)$. Это мера на $Bb(Pp)$, $usb_(j = 1)^oo E_j --> integral_X nu (usb_(j = 1)^oo E_j)_x dif mu(x) = integral_X sum_(j = 1)^oo sum_(j = 1)^oo nu(E_j)_x dif mu(x)$. На $Pp$, $m$ и эта мера совпадают. По теореме о единственности продолжения меры, они совпадают на $Bb(Pp)$.

    Кстати, мы пока не воспользовались полнотой. Но у нас нет широкого смысла измеримости и "почти везде". Сейчас воспользуемся.

    *Шаг 3.* $C in Aa times.circle Bb$, $m C = 0$. Тогда существует $tilde(C) in Bb(Pp)$ такое, что $m tilde(C) = 0$ и $tilde(C) supset C$. Значит $0 = m tilde(C) = integral_X nu tilde(C)_x dif mu(x) ==> nu tilde(C)_x = 0$ при почти всех $x in X$. У нас есть включение $tilde(C)_x supset C_x$, поэтому из-за полноты $nu$, $C_x in Bb$ при почти всех $x in X$ и $nu C_x = 0$ почти везде. $m C = 0 = integral_X nu C_x dif mu(x)$. Значит $phi(x) = nu C_x$ измерима в широком смысле.

    *Шаг 4.* $C$ произвольное. По следствие из теоремы про структуру измеримых множеств (или типа того), $exists tilde(C) in Bb(Pp)$ такое, что $C in tilde(C) union.sq e$, где $mu e = 0$. $C_x = tilde(C)_x union.sq e_x in Bb$ при почти всех $x in X$. $nu C_x = nu tilde(C)_x + nu e_x = nu tilde(C)_x$ --- измерима на $X$. Значит в широком смысле, $nu C$ измерима. Получили второй пункт.

    $m C = m tilde(C) = integral_X nu tilde(C)_x dif mu(x) = integral_X nu C_x dif mu(x)$, так как $nu C_x = nu tilde(C)_x$ при почти всех $x$.

    *Шаг 5.* $mu$ и $nu$ $sigma$-конечные (а не конечные, как раньше). Нарезаем на кусочки: $X = usb_(k = 1)^oo X_k$, $Y = usb_(n = 1)^oo Y_n$, $mu X_k < +oo$ и $nu Y_n < +oo$. $C = usb_(k, n = 1)^oo C_(k,n)$, где $C_(k,n) = C sect (X_k times Y_n)$. Знаем, что $(C_(k,n))_x in Bb$ при почти всех $x$, $phi_(k,n) := nu(C_(k,n))_x$ измерима в широком смысле, $m C_(k n) = integral_X nu(C_(k,n)_x dif mu(x))$. Поймем, что если просуммировать по всем кускам, все будет хорошо:
        $ m C = sum_(k, n) m C_(k, n) = integral_x nu(C_(k, n))_x dif mu(x) = integral_X sum_(k, n) nu(C_(k, n))_x dif mu. $
]

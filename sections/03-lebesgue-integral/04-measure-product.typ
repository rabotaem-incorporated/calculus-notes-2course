#import "../../utils/core.typ": * 

== Произведение мер

#def(label: "def-measurable-rect")[
    $(X, Aa, mu)$ и $(Y, Bb, nu)$ --- пространства с $sigma$-конечной#rf("def-sfinite") мерой. Пусть $ P := {A times B: A in Aa, B in Bb, mu A < +oo, nu B < +oo}. $
    Такие множества $A times B$ назовем _измеримыми прямоугольниками_. Введем $m_0 (A times B) := mu A dot nu B$.
]

#th[
    $Pp$ --- полукольцо#rf("def-semiring"), а $m_0$ --- $sigma$-конечная#rf("def-sfinite") мера на $Pp$.
]

#proof[
    ${A in Aa: mu A < +oo}$ и ${B in Bb : nu B < +oo}$ --- полукольца (и даже просто кольца). Декартово произведение полуколец --- полукольцо#rf("cartesian-semiring-prod"), поэтому $Pp$ --- полукольцо.

    Так как можно сказать, что $X = usb X_n$ и $Y = usb Y_k$, $mu X_n < +oo, nu Y_k < +oo$, то $X times Y = usb X_n times Y_k$, и $m_0 (X_n times Y_k) < +oo$. Отсюда следует $sigma$-конечность. Осталось проверить, что $m_0$ --- мера. Проверим, что если $A times B = P = usb_(k = 1)^oo P_k = usb_(k = 1)^oo A_k times B_k $, то $m_0 P = sum_(k = 1)^oo m_0 P_k.$

    Мы знаем, что $ bb(1)_A dot bb(1)_B = bb(1)_P = sum_(k = 1)^oo bb(1)_(P_k) = sum_(k = 1)^oo bb(1)_(A_k) dot bb(1)_(B_k)$. Проинтегрируем по мере $mu$

    $
        integral_X bb(1)_A (x) dot bb(1)_B (y) dif mu(x) =^rf("def-integral-simple") mu A dot bb(1)_B (y)
    $
    Также
    $ 
        integral_X bb(1)_A (x) dot bb(1)_B (y) dif mu(x) =
        integral_X sum_(k = 1)^oo bb(1)_(A_k) (x) dot bb(1)_(B_k) (y) dif mu (x) 
        newline(=^rf("integral-sum-perm-mfn"))
        sum_(k = 1)^oo integral_X bb(1)_(A_k) (x) dot bb(1)_(B_k) (y) dif mu(x) =
        sum_(k = 1)^oo mu A_k dot bb(1)_(B_k) (y).
    $
    
    Теперь проинтегрируем по мере $nu$ оба результата
    $
        integral_Y mu A dot bb(1)_B (y) dif nu(y) =^rf("def-integral-simple")
        mu A dot nu B = m_0 P
        \
        integral_Y sum_(k = 1)^oo mu A_k bb(1)_(B_k) (y) dif nu(y) =^rf("integral-sum-perm-mfn")
        sum_(k = 1)^oo mu A_k dot nu B_k =
        sum_(k = 1)^oo m_0 P_k.
    $
]

#def(label: "def-measure-prod")[
    Стандартное продолжение#rf("def-standard-continuation") меры $m_0$ с полукольца $Pp$ называется _произведением мер_ $mu$ и $nu$. Обозначается $mu times nu$ (обычно $m$). $Aa times.circle Bb$ --- $sigma$-алгебра, на которой определена $mu times nu$.
]

#props(label: "measure-prod-props")[
    1. #sublabel("cartesian-prod") Декартово произведение измеримых множеств --- измеримое.
    2. #sublabel("zero") Если $mu e = 0$, то $m (e times Y) = 0$, где $m = mu times nu$.
]

#proof[
    1. $A = usb_(k = 1)^oo A_k$, $mu A_k < +oo$, $B = usb_(n = 1)^oo B_n$, $nu B_n < +oo$. $A times B = usb_(n, k = 1)^oo A_k times B_k$, $mu A_k dot nu B_n < +oo$, $A_k times B_n in Pp$.

    2. $Y = usb_(n = 1)^oo Y_n$, $nu Y_n < +oo$. $m(e times Y_k) = 0$. $e times Y = usb_(k = 1)^oo e times Y_k ==> m(e times Y) = 0$.
]

#denote(label: "def-sect")[
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

#def(label: "def-mfn+")[
    $f$ определенная почти везде на $E$, _измерима в широком смысле_, если найдется $e subset E$ ($mu e = 0$), такое, что $f bar_(E without e)$ измерима.

    Вскоре все функции, измеримые в широком смысле мы начнем называть измеримыми.
]

#def(label: "def-monotonous-class")[
    Пусть $Ee$ --- семейство подмножеств в $X$. $Ee$ --- _монотонный класс_, если
    1. $E_j in Ee. space  E_1 subset E_2 subset E_3 subset ... ==> Union_(j = 1)^oo E_j in Ee$.
    2. $E_j in Ee. space E_1 supset E_2 supset E_3 supset ... ==> Sect_(j = 1)^oo E_j in Ee$
]

#th(label: "monotonous-class-contains-borel")[
    Если монотонный класс содержит алгебру $Aa$, то он содержит и ее Бореллевскую оболочку $Bb(Aa)$.
]

#proof[
    Без доказательства. Это делается чистой алгеброй, забьем делать аккуратно. Но основная мысль такая: надо рассмотреть минимум по включению мотононных классов, содержащих $Aa$, и показать, что он является $sigma$-алгеброй. Достаточно будет доказать, что это алгебра, так как есть свойство про объединение башни. Там возня с использованием минимальности, пофиг.
]

#th(name: "принцип Кавальери", label: "cavalieri")[
    $(X, Aa, mu)$ и $(Y, Bb, nu)$ --- пространства с $sigma$-конечными#rf("def-sfinite") мерами, $nu$ --- полная#rf("def-complete-measure") мера. $m = mu times nu$, $C in Aa times.circle Bb$#rf("def-measure-prod"). Тогда
    1. $C_x in Bb$ при почти всех $x in X$.
    2. $phi(x) := nu C_x$ измерима в широком смысле#rf("def-mfn+").
    3. $m C = integral_X nu C_x dif mu(x)$.
]

#proof[
    good luck and godspeed

    *Шаг 1.* Пусть $X$ и $Y$ конечной меры, $Pp = {A times B : A in Aa, B in Bb}$, $Ee$ --- система подмножеств в $X times Y$ такая что $E in Ee <==> forall x in X space E_x in Bb$ и $phi(x) = nu E_x$ --- измеримая.

    Тогда
    1. $Ee$ --- симметричная система#rf("def-symm-system").
        $ (X times Y without E)_x = Y without E_x in Bb. \
            nu((X times Y) without E)_x = underbrace(nu Y, < +oo) - nu E_x space #[--- измерима как функция от $x$].
        $
        Значит $X times Y without E in Ee$.
    
    2. $E_j in Ee. space E_1 subset E_2 subset ... ==> Union_(j = 1)^oo E_j in Ee$
    
        $ 
            (Union_(j = 1)^oo E_j)_x = Union_(j = 1)^oo (E_j)_x in Bb. \
            (E_1)_x subset (E_2)_x subset ... ==> nu(Union_(j = 1)^oo (E_j)_x) = lim nu(E_j)_x, 
        $
        по непрерывности меры снизу#rf("bottom-up-continious"), предел измерим.

        
    
    3. $E_j in Ee. space E_1 supset E_2 supset ... ==> Sect_(j = 1)^oo E_j in Ee$. 
        
        Аналогично#rf("top-down-continious").

    4. Значит $Ee$ --- монотонный класс#rf("def-monotonous-class").

    5. $A sect B = nothing, A, B in Ee ==> A union.sq B in Ee$. 

        $(A union.sq B)_x = A_x union.sq B_x in Bb$. $nu (A union.sq B)_x = nu (A_x union.sq B_x) = nu A_x + nu B_x$. Это сумма измеримых функций, она измерима.

    6. $Ee supset Pp$, а $Pp$ --- полукольцо (измеримых прямоугольников), поэтому по предыдущему пункту, $Ee supset$ конечное дизъюнктное объединение элементов в $Pp$. Это кольцо#rf("def-ring")!

    7. $Ee$ --- симметричное и содержит кольцо, поэтому $Ee$ содержит алгебру. По теореме о монотонном классе#rf("monotonous-class-contains-borel"), $Ee supset sigma"-алгебра"$, натянутая на $Pp$, то есть $Ee supset Bb(Pp)$.

    То есть мы поняли, что для любого $C in Bb(Pp)$, $C_x in Bb$ и $phi(x) = nu C_x$ измерима.

    *Шаг 2: Рассмотрим $C in Bb(Pp)$*. Докажем, что $m C = integral_X phi dif mu$. Рассмотрим на $Bb(Pp)$ функцию множеств $E maps integral_X nu E_x dif mu(x)$. Докажем, что это --- мера на $Bb(Pp)$: 
    $ 
        usb_(j = 1)^oo E_j maps
        integral_X nu (usb_(j = 1)^oo E_j)_x dif mu(x) =
        integral_X sum_(j = 1)^oo nu(E_j)_x dif mu(x) =^rf("integral-sum-perm-mfn")
        sum_(j = 1)^oo integral_X nu(E_j)_x dif mu(x).
    $
    Эта мера и $m$ совпадают на $Pp$. По теореме о единственности продолжения меры#rf("standard-continuation-unique"), они совпадают на $Bb(Pp)$.

    *Шаг 3: $C in Aa times.circle Bb$#rf("def-measure-prod"), $m C = 0$*.
    Тогда существует $tilde(C) in Bb(Pp)$ такое, что $m tilde(C) = 0$ и 
    $tilde(C) supset C$ 
    (у нас была теорема#rf("external-measure-through-semiring") в главе про продолжение меры, которая говорит, что такое множество всегда найдется).
    Значит
    $0 = m tilde(C) = integral_X nu tilde(C)_x dif mu(x) ==> nu tilde(C)_x = 0$
    при почти всех $x in X$.
    У нас есть включение $tilde(C)_x supset C_x$,
    поэтому из-за полноты#rf("def-complete-measure") $nu$,
    $C_x in Bb$ при почти всех $x in X$ и $nu C_x = 0$ почти везде. 
    Значит $m C = 0 = integral_X nu C_x dif mu(x)$ и $phi(x) = nu C_x$
    измерима в широком смысле#rf("def-mfn+").

    *Шаг 4: $C$ произвольное из $Aa times.circle Bb$*. $exists tilde(C) in Bb(Pp)$ такое, что $C = tilde(C) union.sq e$, где $m e = 0$ (следствие#rf("measurable-is-borel-plus-zero") из той самой теоремы, упомянутой на прошлом шаге). $C_x = tilde(C)_x union.sq e_x in Bb$ при почти всех $x in X$. $nu C_x = nu tilde(C)_x + nu e_x = nu tilde(C)_x$ почти везде. Значит $nu C_x$ измерима в широком смысле.

    $ 
        m C = m tilde(C) = integral_X nu tilde(C)_x dif mu(x) = integral_X nu C_x dif mu(x),
    $ 
    так как $nu C_x = nu tilde(C)_x$ при почти всех $x$.

    *Шаг 5: Отказываемся от конечности мер, пользуясь тем, что $mu$ и $nu$ $sigma$-конечные*. Нарезаем на кусочки: $X = usb_(k = 1)^oo X_k$, $Y = usb_(n = 1)^oo Y_n$, $mu X_k < +oo$ и $nu Y_n < +oo$. $C = usb_(k, n = 1)^oo C_(k,n)$, где $C_(k,n) = C sect (X_k times Y_n)$. Знаем, что $(C_(k,n))_x in Bb$ при почти всех $x$, $phi_(k,n) := nu(C_(k,n))_x$ измерима в широком смысле, $m C_(k,n) = integral_X nu(C_(k,n))_x dif mu(x)$. Поймем, что если просуммировать по всем кускам, все будет хорошо:
        $
            C_x = usb_(k, n = 1)^oo (C_(k,n))_x in Bb "при почти всех" x 
        $
        $
            phi = sum_(k, n) phi_(k, n) - "измерима в широком смысле"
        $
        $
            m C = sum_(k, n) m C_(k, n) = sum_(k, n) integral_X nu(C_(k, n))_x dif mu(x) =^rf("integral-sum-perm-mfn") integral_X sum_(k, n) nu(C_(k, n))_x dif mu = integral_X nu C_x dif mu(x)
        $
        
]

#notice[
    - Принцип берет имя от Бонавентуры Кавальери, который, вообще говоря, придумал "метод неделимых" --- эмпирический метод вычисления площади. Это --- его невероятно сильное обобщение с формализацией.

    - $Pp(C) := {x in X: C_x != nothing}$ не всегда измеримо. 

    - $tilde(Pp)(C) := {x in X: nu C_x > 0}$ всегда измеримо. Поэтому вместо $X$ в интеграле можно написать множество $tilde(Pp)(С)$.
]

#def(label: "def-graph")[
    $(X, Aa, mu)$ --- пространство с $sigma$-конечной мерой. $f: E --> overline(RR)$ неотрицательна.
    
    _Подграфиком $f$ над множеством $E$_  называется множество $ Pp_f (E) := {(x, y) in E times RR: 0 <= y <= f(x)}. $

    _Графиком $f$ над множеством $E$_ называется
    $
        Gamma_f (E) := {(x, y) in E times RR : y = f(x)}.
    $
    Отметим, что если функция принимает значение $plus.minus oo$, то соответсвующая точка не принадлежит графику.
]

#lemma(label: "graph-measure-zero")[
    Будем рассматривать меру $m := mu times lambda_1$#rf("def-measure-prod"). Если $f$ измерима, то $m Gamma_f (E) = 0$.
]

#proof[
    Пусть $mu E < +oo$, $eps > 0$. $E_k := E{k eps <= f < (k + 1) eps}$. Тогда $Gamma_f (E_k) subset E_k times [k eps, (k + 1) eps)$, значит 
    $ 
        Gamma_f (E) subset Union_(k in ZZ) Gamma_f (E_k) subset Union_(k in ZZ) E_k times [k eps, (k + 1) eps),\
        m (Union_(k in ZZ)E_k times [k eps, (k + 1) eps)) = sum_(k in ZZ) mu E_k eps = mu E eps ==> Gamma_f (E) --> 0.
    $
    Если $mu E = +oo$, Порежем#rf("def-sfinite") $E = Union_(n = 1)^oo F_n$, $mu F_n < +oo$. Напомню, что произведение мер требует $sigma$-конечности каждой меры по определению#rf("def-measure-prod"). Тогда
    $
        Gamma_f (E) = Union_(n = 1)^oo underbrace(Gamma_f (F_n), "мера 0") = 0.
    $
]

#notice[
    Если $f$ не измерима, ни о чем говорить нельзя. Например, $f(x + y) = f(x) + f(y)$ имеет ужасные ненепрерывные решения, которые всюду плотны на плоскости.
]

#lemma(label: "subgraph-measurable")[
    Если $f$ измерима в широком смысле#rf("def-mfn+"), то $Pp_f (E)$ измерим#rf("def-graph").
]

#proof[
    Берем#rf("simple-approx") $phi_n >= 0$ --- простые. $phi_n arrow.tr f$. $Pp_(phi_n) (E)$ измерим (как конечное объединение измеримых прямоугольников#rf("def-measurable-rect")). 
    
    Попробуем зажать $Pp_f (E)$ между двумя множествами равной меры. Во-первых, для любой точки ниже графика, найдется простая, которая ее покрывает (так как $phi_n (x) arrow.tr f(x)$, то $Union_n phi_n (x) = [0, f(x)) "или" [0, f(x)]$), то есть
    $
        Pp_f (E) without Gamma_f (E) subset Union_(n = 1)^oo Pp_(phi_n) (E).
    $
    При этом, ни для какой точки выше графика, точки под $phi_n$ не найдется, поэтому
    $
        Union_(n = 1)^oo Pp_(phi_n) (E) subset Pp_f (E).
    $
    Если добавить к первому включению график слева и справа, получится
    $
        Pp_f (E) subset Union_(n = 1)^oo Pp_(phi_n) (E) union Gamma_f.
    $
    Объединив все вместе,
    $
        Pp_f (E) without Gamma_f (E) subset
        Union_(n = 1)^oo Pp_(phi_n) (E) subset
        Pp_f (E) subset
        Union_(n = 1)^oo Pp_(phi_n) (E) union Gamma_f.
    $
    Мера второго и четвертого множества равны, так как мера графика нуль#rf("graph-measure-zero"). Значит $Pp_f (E)$ зажат между двумя множествами равной меры, а значит измерим#rf("def-complete-measure"), так как произведение мер --- стандартное продолжение#rf("def-standard-continuation"), а оно полное.
]

#th(name: "о мере подграфика", label: "subgraph-measure")[
    $(X, Aa, mu)$ --- пространство с $sigma$-конечной мерой.
    $f: X --> overline(RR)$, $f >= 0$, $m = mu times lambda_1$.
    Тогда $f$ --- измерима в широком смысле тогда и только тогда#rf("def-mfn+"), когда $Pp_f$#rf("def-graph") измерим, и в этом случае $m Pp_f = integral_X f dif mu$.
]

#proof[
    - "$==>$": лемма#rf("subgraph-measurable").
    
    - "$<==$": Примерим принцип Кавальери#rf("cavalieri") для $Pp_f$.
        $
            (Pp_f)_x = cases(delim: "[", [0, +oo]\, & "если" f(x) = +oo, [0, f(x)]\, & "если" f(x) < +oo).
        $

        Согласно принципу Кавальери, $lambda_1 (Pp_f)_x = f(x)$ измерима в широком смысле и $ m Pp_f = integral_X lambda_1 (P_f)_x dif mu(x) = integral_X f dif mu. $
]

#th(name: "Тонелли", label: "tonelli")[
    $(X, Aa, mu)$, $(Y, Bb, nu)$ --- два пространства с полными $sigma$-конечными мерами, $m = mu times nu$, $f: X times Y --> [0, +oo]$ --- измерима. Тогда
    1. $f_x (y) := f(x, y)$ при почти всех $x in X$ измерима как функция от $y$.
    2. $phi(x) := integral_Y f(x, y) dif nu$ измерима в широком смысле.
    3. $ integral_(X times Y) f dif m = integral_X phi dif mu = integral_X (integral_Y f(x, y) dif nu(y)) dif mu (x) = integral_Y (integral_X f(x, y) dif mu(x)) dif nu(x). $
]

#proof[
    Тут вроде уже не так плохо...

    *Шаг 1*. 
    Пусть $f = bb(1)_C$, где $C in A times.circle B$#rf("def-measure-prod"). Тогда $f_x (y) = bb(1)_(C_x) (y)$. По Кавальери#rf("cavalieri"),
    
    1. при почти всех $x in X$, $C_x$ измерима относительно $nu$, значит и $f_x$ измерима как функция от $y$ относительно $nu$.

    2. $phi(x) = integral_Y f_x dif nu = integral_Y bb(1)_(C_x) dif nu = nu C_x$ --- измерима в широком смысле.

    3. $ integral_(X times Y) f dif m = m C = integral_X phi dif mu. $

    *Шаг 2*. Если $f >= 0$ простая, то $f = sum_(k = 1)^n c_k bb(1)_(C_k)$, $C_k$ дизъюнктнты:
    $ integral_(X times Y) f dif mu = sum_(k = 1)^n c_k m C_k = sum_(k = 1)^n c_k integral_X (integral_Y bb(1)_(C_k) (x, y) dif nu(y)) dif mu(x) = integral_X (integral_Y f(x, y) dif nu(y)) dif mu(x) $

    *Шаг 3*. 
    1. Если $f >= 0$ измеримая. Рассмотрим#rf("simple-approx") $psi_n --> f$ поточечно, $0 <= psi_1 <= psi_2 <= ...$. Можно записать неравенство для сечений: $0 <= (psi_1)_x <= (psi_2)_x <= ...$, значит $(psi_n)_x --> f_x$ поточетно. А поточечный предел измеримых функций измерим#rf("inf-sup-lim-mfn").

    2. $phi_n (x) := integral_Y (psi_n)_x dif nu$ измерима в широком смысле и по теореме Леви#rf("levy") сходится к $integral_Y f_x dif nu$.

    3. По монотонности интеграла#rf("mfn-props", "inequality") $integral_Y (psi_n)_x dif nu <= integral_Y (psi_(n + 1))_x dif nu$. Так как $integral_(X times Y) psi_n dif m = integral_(X) phi_n dif mu$ по предыдущему пункту, по теореме Леви#rf("levy"), левая часть стремится к $integral_(X times Y) f dif m$, а правая к $integral_X phi dif mu$. Получили равенство.

    Разумеется, здесь мы рассмотрели сечения по $x$, но аналогично можно рассмотреть сечения $y$, и получить равенство последнему интегралу.
]

#th(name: "Фубини", label: "fubini")[
    _(Везде вместо измеримости пишем суммируемость)_

    $(X, Aa, mu)$, $(Y, Bb, nu)$ --- два пространства с полными $sigma$-конечными мерами, $m = mu times nu$, $f: X times Y --> overline(RR)$ --- суммируема. Тогда
    1. $f_x (y) := f(x, y)$ при почти всех $x in X$ суммируема как функция от $y$.
    2. $phi(x) := integral_Y f(x, y) dif nu(y)$ суммируема на $X$.
    3. $ integral_(X times Y) f dif m = integral_X phi dif mu = integral_X (integral_Y f(x, y) dif nu(y)) dif mu (x) = integral_Y (integral_X f(x, y) dif mu(x)) dif nu(y). $
]

#proof[
    1. $f = f_+ - f_-$, $f_x = (f_+)_x - (f_-)_x$ суммируема при причти всех $x$, так как#rf("sfn-props", "abs-bound"):
        $
            +oo > integral_(X times Y) abs(f) dif m =^rf("tonelli")
            integral_X integral_Y abs(f(x, y)) dif nu(y) dif mu(x) ==>
            integral_Y abs(f(x, y)) dif nu(y) =
            integral_Y abs(f_x) dif nu < +oo
        $
        при почти всех $x in X$.

    2. $ integral_X abs(phi) dif mu = integral_X abs(integral_Y f(x, y) dif nu(y)) dif mu (x) <= integral_X integral_Y abs(f(x, y)) dif nu(y) dif mu(x) < +oo. $
    
    3. $ integral_(X times Y) f_(plus.minus) dif m = integral_X integral_Y f_(plus.minus) (x, y) dif nu(y) dif mu(x). $ (и вычтем)
]

#follow(label: "independent-2d-prod")[
    $(X, Aa, mu)$, $(Y, Bb, nu)$ --- два пространства с полными $sigma$-конечными мерами, $m = mu times nu$. $f: X --> overline(RR)$ и $g: Y --> overline(RR)$ суммируемы. Пусть $h(x, y) = f(x) g(y)$. Тогда $h$ суммируема на $X times Y$ и $ integral_(X times Y) h dif m = integral_X f dif mu dot integral_Y g dif nu. $
]

#proof[
    Если $f$ рассмотреть как функцию двух переменных, то она измерима. Тоже самое с $g$. Значит произведение измеримых функций $h$ тоже измеримо. Докажем суммируемость#rf("sfn-props", "abs-bound"):

    $
        integral_(X times Y) abs(h) dif mu =^"Тонелли"_rf("tonelli")
        integral_X integral_Y underbrace(abs(f(x)), "не зависит от y") abs(g(y)) dif nu(y) dif mu(x) 
        newline(=) 
        integral_X abs(f(x)) underbrace(integral_Y abs(g(y)) dif nu(y), "константа от" x) dif mu(x) =
        integral_X abs(f) dif mu dot integral_Y abs(g) dif nu < +oo.
    $

    Дальше можно записать тоже самое без модулей по теореме Фубини#rf("fubini"), получим равенство.
]

#notice[
    Для справедливости формулы 
    $
        integral_X integral_Y f(x, y) dif nu(y) dif mu(x) = integral_Y integral_X f(x, y) dif mu(x) dif nu(y)
    $
    не достаточно суммируемости функций $f_x (y) := f(x, y)$, $f_y (x) := f(x, y)$, $phi(x) := integral_Y f_x dif nu(y)$ и $psi(y) := integral_X f_y dif mu(x)$. Обязательна суммируемость $f(x, y)$ на $X times Y$.
]

#example[
    $mu = nu = lambda_1$, $X = Y = [-1, 1]$, $f(x, y) = (x^2 - y^2)/(x^2 + y^2)^2$. Тогда $ phi(x) = integral_[-1, 1] (x^2 - y^2)/(x^2 + y^2)^2 dif y = lr(y / (x^2 + y^2) bar)_(y=-1)^(y=1) = 2 / (x^2 + 1). $
    Это суммируемая функция.
    $
        integral_[-1, 1] phi(x) dif x = integral_(-1)^1 2 / (x^2 + 1) dif x = lr( 2 arctan x bar)_(-1)^1 = pi.
    $
    С другой стороны,
    $
        integral_[-1, 1] integral_[-1, 1] (x^2 - y^2)/(x^2 + y^2)^2 dif x dif y = -pi.
    $
    (тут аналогично, опустим подробности).
]

#notice[
    Формула
    $
        integral_X integral_Y f(x, y) dif nu(y) dif mu(x) = integral_Y integral_X f(x, y) dif mu(x) dif nu(y)
    $
    может быть верной, и без суммируемости $f$ на $X times Y$.
]

#example[
    $mu = nu = lambda_1$, $X = Y = [-1, 1]$, и $f(x, y) = (x y) / (x^2 + y^2)^2$. Равенство интегралов, очевидно есть, из-за симметричности функции. Почему суммируемости нет остается читателю в качестве упражнения.
]

#th(label: "integral-through-lebesgue-set-measure")[
    $(X, Aa, mu)$ --- пространство с $sigma$-конечной мерой. Тогда $integral_E abs(f) dif mu = integral_0^(+oo) mu X{abs(f) >= t} dif t$.
]

#notice[
    $mu E{abs(f) >= t}$ убывает, значит у нее более чем счетное число точек разрыва. Почему? Возьмем какую-то точку разрыва. У нее есть предел слева и предел справа, то есть это скачок. В каждом скачке рациональное число, а их не более чем счетно.
]

#proof[
    Рассмотрим $m = mu times lambda_1$, 
    $
        integral_X abs(f) dif mu =
        m Pp_abs(f) =
        integral_(X times [0, +oo)) bb(1)_(Pp_abs(f)) dif m =_"Тонелли"^rf("tonelli")
        integral_[0, +oo) integral_X underbrace(bb(1)_(Pp_abs(f)) (x, t), = bb(1)_(X{abs(f) >= t})) dif mu(x) dif lambda_1 (t) 
        newline(=)
        integral_[0, +oo] underbrace(integral_X bb(1)_{abs(f) >= t} dif mu, = mu X{abs(f) >= t}) dif lambda_1 (t) = integral_0^(+oo) mu X{abs(f) >= t} dif t. $
]

#follow(label: "integral-through-lebesgue-set-measure'")[
    В условии теоремы можно записать стогий знак.

    $(X, Aa, mu)$ --- пространство с $sigma$-конечной мерой. Тогда $integral_E abs(f) dif mu = integral_0^(+oo) mu E{abs(f) > t} dif t$.
]

#proof[
    $g(t) := mu E {abs(f) >= t}$ монотонна, значит у нее не более чем счетное число точек разрыва. Пусть $t_0$ --- точка непрерывности. Тогда $t_n arrow.br t_0$ и $ E{abs(f) > t_0} = Union_(n = 1)^oo E{abs(f) >= t_n}. $
    $ mu E{abs(f) > t_0} =^rf("bottom-up-continious") lim_(n -> oo) mu E{abs(f) >= t_n} = lim_(n -> oo) g(t_n) = g(t_0). $
]

#follow(label: "power-integral-through-lebesgue-set-measure")[
    $ integral_E abs(f)^p dif mu = integral_0^(+oo) p t^(p - 1) mu E{abs(f) >= t} dif t. $
]

#proof[
    Пусть $g(t) := mu E{abs(f) >= t}$.
    $ integral_E abs(f)^p dif mu = integral_0^(+oo) underbrace(mu E{abs(f)^p >= t}, =g(t^(1/p))) dif t = integral_0^(+oo) g(t^(1/p)) dif t. $
    Сделаем замену переменной в римановом интеграле: $s := t^(1/p)$:
    $
        integral_0^(+oo) g(t^(1/p)) dif t = integral_0^(+oo) p s^(p - 1) g(s) dif s.
    $
    Формально говоря, мы ее не доказывали для ненеприрывных функций, ну и ладно. Скоро появится более общая теорема#rf("substitution"), которая покроет и этот случай.
]

#import "../../utils/core.typ": * 
== Измеримые функции

#notice[
    Так как все меры можно продолжить на $sigma$-алгебру, далее мы будем считать, что все меры определены на $sigma$-алгебре.
]

#def(label: "def-lebesgue-set")[
    Пусть $f: E --> overline(RR)$. _Лебеговыми множествами фукнции $f$_ называются
    $
        E{f <= a} = {x in E: f(x) <= a} = f^(-1)([-oo, a]), \
        E{f >= a} = {x in E: f(x) >= a} = f^(-1)([a, +oo]), \
        E{f < a} = {x in E: f(x) < a} = f^(-1)([-oo, a)), \
        E{f > a} = {x in E: f(x) > a} = f^(-1)((a, +oo]). \
    $
]
#th(label: "def-measurable-correctness")[
    Пусть $E$ --- измеримо, $f: E --> overline(RR)$. Тогда равносильны следующие условия:
    + $E{f <= a}$ измеримы для любого $a in RR$;
    + $E{f < a}$ измеримы для любого $a in RR$;
    + $E{f > a}$ измеримы для любого $a in RR$;
    + $E{f >= a}$ измеримы для любого $a in RR$.
]

#proof[
    - "$1) <==> 3)$" --- очевидно, так как $E{f <= a} = E without E{f > a}$.

    - "$2) <==> 4)$" --- аналогично.

    - "$1) <==> 2)$" --- $E{f < a} = Union_(n = 1)^oo E{f <= a - 1/n}$.

    - "$3) <==> 4)$" --- $E{f > a} = Union_(n = 1)^oo E{f >= a + 1/n}$.
]

#def(label: "def-mfn")[
    $f: E --> overline(RR)$ называется _измеримой_, если измеримы все ее лебеговы множества#rf("def-lebesgue-set"). (Эквивалентно, если $E$ измерима, и измеримы все лебеговы множества конкретного вида#rf("def-measurable-correctness")).
]

#examples(label: "mfns")[
    + #sublabel("const") Константа на измеримом множестве измерима.

    + #sublabel("indicator") Характеристическая функция множества: $E$ и $A$ измеримы, 
        $ 
            bb(1)_A (x) = cases(
                1\, "если" x in A\,,
                0\, "если" x in E without A.
            ) 
        $
    
    + #sublabel("continious") Пусть $E in Ll^m$ и $f in C(RR^m)$. Тогда $f$ измерима относильно меры Лебега. Это получается из того, что $f^(-1)((-oo, a))$ --- открыт, значит лежит в $Bb^m subset Ll^m$. Значит функция измерима.
]

#props(label: "non-integral-mfn-props")[
    1. #sublabel("domain-measurable")
        Если $f: E --> overline(RR)$ измерима#rf("def-mfn"), то $E$ --- измеримо.
    2. #sublabel("restriction-mfn")
        Если $f: E --> overline(RR)$ измерима, $overline(E) subset E$ измеримо, то $f bar_overline(E)$ тоже измерима.
    3. #sublabel("preimage-segment-measurable")
        Если $f$ измерима, то прообраз любого промежутка измерим.
    4. #sublabel("preimage-open-measurable")
        Если $f$ измерима, то прообраз любого открытого множества измерим.
    5. #sublabel("abs-mfn") #sublabel("neg-mfn")
        Если $f$ измерима, то $abs(f)$ и $-f$ измеримы.
    6. #sublabel("max-mfn") #sublabel("min-mfn") 
        #sublabel("pos-part-mfn") #sublabel("neg-part-mnf")
        Если $f, g: E --> overline(RR)$ измеримы, то $max{f, g}$ и $min{f, g}$ измеримы.
        В частности, $f_+ = max{f, 0}$ и $f_- = max{-f, 0}$ измеримы.
    7. #sublabel("union-mfn")
        Пусть $E = Union E_n$ (конечное или счетное --- не важно), $f: E --> overline(RR)$ и $f bar_E_n$ измеримо для любого $n$. Тогда $f$ измеримо.
    8. #sublabel("mfn-is-mfn-restriction")
        Каждая измеримая функция $f: E --> overline(RR)$ --- сужение на $E$ некоторой измеримой функции $g: X --> overline(RR)$.
]

#proof[
    1. Очевидно из определения#rf("def-mfn").
    
    2. $tilde(E){f <= a} = tilde(E) sect E{f <= a}$#rf("def-mfn").
    
    3. $E{a < f < b} = E{f < b} sect E{f > a}$ --- измеримо#rf("def-mfn"). Аналогично для промежутков другого вида.
    
    4. Пусть $G subset RR$ открытое, тогда#rf("borel-set-over-cells") $G = usb_(j = 1)^oo (a_j, b_j]$. Тогда $f^(-1)(G) = usb_(j = 1)^oo f^(-1)(a_j, b_j]$, а счетное объединение измеримо.
    
    5. По определению#rf("def-mfn"), $E{-f <= a} = E{f >= -a}$. $E{abs(f) <= a} = cases(emptyset\, &a < 0, E{-a <= f <= a}\, quad &a >= 0)$.

    6. По определению#rf("def-mfn"), $E{max{f, g} <= a} = E{f <= a} sect E{g <= a}$. Аналогично для $min$.

    7. По определению#rf("def-mfn"), $E{f <= a} = Union E_n {f <= a}$.

    8. $ g(x) = cases(f(x)\, quad & "если" x in E\,,0\, & "иначе".) $
        Так как $E$ измерима#rf("non-integral-mfn-props", "domain-measurable"), эта функция тоже#rf("non-integral-mfn-props", "union-mfn").
]

#th(label: "inf-sup-lim-mfn")[
    Пусть $f_n: E --> overline(RR)$ --- измеримые. Тогда:
    1. $sup f_n$ и $inf f_n$ измеримы.
    2. $overline(lim) f_n$ и $underline(lim) f_n$ измеримы.
    3. Если $f = lim f_n$ (поточечный предел), то $f$ измерима.
]

#proof[
    1. $ 
        E{sup f_n <= a} &=^rf("def-mfn")
        {x in E: sup{f_1(x), f_2(x), ...} <= a} \
        &= {x in E: a #[--- верхняя граница множества] {f_1(x), f_2(x), ...}} \
        &= {x in E: f_n (x) <= a space forall n} = sect.big_(n = 1)^oo E{f_n <= a}.
    $
        Аналогично для $inf$.
    2. $overline(lim) f_n (x) = inf_n sup_(k >= n) f_k (x)$. Измерим.
    3. $f = overline(lim) f_n$, значит $f$ --- измерима.
]

#th(label: "compose-mfn")[
    Пусть $f: E --> H subset RR^m$, $f = (f_1, f_2, ..., f_m)$. $f_1$, $f_2$, ..., $f_m$ --- измеримые. Пусть $phi: H --> RR$, $phi in C(H)$. Тогда $F = phi compose f: E --> RR$ измерима.
]

#proof[
    Хотим понять, что $E{F < a} =^rf("def-mfn") F^(-1)(-oo, a) = f^(-1)(phi^(-1)(-oo, a))$ измеримо. $phi^(-1)(-oo, a) =: U$ --- открытое множество в $H$, так как $phi$ непрерывна. Тогда $U = H sect G$, где $G$ --- открыто в $RR^m$. Тогда $f^(-1)(U) = f^(-1)(H sect G) = f^(-1)(G)$. Остается доказать, что если $G subset RR^m$ открыто, то $f^(-1)(G)$ измеримо.

    Открытые множества представляются в виде счетного объединения ячеек#rf("borel-set-over-cells"):
    $G = usb_(n = 1)^oo (a_n, b_n]$, где $a_n, b_n in RR^m$. $f^(-1)(G) = usb_(n = 1)^oo f^(-1)(a_n, b_n]$. Достаточно понять про прообраз одной ячейки. $f^(-1)(c, d] = sect.big_(k = 1)^m f^(-1)_k (c_k, d_k]$ (разложили по кооридинатам). Значит $F$ измерима. 
]

#follow[ 
    В условии теоремы в качестве $phi$ можно взять поточечный предел непрерывных функций#rf("inf-sup-lim-mfn")#rf("mfns", "continious").
]

#def(name: "Арифметические операции с бесконечностями", label: "inf-arithmetic")[
    1. Если $x in RR$, то $x + (+oo) = x - (-oo) = +oo$ и $x + (-oo) = x - (+oo) = -oo$.
    2. Если $x > 0$, то $x dot (plus.minus oo) = plus.minus oo$, если $x < 0$, $x dot (plus.minus oo) = minus.plus oo$.
    3. Если $x in overline(RR)$, то $x dot 0 = 0$.
    4. #text(red, $(+oo) - (+oo) = (+oo) + (-oo) = (-oo) - (-oo) = 0$).
    Деление на $0$ все еще не определено. #text(red, strong[Свойство 4 нарушает ассоциативность сложения:])
    $ (1 + (+oo)) + (-oo) &= 0, \ 1 + ((+oo) + (-oo)) &= 1. $
]

#th(label: "mfn-arithmetic")[
    1. #sublabel("sum-mfn") #sublabel("prod-mfn") Сумма и произведение измеримых функций --- измеримая функция.
    2. #sublabel("compose-mfn") $f: E --> H subset RR, phi in C(H)$. Если $f$ измерима, то $phi compose f$ измерима.
    3. #sublabel("power-mfn") Если $f >= 0$ и измерима, $p > 0$, то $f^p$ измерима. (Соглашение: $(+oo)^p = +oo$).
    4. #sublabel("inf-mfn") Если $f$ измерима, то $1/f$ измерима на множестве $E{f != 0}$.
]

#proof[
    1. $f, g: E --> overline(RR)$ измеримы. Если значения функций конечны, то $phi(x, y) = x + y$. Можно рассмотреть#rf("compose-mfn") композицию $phi (f, g)$. Аналогично с умножением. Вопрос только с бесконечностями (в теореме#rf("compose-mfn") обе функции действуют в $RR$).

        Если какие-то функции, режем функцию на части#rf("non-integral-mfn-props", "union-mfn"): $E{f = -oo}$, $E{-oo < f < 0}$, $E{f = 0}$, $E{0 < f < +oo}$, $E{f = +oo}$, аналогично для $g$. Тогда на пересечении где есть хотя бы одна бесконечность, всегда получается константа#rf("mfns", "const"). На остальных кусках применяем рассуждение выше.
    
    2. Просто одномерный частный случай теоремы#rf("compose-mfn").

    3. $E{f^p <= a} =^rf("def-mfn") cases(emptyset\, "если" a < 0, E{f <= a^(1/p)}\, "если" a >= 0).$

    4. $tilde(E) = E{f != 0}$. $ tilde(E){1/f <= a} =^rf("def-mfn") cases(tilde(E){f >= 1/a} sect tilde(E){f < 0} "если" a < 0, tilde(E){f < 0} union tilde(E){f >= 1/a} "если" a > 0, tilde(E){f < 0} "если" a = 0). $
]

#follow(label: "mfn-arithmetic'")[
    1. Произведение конечного числа измеримых функций --- измеримая функция.
    2. Натуральная степень измеримой функции --- измеримая функция.
    3. Линейная комбинация измеримых функций --- измеримая функция.
]

#th(label: "continious-mfn")[
    Пусть $E in Ll^m$, $f in C(E)$. Тогда $f$ измерима относильно меры Лебега.
]

#proof[
    $E{f < a} = f^(-1)(-oo, a)$ --- открыто в $E$. Значит $E{f < a} =^rf("def-lebesgue-set") E sect G$, где $G$ открыто в $RR^m$. Значит оно измеримо#rf("def-mfn"). Мне кажется, или это уже где-то#rf("mfns", "continious") было?..
]

#def(label: "def-simple-fn")[
    Измеримая#rf("def-mfn") фукнция $f: E --> RR$ (с конечными значениями) называется _простой_, если она принимает конечное число значений.

    _Допустимым разбиением простой функции_ называется $E = usb_(k = 1)^n E_k$ такое, что $f bar_E_k$ --- постоянная.
]

#notice[
    У любой простой есть допустимое разбиение. В качестве $E_k$ берется $E{f = y_k}$. $y_k$ --- все значения функции.
]

#props(label: "simple-fn-props")[
    1. Если $E = usb_(k = 1)^n E_k$ --- измеримо и $f$ постоянна на каждом $E_k$, то $f$ --- простая.
    2. #sublabel("common-partition") Для любых двух простых функций есть общее допустимое разбиение.
    3. #sublabel("sum-simple") #sublabel("prod-simple") Сумма и произведение простых функций --- простая функция.
    4. #sublabel("linear-comb-simple") Линейная комбинация простых функций --- простая функция.
    5. #sublabel("max-simple") #sublabel("min-simple") $max$ и $min$ конечного числа простых функций --- простая функция.
]

#proof[
    1. Очевидно.
    2. $E = usb_(k = 1)^m A_i = usb_(j = 1)^n B_j$. Рассмотрим разбиение на $A_i sect B_j$. Оно подойдет.
    3. Свойство 2#rf("simple-fn-props", "common-partition") + тривиальщина#rf("def-simple-fn").
    4. Свойство 3#rf("simple-fn-props", "sum-simple") + индукция.
    5. Свойство 2#rf("simple-fn-props", "common-partition") + индукция + тривиальщина#rf("def-simple-fn").
]

#th(label: "simple-approx")[
    Пусть $f: X --> overline(RR)$, $f >= 0$ измеримая#rf("def-mfn"). Тогда существует последовательность простых функций#rf("def-simple-fn") $phi_n: X --> RR$, $0 <= phi_1 <= phi_2 <= ...$. и $f = lim phi_n$ поточечно. Если $f$ ограниченная, то $phi_n$ можно выбрать так, что $phi_n arrows.rr f$#rf("def-fn-converge") на $X$.
]

#proof[
    Пусть $Delta_k := [k/n, (k + 1)/n)$ при $k = 0, 1, ..., n^2 - 1$, $Delta_(n^2) := [n, +oo]$. То есть мы разрезали $[0, +oo]$ на $n^2 + 1$ кусков.

    Рассмотрим $A_k := f^(-1) (Delta_k)$ --- измеримые#rf("non-integral-mfn-props", "preimage-segment-measurable"). Тогда пусть $phi_n$ на $A_k$ равняется $k/n$. Это простая функция. 
    
    Докажем, что предел получится правильный: $lim phi_n (x) = f(x)$: 
    - Если $f(x) = +oo$, то $x in f^(-1)([n, +oo])$. Значит $phi_n (x) = n$.
    - Если $f(x) < +oo$, то при больших $n$, $x$ не будет лежать в прообразе луча. Пусть $x in.not f^(-1)([n, +oo])$. Тогда $f(x) - 1/n < phi_n (x) <= f(x)$, и, следовательно, $lim phi_n (x) = f(x)$. Причем если $f$ ограничена, то при $n >= N space f^(-1) [n, +oo) = nothing$. Значит $abs(phi_n (x) - f(x)) < 1/n$. Это и есть равномерная сходимость.

    Есть только небольшая проблема: не выполняется $0 <= phi_1 <= phi_2 <= ...$. Можно просто брать максимумы по префиксам, тогда все будет хорошо. Но предлагается другой способ: заметить, что $phi_(2^n) <= phi_(2^(n+1))$. Тогда можно просто взять подпоследовательность $phi_(2^n)$. Ну а почему это верно? Пусть для $2^n$ вы выбрали значение $k / 2^n$. Тогда $k/2^n <= f(x) < (k + 1)/2^n$. Тогда для $2^(n + 1)$ можно выбрать либо значение $(2k)/2^(n + 1)$ (если мы попали в первую половину), либо $(2k + 1)/2^(n + 1)$. Оба не меньше.
]

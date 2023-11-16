#import "../../utils/core.typ": * 
== Мера Лебега

#th[
    Классический объем $lambda_m$ на ячейках $Pp^m$ --- $sigma$-конечная мера.
]

#proof[
    Надо проверить счетную полуаддитивность: $ (a, b] subset Union_(n = 1)^oo (a_n, b_n] ==> lambda_m (a, b] <= sum_(n = 1)^oo lambda_m (a_n, b_n], $
    где $a, b, a_n, b_n in RR^m$. Возьмем $eps > 0$ и 
    $[a', b] subset (a, b]$ так, чтобы $lambda_m (a', b] > lambda_m (a, b] - eps$.

    Возьмем $(a_n, b'_n) supset (a_n, b_n]$ так, чтобы $lambda_m (a_n, b'_n] < lambda_m (a_n, b_n] + eps / 2^n$. $[a', b] subset (a, b] subset Union_(n = 1)^oo (a_n, b_n] subset Union_(n = 1)^oo (a_n, b'_n)$.

    У нас написано какое-то покрытие компакта. Выберем конечное подпокрытие, $(a', b] subset [a', b] subset Union_(i=1)^N (a_n_i, b'_n_i) subset Union_(i=1)^N (a_n_i, b'_n_i]$.

    $
        lambda_m (a, b] - eps < lambda_m (a', b] <= sum_(i = 1)^N lambda_m (a_n_i, b'_n_i] < \ < sum_(i = 1)^N (lambda_m (a_n_i, b_n_i] + eps / 2^(n_i)) < sum_(n = 1)^oo lambda_m (a_n, b_n] + eps.
    $

    Значит $lambda_m (a, b] < 2 eps + sum_(n = 1)^oo lambda_m (a_n, b_n]$. Устремим $eps$ к нулю и получим требуемое.
]

#def[
    _Мера Лебега_ $lambda_m$ --- это стандартное продолжение классического объема с полукольца ячеек $Pp^m$ (можно брать $Pp_QQ^m$) на $sigma$-алгебру $Ll^m$, где $Ll^m$ --- _лебеговская $sigma$-алгебра_
]

#notice[
    Если $A in Ll^m$, то 
    $ lambda_m A = inf {sum_(k = 1)^oo lambda_m P_k: P_k in Pp^m and A subset Union_(k = 1)^oo P_k}. $
]

#props[
    1. Открытые множества измеримы и мера непустого открытого множества положительна.
    2. Замкнутые множества измеримы и мера одноточечного множества равна нулю.
    3. Мера измеримого ограниченного множества конечна.
    4. Всякое измеримое множество --- это дизъюнктное объединение счетного числа множеств конечной меры.
    5. Пусть $E subset RR^m$. Если $forall eps > 0 space exists "измеримые множества" A_eps, B_eps$, такие, что $A_eps subset E subset B_eps$ и $lambda(B_eps without A_eps) < eps$, то $E$ измеримо.
        _Это свойство верно для любой меры на $sigma$-алгебре, не только для меры Лебега._
    6. Пусть $E subset RR^m$. Если $forall eps > 0$, найдется $B_eps supset E$, такое, что $lambda B_eps < eps$, то $E$ измеримо, и $lambda E = 0$.
    7. Счетное объединение множеств нулевой меры имеет меру 0.
    8. Счетное множество имеет нулевую меру.
    9. Множество нулевой меры имеет пустую внутренность.
    10. Если $e$ --- множество нулевой меры, то $forall eps$ существуют такие кубические ячейки $Q_j$, что $e subset Union_(j=1)^oo Q_j$ и $sum_(j=1)^oo lambda Q_j < eps$.
    11. Пусть $m >= 2$, $H_j(c) = {x in RR^m : x_j = c}$ --- $(m - 1)$---мерная гиперплоскость. Тогда $lambda_m H_j(c) = 0$.
    12. Любое множество, содержащееся в счетном объединении таких плоскостей, имеет нулевую меру.
    13. $lambda (a, b) = lambda (a, b] = lambda [a, b]$.
]

#proof[
    1. $Ll_m supset Bb(Pp^m) = Bb^m$, а $Bb^m$ содержит все открытые множества. Если $G$ --- непустое открытое, то $exists a in G ==> exists overline(B)_r(a) subset G$. А еще $lambda_m G >= lambda_m ("кубическая ячейка") > 0$, и эта ячейка лежит в найденном $overline(B)_r(a)$.
    
    2. Если есть одна точка, то можем взять ячейку со стороной $epsilon$, тогда $ lambda(dot) <= lambda("ячейка со стороной " epsilon) = epsilon^n. $
    
    3. Очевидно.
    
    4. $RR^m = usb_(k = 1)^oo P_k$, где $P_k$ --- ячейка с единичными сторонами. Тогда $E = usb_(k = 1)^oo (P_k sect E)$, а $lambda(E sect P_k) <= lambda P_k = 1$.

    5. $A := Union_(n=1)^oo A_(1/n)$ и $B := Sect_(n=1)^oo B_(1/n) ==> A subset E subset B$. 
    $ B without A subset B_(1/n) without A_(1/n) ==> lambda(B without A) <= lambda(B_(1/n) without A_(1/n)) < 1/n ==> lambda(B without A) = 0 $
    $ E without A subset B without A ==>^("полнота") E without A space #[--- измеримо] space ==> E = (E without A)union.sq A space #[--- измеримо]. $

    6. $A_eps = nothing$, подставляем А-шки в предыдущее свойство --- фиксируем результат. Если $E subset B_eps ==> lambda E <= lambda B_eps < eps$.

    7. Верно для любой меры на $sigma$-алгебре.

    8. Так как это счетное объединение одноточечных множеств.

    9. Если $Int A$ --- не пустое, то $A supset Int A ==> lambda A >= lambda Int A > 0$, так как $Int A$ открыто.
    
    10. $0 = lambda e = inf {sum_(n = 1)^oo lambda P_n : P_n in Pp_QQ^m and e in Union_(n = 1)^oo P_n}$. Выберем такие $P_n$, что $sum_(n=1)^oo lambda P_n < eps$. Рассмотрим $P_n$. У нее длины сторон --- рациональные числа. Нарежем на кубики со стороной $1 / "НОК всех знаменателей"$.

    11. Рассмотрим $A_n := (-n; n]^m sect H_j(c)$. Тогда $H_j(c) = Union_(n = 1)^oo A_n$. Достаточно проверить, что $lambda A_n = 0$. $ A_n subset (-n; n] times (-n; n] ...  times (-n; n] times (c - eps, c] times ... times (-n; n] $
    Тогда $lambda A_n <= (2n)^(m - 1) eps ==>^("св-во 6") lambda A_n = 0$.

    12. Свойство 7. + монотонность.

    13. Знаем, что $(a, b) subset (a, b] subset [a, b]$, $[a, b] without (a, b) subset$ конечное объединение гиперплоскостей, поэтому $lambda([a, b] without (a, b)) = 0$.
]

#notice[
    1. Существуют неизмеримые множества. Более того, любое множество положительной меры содержит неизмеримое подмножество.

    2. Существуют несчетные множества нулевой меры. Например, при $m >= 2$ подойдет гипер-плоскость. При $m = 1$ подходит канторово множество (это про отрезок из которого выкидывают середину, и потом из оставшихся отрезков выкидывают середины и т.д. рекурсивно).

        У канторова множества $K$ мера удовлетворяет  
        $ lambda K + 1/3 + 2 dot 1/9 + 4 dot 1/27 + ... = 1, $
        откуда $lambda K = 0$.

        Само множество несчетное: выкинем рациональные числа (их троичная запись неоднозначна). В троичной записи чисел из канторова множества нет единиц. Тогда есть биекция между $K$ и $[0, 1]$ заменой двоек на единицы и переинтерпретацией троичной записи как двоичной (можно вернуть рациональные числа для аккуратности).
]

#th(name: "регулярность меры Лебега")[
    Пусть $E$ --- измеримое. Тогда $forall eps > 0$ сущесвует открытое $G$ такое, что $E subset G$ и $lambda(G without E) < eps$.
]

#proof[
    Пусть $lambda E < +oo$. Знаем, что $ lambda E = inf {sum_(k = 1)^oo lambda P_k : P_k #[--- ячейки] and E subset Union_(k = 1)^oo P_k}. $
    Возьмем такое покрытие $E subset Union_(n=1)^oo (a_n, b_n]$, что $sum_(n=1)^oo lambda (a_n, b_n] < lambda E + eps$. Возьмем $(a_n, b'_n) supset (a_n, b_n]$, т.ч. $lambda (a_n, b'_n) < lambda (a_n, b_n] + eps/(2^n) $. Пусть $G = Union_(n=1)^oo (a_n, b'_n)$ --- открытое $G supset E$. $lambda G <= sum_(n=1)^oo lambda (a_n, b'_n) <= sum_(n=1)^oo (lambda (a_n, b_n] + eps/(2^n)) = eps + sum_(n=1)^oo lambda (a_n, b_n] < 2eps + lambda E$. Поэтому $lambda (G without E) = lambda G - lambda E < 2 eps$.

    Пусть $lambda E = +oo$. Тогда $E = usb_(n = 1)^oo E_n$, где $lambda E_n < +oo$. Возьмем открытое $G_n supset E_n$, такое, что $lambda (G_n without E_n) < eps / 2^n$. Тогда $G := Union_(n = 1)^oo G_n$ подходит.

    $
        G without E subset Union_(n = 1)^oo (G_n without E_n) ==> lambda (G without E) <= sum_(n = 1)^oo lambda (G_n without E_n) < sum_(n = 1)^oo eps/2^n = eps.
    $
]

#follow[
    1. Для любого измеримого множества найдется замкнутое $F subset E$ такое, что $lambda(E without F) < eps$.
    2. $E$ --- измеримое. Тогда
        $
            lambda E = inf{lambda G: G #[--- открытое и ] G supset E} \
            lambda E = sup{lambda F: F #[--- замкнутое и ] F subset E} \
            lambda E = sup{lambda K: K #[--- компакт и ] K subset E} \
        $
    3. $E$ --- измеримо. Тогда существует такая последовательность компактов $K_1 subset K_2 subset ...$, вложенных друг в друга, и $e$ --- множество нулевой меры, что $E = Union_(n=1)^oo K_n union e$.
]

#proof[
    1. Давайте возьмем $X without E$ и по нему открытое $G$, которое накрывает $X without E$, такое, что $eps > lambda(underbrace(G without (X without E), E without (X without G)))$. Положим $F = X without G$. Оно подходит.
    #TODO[картиночка той самой прослойки]

    2. Про компакты: давайте рассмотрим $K_n := [-n, n]^m sect F$, где $F$ --- замкнутое. Тогда это компакт. $K_1 subset K_2 subset ...$ и $Union_(n=1)^oo K_n = F ==>_("непрерывность меры" \ "снизу") lambda K_n --> lambda F$.

    3. Пусть $lambda E < +oo$. Найдется $tilde(K)_n subset E$, такое, что $lambda tilde(K)_n + 1/n > lambda E$. $Union_(n=1)^oo tilde(K)_n subset E$. $lambda E >= lambda(Union_(n=1)^oo tilde(K)_n) >= lambda tilde(K)_n > lambda E - 1/n ==> lambda(Union tilde(K)_n) = lambda E ==> lambda(underbrace(E without Union tilde(K)_n, e)) = 0$

        Пусть $lambda E = +oo$. Тогда $E = usb_(n = 1)^oo E_n$, где $lambda E_n < +oo$, $E_n = sum_(j = 1)^n K_(n j) union e$, $e = Union_(n = 1)^oo e_n$, $E = Union_(k = 1)^oo Union_(j = 1)^oo K_(n j) union e_n$ ($lambda e = 0$). $E = Union_(n=1)^oo Union_(j=1)^oo K_(n j) union e$.
]

#th[
    При сдвиге множества, его измеримость сохраняется, его мера не меняется.
]

#proof[
    $mu E := lambda (E + v)$ --- новая мера, где $v$ --- вектор, на который мы сдвигаем. Тогда $mu$ и $lambda$ совпадают на ячейках, а по единственности продолжения меры, $mu = lambda$. Отмечу, что они определились на одних и тех же множествах: в принципе интуитивно, но не очевидно. Чуть позже появится более общя теорема, которая это объяснит.
]

#th[
    Пусть $mu$ --- мера, заданная на $Ll^m$ и такая, что:
        1. $mu$ инварианта относительно сдвига.
        2. $mu$ конечна на ячейках. ($= mu$ конечна на органиченных измеримых множествах)
    Тогда $exists k in [0, +oo)$, такое, что $mu = k lambda$ (то есть $mu E = k lambda E space forall E in Ll^m$).
]
#proof[
    $Q := (0, 1]^m space k := mu Q$
    - Случай 1 ($k = 1$): надо доказать, что $mu = lambda$. По единственности продолжения достаточно проверить, что $mu P = lambda P space forall P in Pp_(QQ)^m$.
        $P$ разбивается на кубические ячейки со стороной $1/n$, где $n$ --- это НОК знаменателей длин сторон $P$. Поэтому нам достаточно проверить, что $ mu (0, 1/n]^m = lambda (0, 1/n]^m = 1/n^m. $ Представим $Q = usb_(k=1)^(n^m)$ сдвиги $(0, 1/n]^m$. Значит, что $ 1 = mu Q = n^m dot mu (0, 1/n]^m ==> mu (0, 1/n]^m = 1/n^m. $

    - Случай 2 ($k > 0$): возьмем $tilde(mu) := 1/k mu$, то есть $(tilde(mu) E = (mu E) / k)$. $tilde(mu) Q = 1$, $tilde(mu)$ --- мера, инвариантна относительно сдвигов, поэтому $tilde(mu) = lambda$.

    - Случай 3 ($k = 0$): $RR^m = usb_(k=1)^oo$ сдвиги $Q$, поэтому $mu RR^m = 0 ==> mu = 0 dot lambda$.
]

#th[
    Пусть $G subset RR^m$ --- открытое, $Phi: G --> RR^m$ непрерывно диффериенцируемо.
    1. Если $lambda e = 0$, то $lambda(Phi(e)) = 0$
    2. Если $E subset G$ измеримо, то $Phi(E)$ --- измеримо.
]
#proof[
    1. Случай 1: $e subset P subset Cl P subset G$, $P$ --- ячейка.
    $Cl P$ --- компакт, а $norm(Phi'(x))$ непрерывна на $Cl P$, поэтому $norm(Phi'(x))$ ограничена на $Cl P$. Пусть $norm(Phi'(x)) <= M space forall x in Cl P$, поэтому если $x, y in Cl P$, то $norm(Phi(x) - Phi(y)) = norm(Phi'(xi)) norm(x - y) <= M norm(x - y)$. Покроем $e$ кубическими ячейками $Q_j$ так, что $sum lambda Q_j < eps$ и пусть $h_j$ длина стороны $Q_j$. $x, y in Q_j ==> norm(x - y) <= sqrt(m) dot h_j ==> norm(Phi(x) - Phi(y)) <= M sqrt(m) dot h_j ==> Phi(Q_j)$ содержится в шаре радиуса $M sqrt(m) h_j$.

    Тогда $Phi(Q_j)$ накрылось кубиком со стороной $M sqrt(m) h_j$.

    $Phi(e) subset Union_(j = 1)^oo Phi(Q_j) subset Union_(j = 1)^oo "кубик со стороной" 2 M sqrt(m) h_j$.

    $lambda("кубик со стороной" 2 M sqrt(m) h_j) = (2 M sqrt(m) h_j)^m = (2M sqrt(m))^m lambda Q_j$. Тогда сумма мер кубиков равна $sum (2M sqrt(m))^m lambda Q_j < (2 M sqrt(m))^m eps$, значит $Phi(e)$ измеримо и $lambda(Phi(e)) = 0$.

    Случай 2: $e subset G$, $G = usb_(k=1)^oo P_k$, такие, что $P_k in Pp_(QQ)^m$ и $P_k subset Cl P_k subset G$. $e = usb_(k=1)^oo (P_k sect e), space P_k sect e subset P_k ==>_("сл. 1") lambda(P_k sect e) = 0 ==> lambda(underbrace(usb(P_k sect e), = e)) = 0$

    2. $E = e union Union_(n=1)^oo K_n$, где $K_n$ --- компакт и $lambda e = 0$. Поэтому $Phi(E) = underbrace(Phi(e), "измеримо") union Union_(n=1)^oo Phi(K_n)$, последнее --- компакты, поэтому измеримы.
]
#notice[
    Для просто диффериенцируемых отображений (обобщение сдвига) это неверно.
]

#th[
    Мера Лебега инвариантна относительно движения.
]

#proof[
    Пусть $U: RR^m --> RR^m$ --- поворот (линейное отображение), пусть $mu E := lambda(U(E)) space E in Ll^m$
    - $mu$ конечна на ограниченных множествах.
    - $mu$ инвариантна относительно сдвигов $forall v in RR^m$
    - $mu(E + v) = lambda (U(E + v)) = lambda(U(E) + U(v)) = lambda(U(E)) = mu E$, поэтому $mu = k lambda$, но единичный шар переходит в себя при повороте, поэтому на нем $mu = lambda ==> k = 1$.
]

#th(name: "Об изменении меры Лебега при линейном отображении")[
    Пусть $T: RR^m --> RR^m$ --- линейное отображение, тогда $lambda(T(E)) = abs(det(T)) dot lambda E$
]
#proof[
    $mu E := lambda(T(E))$ --- инвариантна относительно сдвигов и конечна на органиченных множествах, поэтому $mu = k lambda$, где $k = lambda(T((0, 1]^m)) = abs(det T).$
]

#pr(name: "Существование неизмеримое множества")[
    Рассмотрим $lambda$ на $RR$. Будем говорить, что $x sim y$ если $x - y in QQ$. Это отношение эквивалентности, $RR$ разбивается на классы. Выберем по одному элементу из каждого класса, который попадает в $[0, 1)$. $A$ --- множество выбранных элементов. Тогда $A$ неизмеримо.
]

#proof[
     Пусть множество $A$ --- измеримо. Рассмотрим случаи.

     Пусть $lambda A = 0$. Тогда $ [0, 1) subset Union_(r in QQ) (A + r) = RR. $ Но $lambda (A + r) = lambda A = 0$, поэтому, так как справа написано счетное объединение множеств нулевой меры, $lambda RR = 0$. Противоречие.

     Пусть $lambda A > 0$. Рассмотрим $ usb_(r in Q \ 0 < r < 1) (A + r) subset (0, 2). $ Значит, $ 2 = lambda (0, 2) >= sum_(r in QQ \ 0 < r < 1) lambda (A + r) = +oo. $
    Снова противоречие.

    Значит множество $A$ неизмеримо.
]

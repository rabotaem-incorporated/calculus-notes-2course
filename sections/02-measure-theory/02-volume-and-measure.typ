#import "../../utils/core.typ": * 

== Объем и мера

#def[
    $Pp$ --- полукольцо подмножеств в $X$. $mu: Pp --> [0; +oo]$.
    
    - $mu$ --- _объем_, если:
        1. $mu nothing = 0$
        2. $P_1, ..., P_n in Pp; quad union.sq.big_(k = 1)^n P_k in Pp ==> mu (union.sq.big_(k = 1)^n P_k) = sum_(k = 1)^n mu P_k$

    - $mu$ -- _мера_, если:
        1. $mu nothing = 0$ #h(1fr) $(1^*)$
        2. $P_1, P_2, ... in Pp; quad union.sq.big_(k = 1)^oo P_k in Pp ==> mu (union.sq.big_(k = 1)^oo P_k) = sum_(k = 1)^oo mu P_k$ #h(1fr) $(2^*)$
]

#notice[
    1. Если $mu$ --- мера, то $mu$ --- объем
    2. Если $mu$ удовлетворяет $(2^*)$ и есть непустое множество, на котором $mu$ конечно, то $(2^*) ==> mu nothing = 0$. Иными словами, $(1^*)$ нужно просто чтобы исключить тупой случай $mu equiv +oo$. 
]

#examples[(Объемов)
    1. Длина на полуинтервалах --- объем.
    2. Пусть $g: RR --> RR$ неубывающая. Тогда следующее $nu_g$ --- объем:
        $ 
            nu_g: Pp &--> [0, +oo) \
            nu_(a, b] &= g(b) - g(a). 
        $
    3. Классический объем на ячейках $lambda_m: Pp^m --> [0, +oo)$:
        $ lambda lr((a, b]) = (b_1 - a_1)(b_2 - a_2) ... (b_m - a_m). $
    4. $x_0 in X$, $a > 0$, $mu: 2^X --> lr([0, +oo])$:
        $ mu A = cases(a\, &"если" x_0 in A, 0\, &"иначе".) $
    5. $Aa = {"ограниченные множества в" RR^2 "и их дополнения"}$
        $ mu A = cases(0\, &#[если $A$ --- ограничено], 1\, &"иначе".) $

    Отметим, что 5 не является мерой.
]

#th(name: "свойства объема")[
    #set enum(numbering: x => if x != 228 { numbering("1)", x) } else { "2')" } )
    
    $Pp$ --- полукольцо подмножества $X, mu$ --- объем на $Pp$. Тогда
    1. Монотонность: eсли $P' subset P$, то $mu P' <= mu P$
    
    2. Усиленная монотонность: если $union.sq.big_(k=1)^n P_k subset P$, то $sum_(k=1)^n mu P_k <= mu P$
    
    228. #hide[Усиленная монотонность: ] если $union.sq.big_(k=1)^oo P_k subset P$, то $sum_(k=1)^oo mu P_k <= mu P$
    
    3. Полуаддитивность: eсли $P subset union.big_(k=1)^n P_k$, то $mu P <= sum_(k=1)^n mu P_k$
]

#let Union = math.union.big
#let UnionSq = math.union.big.sq
#let usb = math.union.big.sq

#proof[
    #set enum(numbering: x => if x != 228 { numbering("1)", x) } else { "2')" } )
    
    2. $P without union.sq.big_(k=1)^n P_k = union.sq.big_(j=1)^m Q_j$ для некоторых $Q_j in Pp$, поэтому 
    $
        P &= union.sq.big_(k=1)^n P_k union.sq union.sq.big_(j=1)^m Q_j
        ==> \ mu P &= sum_(k=1)^n mu P_k + sum_(j = 1)^m mu Q_j >= sum_(k=1)^n mu P_k. 
    $

    228. 
        $
            union.sq.big_(k=1)^n P_k subset union.sq.big_(k=1)^oo P_k subset P  ==> mu P >= sum_(k=1)^n mu P_k --> sum_(k=1)^oo mu P_k
        $
    
    3. 
        $
            P'_k := P sect P_k in Pp, space P subset Union_(k=1)^n P_k' = usb_(k=1)^n usb_(j=1)^(m_k)Q_(k j),
        $ 
        где $Q_(k j) subset P_k' subset P_k, space Q_(k j) in Pp$. Тогда:
        $
            usb_(j=1)^(m_k) Q_(k j) subset P_k ==>_(#[по 2.]) sum_(j=1)^(m_k)mu Q_(k j) <= mu P_k. \
            mu P <= sum_(k=1)^n sum_(j=1)^(m_k) mu Q_(k j) <= sum_(k =1)^n mu P_k
        $
]

#notice[
    1. Пусть $Rr$ --- кольцо, $mu$ --- объем на $Rr$. $A subset B in Rr$, $mu A < +oo$. Тогда $mu(B without A) = mu B - mu A$.
]

#proof[
    $
        B = A union.sq B without A \ mu B = mu A + mu (B without A)
    $
]

#th(name: "Декартово произведение объемов")[
    $Pp$ --- полукольцо подмножеств в $X$, $Qq$ --- полукольцо подмножеств в $Y$. $mu$ --- объем на $Pp$, $nu$ --- объем на $Qq$.
    $
        lambda: Pp times Qq &--> [0, +oo] \
        lambda(P times Q) &= mu P dot nu Q,
    $
    причем мы считаем, что $0 dot (+oo) = (+oo) dot 0 = 0$.
    Тогда $lambda$ --- объем на $Pp times Qq$.
]

#proof[
    Нужно проверить свойства объема:
    1. $lambda nothing = 0$
    2. $P_1, ..., P_n in Pp; quad union.sq.big_(k = 1)^n P_k in Pp ==> lambda (union.sq.big_(k = 1)^n P_k) = sum_(k = 1)^n lambda P_k$

    Первое свойство очевидно.

    Докажем второе, для этого рассмотрим *частный случай*, когда $P = usb_(i=1)^n P_i, space Q = usb_(j = 1)^m Q_j, space P, P_i in Pp, space Q, Q_j in Qq$, тогда $P times Q = usb_(i=1)^n usb_(j=1)^m P_i times Q_j$ и 
    #figure(cetz.canvas({
        import cetz.draw: *
        import cetz.decorations: *
        line((-1, -0.5), (7.5, -0.5), stroke: 1pt + gray)
        line((0, -0.5), (3, -0.5), stroke: 3pt + blue)
        line((3, -0.5), (5, -0.5), stroke: 3pt + red)
        line((5, -0.5), (7, -0.5), stroke: 3pt + green)
        line((-0.5, -1), (-0.5, 4.5), stroke: 1pt + gray)
        line((-0.5, 0), (-0.5, 3), stroke: 4pt + green)
        line((-0.5, 3), (-0.5, 4), stroke: 3pt + red)
        
        brace((3, -0.5), (0, -0.5), amplitude: 0.3, name: "br1")
        brace((5, -0.5), (3, -0.5), amplitude: 0.3, name: "br2")
        brace((7, -0.5), (5, -0.5), amplitude: 0.3, name: "br3")
        brace((-0.5, 0), (-0.5, 3), amplitude: 0.3, name: "br4")
        brace((-0.5, 3), (-0.5, 4), amplitude: 0.3, name: "br5")
        content((rel: (0, -0.4), to: "br1.center"), $P_1$)
        content((rel: (0, -0.4), to: "br2.center"), $P_2$)
        content((rel: (0, -0.4), to: "br3.center"), $P_3$)
        content((rel: (-0.5, 0), to: "br4.center"), $Q_1$)
        content((rel: (-0.5, 0), to: "br5.center"), $Q_2$)
        
        line((0, -1), (0, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((3, -1), (3, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((5, -1), (5, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((7, -1), (7, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((-1, 0), (7.5, 0), stroke: (paint: gray, dash: "dashed"))
        line((-1, 3), (7.5, 3), stroke: (paint: gray, dash: "dashed"))
        line((-1, 4), (7.5, 4), stroke: (paint: gray, dash: "dashed"))

        rect((0, 0), (3, 3), fill: blue.lighten(50%))
        rect((3, 0), (5, 3), fill: red.lighten(50%))
        rect((5, 0), (7, 3), fill: green.lighten(50%))
        rect((0, 3), (3, 4), fill: purple.lighten(50%))
        rect((3, 3), (5, 4), fill: yellow.lighten(50%))
        rect((5, 3), (7, 4), fill: orange.lighten(50%))
    }))
    $
        lambda (P times Q) = mu P dot nu Q = sum_(i=1)^n mu P_i dot sum_(j=1)^m nu Q_j = sum_(i=1)^n sum_(j = 1)^m mu P_i dot nu Q_j = sum_(i=1)^n sum_(j = 1)^m lambda(P_i times Q_j)
    $

    *Общий случай*: $P times Q = usb_(k=1)^n P_k times Q_k$
    #figure(cetz.canvas({
        import cetz.draw: *
        import cetz.decorations: *
        line((-1, -0.5), (7.5, -0.5), stroke: 1pt + gray)
        line((0, -0.5), (3, -0.5), stroke: 3pt + blue)
        line((3, -0.5), (6, -0.5), stroke: 3pt + red)
        line((6, -0.5), (7, -0.5), stroke: 3pt + green)
        line((-0.5, -1), (-0.5, 4.5), stroke: 1pt + gray)
        line((-0.5, 0), (-0.5, 2), stroke: 4pt + green)
        line((-0.5, 2), (-0.5, 4), stroke: 4pt + blue)
        line((-0.5, 4), (-0.5, 5), stroke: 3pt + red)
        
        brace((3, -0.5), (0, -0.5), amplitude: 0.3, name: "br1")
        brace((6, -0.5), (3, -0.5), amplitude: 0.3, name: "br2")
        brace((7, -0.5), (6, -0.5), amplitude: 0.3, name: "br3")
        brace((-0.5, 0), (-0.5, 2), amplitude: 0.3, name: "br4")
        brace((-0.5, 2), (-0.5, 4), amplitude: 0.3, name: "br5")
        brace((-0.5, 4), (-0.5, 5), amplitude: 0.3, name: "br6")
        content((rel: (0, -0.4), to: "br1.center"), $P'_1$)
        content((rel: (0, -0.4), to: "br2.center"), $P'_2$)
        content((rel: (0, -0.4), to: "br3.center"), $P'_3$)
        content((rel: (-0.5, 0), to: "br4.center"), $Q'_1$)
        content((rel: (-0.5, 0), to: "br5.center"), $Q'_2$)
        content((rel: (-0.5, 0), to: "br6.center"), $Q'_3$)
        
        line((0, -1), (0, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((3, -1), (3, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((5, -1), (5, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((6, -1), (6, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((7, -1), (7, 4.5), stroke: (paint: gray, dash: "dashed"))
        line((-1, 0), (7.5, 0), stroke: (paint: gray, dash: "dashed"))
        line((-1, 2), (7.5, 2), stroke: (paint: gray, dash: "dashed"))
        line((-1, 3), (7.5, 3), stroke: (paint: gray, dash: "dashed"))
        line((-1, 4), (7.5, 4), stroke: (paint: gray, dash: "dashed"))

        rect((0, 0), (3, 4), fill: blue.lighten(50%))
        rect((0, 4), (6, 5), fill: red.lighten(50%))
        rect((6, 2), (7, 5), fill: green.lighten(50%))
        rect((3, 0), (7, 2), fill: yellow.lighten(50%))
        rect((3, 2), (6, 4), fill: orange.lighten(50%))
    }))
 
    Знаем, что $P, Q, P_k, Q_k$ представляются в виде конечного объединения элементов из соответствующих полуколец и их можно попересекать, а значит найдутся такие $P'_i, Q'_j$, что
    $
        P times Q = usb_(i = 1)^N usb_(j = 1)^M P'_i times Q'_j \
        P_k times Q_k = usb_("какое-то подмножество") P'_i times Q'_j \
        forall i, j space P'_i times Q'_j "лежит ровно в одном" P_k times Q_k
    $
    Это разбиение попадает под разобранный случай 

    $ lambda(P times Q) = sum_(i=1)^N sum_(j=1)^M lambda(P'_i times Q'_j) =^"группировка слагаемых" sum_(k=1)^n lambda (P_k times Q_k) $
]

#follow[
    Классический объем --- это объем.
]

#examples[(Мер)
    1. Классический объем --- мера. (доказательство позже)
    2. Пусть $g: RR --> RR$ --- неубывающая непрерывная справа фукнция. Тогда $nu_g lr((a, b]) = g(b) - g(a)$ --- мера.
    3. $x_0 in X$, $a > 0$, то 
        $
            mu A = cases(a\, & "если" x_0 in A, 0\, & "иначе") quad #[--- мера].
        $
    4. (_Считающая мера_) $X$ --- произвольное множество. $mu: 2^X --> [0; +oo]$, где $mu A$ --- количество элементов в множестве $A$.
    5. $X$ --- произвольное, $X supset T = {t_1, t_2, ...}$ --- не более чем счетное. $w_1, w_2, ... >= 0$. Пусть $display(mu A = sum_(t_i in A) w_i)$. Это мера.
]

#proof[(Чего-то)

    Докажем, что $A = usb_(k = 1)^oo A_k ==> mu A = sum^oo_(k = 1) mu A_k$

    Пусть $S := underbrace(sum a_(k j), "в каком-то порядке") = sum_(k = 1)^oo sum_(j = 1)^oo a_(k j) =: S'$.

    $
        sum_(k = 1)^n sum_(j = 1)^oo a_(k j) = sum^oo_(j = 1) sum_(k = 1)^n a_(k j).
    $ 
    $
        S >= sum_(k = 1)^n sum_(j = 1)^oo a_(k j) --> sum_(k = 1)^oo sum_(j = 1)^oo a_(k j) ==> S >= S'.
    $

    Рассмотрим конечную сумму $ sum a_(k j) <= sum_(k = 1)^n sum_(j = 1)^m a_(k j) <= sum_(k = 1)^n sum_(j = 1)^oo a_(k j) <= sum_(k = 1)^oo sum_(j = 1)^oo a_(k j) = S' ==> S <= S' $

    Значит $S = S'$
]

#th[
    $mu: Pp --> [0; +oo]$ объем на полукольце $Pp$. Тогда $mu #[--- мера] <==> #[если] P, P_1, P_2, ... in Pp$, такие что $P subset Union_(k=1)^oo P_k$, то
    $mu P <= sum_(k=1)^oo mu P_k$. Это свойство называется _счетная полуаддитивность_.
]

#proof[
    - "$<==$" $P = usb_(k=1)^oo P_k$ тогда из счетной полуаддитивности следует, что $mu P <= sum_(k=1)^oo mu P_k$. А из объема следует усиленная монотонность  $==> mu P >= sum_(k=1)^oo mu P_k$

    - "$==>$": $P subset Union_(k=1)^oo P_k$ Пусть $P'_k = P sect P_k$, и тогда $ P subset Union_(k=1)^oo P'_k ==> P subset usb_(k=1)^oo usb_(j=1)^(m_k) Q_(k j), $ где $Q_(k j) in P$ и $Q_(k j) subset P'_k subset P_k$. Тогда имеем $usb_(j=1)^(m_k) Q_(k j) subset P_k ==> sum_(j=1)^(m_k)mu Q_j <= mu P_k$ из усиленной монотонности объема, и
    $ mu P <= sum_(k=1)^oo sum_(j=1)^(m_k) mu Q_(k j) <= sum_(k=1)^oo mu P_k. $
]

#follow[
    Пусть $mu$ --- мера на $sigma$-алгебре. Тогда счетное объединение множеств нулевой меры $mu$ имеет нулевую меру. 
]
#proof[
    $ mu(Union_(k=1)^oo P_k) <= sum_(k = 1)^oo mu P_k = 0, "если" forall k space mu P_k = 0 $
]
#th[
    Пусть $mu$ --- объем на $sigma$-алебре. Тогда $mu$ --- мера тогда и только тогда, когда $A_1 subset A_2 subset ... in Aa ==> mu(Union_(k=1)^oo A_k) = lim_(n -> oo) mu A_n$. Это свойство называется _непрерывность снизу_.
]

#proof[
    - "$==>$": $B_n := A_n without A_(n-1), space A_0 = nothing$
        $ Union_(k=1)^oo A_n = usb_(k=1)^oo B_k, space #[так как $A_n = usb_(k=1)^n B_k$] $
        $ mu(Union_(k=1)^oo A_k) = mu(usb_(k=1)^oo B_k) = sum_(k=1)^oo mu B_k = sum_(k=1)^oo underbrace(mu(A_k without A_(k-1)), mu A_k - mu A_(k-1)) $
        Если $mu A_k < +oo$, то $mu(Union_(k=1)^oo A_k) = lim_(n->oo)sum_(k=1)^n (mu A_k - mu A_(k-1)) = lim mu A_n$
        Если $mu A_n = +oo$, то $mu A_k = +oo space forall k >= n$ и $mu(Union A_k) = +oo$

    - "$<==$": Пусть $C = usb_(k = 1)^oo C_k$. Надо доказать, что $mu C = sum_(k = 1)^oo mu C_k$. Пусть $A_n := usb_(k = 1)^n C_k$.
        $ 
            mu A_n = sum_(k = 1)^n mu C_k ==> mu C = mu(Union_(n = 1)^oo A_n) = lim_(n->oo) mu A_n = sum_(k = 1)^oo mu C_k 
        $
]

#th[
    $mu$ --- объем на $sigma$-алгебре $Aa$ подмножеств $X$, $mu X < +oo$. Тогда следующие условия равносильны:
    1. $mu$ --- мера
    2. (непрерывность сверху) $A_1 supset A_2 supset A_3 supset ... ==> mu(sect.big_(n=1)^oo A_n) = lim_(n->oo)mu A_n$
    3. (непрерывность сверху на пустом множестве) Если $A_1 supset A_2 supset A_3 supset ...$ и $sect.big_(n=1)^oo A_n = nothing$, то $lim_(n->oo)mu A_n = 0$
]

#proof[
    - $2) => 3)$ --- тривиально. 
    - $1) => 2)$: $B_n = A_1 without A_n$. $nothing = B_1 subset B_2 subset B_3 subset ...$.
    $
        mu A_1 - mu (sect.big_(n = 1)^oo A_n) = mu(A_1 without sect.big_(n = 1)^oo A_n) = mu(Union_(n = 1)^oo B_n) = \ #h(3cm) lim_(n -> oo) mu B_n = lim_(n -> oo) (mu A_1 - mu A_n) = mu A_1 - lim mu A_n.
    $
    - $3) => 1)$: Пусть $A = usb_(k = 1)^oo C_k$. Рассмотрим $A_n = usb_(k = n)^oo C_k$. Так как $A_1 supset A_2 supset A_3 supset ...$ и $sect.big_(n = 1)^oo A_n = nothing$, $mu A_n --> 0$. 
    $ 
        A = usb_(k = 1)^(n - 1) C_k union.sq A_n ==> mu A = sum_(k = 1)^(n - 1) mu C_k + mu A_n --> sum_(k = 1)^oo mu C_k.
    $
]

#notice[
    1. Если $mu$ --- мера, и $mu A_n < +oo$ для какого-то $n$, то $mu(sect.big A_k) = lim_(k -> oo) mu A_k$.
    2. Условие $mu X < +oo$ важно, например если $A_n = (n, +oo)$.
]

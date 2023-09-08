#import "../../utils/core.typ": * 

== Объем и мера

#def[
    $Pp$ --- полукольцо подмножеств в $X$. $mu: Pp --> [0; +oo]$.
    
    - $mu$ --- _объем_, если:
        1. $mu nothing = 0$
        2. $P_1, ..., P_n in Pp; thin union.sq.big_(k = 1)^n P_k in Pp ==> mu (union.sq.big_(k = 1)^n P_k) = sum_(k = 1)^m mu P_k$

    - $mu$ -- _мера_, если:
        1. $mu nothing = 0$
        2. $P_1, P_2, ... in Pp; thin union.sq.big_(k = 1)^oo P_k in Pp ==> mu (union.sq.big_(k = 1)^n P_k) = sum_(k = 1)^m mu P_k$ #h(1fr) $(2*)$
]

#notice[
    1. Если $mu$ --- мера, то $mu$ --- объем
    2. Если $mu$ удовлетворяет $(2*)$ и есть непустое множество, на котором $mu$ конечно, то $(2*) ==> mu nothing = 0$. Иными словами, $(1*)$ нужно просто чтобы исключить тупой случай $mu equiv +oo$. 
]

#examples[
    1. Длина на полуинтервалах --- объем.
    2. Пусть $g: RR --> RR$ неубывающая. Тогда следующее $nu_g$ --- объем:
        $ 
            nu_g: Pp^1 &--> [0, +oo) \
            nu_(a, b] &= g(b) - g(a). 
        $.
    3. Классический объем на ячейках $lambda_m: Pp^m --> [0, +oo)$:
        $ lambda lr((a, b]) = (b_1 - a_1)(b_2 - a_2) ... (b_m - a_m). $
    4. $x_0 in X$, $a > 0$, $mu: 2^X --> lr([0, +oo])$:
        $ mu A = cases(a\, &"если" x_0 in A, 0\, &"иначе".) $
    5. $Aa = {"ограниченные множества в" RR^2 "и их дополнения"}$
        $ mu A = cases(0\, &#[если $A$ --- ограничено], 1\, &"иначе".) $

    Отметим, что 5 не является мерой.
]

#th(name: "свойства объема")[
    // #show enum.item.where(number: 228): set(numbering: x => "2')")
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
    
    2. $P without union.sq.big_(k=1)^n = union.sq.big_(j=1)^m Q_j$ для некоторых $Q_j in P$, поэтому 
    $
        P &= union.sq.big_(k=1)^n P_k union.sq union.sq.big_(j=1)^m Q_j
        ==> \ mu P &= sum_(k=1)^n mu P_k + sum_(j = 1)^m mu Q_j >= sum_(k=1)^n mu P_k. 
    $

    228. 
        $
            union.sq.big_(k=1)^n subset union.sq.big_(k=1)^oo P_k subset P  ==> mu P >= sum_(k=1)^n mu P_k --> sum_(k=1)^oo mu P_k
        $
    
    3. 
        $
            P_k' := P sect P_k in Pp space P = Union_(k=1)^n P_k' = usb_(k=1)^n usb_(j=1)^(m_k)Q_(k j),
        $ 
        где
        $ 
            Q_(k j) subset P_k' subset P_k space Q_(k j) in Pp. 
        $
        Тогда 
        $
            mu P = sum_(k=1)^n sum_(j=1)^(m_k) mu Q_(k j) <= sum_(k =1)^n mu P_k
        $
        $
            usb_(j=1)^(m_k) Q_(k j) subset P_k ==>_(#[по 2.]) sum_(j=1)^(m_k)mu Q_(k j) <= mu P_k.
        $
]

#notice[
    1. Пусть $Rr$ --- кольцо, $mu$ --- объем на $Rr$. $A subset B in Rr$, $mu A < +oo$. Тогда $mu(B without A) = mu B - mu A$.
]

#proof[
    $
        B = A union.sq B without A space space mu B = mu A + mu (B without A)
    $
]

#th(name: "Декартово произведение объемов")[
    $Pp$ --- полукольцо подмножеств в $X$, $Q$ --- полукольцо подмножеств в $Y$. $mu$ --- объем на $Pp$, $nu$ --- объем на $Q$.
    $
        lambda: P times Q &--> [0, +oo] \
        lambda(P times Q) &= mu P dot nu Q,
    $
    причем мы считаем, что $0 dot (+oo) = (+oo) dot 0 = 0$.
    Тогда $lambda$ --- объем на $Pp times Qq$.
]

#show "картиночка": "картин0чка"

#proof[
    - Простой случай: пусть $P = usb_(k =1)^n P_k, space Q = usb_(j = 1)^m Q_j, space P, P_k in Pp, space Q, Q_j in Qq$
    Тогда $P times Q = usb_(k=1)^n usb(j = 1)^m P_k times Q_j$
    #TODO[картиночка]
    $
        lambda (P times Q) = mu P dot nu Q = sum_(k=1)^n mu P_k dot sum_(j=1)^m nu Q_j = sum_(k=1)^n sum_(j = 1)^m underbrace(mu P_k dot nu Q_j, = lambda(P_k times Q_j))
    $
    - Противный случай: $P times Q = usb_(k=1)^n P_k times Q_k$
    $ P times Q = usb_(i = 1)^N usb_(j = 1)^M P_i' times Q_j' $
    $ lambda(P times Q) = sum_(i=1)^N sum_(j=1)^M lambda(P_i' times Q_j') = sum_(k=)^n lambda (P_k times Q_k) $
    #TODO[картиночка]
]

#follow[
    Классический объем --- это объем.
]

#examples[
    1. Классический объем --- мера. (доказательство позже)
    2. Пусть $g: RR --> RR$ --- неубывающая непрерывная справа фукнция. Тогда $nu_g lr((a, b]) = g(b) - g(a)$ --- мера.
    3. $x_0 in X$, $a > 0$, то 
        $
            mu A = cases(a\, & "если" x_0 in A, 0\, & "иначе") quad #[--- мера].
        $
    4. (_Считающая мера_) $X$ --- произвольное множество. $mu: 2^X --> [0; +oo]$, где $mu A$ --- количество элементов в множестве $A$.
    5. $X$ --- произвольное, $X supset T = {t_1, t_2, ...}$ --- не более чем счетное. $w_1, w_2, ... >= 0$. Пусть $display(mu A = sum_{i: t_i in A} w_i)$. Это мера.
]

#proof[
    5. Пусть $A = usb_(k = 1)^oo A_k$. Докажем, что $mu A = sum^oo_(k = 1) mu A_k$.

        Пусть $S := underbrace(sum a_(k j), "в каком-то порядке") = sum_(k = 1)^oo sum_(j = 1)^oo a_(k j) =: S'$.

        $
            sum_(k = 1)^n sum_(j = 1)^oo a_(k j) = sum^oo_(j = 1) sum_(k = 1)^n a_(k j).
        $ 
        $
            S => sum_(k = 1)^n sum_(j = 1)^oo a_(k j) --> sum_(k = 1)^oo sum_(j = 1)^oo a_(k j) ==> S >= S'.
        $

        Рассмотрим конечную сумму $ sum a_(k j) <= sum_(k = 1)^n sum_(j = 1)^m a_(k j) <= sum_(k = 1)^n sum_(j = 1)^oo a_(k j) <= sum_(k = 1)^oo sum_(j = 1)^oo a_(k j) = S' ==> S <= S' $

        Значит $S = S'$
]

#th[
    $mu: Pp --> [0; +oo]$ объем на полукольце $Pp$. Тогда $mu --- #[мера] <==> #[если] P, P_1, P_2, ... in Pp$, такие что $P subset Union_(k=1)^oo P_k$, то
    $mu P <= sum_(k=1)^oo mu P_k$. Это свойство называется _счетная полуаддитивность_.
]

#proof[
    - "$<==$" $P = usb_(k=1)^oo P_k$ тогда из счетной полуаддитивности следует, что $mu P <= sum_(k=1)mu P_k$. А из объема следует усиленная монотонность  $==> mu P >= sum_(k=1)^oo mu P_k$

    - "$==>$": $P subset Union_(k=1)^oo P_k space space P_k' = P sect P_k ==> P = Union_(k=1)^oo P_k' ==>$
    $ ==> P = usb_(k=1)^oo usb_(j=1)^(m_k) Q_(k j)$, где $Q_(k j) in P$ и $Q_(k j) subset P_k' subset P_k $
    $ usb_(j=1)^(m_k) Q_(k j) subset P_k ==> sum_(j=1)^(m_k)mu Q_j <= mu P_k space #[из усиленной монотонности объема]$
    $ mu P = sum_(k=1)^oo sum_(j=1)^(m_k) mu Q_(k j) <= sum_(k=1)^oo mu P_k $
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
    - "$==>$": $B_n := A_n without A_(n-1), space A_0 != nothing$
        $ Union_(k=1)^oo = usb_(k=1)^oo B_k, space #[так как $A_n = usb_(k=1)^n B_k$] $
        $ mu(Union_(k=1)^oo A_k) = mu(usb_(k=1)^oo B_k) = sum_(k=1)^oo mu B_k = sum_(k=1)^oo underbrace(mu(A_k without A_(k-1)), mu A_k - mu A_(k-1)) $
        Если $mu A_k < +oo$, то $mu(Union_(k=1)^oo A_k) = lim_(n-->oo)sum_(k=1)^n (mu A_k - mu A_(k-1)) = lim mu A_n$
        Если $mu A_n = +oo$, то $mu A_k = +oo space forall k >= n$ и $mu(Union A_k) = +oo$

    - "$<==$": Пусть $C = usb_(k = 1)^oo C_k$. Надо доказать, что $mu C = sum_(k = 1)^oo mu C_k$. Пусть $A_n := usb_(k = 1)^n C_k$.
        $ 
            mu A_n = sum_(k = 1)^n mu C_k ==> mu C = mu(Union_(n = 1)^oo A)n) = lim mu A_n = sum_(k = 1)^oo mu C_k 
        $
]

#th[
    $mu$ --- объем на $sigma$-алгебре $Aa$ подмножеств $X$, $mu X < +oo$. Тогда следующие условия равносильны:
    1. $mu$ --- мера
    2. (непрерывность сверху) $A_1 supset A_2 supset A_3 supset ... ==> mu(sect.big_(n=1)^oo A_n) = lim_(n-->oo)mu A_n$
    3. (непрерывность сверху на пустом множестве) Если $A_1 supset A_2 supset A_3 supset ...$ и $sect.big_(n=1)^oo = nothing$, то $lim_(n-->oo)mu A_n = 0$
]

#proof[
    - $2) => 3)$ --- тривиально. 
    - $1) => 2)$: $B_n = A_1 without A_n$. $nothing != B_1 subset B_2 subset B_3 subset ...$.
    $
        nu A_1 - mu (sect.big_(n = 1)^oo A_n) = mu(A_1 without sect.big_(n = 1)^oo A_n) = mu(Union_(n = 1)^oo B_n) = \ #h(3cm) lim_(n -> oo) mu B_n = lim_(n -> oo) (mu A_1 - mu A_n) = mu A_1 - lim mu A_n.
    $
    - $3) => 1)$: Пусть $A = usb_(k = 1)^oo C_k$. Рассмотрим $A_n = usb_(k = n)^oo C_k$. Так как $A_1 supset A_2 supset A_3 supset ...$ и $sect.big_(n = 1)^oo A_n = nothing$, $mu A_n --> 0$. 
    $ 
        A = usb_(k = 1)^(n - 1) C_k union.sq A_n ==> mu A = sum_(k = 1)^(n - 1) mu C_k + mu A_n --> sum_(k = 1)^oo mu C_k.
    $
]

#notice[
    1. Если $mu$ --- мера, и $mu A < +oo$ для какого-то $n$, то $mu(sect.big A_k) = lim_(k -> oo) mu A_k$.
    2. Условие $mu X < +oo$ важно, например если $A_n = (n, +oo)$.
]

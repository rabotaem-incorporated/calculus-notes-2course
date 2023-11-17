#import "../../utils/core.typ": * 
== Продолжение меры

#def[
    $nu: 2^X --> [0; +oo]$ --- _субмера_, если:
    1. $nu nothing = 0$
    2. Если $A subset B$, то $nu A <= nu B$ (монотонность).
    3. $nu(Union_(n=1)^oo A_n) <= sum_(n=1)^oo nu A_n$ (счетная полуаддитивность).
]

#def[
    $nu$ -- мера на $Aa$, тогда $nu$ --- полная, если $forall A in Aa$ и $forall B subset A$ и $nu A = 0$, то $B in Aa$
]
#notice[$mu B = 0$.]

#def[
    $nu$ --- субмера. Множество $E$ --- $nu$-измеримое, если $forall A$
    $ nu A = nu(A sect E) + nu(A without E) $
    #TODO[рисуночек]
]

#notice[
    Достаточно неравенства $nu A >= nu (A sect E) + nu (A without E)$.
]

#notice[
    Если $E_1, E_2, ..., E_n$ --- $nu$-измеримые, то $nu (A sect usb_(k = 1)^n E_k) = sum_(k = 1)^n nu(A sect E_k)$.
]

#proof[
    $ nu(A sect usb_(k = 1)^n E_k) = nu(usb_(k = 1)^n (A sect E_k)) = nu underbrace((usb_(k = 1)^n (A sect E_k) without E_n), usb_(k = 1)^(n - 1) A sect E_k) + nu underbrace((usb_(k = 1)^n (A sect E_k) sect E_n), A sect E_n). $
]

#th(name: "Каратеодори")[
    Если $nu$ --- субмера, то $nu$-измеримые множества образуют $sigma$-алгебру $Aa$ и сужение $nu$ на $Aa$ --- полная мера.
]
#proof[
    1. Если $nu E = 0$, то $E in Aa$:
    $ nu(underbrace(A sect E, subset E)) + nu(underbrace(A without E, subset A)) <= nu E + nu A = nu A. $
    2. $Aa$ --- симметричная структура. $A sect E = A without (X without E)$, $A without E = A sect (X without E)$. Значит, взяв дополнение от множества, мы останемся в структуре.
    3. Если $E$ и $F in Aa$, то $E union F in Aa$.
    $ nu A = nu(A sect E) + nu(A without E) &= nu(A sect E) + nu((A without E) sect F) + nu(underbrace((A without E) without F, A without (E union F))) >= \ &>= nu(A sect (E union F)) + nu(A without (E union F)). $
    4. Итого, это алгебра. Докажем, что это $sigma$-алгебра:
    5. Если $E_1, E_2, ... in Aa$, то $usb_(n=1)^oo E_n in Aa$. $E := usb_(n=1)^oo E_n$
    $
        nu A = nu(A sect usb_(k=1)^n E_k) + nu(A without usb_(k=1)^n E_k) = sum_(k=1)^n nu(A sect E_k) + nu(A without usb_(k=1)^n E_k) >= \ >= sum_(k=1)^n nu(A sect E_k) + nu(A without E) --> sum_(k=1)^oo nu(A sect E_k) + nu(A without E) >=_(#[счетная \ полуадд.]) nu(A sect E) + nu(A without E).
    $
    6. Объединение переделываем в дизъюнктное (по одной из теорем выше), то есть $Aa$ --- $sigma$-алгебра.
    7. Сужение $nu$ на $Aa$ --- это мера. Подставим $A = X$ в замечание 2 и получим, что $nu$ --- это объем на $Aa$. Объем и счетная полуаддитивность --- мера.
]

#def[
    Пусть $mu$ --- мера на полукольце $Pp$. _Внешняя мера (порожденная $mu$)_ $mu^*$:
    $
        mu^* A := inf { sum_(k = 1)^oo mu P_k : P_k in Pp and A subset Union_(k = 1)^oo P_k }.
    $
    Если такого покрытия не сущесвует, считаем $mu^* A = +oo$.
]

#notice[
    Можно рассматривать только дизъюнктные наборы $P_k$, так как 
    $ Union_(n = 1)^oo P_n = usb_(n = 1)^oo usb_(k = 1)^m_n Q_(n k), $
    где $Q_(n k) subset P_n$, то есть $usb_(k = 1)^m_n Q_(n k) subset P_n$. Тогда
    $
        sum_(k = 1)^(m_n) mu Q_(n k) <= mu P_n ==> sum_(n = 1)^oo sum_(k = 1)^(m_n) mu Q_(n k) <= sum_(n = 1)^oo mu P_n.
    $ 
]

#notice[
    Если $Pp$ --- $sigma$-алгебра, то $mu^* A = inf{mu B: B in Pp and A subset B}$
]

#th[
    Пусть $mu$ --- мера на полукольце $Pp$. Тогда $mu^*$ --- субмера, совпадающая с $mu$ на полукольце.
]

#proof[
    1. Поймем, что $mu$ и $mu^*$ совпадают на $Pp$
    $ #[Пусть] A in Pp space P_1 = A, P_2 = P_3 = ... = nothing ==> mu^* A <= mu A $
    $ sum_(k=1)^oo mu P_k >=_(#[счетная \ полуадд. меры]) mu A ==> mu^* A >= mu A $
    2. Покажем, что $mu^*$ --- субмера.
        - $mu^* nothing = 0$
        - $#[Если] A subset B, #[то] mu^* A <= mu^* B$, так как любое покрытие $B$ будет и покрытием $A$. 
        - Счетная полуаддитивность: $A = Union_(n=1)^oo A_n ==> mu^* A <= sum_(n=1)^oo mu^* A_n$. 
        Доказательство счетной полуаддитивности: рассмотрим $A_n$ и возьмем такие $P_(n k)$, что $A_n subset Union_(k = 1)^oo P_(n k)$ и $sum_(k = 1)^oo mu P_(n k) < mu^* A_n + eps / 2^n$.
            Пусть $A = Union_(n = 1)^oo A_n subset Union_(n = 1)^oo Union_(k = 1)^oo P_(n k)$. Тогда  
            $
                mu^* A <= sum_(n = 1)^oo underbrace(sum_(k = 1)^oo mu P_(n k), < mu^* A_n + eps / 2^n) < sum_(n = 1)^oo (mu^* A_n + eps / 2^n) = sum_(n = 1)^oo mu^* A_n + eps.
            $
            Устремив $eps$ к 0, получим требуемое.
]

#def[
    Пусть $mu_0$ --- мера на полукольце $Pp$. _Стандартное продолжение_ $mu_0^*$ --- внешняя мера, порожденная $mu_0$ и суженная на $sigma$-алгебру $mu_0^*$-измеримых множеств. Получается полная мера на некоторой $sigma$-алгебре.
]
 
#th[
    Это действительно продолжение. То есть элементы из полукольца $Pp$ будут $mu^*$-измеримыми. (здесь $mu^*$ --- это $mu_0^*$ из определения)
]
#proof[
    Надо доказать, что если $E in Pp$, то $forall A space mu^* A >= mu^* (A sect E) + mu^*(A without E)$.
    1. $A in Pp$, тогда $A without E = usb_(k=1)^n Q_k ==> A = (A sect E) union.sq usb_(k=1)^n Q_k$
    $ mu^* A = mu A = underbrace(mu(A sect E), mu^* (A sect E)) + underbrace(sum_(k=1)^n mu Q_k, >= mu^* (A without E)) $
    2. $A in.not Pp$, если $mu^* A = +oo$, то очевидно, поэтому считаем, что конечно. \
    Берем покрытие $A subset Union_(k=1)^oo P_k space P_k in Pp$ и $sum_(k=1)^oo mu P_k < mu^* A + epsilon$. \
    Знаем, что $mu P_k >= mu^* (P_k sect E) + mu^*(P_k without E)$, поэтому
    $ epsilon + mu^* A > sum_(k=1)^oo mu P_k >= sum_(k=1)^oo mu^*(P_k sect E) + sum_(k=1)^oo mu^* (P_k without E) >= \ >= mu^* (Union_(k=1)^oo (P_k sect E)) + mu^* (Union_(k=1)^oo (P_k without E)) >= mu^*(A sect E) + mu^* (A without E) $
]

#notice[Далее мы не будем разделять "меру" и "продолжение меры".]

#notice[$mu A = inf {sum_(k = 1)^oo mu P_k : A subset Union_(k = 1)^oo P_k and P_k in Pp}$.]

#notice[Если применить стандартное продолжение к стандартному продолжению, не получится ничего нового.]

#exercise[Доказать. _Указание: пусть $mu_0$ --- исходная мера, $mu$ --- стандартное продолжение. Доказать, что $mu_0^* = mu^*$._]

#notice[Можно ли продолжить на более широкую $sigma$-алгебру? Можно, но непонятно зачем.]

#def[
    $mu$ --- мера на $Pp$. $mu$ --- _$sigma$-конечная_ мера, если существуют $P_k in Pp:$ $mu P_k < +oo$ и $X = Union_(k=1)^oo P_k$
]

#notice[Можно ли по-другому продолжить $mu$ на $sigma$-алгебру $mu^*$-измеримых множеств? Если $mu$ --- $sigma$-конечная, то нет. Доказательство далее.]

#notice[Обязательно ли полная мера должна быть задана на $sigma$-алгебре $mu^*$-измеримых множеств? Если исходная $mu$ --- $sigma$-конечная мера, то да. Доказательство сложное.]

#th[
    Пусть $mu^*$ --- внешняя мера, порожденная мерой $mu$, заданной на полукольце $Pp$. Если $mu^* A < +oo$, то существуют 
    $ B_(n k) in Pp: C_n := Union_(k=1)^oo B_(n k) space #[и] space C := sect.big_(n=1)^oo C_n, space A subset C and mu^* A = mu C $
]
#proof[
    $ mu^* A = inf{sum_(k=1)^oo mu P_k: P_k in P space #[и] space A subset Union_(k=1)^oo P_k} $
    Возьмем такие $B_(n k)$, что $B_(n k) in Pp, A subset Union_(k=1)^oo B_(n k)$ и $mu^* A + 1/n >sum_(k=1)^oo mu B_(n k) >= mu C_n >= mu C = mu^* C >= mu^* A$, где $C_n supset A ==> C_n supset C supset A$ и $mu^* A <= mu C < mu^* A + 1/n ==> mu^* A = mu C$.
]
#follow[
    $mu$ --- стандартное продолжение с полукольца $Pp$. Пусть $A$ --- измеримо относительно $mu$ и $mu A < +oo$. Тогда $A = B union.sq e$, где $B in Bb(Pp)$ и $mu e = 0$.
]
#proof[
    Возьмем $C$ из теоремы, $C in Bb(Pp)$. $mu(C without A) = mu C - mu A = 0$. Применим теорему к множеству $C without A$. Найдется $e_1 supset C without A$, такое что $e_1 in Bb(Pp)$ и $mu e_1 = mu(C without A) = 0$.

    Рассмотрим $B := C without e_1 in Bb(Pp)$. Тогда $B subset A$. Рассмотрим $e = A without B$. Это то что надо: $e subset C without B subset e_1$. Тогда $mu e <= mu e_1 = 0$. Значит $mu e = 0$. 
]

#notice[
    Если $mu$ --- $sigma$-конечная мера и $A$ --- $mu$-измеримое множество, то $A = B union.sq e$, где $B in Bb(Pp)$ и $mu e = 0$.
    #TODO[это треш а не теорема :)]
]

#proof[
    $A_n = A sect P_n$.
    $
        mu A_n <= mu P_n < +oo ==> A_n = B_n union.sq e_n = usb B_n union.sq usb e_n.
    $
]

#th(name: "единственность продолжения")[
    Пусть $mu$ --- стандартное продолжение меры на $sigma$-алгебру $Aa$ с  полукольца $Pp$, $mu$ --- $sigma$-конечная мера. А $nu$ --- другая мера на $Aa$, совпадающая с $mu$ на $Pp$. Тогда $mu A = nu A space forall A in Aa$
]

#proof[
    Пусть $A in Aa$ и $A subset Union_(n = 1)^oo A_n$, где $A_n in Pp$.
    $ nu A <= sum_(k=1)^oo nu A_k = sum_(k=1)^oo mu A_k ==> nu A <= inf{sum_(n=1)^oo mu A_n: A_n in Pp, A subset Union A_n} = mu A ==> nu A <= mu A. $
    Возьмем $P in Pp$.

    $nu(P sect A) + nu(P without A) = nu P = mu P = mu(P sect A) + mu(P without A)$
    
    $nu(P sect A) <= mu(P sect A) $
    
    $nu(P without A) <= mu(P without A) $
    


    Если $mu P < +oo$, то тут равенства. Тогда получается, что $nu(P sect A) = mu(P sect A) space forall P in Pp: mu P < +oo$. \
    $mu$ --- $sigma$-конечная, поэтому $X = usb_(n=1)^oo P_n: P_n in Pp$ и $mu P_n < +oo$.
    $ ==> A = A sect X = usb_(n=1)^oo A sect P_n $
    $ mu(A sect P_n) = nu(A sect P_n) ==> underbrace(sum_(n=1)^oo mu(A sect P_n), mu A) = underbrace(sum_(n=1)^oo nu(A sect P_n), nu A) $
]

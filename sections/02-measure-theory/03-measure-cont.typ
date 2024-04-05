#import "../../utils/core.typ": * 
== Продолжение меры

#def(label: "def-submeasure")[
    $nu: 2^X --> [0; +oo]$ --- _субмера_, если:
    1. $nu nothing = 0$
    2. Если $A subset B$, то $nu A <= nu B$ (монотонность).
    3. $nu(Union_(n=1)^oo A_n) <= sum_(n=1)^oo nu A_n$ (счетная полуаддитивность).
]

#def(label: "def-complete-measure")[
    $mu$ -- мера на $Aa$, тогда $mu$ --- полная, если $forall A in Aa$ и $forall B subset A$ и $mu A = 0$, то $B in Aa$.
]

#notice[$mu B = 0$.]

#def(label: "def-measurable")[
    $nu$ --- субмера. Множество $E$ --- $nu$-измеримое, если $forall A$
    $ nu A = nu(A sect E) + nu(A without E) $
]

#notice(label: "def-measurable'")[
    Достаточно неравенства $nu A >= nu (A sect E) + nu (A without E)$.
]

#notice(label: "measurable-union")[
    Если $E_1, E_2, ..., E_n$ --- $nu$-измеримые, то $nu (A sect usb_(k = 1)^n E_k) = sum_(k = 1)^n nu(A sect E_k)$.
]

#proof[
    $ nu(A sect usb_(k = 1)^n E_k) = nu(usb_(k = 1)^n (A sect E_k)) = nu underbrace((usb_(k = 1)^n (A sect E_k) without E_n), usb_(k = 1)^(n - 1) A sect E_k) + nu underbrace((usb_(k = 1)^n (A sect E_k) sect E_n), A sect E_n). $
]

#th(name: "Каратеодори", label: "caratheodory")[
    Если $nu$ --- субмера#rf("def-submeasure"), то $nu$-измеримые#rf("def-measurable") множества образуют $sigma$-алгебру#rf("def-salgebra") $Aa$ и сужение $nu$ на $Aa$ --- полная мера#rf("def-complete-measure").
]
#proof[
    Положим $Aa = {A | A "является" nu"-измеримым"}$.
    1. Если $nu E = 0$, то $E in Aa$:
    $ nu(underbrace(A sect E, subset E)) + nu(underbrace(A without E, subset A)) <= nu E + nu A = nu A. $
    2. $Aa$ --- симметричная структура#rf("def-symm-system"). $A sect E = A without (X without E)$, $A without E = A sect (X without E)$. Значит, взяв дополнение от множества, мы останемся в структуре.
    3. Докажем, что если $E$ и $F in Aa$, то $E union F in Aa$. Рассмотрим произвольное $A$:
        $ 
            nu A =^rf("def-measurable")
            nu(A sect E) + nu(A without E) &=
            nu(A sect E) + nu((A without E) sect F) + nu(underbrace((A without E) without F, A without (E union F))) >=\ &>= 
            nu(A sect (E union F)) + nu(A without (E union F)). 
        $
        Значит по замечанию#rf("def-measurable'"), $E union F$ $nu$-измеримы.
    4. Итого, это алгебра#rf("def-algebra"). Докажем, что это $sigma$-алгебра:
    5. Докажем, что если $E_1, E_2, ... in Aa$, то $usb_(n=1)^oo E_n in Aa$. $E := usb_(n=1)^oo E_n$. Для произвольного $A$:
        $
            nu A =^rf("def-measurable")
            nu(A sect usb_(k=1)^n E_k) + nu(A without usb_(k=1)^n E_k) =
            sum_(k=1)^n nu(A sect E_k) + nu(A without usb_(k=1)^n E_k) >= \ >=
            sum_(k=1)^n nu(A sect E_k) + nu(A without E) -->
            sum_(k=1)^oo nu(A sect E_k) + nu(A without E)
            >=_(#[счетная \ полуадд.])^rf("def-measurable") 
            nu(A sect E) + nu(A without E).
        $
    6. В определении#rf("def-salgebra") $sigma$-алгебры надо доказать для любого объединения, а не только для дизъюнктного. Но мы знаем, что в полукольце любое объединение можно переделать в дизъюнктное#rf("semiring-disjoint-union"). Значит $Aa$ --- $sigma$-алгебра.
    7. Остается доказать, что сужение $nu$ на $Aa$ --- это мера. Подставим $A = X$ в замечание 2#rf("measurable-union") и получим, что $nu$ --- это объем#rf("def-measure", "volume") на $Aa$. Объем и счетная полуаддитивность#rf("measure-semiadditive") --- мера.
]

#def(label: "def-external-measure")[
    Пусть $mu$ --- мера на полукольце $Pp$. _Внешняя мера (порожденная $mu$)_ $mu^*$:
    $
        mu^* A := inf { sum_(k = 1)^oo mu P_k : P_k in Pp and A subset Union_(k = 1)^oo P_k }.
    $
    Если такого покрытия не существует, считаем $mu^* A = +oo$.
]

#notice[
    Можно рассматривать только дизъюнктные наборы $P_k$, так как 
    $ Union_(n = 1)^oo P_n =^rf("semiring-disjoint-union") usb_(n = 1)^oo usb_(k = 1)^m_n Q_(n k), $
    где $Q_(n k) subset P_n$, то есть $usb_(k = 1)^m_n Q_(n k) subset P_n$. Тогда
    $
        sum_(k = 1)^(m_n) mu Q_(n k) <= mu P_n ==> sum_(n = 1)^oo sum_(k = 1)^(m_n) mu Q_(n k) <= sum_(n = 1)^oo mu P_n.
    $ 
]

#notice[
    Если $Pp$ --- $sigma$-алгебра#rf("def-salgebra"), то $mu^* A = inf{mu B: B in Pp and A subset B}$.
]

#th(label: "ext-measure-is-submeasure")[
    Пусть $mu$ --- мера на полукольце $Pp$. Тогда $mu^*$ --- субмера, совпадающая с $mu$ на полукольце.
]

#proof[
    1. Поймем, что $mu$ и $mu^*$ совпадают на $Pp$. Пусть $A in Pp$, $P_1 = A$, $P_2 = P_3 = ... = nothing$, тогда $mu^* A <= mu A$, так как
    $ sum_(k=1)^oo mu P_k >=_(#[счетная \ полуадд.])^rf("measure-semiadditive") mu A ==> mu^* A >= mu A $
    2. Покажем, что $mu^*$ --- субмера#rf("def-submeasure"). Надо доказать 3 свойства:
        - $mu^* nothing = 0$.
        - $#[Если] A subset B, #[то] mu^* A <= mu^* B$. 
        - Счетная полуаддитивность: $A = Union_(n=1)^oo A_n ==> mu^* A <= sum_(n=1)^oo mu^* A_n$.
        Первое свойство очевидно. Второе верно, так как любое покрытие $B$ будет и покрытием $A$.

        Доказательство счетной полуаддитивности: рассмотрим $A_n$ и возьмем такие $P_(n k)$, что $A_n subset Union_(k = 1)^oo P_(n k)$ и $sum_(k = 1)^oo mu P_(n k) < mu^* A_n + eps / 2^n$.
            Пусть $A = Union_(n = 1)^oo A_n subset Union_(n = 1)^oo Union_(k = 1)^oo P_(n k)$. Тогда  
            $
                mu^* A <= sum_(n = 1)^oo underbrace(sum_(k = 1)^oo mu P_(n k), < mu^* A_n + eps / 2^n) < sum_(n = 1)^oo (mu^* A_n + eps / 2^n) = sum_(n = 1)^oo mu^* A_n + eps.
            $
            Устремив $eps$ к 0, получим требуемое.
]

#def(label: "def-standard-continuation")[
    Пусть $mu_0$ --- мера на полукольце $Pp$. _Стандартное продолжение_ $mu_0^*$ --- внешняя мера, порожденная $mu_0$ и суженная на $sigma$-алгебру $mu_0^*$-измеримых множеств. Получается полная мера на некоторой $sigma$-алгебре.
]
 
#th(label: "standard-continuation-correctness")[
    Это действительно продолжение. То есть элементы из полукольца $Pp$ будут $mu^*$-измеримыми. (здесь $mu^*$ --- это $mu_0^*$ из определения)
]
#proof[
    Надо доказать, что если $E in Pp$, то $forall A space mu^* A >= mu^* (A sect E) + mu^*(A without E)$#rf("def-measurable'"). Рассмотрим случаи.
    1. $A in Pp$, тогда $A without E = usb_(k=1)^n Q_k ==> A = (A sect E) union.sq usb_(k=1)^n Q_k$.
    $ 
        mu^* A = mu A = underbrace(mu(A sect E), mu^* (A sect E)) + underbrace(sum_(k=1)^n mu Q_k, >= mu^* (A without E)) >= mu^* (A sect E) + mu^*(A without E).
    $
    2. $A in.not Pp$. Eсли $mu^* A = +oo$, то очевидно, поэтому считаем, что конечно.
        
        Берем покрытие $A subset Union_(k=1)^oo P_k, space P_k in Pp$ и $sum_(k=1)^oo mu P_k < mu^* A + epsilon$. Знаем, что $mu P_k >= mu^* (P_k sect E) + mu^*(P_k without E)$#rf("def-measurable'") (уже в полукольце), поэтому
        $
            epsilon + mu^* A >
            sum_(k=1)^oo mu P_k >=
            sum_(k=1)^oo mu^*(P_k sect E) + sum_(k=1)^oo mu^* (P_k without E) >=^rf("measure-semiadditive") \ >=^rf("measure-semiadditive")
            mu^* (Union_(k=1)^oo (P_k sect E)) + mu^* (Union_(k=1)^oo (P_k without E)) >=
            mu^*(A sect E) + mu^* (A without E)
        $
]

#notice[Далее мы не будем разделять "меру" и "продолжение меры".]

#notice[$mu A = inf {sum_(k = 1)^oo mu P_k : P_k in Pp and A subset Union_(k = 1)^oo P_k}$.]

#notice[Если применить стандартное продолжение к стандартному продолжению, не получится ничего нового.]

#exercise[Доказать. _Указание: пусть $mu_0$ --- исходная мера, $mu$ --- стандартное продолжение. Доказать, что $mu_0^* = mu^*$._]

#notice[Можно ли продолжить на более широкую $sigma$-алгебру? Можно, но непонятно зачем.]

#def(label: "def-sfinite")[
    $mu$ --- мера на $Pp$. $mu$ --- _$sigma$-конечная_ мера, если существуют $P_k in Pp:$ $mu P_k < +oo$ и $X = Union_(k=1)^oo P_k$
]

#notice[Можно ли по-другому продолжить $mu$ на $sigma$-алгебру $mu^*$-измеримых множеств? Если $mu$ --- $sigma$-конечная, то нет. Доказательство далее.]

#notice[Обязательно ли полная мера должна быть задана на $sigma$-алгебре $mu^*$-измеримых множеств? Если исходная $mu$ --- $sigma$-конечная мера, то да. Доказательство сложное.]

#th(label: "external-measure-through-semiring")[
    Пусть $mu^*$ --- внешняя мера#rf("def-external-measure"), порожденная мерой $mu$, заданной на полукольце $Pp$. Если $mu^* A < +oo$, то существуют 
    $ B_(n k) in Pp: C_n := Union_(k=1)^oo B_(n k) space #[и] space C := sect.big_(n=1)^oo C_n, space A subset C and mu^* A = mu C $
]

#proof[
    По определению#rf("def-external-measure"),
    $ mu^* A = inf{sum_(k=1)^oo mu P_k: P_k in P space and space A subset Union_(k=1)^oo P_k}. $
    Возьмем такие $B_(n k)$,
    что $B_(n k) in Pp, A subset Union_(k=1)^oo B_(n k)$ и
    $
        mu^* A + 1/n >sum_(k=1)^oo mu B_(n k) >= mu C_n >= mu C = mu^* C >= mu^* A,
    $
    где $C_n supset A ==> C_n supset C supset A$ и $mu^* A <= mu C < mu^* A + 1/n ==> mu^* A = mu C$.
]

#follow(label: "measurable-is-borel-plus-zero")[
    $mu$ --- стандартное продолжение#rf("def-standard-continuation") с полукольца $Pp$. Пусть $A$ --- измеримо#rf("def-measurable") относительно $mu$ и $mu A < +oo$. Тогда $A = B union.sq e$, где $B in Bb(Pp)$#rf("borel-set") и $mu e = 0$.
]

#proof[
    Возьмем $C$ из теоремы#rf("external-measure-through-semiring"), $C in Bb(Pp)$. $mu(C without A) = mu C - mu A = 0$. Применим теорему#rf("external-measure-through-semiring") еще раз, к множеству $C without A$. Найдется $e_1 supset C without A$, такое что $e_1 in Bb(Pp)$ и $mu e_1 = mu(C without A) = 0$.

    Рассмотрим $B := C without e_1 in Bb(Pp)$. Тогда $B subset A$. Рассмотрим $e = A without B$. Это то что надо: $e subset C without B subset e_1$. Тогда $mu e <= mu e_1 = 0$. Значит $mu e = 0$.
]

/*
#proof[
    $A_n = A sect P_n$.
    $
        mu A_n <= mu P_n < +oo ==> A_n = B_n union.sq e_n = usb B_n union.sq usb e_n.
    $
]
*/

#th(name: "единственность продолжения", label: "standard-continuation-unique")[
    Пусть $mu$ --- стандартное продолжение#rf("def-standard-continuation")
    меры на $sigma$-алгебру $Aa$ с полукольца $Pp$,
    $mu$ --- $sigma$-конечная#rf("def-sfinite") мера.
    А $nu$ --- другая мера на $Aa$, совпадающая с $mu$ на $Pp$. Тогда $mu A = nu A space forall A in Aa$.
]

#proof[
    Пусть $A in Aa$ и $A subset Union_(n = 1)^oo A_n$, где $A_n in Pp$.
    $ 
        nu A <= sum_(k=1)^oo nu A_k =^"совпадение\nна полукольце"
        sum_(k=1)^oo mu A_k ==>\ ==>
        nu A <=
        inf{sum_(n=1)^oo mu A_n: A_n in Pp and A subset Union A_n} =^rf("def-external-measure")
        mu A ==>
        nu A <= mu A. 
    $
    Возьмем $P in Pp$. Из написанного выше, справедливы следующие неравенства:
    - $nu(P sect A) + nu(P without A) = nu P = mu P = mu(P sect A) + mu(P without A)$
    - $nu(P sect A) <= mu(P sect A)$
    - $nu(P without A) <= mu(P without A)$
    Если $mu P < +oo$, то тут равенства. Тогда получается, что 
    $ nu(P sect A) = mu(P sect A) space forall P in Pp: mu P < +oo. $
    $mu$ --- $sigma$-конечная#rf("def-sfinite"), поэтому $X = usb_(n=1)^oo P_n: P_n in Pp$ и $mu P_n < +oo$. Имеем,
    $ A = A sect X = usb_(n=1)^oo A sect P_n. $
    И воспользовавшись выведенным равенством выше,
    $ mu(A sect P_n) = nu(A sect P_n) ==> underbrace(sum_(n=1)^oo mu(A sect P_n), mu A) = underbrace(sum_(n=1)^oo nu(A sect P_n), nu A) ==> mu A = nu A. $
]

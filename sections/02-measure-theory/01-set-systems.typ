#import "../../utils/core.typ": * 

== Системы множеств

#denote[
  $A union.sq B$ --- объединение $A$ и $B$, такое, что $A sect B != nothing$.

  $union.sq.big_(k = 1)^n A_k$ --- объединение множеств $A_1, ..., A_n$ и $A_j sect A_j = nothing$ для всех $i != j$.

  Такие объединения называются _дизъюнктными объединениями_, а множества из них называют _дизъюнктными_.
]

#def[
  ${E_alpha}$ --- разбиение множества $E$, если $ E = union.sq.big_(alpha in I) E_alpha. $
]

#notice(name: "Напоминание")[
  $ 
    X without union.big_(alpha in I) E_alpha &= sect.big_(alpha in I)(X without E_alpha), \
    X without sect.big_(alpha in I) E_alpha &= union.big_(alpha in I)(X without E_alpha).
  $
]

#def(label: "def-sigma-delta-props")[
  $Aa$ --- семейство подмножеств множества $X$. Будем говорить, что множество имеет свойства:
  
  - $(sigma_0)$, если $A, B in Aa$, то $A union B in Aa$
  
  - $(delta_0)$, если $A, B in Aa$, то $A sect B in Aa$
  
  - $(sigma)$, если $A_n in Aa space forall n in NN$, то $union.big_(n = 1)^oo A_n in Aa$
  
  - $(delta)$, если $A_n in Aa space forall n in NN$, то $sect.big_(n = 1)^oo A_n in Aa$
]

#def(label: "def-symm-system")[
  $Aa$ --- симметричная система, если $A in Aa ==> X without A in Aa.$
]

#pr[
  Пусть $Aa$ симметричная система множеств. Тогда
  $ 
    (sigma_0) <==>^rf("def-sigma-delta-props") (delta_0) 
    space 
    #[и] space 
    (sigma) <==>^rf("def-sigma-delta-props") (delta). 
  $
]
#proof[

  "$<==$"
  $
   
     X \\ (A union B) = (X \\ A) sect (X \\ B)
  $
  "$==>$" 
  $ 
    X \\ (A sect B) = (X \\ A) union (X \\ B)
  $
]

#def(label: "def-algebra")[
  Система множеств $Aa$ называется _Алгеброй_, если $Aa$ --- симметричная система#rf("def-symm-system") и $(sigma_0)$, $(delta_0)$#rf("def-sigma-delta-props") и $nothing in Aa$, то есть если $A, B in Aa$, то $X without A$, $X without B$, $A union B$ и $A sect B$ лежат в системе $Aa$.
]

#def(label: "def-salgebra")[
  $Aa$ -- $sigma$-алгебра, если $Aa$ -- алгебра и $(sigma), (delta) in Aa$
]

#props(label: "sigma-algebra-props")[
  1. Если $Aa$ --- $sigma$-алгебра, то $Aa$ --- алгбера.

  2. Если $Aa$ --- алгебра, то $X in Aa$.

  3. Если $Aa$ --- алгебра, $A, B in Aa$, то $A without B in Aa$.

  4. Если $Aa$ --- алгебра, то $A_1, ..., A_n in Aa ==> union.big_(j = 1)^n A_j, sect.big_(j = 1)^n A_j in Aa$.
]

#proof[
  3. $A without B = A sect (X without B)$
  4. Индукция
]

#examples[
  1. Ограниченные в $RR^n$ и их дополнения --- алгебра, но не $sigma$-алгебра.
  2. $2^X$ --- и алгебра, и $sigma$-алгебра.
  3. _Индуцированная алгебра_ ($sigma$-алгебра): \ 
    $Aa subset 2^X$ --- алгебра, $Y subset X$, $Bb := {A sect Y bar A in Aa}$ --- алгебра подмножеств в $Y$.
    #proof[

      $B in Bb <==> B = B' sect Y, B' in Aa ==> Y without B =  Y without (B' sect Y) = Y without B' = (Y without B') sect Y\ (Y without B') in Aa ==> Y without B in Bb$

      $B_1 in Bb, B_2 in Bb <==> ... ==> B_1 sect B_2 = (Y sect B_1 ') sect (Y sect B_2 ') = Y sect (B_1 ' sect B_2 ')\ (B_1 ' sect B_2 ') in A ==> B_1 sect B_2 in Bb$
    ]
  4. Пусть $Aa_alpha$ --- алгебра/$sigma$-алгебра подмножеств в $X$. Тогда $sect.big_(alpha in I) Aa_alpha$ --- алгебра ($sigma$-алгебра) подмножеств в $X$.
  5. Пусть $A$ и $B$ --- множества. Наименьшая алгебра, содержащая $A$ и $B$ - все объединения подмножеств ${A without B, B without A, A sect B, X without (A union B)}$, всего $2^4 = 16$ множеств.
  #figure(grid(columns: 8, gutter: 0.3cm, ..for atom in range(16) {
    let plot = cetz.canvas(length: 0.25cm, {
      import cetz.draw: *
      let c = luma(90%)
      rect((-3.5, -2.5), (3.5, 2.5), fill: if atom < 8 {c} else {blue.lighten(50%)})
      rect((-3, -2), (1, 1), fill: if calc.rem(atom, 8) < 4 {c} else {red.lighten(50%)})
      rect((-2, -1), (3, 2), fill: if calc.rem(atom, 4) < 2 {c} else {green.lighten(50%)})
      rect((-2, -1), (1, 1), fill: if calc.rem(atom, 2) < 1 {c} else {yellow.lighten(50%)})
    })
    (plot,)
  }))
]

#let Ee = $cal(E)$
#let Rr = $cal(R)$


#th(label: "borel-set")[
  $Ee$ --- система подмножеств $X$.
  Тогда существует наименьшая по включению $sigma$-алгебра подмножеств в $X$, содержащая $Ee$.
]

#proof[
  Рассмотрим всевозможные $sigma$-алгебры $Aa_alpha supset Ee$
  $ ==> sect.big_(alpha in I) Aa_alpha space #[--- $sigma$-алгебра и она содержит $Ee$] $
]

#def(glue: true)[
  Такая#rf("borel-set") $sigma$-алгебра называется _Борелевской оболочкой множества $Ee$_. Обозначается $Bb(Ee)$.
]

#def(label: "borel-algebra")[
  Минимальная $sigma$-алгебра, содержащая все открытые множества в $RR^n$ называется _Борелевской $sigma$-алгеброй_. Обозначается $Bb^n$.
]

#notice[
  $underbrace(Bb^n, "континуум") != underbrace(2^RR^n, #[больше \ континуума])$
  // много и очень много
  // дохуя и пиздец дохуя
]

#def(label: "def-ring")[
  $Rr$ --- _кольцо_ подмножеств $X$, если $A, B in Rr ==> A union B, A sect B, A without B in Rr$.
  Пустые кольца не рассматриваются.
]
#notice[
  $ nothing in Rr space #[так как $A without A = nothing$] $
  $X$ не обязательно лежит в $Rr$. \
  Если $X$ лежит в $Rr$, то $Rr$ --- алгебра.
]

#def(label: "def-semiring")[
  $Pp$ --- _полукольцо_ подмножеств $X$, если 
    1. $nothing in Pp$
    2. $A, B in Pp ==> A sect B in Pp$
    3. $A, B in Pp ==> exists Q_1, ..., Q_m in Pp$ такие, что $A without B = union.sq.big_(j=1)^m Q_j$
]

#examples[
  1. Все возможные полуинтервалы $lr((a, b]) in RR$ --- полукольцо.
  2. $Aa := { lr((a, b]) bar a, b in QQ }$
]

#lemma(label: "lem-disjoint-union")[
  $union.big A_n = union.sq.big (A_n without union.big_(k = 1)^(n - 1) A_k)$
]

#proof[
  Пусть $B_n := A_n without union.big_(k = 1)^(n - 1) A_k subset A_n$. Если $i < j$, то 
  $
    B_j sect A_i = nothing ==> B_j sect B_i = nothing. 
  $
  Значит $B_j$ --- дизъюнктны.
  - "$supset$": $A_n supset B_n$
  - "$subset$": Берем все $x in union.big A_n$. Пусть $m$ --- наименьший номер, для которого $x in A_m$. Тогда $x in B_m$.
]

#th(label: "semiring-disjoint-union")[
  $Pp$ --- полукольцо, $P_1, P_2, ... in Pp$. Тогда
  1. $display(P without union.big_(j = 1)^n P_j = union.sq.big_(i = 0)^m Q_i)$ для некоторых $Q_i in Pp$.
  
  2. $display(union.big_(k = 1)^n P_k = union.sq.big_(k = 1)^n union.sq.big_(j = 1)^m_k Q_(k j))$, где $Q_(k, j) in Pp$ и $Q_(k j) subset P_k$.

  3. В 2) можно написать счетное объединение.
]

#proof[
  1. Индукция по $n$: 
    $ P without union.big_(j=1)^(n-1) P_j = union.sq.big_(i=1)^m Q_i \
      P without union.big_(j=1)^n P_j = (P without union.big_(j=1)^(n-1) P_j) without P_n = (union.sq.big_(i=1)^m Q_i) without P_n = union.sq.big_(i=1)^m (Q_i without P_n).
    $
  2. $
      union.big_(k = 1)^n P_k = union.sq.big_(k = 1)^n (P_k without union.big_(j = 1)^(k - 1) P_j) = union.sq.big_(k - 1)^n union.sq.big_(j = 1)^(m_k) Q_(k j).
    $
]

#let Qq = $cal(Q)$

#th(name: [декартово произведение полуколец], label: "cartesian-semiring-prod")[
  $Pp$ --- полукольцо подмножества $X$, $Qq$ --- полукольцо подмножества $Y$.
  $ Pp times Qq = {A times B: A in Pp, B in Qq} space #[--- полукольцо подмножеств в $X times Y$]. $
]

#proof[
  $nothing in Pp times Qq$
  Пусть $A_1 times B_1$ и $A_2 times B_2 in Pp times Qq$. Тогда $ (A_1 times B_1) sect (A_2 times B_2) = (A_1 sect A_2) times (B_1 sect B_2) in Pp times Qq. $

  $ (A_1 times B_1) without (A_2 times B_2) = A_1 times (B_1 without B_2) union.sq (A_1 without A_2) times (B_1 sect B_2) =\ union.sq.big_(j=1)^m underbrace(A_1 times Q_j, in Pp times Qq) union.sq union.sq.big_(i = 1)^n (underbrace(P_i times (B_1 sect B_2), in Pp times Qq)) $
]

#def(label: "def-cell")[
  Пусть $a, b in RR^m$. _Открытым параллелепипедом_ $(a, b)$ называется 
  $
    (a_1, b_1) times (a_2, b_2) times ... times (a_m, b_m).
  $
  _Замкнутым параллелепипедом_ $[a, b]$ называется 
  $
    [a_1, b_1] times [a_2, b_2] times ... times [a_m, b_m].
  $
  _Ячейкой_ $(a, b]$ называется
  $
    lr((a_1, b_1]) times lr((a_2, b_2]) times ... times lr((a_m, b_m]).
  $
]

#pr(label: "cell-through-cuboid")[
  Непустая ячейка представляется в виде счетного пересечения убывающей последовательности вложенных открытых параллелепипедов и в виде счетного объединения возрастающей последовательности вложенных замкнутых параллелепипедов.
]

#proof[
  $ 
    A_n &:= [a_1 + 1/n, b_1] times [a_2 + 1/n, b_2] times ... times [a_m + 1/n, b_m] \
    U_n &:= (a_1, b_1 + 1/n) times (a_2, b_2 + 1/n) times ... times (a_m, b_m + 1/n) \ 
  $
]

#denote(label: "def-R-cells")[
  $
    Pp^m := { "ячейки в" RR^m } supset Pp^m_QQ := { #block[ячейки в $RR^m$ у которых все \ координаты всех вершин рациональны] }
    $
]

#th(label: "cells-semiring")[
  $Pp^m$ и $Pp_(QQ)^m$ --- полукольца
]
#th(label: "open-through-cell")[
  Всякое непустое открытое множество $G subset RR^m$ представляется в виде дизъюнктного объединения счетного числа ячеек, которые вместе с замыканием содержатся в $G$. Более того, ячейки можно брать с рациональными координатами.
]

#let Cl = math.op("Cl")

#proof[
  #figure[
    #image("../../images/pupailupa.svg", width: 50%)
  ]
  $
    x in G ==> exists r in RR space overline(B)_r (x) subset G ==> \
    exists C_x in Pp_(QQ)^m space C_x subset overline(B)_r (x) space ("смотри картинку") ==> \
    G = Union_(x in G) C_x
  $
  Это счетное объединение, поскольку все ячейки имеют рациональные координаты, а значит, его можно переделать в дизъюнктное не испортив ячеек.
]

#follow(label: "borel-set-over-cells")[
  Борелевская оболочка ячеек $Bb(Pp^m) = Bb(Pp_(QQ)^m) = Bb^m$
]
#proof[
  1. Знаем, что $Pp^m supset Pp_(QQ)^m ==> Bb(Pp^m) supset Pp_(QQ)^m ==> Bb(Pp^m) supset Bb(Pp_(QQ)^m)$ (Из-за минимальности#rf("borel-set"))
  2. Любое открытое множество --- счетное объединение ячеек с рациональными координатами вершин#rf("open-through-cell"), поэтому открытые множества лежат в $Bb(Pp_(QQ)^m) ==> Bb^m subset Bb(Pp_(QQ)^m)$
  3. Знаем, что ячейка --- счетное пересечение открытых множеств#rf("cell-through-cuboid"), значит, что все ячейки содержаться в $Bb^m ==> Bb(Pp^m) subset Bb^m$.
]

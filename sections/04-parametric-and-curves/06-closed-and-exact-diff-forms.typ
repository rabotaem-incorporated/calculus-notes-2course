#import "../../utils/core.typ": *

== Замкнутые и точные дифференциальные формы

#def[
  $omega$ --- форма в области $Omega$.
  1. $omega$ --- _точная_, если у нее есть первообразная в $Omega$.
  2. $omega$ --- _локально точная_, если $forall a in Omega space exists U_a$, такая, что у $omega$ в $U_a$ есть первообразная.
  3. $omega$ --- _замкнутая_, если $(diff f_k)/(diff x_i) = (diff f_i)/(diff x_k) space forall i, k$. 
]

#notice[
  Интеграл от точной формы по кривой зависит лишь от ее концов.
]

#th[
  Если коэффициенты у формы из $C^1$, то из локальной точности следует замкнутось.
]

#proof[
  Возьмем $a in Omega$ и $F$ --- первообразную $omega$ в $U_a$. Тогда
  $ (diff F)/(diff x_k) = f_k ==> (diff f_k)/(diff x_j) = diff/(diff x_j) (diff F)/(diff x_k) = diff/(diff x_k) (diff F)/(diff x_j) = (diff f_j)/(diff x_k). $
]

#lemma(name: "Пуанкаре")[
  $Omega$ --- выпуклая область. Коэффициенты формы $omega$ из $C^1$. Тогда из замкнутости следует точность.
]

#proof[
  Доказательство будет только для $n = 2$. Достаточно проверить, что $integral_gamma omega = 0$ для любой $gamma$ --- замкнутой, несамопересекающейся кривой (можно и ломанной). $gamma = diff Gamma$
  
  $
    integral_gamma omega = integral_gamma P dif x + Q dif y = integral_(Gamma) ((diff Q)/(diff x) - (diff P)/(diff y)) dif lambda_2 = 0.
  $
  Чтобы внутри $gamma$ можно было применять формулу Грина, нужно, чтобы $Gamma subset Omega$, то есть чтобы в $Omega$ не было "дырок". Поэтому мы требуем выпуклость $Omega$.

  #TODO[не поверите, картиночка]
]

#follow[
  Если коэффициенты $omega$ из $C^1$, то из замкнутости следует локальная точность, то есть для таких форм замкнутость = локальная точность.
]

#proof[
  Берем $U_a in Omega$. $U_a$ --- выпуклая. Из леммы Пуанкаре, а $U_a$ есть первообразная. Это и есть локальная точность.
]

#notice[
  В лемме выпуклость сущесвенна. $Omega = RR^2 without {(0, 0)}$, а $omega = (x dif y - y dif x) / (x^2 _ y^2)$, $P = - y / (x^2 + y^2)$, $Q = x / (x^2 + y^2)$/ Тогда $(diff P)/(diff y) = - ((x^2 + y^2) - 2 y^2)/(x^2 + y^2)^2 = (y^2 - x^2)/(x^2 + y^2)^2 = (diff Q)/(diff x)$. Значит замкнутость есть.
  Проинтегрируем по единичной окружности $gamma$. $integral_gamma omega = integral_0^(2 pi) (cos t (sin t)' - sin t (cos t)') dif t = integral_0^2pi dif t = 2 pi != 0$.
]

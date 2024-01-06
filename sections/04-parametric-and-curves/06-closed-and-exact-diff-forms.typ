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
  В лемме выпуклость существенна. 
  
  $Omega = RR^2 without {(0, 0)}$, а $omega = (x dif y - y dif x) / (x^2 + y^2)$, $P = - y / (x^2 + y^2)$, $Q = x / (x^2 + y^2)$
  
  Тогда $(diff P)/(diff y) = - ((x^2 + y^2) - 2 y^2)/(x^2 + y^2)^2 = (y^2 - x^2)/(x^2 + y^2)^2 = (diff Q)/(diff x)$. Значит замкнутость есть.
  Проинтегрируем по единичной окружности $gamma$. $integral_gamma omega = integral_0^(2 pi) (cos t (sin t)' - sin t (cos t)') dif t = integral_0^2pi dif t = 2 pi != 0$.
]

#def[
  $gamma: [a, b] --> Omega$ путь, $omega$ --- локально точная форма в $Omega$. $f: [a, b] --> RR$ назовем _первообразной $Omega$ вдоль пути_, если для любой точки $t in [a, b]$, у $gamma(t)$ существует окрестность $U_(gamma(t))$ и первообразная $F$ в $U_(gamma(t))$ такая, что $f(tau) = F (gamma (tau))$ при $tau$ близких к $t$.

  #TODO[картиночка]
]

#lemma[
  $g: [a, b] --> RR$ --- локально постоянная функция (то есть у каждой точки есть окресность, в которой она постоянна). Тогда $g(x) = const$.
]

#proof[
  Если в окрестности каждой точки функция константа, то ее производная в любой точке равна $0$, а раз $g' equiv 0$, то $g equiv const$.
]

#th[
  Первообразная вдоль пути существует, и единственна с точностью до константы.
]

#proof[
  - "Единственность": Пусть $f_1, f_2: [a, b] --> RR$ --- первообразные вдоль пути $gamma$. Берем $t: [a, b]$. В $U_(gamma(t))$ есть первообразные $F_1$ и $F_2$ такие, что $f_i (tau) = F_i (gamma (tau))$ при $tau$ близких к $t$. Значит
    $ f_1 (tau) - f_2 (tau) = F_1 (gamma(tau)) - F_2 (gamma(tau)) = const $
    при $tau$ близких к $t$.
  
  - "Существование": $gamma[a, b]$ покрыто этими окрестностями. Так как носитель $gamma$ --- компакт, по лемме Лебега существует $r > 0$ такой, что $B_r (gamma(t))$ целиком содежится в каком-то элементе покрытия.

    #TODO[картиночка]

    $gamma$ --- непрерывна на компакте, значит равномерно непрерывна. Значит, сущесвует $delta > 0$ такая, что для любых $t$ и $t'$ таких, что $abs(t - t') < delta$, $rho(gamma(t), gamma(t')) < r$. Нарежем $[a, b]$ на равные отрезки длины меньше $delta$. Тогда $gamma[t_(i - 1), t_i] subset B_r (gamma (t_i)) subset U_i$, где $U_i$ --- соответсвующий элемент покрытия.

    Пусть $F_i$ --- первообразная формы $omega$ в $U_i$. Тогда $f(t) = F_(gamma(t))$ при $t in [t_0, t_1]$ (то есть на первом отрезке положим $f$ таковой). Знаем $gamma(t_1) subset U_1 sect U_2$. В этом пересечении есть две первообразные --- $F_1$ и $F_2$. Значит, там они отличаются на константу. Подправим $F_2$ так, что константа будет нулевой. Тогда $f(t) = F_2 (gamma(t))$ при $t in [t_1, t_2]$. Повторяем.
]

#follow[
  Пусть $f$ --- первообразная $omega$ вдоль пути $gamma: [a, b] --> Omega$. Тогда
  $ integral_gamma omega = f(b) - f(a). $
  Это обобщение формулы Ньютона-Лейбница.
]

#proof[
  $f(t) = F_i (gamma(t))$ при $t in [t_(i - 1), t_i]$. Тогда
  $ integral_gamma omega = sum_(i = 1)^n integral_(gamma bar_[t_(i - 1), t_i]) omega = sum_(i = 1)^n (F_i (gamma(t_i))) - F_i (gamma(t_(i - 1))) $
  Мы согласовывали первообразные в построении так, что $F_i (gamma(t_(i - 1))) = F_(i - 1) (gamma(t_(i - 1)))$, поэтому вся сумма телескопическая. Значит
  $
    integral_gamma omega = F_n (gamma(b)) - F_1 (gamma(a)) = f(b) - f(a).
  $
]

#def[
  Пусть $Gamma$ --- область. $gamma_0, gamma_1: [a, b] --> Omega$ и $gamma_0 (a) = gamma_1 (a)$, $gamma_0 (b) = gamma_1 (b)$. $gamma_0$ и $gamma_1$ называются _гомотопными путями с неподвижными концами_, если существует $gamma: [a, b] times [0, 1] --> Omega$, непрерывная, такая, что 
  $
    forall t space cases(gamma_0 (t) = gamma (t, 0), gamma_1 (t) = gamma (t, 1)) #h(1cm) and #h(1cm)
    forall u space cases(gamma (a, u) = gamma_0 (a), gamma (b, u) = gamma_0 (b)).
  $

  Неформально, у нас есть две веревки, протянутые между гвоздями, и эти веревки гомотопны, если можно перетягивая одну превратить в другую. В этом нам могут помешать столбы.

  #TODO[картиночка]
]

#def[
  Пусть $Gamma$ --- область. $gamma_0, gamma_1: [a, b] --> Omega$ и $gamma_0 (a) = gamma_0 (b)$, $gamma_1 (a) = gamma_1 (b)$.

  Назовем $gamma_0$, $gamma_1$ _гомотопными путями с замкнутыми концами_, если найдется $gamma: [a, b] times [0, 1] --> Omega$ непрерывная, такая, что
  $
    forall t space cases(gamma_0 (t) = gamma (t, 0), gamma_1 (t) = gamma (t, 1)) #h(1cm) and #h(1cm) forall u space gamma (a, u) = gamma (b, u).
  $

  То есть, теперь мы берем замкнутые веревки, и превращаем их друг в друга. В этом нам могут помешать столбы, или разное количество оборотов вокруг них.
]

#def[
  Замкнутый путь --- _стягивающий_, если он гомотопен одноточечному пути. Такие пути еще называют _нулевыми_.
]

#def[
  _Односвязная облать_ --- область, в которой любой замкнутый путь стягиваем.
]

#examples[
  - Выпуклая область

  - Звездная область, то есть когда есть выделенная точка, и для любой другой точки области, соединяющий их отрезок лежит в области (подойдет $gamma(t, u) = gamma_1 (t) dot u$, если выделенная точка --- нуль).

  - $RR^2 without {(0, 0)}$ *не односвязна*, доказательство далее.
]

#def[
  $Omega$ --- область, $gamma: [a, b] times [c, d] --> Omega$ непрерывная, $omega$ --- локально точная форма в $Omega$. $f: [a, b] times [c, d] --> RR$ _превообразная $omega$ относительно отображения $gamma$_, если для любых $(t, u) in [a, b] times [c, d]$ сущесвует $U_(gamma(t, u))$ и первообразная $F$ в этой окрестности такая, что $f(tau, nu) = F(gamma(tau, nu))$ при $(tau, nu)$ близких к $(t, u)$.
]

#th[
  Первообразная относительно отображения сущесвует и единственна с точностью до константы.
]

#proof[
  - "Единственность": Получается аналогично первообразной вдоль пути.

  - "Существование": У каждой точки $gamma(t, u)$ есть окрестность, в которой задана какая-то первообразная $omega$. Эти окрестности --- покрытие компакта $gamma([a, b] times [c, d])$. Возьмем для этого покрытия $r > 0$ из леммы Лебега. $gamma$ --- равномерно непрерывна, сущесвует $delta > 0$, такая, что если $rho((t, u), (t', u')) < eps$, то $rho(gamma(t, u), gamma(t', u')) < r$.

    Нарежем прямоугольник $[a, b] times [c, d]$ на равные прямоугольники, у которых диагональ меньше, чем $delta$. Образ каждого прямоугольника лежит в шарике радиуса $r$, потому что мы так выбрали размер диагонали. Значит, он лежит в каком-то элементе покрытия. 

    #TODO[картиночка]
    
    Пусть $gamma([t_(i - 1), t_i] times [u_(j - 1), u_j]) in U_(i j)$, где $U_(i j)$ --- элементы покрытия. $F_(i j)$ --- первообразная в $U_(i j)$. Рассмотрим строчку от $u_0$ до $u_1$ (смотри картинку, которая здесь точно появится). $t_1 (t, u) = F_(1 1) (gamma(t, u))$ при $(t, u) in [t_0, t_1] times [u_0, u_1]$. $F_(1 1)$ и $F_(2 1)$ --- первообразная в этом пересечении, значит, они отличаются на константу. Подправим $F_(2 1)$ так, чтобы константа была нулевой. Тогда $t_1 (t, u) = F_(2 1) (gamma(t, u))$ при $(t, u) in [t_1, t_2] times [u_0, u_1]$. Склеим $f_1$ --- "первообразную первой строчки", продолжим для каждой строчки.

    Теперь мы имеем $gamma_(u_1) (t) := gamma(t, u_1)$, и $f_1 bar_([a, b] times {u_1})$ и $f_2 bar_([a, b] times {u_2})$ --- первообразные вдоль пути $gamma_(u_1)$. Значит, они отличаются на константу. Подправим $f_2$ так, чтобы константа была нулевой. Продолжаем и склеиваем. Надо только показать, что все будет нормально на границах прямоугольников, аккуратно разобрав окрестности точек от туда.
]

#th[
  $omega$ --- локально точная в $Omega$. $gamma_0$, $gamma_1$ --- гомотопные пути с неподвижными концами. Тогда $integral_(gamma_0) omega = integral_(gamma_1) omega$.
]

#proof[
  Пусть $gamma: [a, b] times [0, 1] --> Omega$ --- гомотопия, $f$ --- первообразная относительно $gamma$. Тогда $ integral_(gamma_0) omega = f(b, 0) - f(a, 0) and integral_(gamma_1) omega = f(b, 1) - f(a, 1). $

  Мы докажем, что $f(b, 0) = f(b, 1)$ и $f(a, 0) = f(a, 1)$. Проверим, что $f(a, u)$ --- локально постоянная функция. Берем $(a, u)$. Найдется $U_(gamma(a, u))$ и $F$ --- первообразная $omega$ в $U_(gamma(a, u))$ такая, что $f(tau, nu) = F(gamma(tau, nu))$ при $(tau, nu)$ близких к $(a, u)$, и $f(a, nu) = F(gamma(a, nu)) = F(gamma_0 (a))$.
]

#th[
  $omega$ --- локально точная форма в $Omega$, $gamma_0$ --- стягиваемый путь. Тогда $integral_(gamma_0) omega = 0$.
]

#proof[
  $gamma: [a, b] times [0, 1] --> Omega$ --- гомотопия. $f$ --- первообразная относильно $gamma$. Тогда $integral_(gamma_0) = f(b, 0) - f(a, 0)$ и $0 = integral_(gamma_1) = f(b, 1) - f(a, 1)$. Проверим, что $f(b, u) - f(a, u)$ локально постоянна.

  Возьмем точку $(a, u)$ и окрестность $U_(gamma(a, u))$ и $F$ --- первообразная $omega$ в $U_(gamma(a, u))$, такие, что $f(tau, nu) = F(gamma(tau, nu))$ при $(tau, nu)$ близких к $(a, u)$. Найдется $U_(gamma(b, u)) = U_(gamma(a, u))$, и $tilde(F)$ --- первообразная $omega$ в $U_(gamma(b, u))$, такие, что $f(tau, nu) = tilde(F) (gamma(tau, nu))$ при $(tau, nu)$ близких к $(b, u)$. Имеем, $f(b, nu) - f(a, nu) = tilde(F) (gamma(b, nu)) - F (gamma(a, nu)) = tilde(F) (gamma(a, nu)) - F(gamma(a, nu))$ --- это константа, так как разность двух первообразных в одной и той же точке.
]

#notice[
  Только что мы доказали, что $RR without {(0, 0)}$ --- не односвязна.
]

#th[
  $Omega$ --- односвязная область. $omega$ --- локально точная форма в $Omega$. Тогда $omega$ --- точная форма в $Omega$.
]

#proof[
  По предыдущей теоремы, интеграл от любой локально точной формы $omega$ по любому замкнутому пути $gamma$ нулевой, а по теореме о существовании первообразной, у $omega$ есть первообразная.
]

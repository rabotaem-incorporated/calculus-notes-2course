#import "../../utils/core.typ": *

== Замкнутые и точные дифференциальные формы

#def(label: "def-closed-exact-form")[
  $omega$ --- форма#rf("def-differential-form") в области $Omega$#rf("def-region").
  1. $omega$ --- _точная_, если у нее есть первообразная#rf("def-form-antiderivative") в $Omega$.
  2. $omega$ --- _локально точная_, если $forall a in Omega space exists U_a$, такая, что у $omega$ в $U_a$ есть первообразная.
  3. $omega$ --- _замкнутая_, если $(diff f_k)/(diff x_i) = (diff f_i)/(diff x_k) space forall i, k$. 
]

#notice[
  Интеграл от точной#rf("def-closed-exact-form") формы по кривой зависит лишь от ее концов#rf("form-antiderivative-props").
]

#th(label: "locally-exact-closed")[
  Если коэффициенты у формы из $C^1$, то из локальной точности#rf("def-closed-exact-form") следует замкнутось#rf("def-closed-exact-form").
]

#proof[
  Возьмем $a in Omega$ и $F$ --- первообразную#rf("def-form-antiderivative") $omega$ в $U_a$. Тогда
  $ (diff F)/(diff x_k) =^rf("def-form-antiderivative") f_k ==> (diff f_k)/(diff x_j) = diff/(diff x_j) (diff F)/(diff x_k) = diff/(diff x_k) (diff F)/(diff x_j) = (diff f_j)/(diff x_k). $
]

#lemma(name: "Пуанкаре", label: "poincare")[
  $Omega$ --- выпуклая область. Коэффициенты формы $omega$ из $C^1$. Тогда из замкнутости следует точность#rf("def-closed-exact-form").
]

#proof[
  Доказательство будет только для $n = 2$. Достаточно проверить, что $integral_gamma omega = 0$ для любой $gamma$ --- замкнутой, несамопересекающейся кривой (можно и ломанной). Пусть $Gamma$ такова, что $gamma = diff Gamma$.
  
  $
    integral_gamma omega =
    integral_gamma P dif x + Q dif y =^rf("green")
    integral_(Gamma) ((diff Q)/(diff x) - (diff P)/(diff y)) dif lambda_2 = 0.
  $
  Чтобы внутри $gamma$ можно было применять формулу Грина#rf("green"), нужно, чтобы $Gamma subset Omega$, то есть чтобы в $Omega$ не было "дырок". Поэтому мы требуем выпуклость $Omega$.
]

#follow(label: "closed-is-locally-exact")[
  Если коэффициенты $omega$ из $C^1$, то из замкнутости следует локальная точность, то есть для таких форм замкнутость = локальная точность.
]

#proof[
  Рассмотрим каждую точку $a$ области $Omega$. Берем $U_a in Omega$. $U_a$ --- выпуклаsя. Из леммы Пуанкаре#rf("poincare"), а $U_a$ есть первообразная#rf("def-form-antiderivative"). Это и есть локальная точность#rf("def-closed-exact-form").
]

#notice[
  В лемме выпуклость существенна. 
  
  $Omega = RR^2 without {(0, 0)}$, а $omega = (x dif y - y dif x) / (x^2 + y^2)$, $P = - y / (x^2 + y^2)$, $Q = x / (x^2 + y^2)$
  
  Тогда $(diff P)/(diff y) = - ((x^2 + y^2) - 2 y^2)/(x^2 + y^2)^2 = (y^2 - x^2)/(x^2 + y^2)^2 = (diff Q)/(diff x)$. Значит замкнутость есть.
  Проинтегрируем по единичной окружности $gamma$. $integral_gamma omega = integral_0^(2 pi) (cos t (sin t)' - sin t (cos t)') dif t = integral_0^(2 pi) dif t = 2 pi != 0$.
]

#def(label: "def-antiderivative-along-path")[
  $gamma: [a, b] --> Omega$ путь, $omega$ --- локально точная форма#rf("def-closed-exact-form") в $Omega$. $f: [a, b] --> RR$ назовем _первообразной $omega$ вдоль пути_, если для любой точки $t in [a, b]$, у $gamma(t)$ существует окрестность $U_(gamma(t))$ и первообразная $F$ в $U_(gamma(t))$ такая, что $f(tau) = F (gamma (tau))$ при $tau$ близких к $t$.

  #figure(
    cetz.canvas({
      import cetz.draw: *
      group({
        line((0, 0), (5, 0), mark: (start: "|", end: "|"), name: "gamma")
        content((rel: (-0.2, 0), to: "gamma.left"), $a$)
        content((rel: (0.2, 0), to: "gamma.right"), $b$)
        line(
          (1.5, 0), (3, 0), 
          stroke: blue + 3pt,
          mark: (start: "|", end: "|", size: 0.3),
          name: "segment")
        circle("segment.center", fill: blue, stroke: none, radius: 0.1)
        content((rel: (0, -0.5), to: "segment.top"), $t$)
      }, name: "segment")
      group({
        translate((8, -1))
        catmull(
          (2, 0), (4, 0), (5, 2),
          (4, 3), (0, 1), close: true
        )
        place-anchors(
          name: "gamma",
          bezier-through(
            (1.5, 1), (3, 2), (4, 1.5),
            mark: (start: "|", end: "|"),
          ),
          (name: "a", pos: 0),
          (name: "t0", pos: 0.3),
          (name: "t", pos: 0.45),
          (name: "t1", pos: 0.6),
          (name: "b", pos: 1),
        )
        content((rel: (-0.5, 0), to: "gamma.a"), $gamma(a)$)
        content((rel: (0.4, 0.2), to: "gamma.b"), $gamma(b)$)
        bezier-through(
          "gamma.t0", "gamma.t", "gamma.t1",
          stroke: blue + 3pt,
          mark: (start: "|", end: "|"),
        )
        circle("gamma.t", radius: 0.4, stroke: (paint: blue, dash: "dashed"), name: "Ua")
        content((rel: (0, -0.3), to: "Ua.top"), $U_gamma(t)$)
      }, name: "mapped")
      line((6, 0), (7, 0), mark: (end: ">"), name: "mapping")
      content((to: "mapping", rel: (0, 0.3)), $gamma$)
    })
  )
]

#lemma(label: "locally-const-const")[
  $g: [a, b] --> RR$ --- локально постоянная функция (то есть у каждой точки есть окресность, в которой она постоянна). Тогда $g(x) = const$.
]

#proof[
  Если в окрестности каждой точки функция константа, то ее производная в любой точке равна $0$, а раз $g' equiv 0$, то $g equiv const$.
]

#th(label: "antiderivative-along-path-exists")[
  Первообразная вдоль пути#rf("def-antiderivative-along-path") существует, и единственна с точностью до константы.
]

#proof[
  - "Единственность": Пусть $f_1, f_2: [a, b] --> RR$ --- первообразные вдоль пути $gamma$. Берем $t: [a, b]$. В $U_(gamma(t))$ есть первообразные $F_1$ и $F_2$ такие, что $f_i (tau) = F_i (gamma (tau))$ при $tau$ близких к $t$. Значит
    $ f_1 (tau) - f_2 (tau) = F_1 (gamma(tau)) - F_2 (gamma(tau)) = const $
    при $tau$ близких к $t$. По лемме#rf("locally-const-const"), они отличаются на константу.
  
  - "Существование": $gamma[a, b]$ покрыто окрестностями, в которых у формы есть первообразная#rf("def-form-antiderivative") (напомню, первообразная вдоль пути определена для локально точных форм#rf("def-antiderivative-along-path")#rf("def-closed-exact-form")). Так как носитель $gamma$ --- компакт, по лемме Лебега существует $r > 0$ такой, что $B_r (gamma(t))$ (на картинке зеленый) целиком содежится в каком-то элементе покрытия.

    #figure(cetz.canvas(length: 0.6cm, {
      import cetz.draw: *
      catmull((0, 0), (3, 2), (6, 6), (8, 1), (4, -2), close: true, tension: 0.5)
      place-anchors(
        name: "p",
        bezier-through((2, 0), (3, 0), (6, 5), stroke: red + 2pt),
        ..for i in range(21) { ((name: str(i), pos: i/20),) },
      )
      circle("p.0", radius: 0.15, stroke: none, fill: blue)
      circle("p.0", radius: 1.1, stroke: (paint: blue, dash: "dashed"))
      circle("p.3", radius: 0.15, stroke: none, fill: blue)
      circle("p.3", radius: 0.9, stroke: (paint: blue, dash: "dashed"))
      circle("p.9", radius: 0.15, stroke: none, fill: blue)
      circle("p.9", radius: 1.5, stroke: (paint: blue, dash: "dashed"))
      circle("p.14", radius: 0.15, stroke: none, fill: blue)
      circle("p.14", radius: 1.3, stroke: (paint: blue, dash: "dashed"))
      circle("p.16", radius: 0.15, stroke: none, fill: blue)
      circle("p.16", radius: 1.2, stroke: (paint: blue, dash: "dashed"))
      circle("p.18", radius: 0.15, stroke: none, fill: blue)
      circle("p.18", radius: 1.1, stroke: (paint: blue, dash: "dashed"))
      circle("p.20", radius: 0.15, stroke: none, fill: blue)
      circle("p.20", radius: 0.8, stroke: (paint: blue, dash: "dashed"))

      for i in range(1, 21, step: 2) {
        circle("p." + str(i), radius: 0.3, stroke: green + 1pt, fill: rgb(0, 200, 0, 20%))
      }
    }))

    $gamma$ --- непрерывна на компакте, значит равномерно непрерывна. Значит, сущесвует $delta > 0$ такая, что для любых $t$ и $t'$ таких, что $abs(t - t') < delta$, $rho(gamma(t), gamma(t')) < r$. Нарежем $[a, b]$ на равные отрезки длины меньше $delta$. Тогда $gamma[t_(i - 1), t_i] subset B_r (gamma (t_i)) subset U_i$, где $U_i$ --- соответсвующий элемент покрытия.

    Пусть $F_i$ --- первообразная формы $omega$ в $U_i$. Тогда $f(t) = F_(gamma(t))$ при $t in [t_0, t_1]$ (то есть на первом отрезке положим $f$ таковой). Знаем $gamma(t_1) subset U_1 sect U_2$. В этом пересечении есть две первообразные --- $F_1$ и $F_2$. Значит, там они отличаются на константу, по единственности. Подправим $F_2$ так, что константа будет нулевой. Тогда $f(t) = F_2 (gamma(t))$ при $t in [t_1, t_2]$. Повторяем.
]

#follow(label: "newton-leibniz+")[
  Пусть $f$ --- первообразная $omega$ вдоль пути#rf("def-antiderivative-along-path") $gamma: [a, b] --> Omega$. Тогда
  $ integral_gamma omega = f(b) - f(a). $
  Это обобщение формулы Ньютона-Лейбница.
]

#proof[
  $f(t) = F_i (gamma(t))$ при $t in [t_(i - 1), t_i]$. Тогда
  $
    integral_gamma omega =^rf("curve-integral-2-props", "curve-additive")
    sum_(i = 1)^n integral_(gamma bar_[t_(i - 1), t_i]) omega =^rf("curve-integral-2-from-antiderivative")
    sum_(i = 1)^n (F_i (gamma(t_i))) - F_i (gamma(t_(i - 1))).
  $
  Мы согласовывали первообразные в построении#rf("antiderivative-along-path-exists") так, что $F_i (gamma(t_(i - 1))) = F_(i - 1) (gamma(t_(i - 1)))$, поэтому вся сумма телескопическая. Значит
  $
    integral_gamma omega = F_n (gamma(b)) - F_1 (gamma(a)) = f(b) - f(a).
  $
]

#def(label: "def-pinned-homotopic-paths")[
  Пусть $Gamma$ --- область. $gamma_0, gamma_1: [a, b] --> Omega$ и $gamma_0 (a) = gamma_1 (a)$, $gamma_0 (b) = gamma_1 (b)$. $gamma_0$ и $gamma_1$ называются _гомотопными путями с неподвижными концами_, если существует $gamma: [a, b] times [0, 1] --> Omega$, непрерывная, такая, что 
  $
    forall t space cases(gamma_0 (t) = gamma (t, 0), gamma_1 (t) = gamma (t, 1)) #h(1cm) and #h(1cm)
    forall u space cases(gamma (a, u) = gamma_0 (a), gamma (b, u) = gamma_0 (b)).
  $

  Неформально, у нас есть две веревки, протянутые между гвоздями, и эти веревки гомотопны, если можно перетягивая одну превратить в другую. В этом нам могут помешать "столбы", ну, то есть дырки в $Omega$.

  #figure(
    cetz.canvas(length: 0.6cm, {
      let std-line = line
      import cetz.draw: *

      let no-fill = th_color.lighten(90%)
      let pfill = pattern(
        size: (3pt, 3pt),
        place(std-line(
          start: (0%, 0%), 
          end: (100%, 100%), 
          stroke: (paint: blue.lighten(70%), thickness: 0.5pt, cap: "square", join: "miter")
        ))
      )

      content((6.4, 0), text(blue, size: 2em, $Omega$))

      set-style(mark: (fill: blue), stroke: blue)
      catmull(
        (0, -2), (8, -1), (6, 4), (2, 3),
        close: true, fill: pfill,
      )
      
      catmull(
        (4, -0.5), (3, -0.5), (2, 0), (3, 0.5),
        close: true, fill: no-fill, stroke: green,
      )

      place-anchors(
        name: "gamma1",
        bezier-through((1, -1), (4, 3), (6, 2), stroke: red),
        (name: "0", pos: 0),
        (name: "c", pos: 0.5),
        (name: "1", pos: 1),
      )
      place-anchors(
        name: "gamma2",
        bezier-through((1, -1), (6, 3), (6, 2), stroke: purple),
        (name: "c", pos: 0.5),
      )
      place-anchors(
        name: "gamma3",
        bezier-through((1, -1), (4, -1), (6, 2), stroke: orange),
        (name: "c", pos: 0.5),
      )
      content((to: "gamma1.c", rel: (-0.1, 0.5)), text(red, $gamma_1$))
      content((to: "gamma2.c", rel: (-0.1, 0.5)), text(purple, $gamma_2$))
      content((to: "gamma3.c", rel: (0.1, -0.5)), text(orange, $gamma_3$))
      circle("gamma1.0", radius: 0.15, stroke: none, fill: red)
      circle("gamma1.1", radius: 0.15, stroke: none, fill: red)
    }),
    caption: [Здесть пути $gamma_1$ и $gamma_2$ являются гомотопными, а $gamma_1$ и $gamma_3$ нет.]
  )
]

#def(label: "def-closed-homotopic-paths")[
  Пусть $Gamma$ --- область. $gamma_0, gamma_1: [a, b] --> Omega$ и $gamma_0 (a) = gamma_0 (b)$, $gamma_1 (a) = gamma_1 (b)$.

  Назовем $gamma_0$, $gamma_1$ _гомотопными путями с замкнутыми концами_, если найдется $gamma: [a, b] times [0, 1] --> Omega$ непрерывная, такая, что
  $
    forall t space cases(gamma_0 (t) = gamma (t, 0), gamma_1 (t) = gamma (t, 1)) #h(1cm) and #h(1cm) forall u space gamma (a, u) = gamma (b, u).
  $

  То есть, теперь мы берем замкнутые веревки, и превращаем их друг в друга. В этом нам могут помешать столбы, или разное количество оборотов вокруг них.

  #TODO[картинка]
]

#def(label: "def-contracting-path")[
  Замкнутый путь --- _стягивающий_, если он гомотопен#rf("def-closed-homotopic-paths") одноточечному пути. Такие пути еще называют _нулевыми_.
]

#def(label: "def-simply-connected-region")[
  _Односвязная облать_ --- область, в которой любой замкнутый путь стягиваем.
]

#examples[
  - Выпуклая область

  - Звездная область, то есть когда есть выделенная точка, и для любой другой точки области, соединяющий их отрезок лежит в области (подойдет $gamma(t, u) = gamma_1 (t) dot u$, если выделенная точка --- нуль).

  - $RR^2 without {(0, 0)}$ *не односвязна*, доказательство далее.
]

#def(label: "antiderivative-relative-to-map")[
  $Omega$ --- область, $gamma: [a, b] times [c, d] --> Omega$ непрерывная, $omega$ --- локально точная форма#rf("def-closed-exact-form") в $Omega$. $f: [a, b] times [c, d] --> RR$ называется _превообразной $omega$ относительно отображения $gamma$_, если для любых $(t, u) in [a, b] times [c, d]$ сущесвует $U_(gamma(t, u))$ и первообразная $F$ в этой окрестности такая, что $f(tau, nu) = F(gamma(tau, nu))$ при $(tau, nu)$ близких к $(t, u)$.
]

#th(label: "antiderivative-relative-to-map-unique")[
  Первообразная относительно отображения сущесвует и единственна с точностью до константы.
]

#proof[
  - "Единственность": Получается аналогично первообразной вдоль пути.

  - "Существование": У каждой точки $gamma(t, u)$ есть окрестность, в которой задана какая-то первообразная $omega$. Эти окрестности --- покрытие компакта $gamma([a, b] times [c, d])$. Возьмем для этого покрытия $r > 0$ из леммы Лебега. $gamma$ --- равномерно непрерывна, сущесвует $delta > 0$, такая, что если $rho((t, u), (t', u')) < eps$, то $rho(gamma(t, u), gamma(t', u')) < r$.

    Нарежем прямоугольник $[a, b] times [c, d]$ на равные прямоугольники, у которых диагональ меньше, чем $delta$. Образ каждого прямоугольника лежит в шарике радиуса $r$, потому что мы так выбрали размер диагонали. Значит, он лежит в каком-то элементе покрытия. 

    #TODO[картиночка]
    
    Пусть $gamma([t_(i - 1), t_i] times [u_(j - 1), u_j]) in U_(i j)$, где $U_(i j)$ --- элементы покрытия. $F_(i j)$ --- первообразная в $U_(i j)$. Рассмотрим строчку от $u_0$ до $u_1$ (смотри картинку, которая здесь точно появится). $f_1 (t, u) = F_(1 1) (gamma(t, u))$ при $(t, u) in [t_0, t_1] times [u_0, u_1]$. $F_(1 1)$ и $F_(2 1)$ --- первообразная в этом пересечении, значит, они отличаются на константу. Подправим $F_(2 1)$ так, чтобы константа была нулевой. Тогда $f_1 (t, u) = F_(2 1) (gamma(t, u))$ при $(t, u) in [t_1, t_2] times [u_0, u_1]$. Склеим $f_1$ --- "первообразную первой строчки", продолжим для каждой строчки.

    Теперь мы имеем $gamma_(u_1) (t) := gamma(t, u_1)$, и $f_1 bar_([a, b] times {u_1})$ и $f_2 bar_([a, b] times {u_2})$ --- первообразные вдоль пути $gamma_(u_1)$. Значит, они отличаются на константу. Подправим $f_2$ так, чтобы константа была нулевой. Продолжаем и склеиваем. Надо только показать, что все будет нормально на границах прямоугольников, аккуратно разобрав окрестности точек от туда.
]

#th(label: "homotopic-paths-integrals-eq")[
  $omega$ --- локально точная в $Omega$. $gamma_0$, $gamma_1$ --- гомотопные пути с неподвижными концами#rf("def-pinned-homotopic-paths"). Тогда $integral_(gamma_0) omega = integral_(gamma_1) omega$.
]

#proof[
  Пусть $gamma: [a, b] times [0, 1] --> Omega$ --- гомотопия, а
  $f$ --- первообразная относительно $gamma$#rf("antiderivative-relative-to-map")#rf("antiderivative-relative-to-map-unique").
  
  Тогда $
    integral_(gamma_0) omega = f(b, 0) - f(a, 0)
    space "и" space
    integral_(gamma_1) omega = f(b, 1) - f(a, 1).
  $

  Мы докажем, что $f(b, 0) = f(b, 1)$ и $f(a, 0) = f(a, 1)$. Проверим, что $f(a, u)$ --- локально постоянная функция. Берем $(a, u)$. По определению первообразной относительно отображения#rf("antiderivative-relative-to-map"), найдется $U_(gamma(a, u))$ и $F$ --- первообразная $omega$ в $U_(gamma(a, u))$ такая, что $f(tau, nu) = F(gamma(tau, nu))$ при $(tau, nu)$ близких к $(a, u)$, и $f(a, nu) = F(gamma(a, nu)) = F(gamma_0 (a))$. По лемме#rf("locally-const-const"), $f(a, u)$ --- постоянная.
]

#th(label: "contracting-path-integral-zero")[
  $omega$ --- локально точная форма в $Omega$, $gamma_0$ --- стягиваемый путь#rf("def-contracting-path"). Тогда $integral_(gamma_0) omega = 0$.
]

#proof[
  $gamma: [a, b] times [0, 1] --> Omega$ --- гомотопия. $f$ --- первообразная относильно $gamma$. Тогда $integral_(gamma_0) = f(b, 0) - f(a, 0)$ и $0 = integral_(gamma_1) = f(b, 1) - f(a, 1)$. Проверим, что $f(b, u) - f(a, u)$ локально постоянна.

  Возьмем точку $(a, u)$ и окрестность $U_(gamma(a, u))$ и $F$ --- первообразная $omega$ в $U_(gamma(a, u))$, такие, что $f(tau, nu) = F(gamma(tau, nu))$ при $(tau, nu)$ близких к $(a, u)$. Найдется $U_(gamma(b, u)) = U_(gamma(a, u))$, и $tilde(F)$ --- первообразная $omega$ в $U_(gamma(b, u))$, такие, что $f(tau, nu) = tilde(F) (gamma(tau, nu))$ при $(tau, nu)$ близких к $(b, u)$. Имеем, $f(b, nu) - f(a, nu) = tilde(F) (gamma(b, nu)) - F (gamma(a, nu)) = tilde(F) (gamma(a, nu)) - F(gamma(a, nu))$ --- это константа, так как разность двух первообразных в одной и той же точке.
]

#notice[
  Только что мы доказали, что $RR without {(0, 0)}$ --- не односвязна.
]

#th(label: "locally-exact-is-exact-in-simply-connected")[
  $Omega$ --- односвязная область. $omega$ --- локально точная форма в $Omega$. Тогда $omega$ --- точная форма в $Omega$.
]

#proof[
  По предыдущей теореме#rf("contracting-path-integral-zero"), интеграл от любой локально точной формы $omega$ по любому замкнутому пути $gamma$ нулевой, а по теореме о существовании первообразной#rf("closed-curve-integral-2"), у $omega$ есть первообразная.
]

#import "../../utils/core.typ": *

== Голоморфные функции

#def(label: "def-hfn")[
  $Omega subset CC$, $f: Omega --> CC$, $z_0 in Omega$.

  $f$ называется _голоморфной_ в точке $z_0$, если существует предел (конечный --- в $CC$ других нет),
  $
    lim_(z -> z_0) (f(z) - f(z_0)) / (z - z_0) =: f'(z_0)
  $
]

#notice(label: "hfn-condition")[
  $f$ --- голоморфна в точке $z_0$ тогда и только тогда, когда существует $k in CC$ такая, что
  $ f(z) = f(z_0) + k (z - z_0) + o(z - z_0) $
  при $z -> z_0$.
]

#props(label: "hfn-props")[
  1. Сумма, разность и произведение функций голоморфных в точке $z_0$ также голоморфна в $z_0$.
  2. $f$ и $g$ голоморфны в $z_0$, $g(z_0) != 0$, значит $f / g$ голоморфна в $z_0$.
  3. Если $f$ голоморфна в $z_0$, а $g$ голоморфна в $f(z_0)$, то $g compose f$ голоморфна в $z_0$.
]
#proof[
  Доказывается ровно так же, как и для вещественных функций.
]

#notice(plural: true, label: "def-complex-linear-mat")[
  1. $f(x, y) := f(x + i y)$, $x, y in RR$, $f$ --- голоморфна#rf("def-hfn"). Тогда
    $ 
      (diff f)/(diff x) (x_0, y_0) &= lim_(h -> 0) (f(x_0 + h + i y_0) - f(x_0 + i y_0)) / h =^rf("def-hfn") f'(z_0), \
      (diff f)/(diff y) (x_0, y_0) &= i lim_(h -> 0) (f(x_0 + i h + i y_0) - f(x_0 + i y_0)) / (i h) =^rf("def-hfn") i f'(z_0).
    $
    Значит, если $f$ голоморфна в точке $z_0$, то $(diff f)/(diff y) (z_0) = i (diff f)/(diff x) (z_0)$.
  
  2. 
    $
      vec(Re f(x, y), Im f(x, y)) = vec(Re f(x_0, y_0), Im f(x_0, y_0)) + mat(a, b; c, d) vec(x - x_0, y - y_0) + o(norm(vec(x - x_0, y - y_0)))
    $
    Какое условие на $mat(a, b; c, d)$ дает голоморфность $f$?
    $
      f(x + i y) =^rf("hfn-condition") f(x_0 + i y_0) + (u + i v) ((x - x_0) + i (y - y_0)) + o(...)
    $
    Распишем,
    $
      (u + i v) ((x - x_0) + i (y - y_0)) = (u (x - x_0) - v (y - y_0)) + i dot (u (y - y_0) + v (x - x_0)),
    $
    и, чтобы вектор соответсвовал комплексному числу, необходимо,
    $
      mat(a, b; c, d) vec(x - x_0, y - y_0) = vec(a(x - x_0) + b(y - y_0), c(x - x_0) + d(y - y_0)) <==> mat(a, b; c, d) = mat(u, -v; v, u).
    $
    Назовем матрицы такого вида _комплексно-линейными_.

  3. Линейное отображение $CC --> CC$: $z maps lambda z = abs(lambda) e^(i phi) z$ --- композиция растяжения и поворота. Такое отображение называется _поворотной гомотетией_.
]

#denote(label: "def-complex-diff")[
  Заведем две дифференциальные формы#rf("def-differential-form"):
  $dif z = dif x + i dif y$, $dif cj(z) = dif x - i dif y$.
  Хотим
  $ dif f = (diff f)/(diff x) dif x + (diff f)/(diff y) dif y = (diff f)/(diff z) dif z + (diff f)/(diff cj(z)) dif cj(z). $
  Чтобы такое равенство выполнялось, необходимо и достаточно, чтобы
  $
    (diff f)/(diff z) dif x + i (diff f)/(diff z) dif y + (diff f)/(diff cj(z)) dif x - i (diff f)/(diff cj(z)) dif y = (diff f)/(diff x) dif x + (diff f)/(diff y) dif y <==> \
    <==> (diff f)/(diff z) := 1/2 ((diff f)/(diff x) - i (diff f)/(diff y)) #h(1cm) and #h(1cm) (diff f)/(diff cj(z)) := 1/2 ((diff f)/(diff x) + i (diff f)/(diff y))
  $
  Положим это определением $(diff f)/(diff z)$ и $(diff f)/(diff cj(z))$.
]

#th(name: "условие Коши-Римана", label: "cauchy-reimann-condition")[
  Пусть $f: Omega --> CC$. $z_0 in Omega subset CC$. $f$ дифференциируема в $z_0$ как функция из $RR^2$ в $RR^2$. Тогда следующие условия равносильны:

  1. $f$ голоморфна в $z_0$.
  
  2. $dif_(z_0) f$ комплексно линеен.
  
  3. $(diff f)/(diff cj(z))(z_0) = 0$.

  4. Выполняется условие Коши-Римана: $ cases((diff Re f)/(diff x) (z_0) = (diff Im f)/(diff y) (z_0), (diff Im f)/(diff x) (z_0) = - (diff Re f)/(diff y) (z_0)) $
]

#proof[
  - "$1 <=> 2$": очевидно#rf("def-complex-linear-mat").

  - "$2 <=> 4$": матрица $dif_(z_0) f$#rf("def-complex-linear-mat"):
    $
      mat((diff Re f)/(diff x), (diff Re f)/(diff y); (diff Im f)/(diff x), (diff Im f)/(diff y)),
    $
    а она комплексно линейна тогда и только тогда, когда выполняется условие Коши-Римана.
  - "$3 <=> 4$": 
    $
      (diff f)/(diff cj(z)) =^rf("def-complex-diff")
      1/2 ((diff f)/(diff x) + i (diff f)/(diff y)) = 0 <=>
      (diff Re f)/(diff x) + i (diff Im f)/(diff x) = (diff f)/(diff x) = - i (diff f)/(diff y) = -i ((diff Re f)/(diff y) + i (diff Im f)/(diff y)). $
]

#denote[
  $f in H(Omega)$ значит, что $f: Omega --> CC$ голоморфна во всех точках.
]

#follow(label: "hfn-real-const-const")[
  Если $f in H(Omega)$, и $Re f = const$, то $f = const$.
]

#proof[
  $
    cases(
      (diff Im f)/(diff x) =^rf("cauchy-reimann-condition") -(diff Re f)/(diff y) = 0, 
      (diff Im f)/(diff y) =^rf("cauchy-reimann-condition") (diff Re f)/(diff x) = 0
    ) ==> Im f = const.
  $
]

#th(name: "Коши", label: "hfn-locally-exact")[
  Если $f in H(Omega)$, то $f(z) dif z$ --- локально точная#rf("def-closed-exact-form").
]

#proof[
  *Первое докальательство*, для случая, когда $(diff f)/(diff x)$ и $(diff f)/(diff y)$ непрерывны. Знаем, что замкнутость и непрерывность частной производной влечет локальную точность#rf("closed-is-locally-exact"). Проверим замкнутость. 
  $ f(z) dif z = f(z) dif x + i f(z) dif y. $
  Надо проверить, что $(diff f)/(diff y) = (diff (i f))/(diff x) = i (diff f)/(diff x)$. Это верно из $(diff f)/(diff cj(z)) = 0$#rf("cauchy-reimann-condition").

  Но мы хотим проверить это в общем случае: оказывается, что непрерывность есть всегда автоматически. Поэтому не будем добавлять это в формулировку, и докажем в общем случае.

  #figure(cetz.canvas({
    import cetz.draw: *
    catmull(
      (0, 0), (5, 0), (7, 5), (0, 4),
      close: true, fill: rgb(20, 100, 255, 10%)
    )
    content((4, 4), text(blue, size: 3em, $Omega$))
    circle((2, 2), radius: 2, fill: rgb(20, 100, 255, 10%), stroke: blue)
    content((4, 0.5), text(blue, size: 2em, $U$))

    let (x1, x3) = (0.8, 3.3)
    let x2 = (x1 + x3) / 2
    rect((0.8, 1.3), (3.3, 3.1), name: "P")
    content((to: "P.north", rel: (0.5, 0.2)), $P$)

    let (y1, y3) = (1.3, 3.1)
    let y2 = (y1 + y3) / 2
    line((x1, y2), (x3, y2), stroke: (dash: "dashed"))
    line((x2, y1), (x2, y3), stroke: (dash: "dashed"))
    content((to: "P", rel: (0.5, 0.4)), $P'$)
    content((to: "P", rel: (0.5, -0.4)), $P''$)
    content((to: "P", rel: (-0.5, 0.4)), $P'''$)
    content((to: "P", rel: (-0.5, -0.4)), $P''''$)
  }))

  *Второе доказальство*, без ограничений на $f$. Возьмем круг $U subset Omega$. Надо доказать, что $integral_P omega = 0$ для любого прямоугольника $P$ из $U$. От противного. Пусть нашелся такой $P$, где $integral_P omega != 0$. Назовем этот интеграл $alpha(P)$. Разрежем его на 4 равные части, как на картинке. Тогда $ alpha(P) = alpha(P') + alpha(P'') + alpha(P''') + alpha(P''''), $ значит $ abs(alpha(P)) <= abs(alpha(P')) + abs(alpha(P'')) + abs(alpha(P''')) + abs(alpha(P'''')). $ Пусть $P_1$ такой из $P'$, $P''$, $P'''$, $P''''$, что $alpha(P_1) >= 1/4 abs(alpha(P))$. Аналогично построим последовательность прямоугольников $P supset P_1 supset P_2 supset ...$, $alpha(P_n) >= 1/(4^n) abs(alpha(P))$. Тогда по теореме о вложенных отрезках, найдется $z_0$ лежащая во всех прямоугольниках. $f$ --- голоморфна в $z_0$,
  $ f(z) = f(z_0) + f'(z_0) (z - z_0) + abs(z - z_0) dot beta(z - z_0), $
  где $lim_(z->z_0) beta(z - z_0) = 0$. Тогда
  $ abs(alpha(P_n)) = abs(integral_(P_n) f(z) dif z) = abs(integral_(P_n) f(z_0) dif z + integral_(P_n) f'(z_0) (z - z_0) dif z + integral_(P_n) abs(z - z_0) beta(z - z_0) dif z). $
  Первый интеграл --- интеграл константы по замкнутому контуру, то есть $0$, второй тоже 0, если сослаться на первое доказательство. Значит,
  $
    4^n abs(alpha(P_n)) =
    4^n abs(integral_(P_n) abs(z - z_0) beta(z - z_0) dif z) <=^rf("curve-integral-2-props", "norm-bound")
    4^n "периметр" P_n dot max abs(z - z_0) beta(z - z_0) <= \ <= 4^n "периметр"^2 P_n dot max_(z in P_n) abs(beta(z - z_0)) = "периметр"^2 P dot max_(z in P_n) abs(beta(z - z_0)) --> 0.
  $
  Противоречие.
]

#follow(plural: true)[
  1. Если $f in H(Omega)$ и $gamma$ --- стягиваемый#rf("def-contracting-path") в $Omega$ замкнутый путь, то $integral_gamma f(z) dif z = 0$.
  
  2. Если $f in H(Omega)$, $z_0 in Omega$, то у $z_0$ есть окрестность $U_(z_0)$ и функция $F in H(Omega)$ такая, что $F' = f$ в $U_(z_0)$.
]

#proof[
  1. Очевидно#rf("contracting-path-integral-zero").

  2. $f(z) dif z$ локально точная, значит существует#rf("def-closed-exact-form") $U_(z_0)$ и $F: U_(z_0) --> CC$ --- первообразная формы#rf("def-form-antiderivative") $f(z) dif z$. Тогда
    $
      f(z) dif z = f(z) dif x + i f(z) dif y ==> (diff F)/(diff x) = f and (diff F)/(diff y) = i f.
    $
    То есть $(diff F)/(diff x) = i (diff F)/(diff y)$, значит#rf("cauchy-reimann-condition") первообразная голоморфна в окрестности, и $F' = (diff F)/(diff x) = f$.
]

#notice(label: "form-antiderivative-hfn-antiderivative")[
  Первообразная формы, и первообразная функции в данном случае --- одно и то же, то есть $F$ --- первообразная формы $f(z) dif z$ тогда и только тогда, когда $F' = f$.
]

#th(name: "модификация теоремы Коши", label: "hfn-locally-exact+")[
  Пусть $Delta$ --- прямая, паралелльная какой-то оси координат. $f in C(Omega)$ и $f in H(Omega without Delta)$. Форма $f(z) dif z$ все равно локально точная в $Omega$.
]

#proof[
  Проверим, что у каждой точки из $Omega$ есть окрестность, такая, что $integral_P f(z) dif z = 0$ для любого прямоугольника $P$ со сторонами параллельными осям, и прямоугольника из этой окрестности.

  Если точка не лежит в $Delta$, то проведем рассуждения также, как в доказательстве теореме Коши. Интересен только случай, когда точка лежит на $Delta$.

  Если $P$ не пересекает $Delta$, то все как в предыдущей теореме. Иначе, разрежем прямоугольник по $Delta$, как на картинке. Остался случай, когда одна из сторон прямоугольника лежит в $Delta$.

  #figure(grid(
    columns: 2,
    cetz.canvas(length: 0.8cm, {
      import cetz.draw: *

      catmull(
        (0, 0), (5, 0), (7, 5), (0, 4),
        close: true, fill: rgb(20, 100, 255, 10%)
      )
      content((4, 4), text(blue, size: 3em, $Omega$))
      circle((2, 2), radius: 2, fill: rgb(20, 100, 255, 10%), stroke: blue)

      line((-1, 2), (8, 2), name: "delta")
      content((to: "delta.end", rel: (0.0, 0.3)), $Delta$)

      set-style(mark: (fill: red), stroke: red)

      merge-path(
        name: "path",
        {
          line((1.3, 2.0), (1.3, 3.1))
          line((1.3, 3.1), (3.3, 3.1))
          line((3.3, 3.1), (3.3, 2.0))
          line((3.3, 2.0), (1.3, 2.0))
        }, 
        close: true,
      )
      for i in range(10) {
        let anc = (name: "path", anchor: i * 10% + 6%)
        let anc2 = (name: "path", anchor: i * 10% + 7%)
        mark(anc, anc2, symbol: "<", scale: 0.6)
      }

      set-style(mark: (fill: orange), stroke: orange)
      merge-path(
        name: "path2",
        {
          line((1.3, 4 - 2.0), (1.3, 4 - 3.3))
          line((1.3, 4 - 3.3), (3.3, 4 - 3.3))
          line((3.3, 4 - 3.3), (3.3, 4 - 2.0))
          line((3.3, 4 - 2.0), (1.3, 4 - 2.0))
        }, 
        close: true,
      )
      for i in range(10) {
        let anc = (name: "path2", anchor: i * 10% + 4%)
        let anc2 = (name: "path2", anchor: i * 10% + 5%)
        mark(anc, anc2, symbol: ">", scale: 0.6)
      }
    }),

    cetz.canvas(length: 0.8cm, {
      import cetz.draw: *

      line((-1, 0), (8, 0), name: "delta")
      content((to: "delta.end", rel: (0.0, 0.3)), $Delta$)

      set-style(mark: (fill: red), stroke: red)

      merge-path(
        name: "path",
        {
          line((1, 0), (7, 0))
          line((7, 0), (7, 5))
          line((7, 5), (1, 5))
          line((1, 5), (1, 0))
        }, 
        close: true
      )
      
      for i in range(20) {
        let anc = (name: "path", anchor: i * 5% + 1%)
        let anc2 = (name: "path", anchor: i * 5% + 2%)
        mark(anc, anc2, symbol: "<", scale: 0.6)
      }

      set-style(mark: (fill: black))
      line(name: "line", (1, 1), (7, 1), stroke: (dash: "dashed", paint: black))
      for i in range(7) {
        let anc = (name: "line", anchor: (i / 7) * 100% + 6%)
        let anc2 = (name: "line", anchor: (i / 7) * 100% + 7%)
        mark(anc, anc2, symbol: "<", scale: 0.6)
      }

      line((2, 0), (2, 1), mark: (start: ">", end: ">"), stroke:black)
      content((2.3, 0.5), $eps$)
      rect(stroke: none, (1, 1), (7, 5), fill: rgb(200, 0, 0, 10%), name: "P1")
      content("P1", text(red, size: 2em, $P_eps$))
      content((1, -0.3), $a$)
      content((7, -0.3), $b$)
    }),
  ))

  Отойдем от $Delta$ на $eps$, "отодвинув" сторону $P$ от нее. Получится прямоугольник $P_eps$. Мы знаем, что $integral_(P_eps) f(z) dif z = 0$. На сколько будут отличаться интегралы?
  $
    integral_P f(z) dif z - integral_(P_eps) f(z) dif z = integral_[b, b + i eps] f(z) dif z + integral_[a + i eps, a] f(z) dif z + integral_[a, b] (f(z) - f(z + i eps)) dif z ==> \
    abs(integral_P f(z) dif z - integral_(P_eps) f(z) dif z) <= abs(integral_[b, b + i eps] f(z) dif z) + abs(integral_[a + i eps, a] f(z) dif z) + abs(integral_[a, b] (f(z) - f(z + i eps)) dif z)
  $

  Так как $f in C(Omega)$, существует $M$ такая, что $abs(f(z)) <= M$ для любого $z$ в прямоугольнике $P$ (на компакте).

  Тогда
  $
    abs(integral_[b, b + i eps] f(z) dif z) <= M eps, 
    abs(integral_[a, a + i eps] f(z) dif z) <= M eps, 
    \
    abs(integral_[a, b] (f(z) - f(z + i eps)) dif z) <=^rf("curve-integral-2-props", "norm-bound") (b - a) max_(z in [a, b]) abs(f(z) - f(z + i eps))
  $
  Что делать с последней штукой? $f$ --- равномерно непрерывна как непрерывная на компакте, значит $ forall delta space exists eps > 0 space abs(omega - omega') <= eps ==> abs(f(omega) - f(omega')) < delta $
  Значит, можно сделать сколь угодно маленькую $delta$, и
  $
    abs(integral_[a, b] (f(z) - f(z + i eps)) dif z) <= (b - a) max_(z in [a, b]) abs(f(z) - f(z + i eps)) < delta (b - a).
  $
]

#follow(label: "hfn-locally-exact++")[
  $f in C(Omega)$ и $f$ голоморфна в $Omega$ за исключением конечного количества точек. Тогда $f(z) dif z$ локально точная в $Omega$.
]

#proof[
  Если в $z_0$ есть голоморфность, то есть окрестность, в которой есть голоморфность, и можно просто сослаться на теорему Коши#rf("hfn-locally-exact"). Если в $z_0$ нет голоморфности, то возьмем маленький кружочек, который не задевает остальные точки, и удаляем из него прямую, содержащую точку. По модифицированной теореме#rf("hfn-locally-exact+"), получили локальную точность.
]

#def(label: "def-curve-index")[
  Пусть $gamma$ --- замкнутая кривая, не проходящая через $0$ (начало координат#footnote[для димы написал]). Пусть $r(t)$ и $phi(t)$ --- ее параметризация в полярных координатах. Пусть $r, phi: [a, b] --> RR$, и $r > 0$.

  _Индекс кривой (пути) относительно точки_ $ Ind(gamma, 0) := (phi(b) - phi(a)) / (2 pi). $

  Это целое число --- количество оборотов прямой около нуля, против часовой стрелки.

  #figure(
    image("../../images/curve-index.svg", width: 10cm),
    caption: [Если я умею считать индекс этой кривой --- 0.]
  )

  Индекс в точках, отличных от нуля, определяется аналогично.
]

#notice[
  Индекс можно посчитать, рассмотрев какой-нибудь луч из точки, и посчитав, сколько раз этот луч пересекается с прямой, и в каких направлениях. Если луч $n$ раз пересекает прямую, идущую против часовой стрелки, и $m$ раз --- по часовой стрелке, то индекс прямой равен $n - m$.

  #figure(
    image("../../images/index-through-intersection.svg", width: 10cm),
    caption: [Вроде и правда умею.]
  )

  Доказательство трудное, нужно возиться, мы не будем.
]

#th(label: "index-through-integral")[
  $gamma$ --- замкнутая кривая, не проходящая через $0$. Тогда $ integral_gamma (dif z)/z = 2 pi i dot Ind(gamma, 0)^rf("def-curve-index"). $
]

#proof[
  Берем параметризацию $gamma$ в полярных координатах, $z(t) = r(t) e^(i phi(t))$. Распишем дифференциал через параметризацию: $ dif z = (r'(t) e^(i phi(t)) + r(t) i phi' e^(i phi(t))) dif t, $
  и интегрируем по ней:
  $
    integral_gamma (dif z)/z =
    integral_a^b (r'(t) e^(i phi(t)) + r(t) i phi'(t) e^(i phi(t)))/(r(t) e^(i phi(t))) dif t newline(=)
    integral_a^b ((r'(t))/(r(t)) + i phi'(t)) dif t =
    underbrace(ln r(b) - ln r(a), 0) + i (phi(b) - phi(a)) =
    2 pi i dot Ind(gamma, 0).
  $
  $r(b) = r(a)$, так как кривая замкнутая. Индекс возникает по определению#rf("def-curve-index").
]

#th(name: "Интегральная формула Коши", label: "cauchy-integral")[
  $f in H(Omega)$, $a in Omega$, $gamma$ --- стягиваемый в $Omega$ путь#rf("def-contracting-path"), $gamma$ не проходит через $a$. Тогда $ integral_gamma (f(z))/(z - a) dif z = 2pi i f(a) Ind(gamma, a) $
]

#proof[
  $ g(z) := cases(
    (f(z) - f(a))/(z - a) "при" z != a,
    f'(a) "при" z = a 
  ) $
  Такая $g in C(Omega)$ и $g in H(Omega without {a})$. По следствию из теоремы выше про локальную точность голоморфной функции без конечного числа точек#rf("hfn-locally-exact++"), $g$ --- локально точная, и $integral_gamma g(z) dif z = 0$#rf("contracting-path-integral-zero").
  Тогда
  $
    0 =^rf("contracting-path-integral-zero")
    integral_gamma g(z) dif z =
    integral_gamma (f(z))/(z -a) dif z - integral_gamma f(a)/(z - a) dif z newline(=)
    integral_gamma (f(z))/(z -a) dif z - f(a) integral_gamma (dif z)/(z - a) =^rf("index-through-integral")
    integral_gamma (f(z))/(z -a) dif z - 2pi i f(a) Ind(gamma, a).
  $
]

#th(label: "hfn-analytical")[
  $f$ --- голоморфна в круге ${abs(z) < R}$. Тогда $f$ --- аналитична в этом круге.
]

#proof[
  Рассмотрим $abs(z) < r_1 < r < R$. По интегральной формуле Коши#rf("cauchy-integral") для $gamma$ --- окружность радиуса $r$,
  $
    f(z) = 1/(2 pi i) integral_({abs(zeta) = r}) (f(zeta))/(zeta - z) dif zeta.
  $
  Разложим $1/(zeta - z)$ в ряд:
  $
    1 / (zeta - z) = 1/(zeta) dot 1/(1 - z / zeta) = 1/zeta sum_(n = 0)^oo (z^n)/(zeta^n) = sum_(n = 0)^oo (z^n)/(zeta^(n + 1)).
  $
  Так можно делать, так как $abs(z / zeta) < r_1 / r < 1$.
  Значит,
  $
    f(z) = 1/(2 pi i) integral_({abs(zeta) = r}) sum_(n = 0)^oo f(zeta)/(zeta^(n + 1)) dot z^n dif zeta.
  $
  Поменяем местами интеграл и сумму:
  $
    f(z) = 1/(2 pi i) integral_({abs(zeta) = r}) sum_(n = 0)^oo f(zeta)/(zeta^(n + 1)) dot z^n dif zeta = sum_(n = 0)^oo z^n dot underbrace(1/(2 pi i) integral_({abs(zeta) = r}) f(zeta)/(zeta^(n + 1)) dif zeta, =: a_n) = sum_(n = 0)^oo a_n z^n.
  $
  Почему так можно делать? Промажорируем,
  $
    (f(zeta) z^n) / zeta^(n + 1) <= M/r dot ((r_1)/r)^n.
  $
  Значит, есть равномерная сходимость.
]

#follow(plural: true, label: "hfn-analytical-props")[
  1. #sublabel("coeff-formula") Есть формула для коэффициентов:
    $
      a_n = 1/(2 pi i) integral_({abs(zeta) = r}) f(zeta)/(zeta^(n + 1)) dif zeta.
    $
  2. #sublabel("hfn-analytical") $f: Omega --> CC$. $f in H(Omega) <==> f "аналитична в" Omega$.

  3. #sublabel("hfn-infinitely-differentiable") $f in H(Omega) ==> f "бесконечно дифференцируема"$.

  4. #sublabel("derivative-hfn") $f in H(Omega) ==> f' in H(Omega)$.
]

#proof[
  1. Достается из доказательства.

  2. "$==>$": берем $B_R (a) in Omega$, по теореме $f(z)$ раксладывается в ряд в этом круге.

  3. Следует из аналитичности.

  4. Аналитичность + 2)
]

#def(label: "def-harmonic")[
  $f: Omega --> RR$, $Omega subset RR^n$. $f$ --- гармоническая, если
  $
    (diff^2 f)/(diff x_1^2) + (diff^2 f)/(diff x_2^2) + ... + (diff^2 f)/(diff x_n^2) = 0.
  $

  Если $Omega subset CC$, то $
    (diff^2 f)/(diff x^2) + (diff^2 f)/(diff y^2) = 0.
  $
]

#follow(name: "продолжение", plural: true, label: "hfn-re-im-harmonic")[
  5. $f in H(Omega)$, значит $Re f$ и $Im f$ --- гармонические.
]

#proof[
  5. $ (diff^2 Re f)/(diff x^2) = (diff)/(diff x) ((diff Re f)/(diff x)) = (diff)/(diff x) ((diff Im f)/(diff y)) = (diff)/(diff y) ((diff Im f)/(diff x)) = (diff)/(diff y) (-(diff Re f)/(diff y)) = -(diff^2 Re f)/(diff y^2). $
]

#notice[
  На односзвяной области $Omega$, если $P$ --- гармоническая#rf("def-harmonic"), то $exists Q$ --- гармоническая#rf("def-harmonic"), такая, что $P + i Q$ --- голоморфная, и $Q$ --- единственная с точностью до прибавления константы.
]

#proof[
  Мы хотим, чтобы выполнялось условие Коши-Римана для $P + i Q$#rf("cauchy-reimann-condition"):
  $
    cases(
      (diff P)/(diff x) = (diff Q)/(diff y),
      (diff P)/(diff y) = -(diff Q)/(diff x),
    ).
  $
  Рассмотрим следующую дифференициальную форму:
  $
    -(diff P)/(diff y) dif x + (diff P)/(diff x) dif y. 
  $
  Она замкнута, так как
  $
    diff/(diff y) (-(diff P)/(diff y)) = -(diff^2 P)/(diff y^2) = (diff^2 P)/(diff x^2) = diff/(diff x) ((diff P)/(diff x)).
  $
  По лемме Пуанкаре#rf("poincare"), из замкнутости следует локальная точность, а по теореме о локально точной форме на односвязной области#rf("locally-exact-is-exact-in-simply-connected"), она точная.

  Значит у нее есть первооборазная, назовем ее $Q$. По построению, $P + i Q$ --- голоморфна. Наконец, $Q$ гармонична#rf("def-harmonic"), так как
  $
    (diff^2 Q)/(diff x^2) + (diff^2 Q)/(diff y^2) =
    diff/(diff x) (diff Q)/(diff x) + diff/(diff y) (diff Q)/(diff y) = -diff/(diff x) (diff P)/(diff y) + diff/(diff y) (diff P)/(diff x) = -(diff^2 P)/(diff x diff y) + (diff^2 P)/(diff y diff x) =^rf("def-harmonic") 0.
  $
]

#th(name: "Морера", label: "morera")[
  $f(z) in C(Omega), space f(z) dif z$ локально точная. Тогда $f in H(Omega)$.
]

#proof[
  $f(z) dif z$ --- локально точная, значит, у нее локально есть первообразная у каждой точки. Если есть первообразная у формы, то это значит, что выполняются условия Коши-Римана, а тогда из непрерывности $f = F'$ следует #rf("cauchy-reimann-condition") голоморфность $F$, а из нее, в совою очередь #rf("hfn-analytical-props", "derivative-hfn"), голоморфность $f$.
]

#follow(label: "hfn-without-line-hfn")[
  $f in C(Omega)$ и $f$ голоморфна в $Omega without Delta$ (где $Delta$ --- прямая, паралелльная оси), или в $Omega$ за исключением конечного числа точек. Тогда $f in H(Omega)$.
]

#proof[
  Условие говорит о том, что $f(z) dif z$ локально точна#rf("hfn-locally-exact+")#rf("hfn-locally-exact++"), и можно применить теорему Морера#rf("morera").
]

#th(label: "hfn-conditions")[
  Собираем все вместе.

  $f: Omega --> CC$. Следующие условия равносильны:
  1. $f in H(Omega)$.
  2. $f$ аналитична в $Omega$.
  3. $f$ бесконечно дифференцируема в $Omega$.
  4. $f$ локально имеет первообразную.
  5. Форма $f(z) dif z$ локально точная.
  6. Форма $f(z) dif z$ замкнута, и частные производные $f$ непрерывны, $f in C(Omega)$.
  7. Интеграл по любому достаточно малому прямоугольнику (у любой точки есть окрестность, в которой все прямоугольники такие), со сторонами паралелльными осям, равен $0$, $f in C(Omega)$.
]

#proof[
  - "$1 ==> 5$": теорема Коши#rf("hfn-locally-exact").
  - "$5 ==> 1$": теорема Морера#rf("morera").
  - "$1 ==> 2$": теорема про аналитичность#rf("hfn-analytical").
  - "$2 ==> 3$": очевидно.
  - "$3 ==> 1$": очевидно.
  - "$4 <==> 5$": первообразная формы $f(z) dif z$ и функции $f$ --- одно и то же#rf("form-antiderivative-hfn-antiderivative").
  - "$6 ==> 7$": формула Грина#rf("green") + свойство Коши-Римана под интегралом#rf("cauchy-reimann-condition").
  - "$7 ==> 5$": критерий точности#rf("closed-curve-integral-2").
  - "$5 + 3 ==> 6$": коэффициенты формы непрерывны#rf("locally-exact-closed").
]

#th(name: "Неравенство Коши", label: "cauchy-inequality")[
  $f$ --- голоморфна в круге ${abs(z) < R}$, $f(z) = sum_(n = 0)^oo a_n z^n$. Тогда 
  $
    abs(a_n) <= M_r / r^n, "где" 0 < r < R " и " M_r := max_(abs(z) = r) abs(f(z)).
  $
]

#proof[
  $
    abs(a_n) =^rf("hfn-analytical-props", "coeff-formula")
    abs(1 / (2pi i) integral_(abs(z) = r) f(z)/(z^(n + 1)) dif z) <=
    1/cancel(2 pi) dot max_(abs(z) = r) abs(f(z)/(z^(n + 1))) dot cancel(2 pi) r =
    (r dot max_(abs(z) = r) abs(f(z))) / r^(n + 1) = M_r / r^n.
  $
]

#def(label: "whole-fn")[
  $f$ --- _целая_ функция, если $f in H(CC)$. Это всегда степенные ряды, у которых радиус сходимости равен бесконечности.
]

#examples[
  $exp$, $sin$, $cos$, $CC[x]$, ...
]

#th(name: "Лиувилля", label: "liouville")[
  Если $f in H(CC)$ и ограниченная, то $f = const$.
]

#proof[
  $f(z) = sum_(n = 0)^oo a_n z^n$. Пусть $abs(f(z)) <= M$ для любого $z in CC$. Тогда $ abs(a_n) <=^rf("cauchy-inequality") M_r/r^n <= M/r^n -->_(r -> +oo) 0 ==> a_n = 0. $
]

#th(name: "Основная теорема алгебры", label: "fundamental-theorem-of-algebra")[
  Любой многочлен $P$ степени $deg P >= 1$ имеет корень в $CC$.
]
#proof[
  Предположим противное. Пусть $P(z) != 0$ для любого $z in CC$. Тогда $f(z) := 1/P(z) in H(CC)$. Если мы проверим, что она ограничена, мы получим противоречие, так как тогда $f$ --- константа.

  Запишем многочлен в приведенном виде: $P(z) = z^n + a_(n - 1) z^(n - 1) + ... + a_1 z + a_0$. Пусть $R := 1 + abs(a_(n - 1)) + ... + abs(a_1) + abs(a_0)$. $f$ непрерывна в ${abs(z) <= R}$, значит $f$ --- ограничена в этом круге. Проверим, что $f$ ограничена в ${abs(z) >= R}$. Оценим снизу $P$:
  $
    abs(P(z)) = abs(sum_(k = 0)^n a_k z^k) >= abs(z^n) - sum_(k = 0)^(n - 1) abs(a_k) dot abs(z)^k.
  $
  Так как $R >= 1$, то $abs(z) >= 1$, поэтому
  $
    abs(P(z)) >= abs(z^n) - sum_(k = 0)^(n - 1) abs(a_k) dot abs(z)^k >= abs(z)^n - abs(z)^(n - 1) dot underbrace(sum_(k = 0)^(n - 1) abs(a_k), R - 1) = underbrace(abs(z)^(n - 1), >= 1) dot underbrace((abs(z) - (R - 1)), >= 1) >= 1.
  $
  По теореме Лиувилля#rf("liouville"), $f equiv const$, значит $P equiv const$. Противоречие.
]

#follow[
  Если $P$ --- многочлен степени $n$, то $P(z) = c dot (z - z_1) dot (z - z_2) dot ... dot (z - z_n)$.
]

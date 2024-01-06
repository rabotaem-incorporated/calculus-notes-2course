#import "../../utils/core.typ": *

== Криволинейные интегралы

#remind(label: "def-path")[
  Путь --- отображение $gamma: [a, b] -> RR^n$ непрерывное.

  Пути эквивалентны ($gamma tilde tilde(gamma)$, где $gamma: [a, b] --> RR^n$ и $tilde(gamma): [c, d] --> RR^n$) когда существует непрерывная строго возрастающая биекция $tau: [a, b] -> [c, d]$ такая, что $gamma = tilde(gamma) compose tau$.

  Кривая --- класс эквивалентности путей.

  Параметрицация кривой --- конкретный представитель класса.
]

#def(label: "def-curve-integral-1")[
  _Криволинейный интеграл первого рода функции $f$ по гладкой кривой $s$#rf("def-path")_ (иди _интеграл по длине дуги_):
  $
    integral_gamma f dif s := integral_a^b f(gamma(t)) norm(gamma'(t)) dif t,
  $
  где $gamma$ --- какая-то параметризация#rf("def-path") $s$.

  Напомню, что норма производной равна $sqrt((gamma'_1 (t))^2 + ... + (gamma'_n (t))^2)$.
]

#props(label: "curve-integral-1-props")[
  1. #sublabel("param-indep")
    Не зависит от параметризации.
  2. #sublabel("dir-indep")
    Не зависит от направления.
  3. #sublabel("length")
    $integral_gamma dif s = l(gamma)$ --- формула длины гладкой кривой.
  4. #sublabel("linear")
    Линейность $integral_gamma (alpha f + beta g) dif s = alpha integral_gamma f dif s + beta integral_gamma f dif s$
  5. #sublabel("curve-additive")
    Аддитивность по кривой: $gamma: [a, b] --> RR^n$ и $gamma_1 := gamma bar_[a, c]$, $gamma_2 := gamma bar_[c, b]$. Тогда $integral_gamma f dif s = integral_(gamma_1) f dif s + integral_(gamma_2) f dif s$.
  6. #sublabel("inequality")
    Неравенство сохраняется: если $f <= g$ на $gamma[a, b]$ (носитель кривой), то $integral_gamma f dif s <= integral_gamma g dif s$.
  7. #sublabel("abs-bound")
    $abs(integral_gamma) <= integral_gamma abs(f) dif s$.
]

#proof[
  1. Пусть $gamma = tilde(gamma) compose tau$.
  
    $
      integral_tilde(gamma) t dif s =^rf("def-curve-integral-1")
      integral_c^d f(tilde(gamma)(t)) norm(tilde(gamma)'(t)) dif t =^(t = tau(u))
      integral_a^b f(tilde(gamma)(tau(u))) norm(tilde(gamma)'(tau(u))) dot underbrace(tau'(u), >0) dif u 
      newline(=)
      integral_a^b f underbrace(
        (tilde(gamma)(tau(u))),
        tilde(gamma) compose tau = gamma
      ) 
      underbrace(norm(tau'(u) dot tilde(gamma)'(tau(u))), norm(gamma')) dif u =
      integral_a^b f(gamma(u)) norm(gamma') dif u =^rf("def-curve-integral-1")
      integral_gamma f dif s.
    $
  
  2. То же самое.

  3. Ну да, это и правда формула длины гладкой кривой#rf("curve-length").

  4.
    $ 
      integral_gamma (alpha f + beta g) dif s =^rf("def-curve-integral-1")
      integral_a^b (alpha f(gamma(t)) + beta g(gamma(t))) norm(gamma'(t)) dif t =^(rf("sfn-props", "linear") rf("def-curve-integral-1"))
      alpha integral_gamma f dif s + beta integral_gamma f dif s.
    $

  5. Аналогично, надо расписать по определению#rf("def-curve-integral-1").

  6. Опять аналогично. Так как нормы неотрицательные, неравентсва сохраняются.

  7. $-abs(f) <= f <= abs(f)$ и 6#rf("curve-integral-1-props", "inequality").
]

#exercise[
  Интегральная сумма: если есть отрезок $[a, b]$ нарезанный каким-то дроблением в точках $a = t_0, t_1, t_2, ..., t_m = b$ и имеется оснащение $xi_1 in [t_0, t_1], xi_2 in [t_1, t_2], ..., xi_m in [t_(m - 1), t_m]$, то
  $
    integral_gamma f dif s = lim sum_(k = 1)^m f(gamma(xi_k)) dot l(gamma bar_[t_(k - 1), t_k]),
  $
  где $gamma$ --- гладкая кривая (конечной длины), а предел при мелкости дробления стремящейся к нулю.
]

#def(label: "def-differential-form")[
  _Дифференциальной формой первого порядка_ называется формальная конструкция
  $
    omega := f_1 dif x_1 + f_2 dif x_2 + ... + f_n dif x_n,
  $
  где $f_1, ..., f_n$ --- функции от $n$ переменных.

  Далее мы будем интересоваться только дифференциальными формами первого порядка, поэтому порядок упоминать мы не будем.
]

#def(label: "def-curve-integral-2")[
  _Криволинейным интегралом второго рода_ (или _интегралом от дифференциальной формы_) называется
  $
    integral_gamma omega := integral_a^b sum_(k = 1)^n f_k (gamma(t)) gamma'_k (t) dif t.
  $
]

#let vf = $arrow(f)$
#let vsigma = $arrow(sigma)$

#props(label: "curve-integral-2-props")[
  1. #sublabel("indep-param") Не зависит от параметризации.
  2. #sublabel("sign-dir") Меняет знак при изменении направления.
  3. #sublabel("tangent") Если $arrow(f) = (f_1, f_2, ..., f_n)$ и $arrow(sigma)(t)$ --- единичный касательный вектор к кривой в точке $gamma(t)$, то $integral_gamma omega = integral_gamma dotp(arrow(f), arrow(sigma)) dif s$.
  4. #sublabel("curve-additive") Аддитивность по кривой: если $gamma_1 = gamma |_[a, c]$, $gamma_2 = gamma |_[c, b]$, то $integral_gamma omega = integral_(gamma_1) omega + integral_(gamma_2) omega$.
  5. #sublabel("linear") Линейность по форме: если $alpha_1, alpha_2 in RR$, $omega_1, omega_2$ --- дифф. формы, то $integral_gamma (alpha_1 omega_1 + alpha_2 omega_2) = alpha_1 integral_gamma omega_1 + alpha_2 integral_gamma omega_2$.
  6. #sublabel("norm-bound") $abs(integral_gamma omega) <= integral_gamma norm(vf) dif s <= l(gamma) dot max_(gamma[a, b]) norm(vf)$.
]

#proof[
  1. Пусть $gamma = tilde(gamma) compose tau$.
    $
      integral_tilde(gamma) omega =^rf("def-curve-integral-2")
      integral_c^d sum_(k = 1)^n f_k (tilde(gamma)(t)) tilde(gamma)'_k (t) dif t newline(=^(t = tau(u)))
      integral_a^b sum_(k = 1)^n f_k (tilde(gamma)(tau(u))) tilde(gamma)'_k (tau(u)) tau'(u) dif u =^rf("def-curve-integral-2")
      integral_a^b sum_(k = 1)^n f_k (gamma(u)) gamma'_k (u) dif u.
    $
  
  2. Аналогично.

  3. $gamma'(t)$ --- касательный вектор в точке $gamma(t)$, $arrow(sigma)(t) = (gamma'(t)) / norm(gamma'(t))$.
    $
      integral_gamma dotp(vf, vsigma) dif s =
      integral_a^b sum_(k = 1)^n f_k (gamma(t)) dot (gamma'_k (t))/norm(gamma'(t)) dot norm(gamma'(t)) dif t =^rf("def-curve-integral-2")
      integral_gamma omega.
    $
  
  4. Тривиально получается по определению#rf("def-curve-integral-2").

  5. Очевидно получается по определению#rf("def-curve-integral-2").

  6. 
    Первое неравенство:
    $
      abs(integral_gamma omega) =^rf("curve-integral-2-props", "tangent")
      abs(integral_gamma dotp(vf, vsigma) dif s) <=
      integral_gamma abs(dotp(vf, vsigma)) dif s <=
      integral_gamma norm(vf) dot underbrace(norm(vsigma), 1) dif s =
      integral_gamma norm(vf) dif s. 
    $
    Второе неравентсво:
    $
      integral_gamma norm(vf) dif s <= integral_gamma max_(gamma[a, b]) norm(vf) dif s = 
      max_(gamma[a, b]) norm(vf) dot integral_gamma dif s =^rf("curve-integral-1-props", "length")
      max_(gamma[a, b]) norm(vf) dot l(gamma).
    $
]

#exercise[
  Доказать, что 
  $ integral_gamma omega = lim sum_(j = 1)^m sum_(k = 1)^n f_k (gamma(xi_j)) (gamma_k (t_j) - gamma_k (t_(j - 1))), $
  где $a = t_0 < t_1 < ... < t_m = b$ --- разбиение $[a, b]$, $xi_j in [t_(j - 1), t_j]$ --- оснащение, в пределе у последовательности разбиений мелкость дробления стремиться к нулю.
]

#notice[
  Пусть $F: Omega --> RR$, $Omega subset RR^n$.
  Рассмотрим $dif_x F$ --- дифференциал (линейное отображение из $RR^n$ в $RR$).
  Тогда $F(x + h) = F(x) + dif_x F(h) + o(h)$, при $h --> 0$. Возьмем $g_i (x) = x_i$.
  Тогда 
  $
    underbrace(g_i (x + h), x_i + h_i) =
    underbrace(g_i (x), x_i) + underbrace(dif_x g_i (h), h_i) + o(h).
  $
  Такое отображение $dif_x g_i (h)$ обозначают $dif x_i$.
  Более того, все $dif x_i$ линейно независимы,
  поэтому $dif x_i$ --- базис в пространстве линейных отображений из $RR^n$ в $RR$.
  Разложим вектор $dif_x F$ в этом базисе:
  $
    dif_x F (h) =
    (diff F)/(diff x_1) dif x_1 (h) + (diff F)/(diff x_2) dif x_2 (h) + ... + (diff F)/(diff x_n) dif x_n (h).
  $

  Что такое дифференциальная форма#rf("def-differential-form") в $Omega$? Вообще говоря, просто формальная конструкция, но раз в каждой точке $Omega$ есть свое линейное отображение $RR^n --> RR$, то
  $ omega = f_1 dif x_1 + f_2 dif x_2 + ... + f_n dif x_n, $
  где $f_j$ --- коэффициенты при разложении по базису.

  Примерно так можно понимать дифференциальные формы.
]

#def(label: "def-region")[
  $Omega$ --- _область_, если $Omega$ открыто и линейно связно (то есть между любыми двумя точками можно провести путь в $Omega$, которых их соединяет).
]

#def(label: "def-form-antiderivative")[
  В $Omega subset RR^n$ задана форма#rf("def-differential-form") $omega$.
  $F: Omega --> RR$ --- _первообразная формы_ $omega$,
  если $dif F = omega$,
  то есть $f_k = (diff F) / (diff x_k)$.
]

#th(label: "curve-integral-2-from-antiderivative")[
  Пусть $F$ --- первообразная#rf("def-form-antiderivative") формы#rf("def-differential-form") $omega$ заданной в $Omega$#rf("def-region"), а $gamma$ --- кривая в $Omega$, соединяющая точки $a$ и $b$. Тогда криволинейный интеграл от дифференциальной формы считается как
  $ integral_gamma omega = F(b) - F(a). $
]

#proof[
  Пусть $gamma: [alpha, beta] --> Omega$.
  $
    integral_gamma omega =^rf("def-curve-integral-2")
    integral_alpha^beta sum_(k = 1)^n f_k (gamma(t)) gamma'_k (t) dif t =^rf("def-form-antiderivative")
    integral_alpha^beta sum_(k = 1)^n (diff F)/(diff x_k) (gamma(t)) (gamma'_k (t)) dif t newline(=)
    integral_alpha^beta (F compose gamma)' (t) dif t =
    F(gamma(beta)) - F(gamma(alpha)) =
    F(b) - f(a).
  $
]

#follow(plural: true, label: "form-antiderivative-props")[
  1. Если у формы $omega$ есть первообразная#rf("def-form-antiderivative"), то $integral_gamma omega$ зависит только от концов кривой, и не зависит от самой кривой.
  2. Если $omega$ --- область#rf("def-region"), то все первообразные#rf("def-form-antiderivative") отличаются друг от друга на константу.
]

#proof[
  1. Очевидно из теоремы#rf("curve-integral-2-from-antiderivative").
  2. Пусть $F$ и $tilde(F)$ --- первообразные#rf("def-form-antiderivative") в $Omega$#rf("def-region"). Зафиксируем $a$, будем менять $b$. Для каждой пары точек рассмотрим на путь из $a$ в $b$. Тогда 
    $ integral_gamma omega = F(b) - F(a) = tilde(F)(b) - tilde(F)(a) ==> tilde(F)(b) = F(b) + underbrace((tilde(F)(a) - F(a)), const). $
]

#lemma(label: "broken-line-from-curve")[
  $Omega$ --- область#rf("def-region"). Тогда между любыми двумя точками из $Omega$, можно провести несамопересекающуюся ломаную, такую, что все ее звенья параллельны осям координат.
]

#proof[
  Рассмотрим#rf("def-region") кривую, которая соединяет $a$ и $b$. Для каждой точки на кривой, заведем шарик $B_(r(t)) (gamma(t)) in Omega$. Тогда носитель кривой $gamma[a, b]$ покрывается этими шариками. Так как носитель --- компакт, покроем его конечным количеством шариков. 
  
  #figure(cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    catmull((0, 0), (3, 2), (6, 6), (8, 1), (4, -2), close: true, tension: 0.5)
    place-anchors(
      name: "p",
      bezier-through((2, 0), (3, 0), (6, 5), stroke: red + 2pt),
      ..for i in range(21) { ((name: str(i), pos: i/20),) },
    )
    circle("p.0", radius: 0.15, stroke: none, fill: blue)
    circle("p.0", radius: 1, stroke: (paint: blue, dash: "dashed"))
    circle("p.3", radius: 0.15, stroke: none, fill: blue)
    circle("p.3", radius: 0.7, stroke: (paint: blue, dash: "dashed"))
    circle("p.9", radius: 0.15, stroke: none, fill: blue)
    circle("p.9", radius: 1.1, stroke: (paint: blue, dash: "dashed"))
    circle("p.14", radius: 0.15, stroke: none, fill: blue)
    circle("p.14", radius: 1, stroke: (paint: blue, dash: "dashed"))
    circle("p.16", radius: 0.15, stroke: none, fill: blue)
    circle("p.16", radius: 0.7, stroke: (paint: blue, dash: "dashed"))
    circle("p.18", radius: 0.15, stroke: none, fill: blue)
    circle("p.18", radius: 1.1, stroke: (paint: blue, dash: "dashed"))
    circle("p.20", radius: 0.15, stroke: none, fill: blue)
    circle("p.20", radius: 0.7, stroke: (paint: blue, dash: "dashed"))
  }))

  Занумеруем шарики, и пойдем последовательно от первого шарика до последнего. Мы можем так сделать: в рамках каждого шарика будем идти до точки на пересечении границы и следующего шарика. Ломаная может получиться самопересекающиейся, но из нее можно убрать все петли. Короче, доделывается, зуб даю.
  #figure(cetz.canvas(length: 1cm, {
    import cetz.draw: *
    catmull((0, 0), (3, 2), (6, 6), (8, 1), (4, -2), close: true, tension: 0.5)
    place-anchors(
      name: "p",
      bezier-through((2, 0), (3, 0), (6, 5), stroke: red + 2pt),
      ..for i in range(21) { ((name: str(i), pos: i/20),) },
    )
    line(
      ..for i in range(20, step: 2) {
        ("p." + str(i), (horizontal: (), vertical: "p." + str(i + 2)))
      }, "p.20", 
      stroke: green + 3pt)
    circle("p.0", radius: 0.15, stroke: none, fill: blue)
    circle("p.0", radius: 1, stroke: (paint: blue, dash: "dashed"))
    circle("p.3", radius: 0.15, stroke: none, fill: blue)
    circle("p.3", radius: 0.7, stroke: (paint: blue, dash: "dashed"))
    circle("p.9", radius: 0.15, stroke: none, fill: blue)
    circle("p.9", radius: 1.1, stroke: (paint: blue, dash: "dashed"))
    circle("p.14", radius: 0.15, stroke: none, fill: blue)
    circle("p.14", radius: 1, stroke: (paint: blue, dash: "dashed"))
    circle("p.16", radius: 0.15, stroke: none, fill: blue)
    circle("p.16", radius: 0.7, stroke: (paint: blue, dash: "dashed"))
    circle("p.18", radius: 0.15, stroke: none, fill: blue)
    circle("p.18", radius: 1.1, stroke: (paint: blue, dash: "dashed"))
    circle("p.20", radius: 0.15, stroke: none, fill: blue)
    circle("p.20", radius: 0.7, stroke: (paint: blue, dash: "dashed"))
  }))
]

#th(label: "closed-curve-integral-2")[
  Пусть $Omega$ --- область#rf("def-region"), $omega$ --- форма#rf("def-differential-form") в $Omega$. Коэффициенты формы $f_1, f_2, ..., f_n: Omega --> RR$ непрерывны.

  Тогда следующие условия равносильны:
  1. $omega$ имеет первообразную#rf("def-form-antiderivative").
  2. $integral_gamma omega = 0$, для любой замкнутой кривой $gamma$.
  3. $integral_gamma omega = 0$, для любой замкнутой несамопересекающейся ломаной, все звенья которой параллельны осям координат.
]

#proof[
  - "$1 ==> 2$": очевидно по предыдущей теореме#rf("curve-integral-2-from-antiderivative").
  - "$2 ==> 3$": вообще очев: если для любой кривой, то для ломаной тем более.
  - "$3 ==> 1$": зафиксируем $a in Omega$ и $forall x in Omega$ проведем из $a$ в $x$ ломаную $gamma$ со звеньями параллельными осям.
    Она есть по лемме#rf("broken-line-from-curve").
    Рассмотрим $F(x) := integral_gamma omega$.
    Этот интеграл не зависит от выбора $gamma$,
    так как если к одной кривой добавить в конец вторую перевернутую, получится ломаная из $a$ в $a$.
    Она, может быть, самопересекается. Давайте немного подвигаем отрезки так, чтобы точек пересечения было не более чем счетно (какие-то отрезки могут совпасть). Тогда по $3)$, значение интеграла не изменится, и если порезать ее точками пересечения,
    получаться интегралы по замкнутым несамопересекающемся ломаным, которые, по $3)$, равны 0.
    Ну значит интегралы тоже равны.
    
    #figure(
      cetz.canvas(length: 0.6cm, {
        import cetz.draw: *
        catmull((0, 0), (3, 2), (6, 6), (8, 1), (4, -2), close: true, tension: 0.5)
        place-anchors(
          name: "p",
          bezier-through((2, 0), (3, 0), (6, 5), stroke: red + 2pt),
          ..for i in range(21) { ((name: str(i), pos: i/20),) },
        )

        line(
          ..for i in range(20, step: 5) {
            ("p." + str(i), (horizontal: (), vertical: "p." + str(i + 5)))
          }, "p.20", 
          mark: (end: ">"),
          stroke: green + 2pt
        )

        line(
          ..for i in range(20, step: 4) {
            ("p." + str(i), (vertical: (), horizontal: "p." + str(i + 4)))
          }, "p.20",
          mark: (start: ">"),
          stroke: blue + 2pt
        )
      }))

    Проверим, что $F$ подходит: не умаляя общности, проверим первую координату.
    $
      (diff F)/(diff x_1) (x) =
      lim_(t -> 0) (F(x_1 + t, x_2, ..., x_n) - F(x_1, ..., x_n)) / t =^rf("curve-integral-2-from-antiderivative")
      lim_(t -> 0) 1/t integral_[x, (x_1 + t, ..., x_n)] omega.
    $
    Рассмотрим интеграл:
    $
      integral_[x, (x_1 + t, ..., x_n)] omega = integral_0^t sum_(k = 1)^n f_k (gamma(tau)) underbrace(gamma'_k (tau), [k = 1]) dif tau = integral_0^t f_1(x_1 + tau, x_2, ..., x_n) dif tau.
    $
    Здесь $gamma$ --- параметризация $(x_1 + tau, x_2, ..., x_n)$.
    Значит,
    $
      (diff F)/(diff x_1) (x) =
      lim_(t -> 0) 1/t integral_0^t f_1(x_1 + tau, x_2, ..., x_n) dif tau =^rf("barrow")
      f_1 (x).
    $
]

#let pfill = pattern(
  size: (3pt, 3pt),
  place(line(
    start: (0%, 0%), 
    end: (100%, 100%), 
    stroke: (paint: blue, thickness: 0.5pt, cap: "square", join: "miter")
  ))
)

#def(label: "def-primitive-region")[
  $Omega subset RR^2$ --- элементарная область#rf("def-region"), если $Omega$ можно представить в виде $ Omega &= {(x, y) : a < x < b and phi(x) < y < psi(x)} \ &= {(x, y): c < y < d and alpha(y) < x < beta(y)}. $

  #grid(columns: (1fr, 1fr, 1fr), figure(
    supplement: none,
    caption: [Удовлетворяет первому условию],
    cetz.canvas(length: 0.9cm, {
      import cetz.draw: *
      line((-0.5, 0), (5.5, 0), mark: (end: ">"))
      content((rel: (0.2, 0)), $x$)
      line((0, -0.5), (0, 5.5), mark: (end: ">"))
      content((rel: (0, 0.3)), $y$)

      line((1, 5.5), (1, -0.5), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.2, 0.3)), $a$)
      line((4, 5.5), (4, -0.5), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.2, 0.3)), $b$)
      merge-path({
        line((1, 0.5), (1, 4))
        bezier-through((1, 4), (2, 3), (3, 5))
        bezier-through((3, 5), (3.5, 4.5), (4, 3))
        line((4, 3), (4, 1))
        bezier-through((4, 1), (3, 2), (1, 0.5))
      }, stroke: blue + 2pt, fill: pfill, close: true)
    })
  ), figure(
    supplement: none,
    caption: [Удовлетворяет второму условию],
    cetz.canvas(length: 0.9cm, {
      let std-line = line
      import cetz.draw: *
      line((-0.5, 0), (5.5, 0), mark: (end: ">"))
      content((rel: (0.2, 0)), $x$)
      line((0, -0.5), (0, 5.5), mark: (end: ">"))
      content((rel: (0, 0.3)), $y$)

      line((5.5, 1), (-0.5, 1), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.3, 0.2)), $c$)
      line((5.5, 4), (-0.5, 4), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.3, 0.2)), $d$)
      merge-path({
        line((1, 1), (5, 1))
        bezier-through((5, 1), (3, 3), (4, 4))
        line((4, 4), (0.5, 4))
        bezier-through((0.5, 4), (0.5, 2), (1, 1))
      }, stroke: blue + 2pt, fill: pfill, close: true)
    })
  ),figure(
    supplement: none,
    caption: [Удовлетворяет обоим условиям],
    cetz.canvas(length: 0.9cm, {
      let std-line = line
      import cetz.draw: *
      line((-0.5, 0), (5.5, 0), mark: (end: ">"))
      content((rel: (0.2, 0)), $x$)
      line((0, -0.5), (0, 5.5), mark: (end: ">"))
      content((rel: (0, 0.3)), $y$)

      line((1, 5.5), (1, -0.5), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.2, 0.3)), $a$)
      line((4, 5.5), (4, -0.5), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.2, 0.3)), $b$)
      line((5.5, 1), (-0.5, 1), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.3, 0.2)), $c$)
      line((5.5, 4), (-0.5, 4), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.3, 0.2)), $d$)
      merge-path({
        line((1, 1), (4, 1))
        bezier-through((4, 1), (3, 1.5), (2.5, 2.5))
        bezier-through((2.5, 2.5), (2, 3), (1.5, 4))
        line((1.5, 4), (1, 4))
        line((1, 4), (1, 1))
      }, stroke: blue + 2pt, fill: pfill, close: true)
    })
  ))
]

#th(name: "формула Грина", label: "green")[
  $Omega subset RR^2$ --- ограниченая на плоскости область#rf("def-region"), граница которой представляет собой конечное объединение непересекующихся простых кусочно-гладких замкнутых кривых. $P, Q: Cl Omega --> RR$ --- непрерывные, такие, что $(diff P)/(diff y)$ и $(diff Q)/(diff x)$ непрерывны на $Cl Omega$. Тогда
  $ integral_Omega ((diff Q)/(diff x) - (diff P)/(diff y)) dif lambda_2 = integral_(diff Omega) (P dif x + Q dif y), $
  где $diff Omega$ --- границы, причем направления кривых выбраны так, что область интегрирования всегда лежит слева от границы:

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
          stroke: (paint: blue, thickness: 0.5pt, cap: "square", join: "miter")
        ))
      )

      content((4.4, 0), text(blue, size: 2em, $Omega$))

      set-style(mark: (fill: blue), stroke: blue)
      place-marks(
        catmull(
          (0, -2), (8, -1), (6, 4), (2, 3), 
          close: true, fill: pfill,
        ),
        ..for i in range(7) {
          ((mark: ">", size: 0.2, pos: i / 7), )
        }
      )
      
      set-style(mark: (fill: green), stroke: green)
      place-marks(
        catmull(
          (1, -1), (3, 0), (3.5, -1), (2, -2),
          close: true, fill: no-fill
        ),
        ..for i in range(5) {
          ((mark: ">", size: 0.2, pos: i / 5), )
        }
      )

      place-marks(
        catmull(
          (4, 2), (3, 1), (2, 2), (3, 3),
          close: true, fill: no-fill
        ),
        ..for i in range(7) {
          ((mark: ">", size: 0.2, pos: i / 7), )
        }
      )
      
      place-marks(
        catmull(
          (5, 2.5), (6, 0), (6.6, 1.5), (5.5, 3),
          close: true, fill: no-fill
        ),
        ..for i in range(7) {
          ((mark: ">", size: 0.2, pos: i / 7), )
        }
      )
    })
  )
  
]

#proof[
  Надо доказать две формулы:
  $ integral_Omega (diff Q) / (diff x) dif lambda_2 = integral_(dif Omega) Q dif y quad "и" quad integral_Omega (diff P) / (diff y) dif lambda_2 = - integral_(diff Omega) P dif x. $
  Мы докажем вторую, первая аналогична. 

  *Шаг 1: $Omega$ --- элементарная область#rf("def-primitive-region")*.
  $ integral_Omega (diff P)/(diff y) dif lambda_2 = integral_a^b integral_(phi(x))^(psi(x)) (diff P)/(diff y) (x, y) dif y dif x = integral_a^b (P(x, psi(x)) - P(x, phi(x))) dif x. $
  С другой стороны, $integral_(diff Omega) P dif x$ равен сумме интегралов по четырем границам элементарной области (сверху, снизу, справа, слева):
  $ integral_(diff Omega) P dif x = integral_"I" + integral_"II" + integral_"III" + integral_"IV". $
  
  #figure[
    #cetz.canvas({
      import cetz.draw: *

      line((1, 3.5), (1, 0), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.2, 0.3)), $a$)
      line((4, 3.5), (4, 0), stroke: (paint: gray, dash: "dashed"))
      content((rel: (0.2, 0.3)), $b$)

      merge-path({
        line((1, 0.5), (1, 3))
        bezier-through((1, 3), (2, 3.2), (4, 3))
        line((4, 3), (4, 1))
        bezier-through((4, 1), (3, 0.6), (1, 0.5))
      }, stroke: blue + 2pt, fill: pfill, close: true)
    
      content((2.5, 0.35))[I]
      content((4.3, 2))[II]
      content((2.5, 3.4))[III]
      content((0.7, 1.75))[IV]
      content((4.3, 1), $phi$)
      content((4.3, 3), $psi$)
    })
  ]

  Правый интеграл равен $integral_"II" = integral_phi(b)^psi(b) P(gamma(t)) gamma'_1 (t) dif t = 0$, так как производная равна 0. Аналогично интеграл слева $integral_"IV" = 0$. Снизу интеграл равен $integral_"I" = integral_a^b P(t, phi(t)) dif t$, а сверху $integral_"III" = integral_b^a P(t, psi(t)) dif t$, а в сумме они дают $integral_a^b P(t, phi(t)) dif t - integral_a^b P(t, psi(t)) dif t$. Получили что хотели, даже знаки получились разными.

  *Шаг 2*. Если область $Omega$ по кривой $gamma$ разрезали на $Omega_1$ и $Omega_2$, и формула была верна в $Omega_1$ и $Omega_2$, то она была верна и в $Omega$.
    $ -integral_(diff Omega_i) P dif x = integral_(Omega_i) (diff P)/(diff y) dif lambda_2 ==> -integral_(diff Omega) P dif x = -integral_(diff Omega_1 union diff Omega_2) P dif x = integral_(Omega_1 union Omega_2) (diff P)/(diff y) dif lambda_2 = integral_Omega (diff P)/(diff y) dif lambda_2. $

  #figure[
    #cetz.canvas({
      import cetz.draw: *
      place-marks(
        place-anchors(name: "Omega", catmull((0, 0), (2, -0.5), (3, 0.5), (4, 0), (5, 1.5), (4, 3), (2, 2.5), close: true), (name: "a", pos: 0.25), (name: "b", pos: 0.7, fill: black)),
        fill: black,
        ..for i in range(7) {
          ((mark: ">", size: 0.2, pos: i / 7), )
        }
      )
      place-marks(
        place-anchors(bezier("Omega.a", "Omega.b", (1.0, 1.5)), name: "gamma", pos: 0.5),
        stroke: green, fill: green,
        ..for i in range(3) {
          (
            (mark: "<", size: 0.2, pos: i / 3 + 2/9),
          )
        }
      )
      
      place-marks(
        bezier("Omega.a", "Omega.b", (1.0, 1.5), stroke: none),
        stroke: blue, fill: blue,
        ..for i in range(3) {
          (
            (mark: ">", size: 0.2, pos: i / 3 + 1/9),
          )
        }
      )
      content((rel: (-0.2, 0), to: "gamma"), $gamma$)
      content((1.5, .5), text(blue, 2em, $Omega_1$))
      content((3.5, 1.7), text(green, 2em, $Omega_2$))
    })
  ]

  *Шаг 3*. Формула верна для конечного объединения элементраных областей. Это индукция.

  *Шаг 4*. Любая область из формулировки так получается. Проверять не будем. В любом случае на практике интегралы так представляются точно.
]

#follow(label: "region-measure-through-green")[
  $ lambda_2 Omega = -integral_(diff Omega) y dif x = integral_(diff Omega) x dif y = 1/2 integral_(diff Omega) x dif y - y dif x. $
]

#import "../../utils/core.typ": *

== Голоморфные функции

#def[
  $Omega subset CC$, $f: Omega --> CC$, $z_0 in Omega$.

  $f$ называется _голоморфной_ в точке $z_0$, если существует предел (конечный --- в $CC$ других нет),
  $
    lim_(z -> z_0) (f(z) - f(z_0)) / (z - z_0) =: f'(z_0)
  $
]

#notice[
  $f$ --- голоморфна в точке $z_0$ тогда и только тогда, когда сущесвует $k in CC$ такая, что
  $ f(z) = f(z_0) + k (z - z_0) + o(z - z_0) $
  при $z -> z_0$.
]

#props[
  1. Сумма, разность и произведение функций голоморфных в точке $z_0$ также голоморфна в $z_0$.
  2. $f$ и $g$ голоморфны в $z_0$, $g(z_0) != 0$ => $f / g$ голоморфна в $z_0$.
  3. Если $f$ голоморфна в $z_0$, а $g$ голоморфна в $f(z_0)$, то $g compose f$ голоморфна в $z_0$.
]
#proof[
  Доказывается ровно так же, как и для действительных функций.
]

#notice(plural: true)[
  1. $f(x, y) := f(x + i y)$, $x, y in RR$. Тогда
    $ 
      (diff f)/(diff x) (x_0, y_0) = lim_(h -> 0) (f(x_0 + h + i y_0) - f(x_0 + i y_0)) / h = f'(z_0) \
      (diff f)/(diff y) (x_0, y_0) = i lim_(h -> 0) (f(x_0 + i h + i y_0) - f(x_0 + i y_0)) / (i h) = i f'(z_0)
    $
    Значит, если $f$ голоморфно в точке $z_0$, то $(diff f)/(diff y) (z_0) = i (diff f)/(diff x) (z_0)$.
  
  2. $
    vec(Re f(x, y), Im f(x, y)) = vec(Re f(x_0, y_0), Im f(x_0, y_0)) + mat(a, b; c, d) vec(x - x_0, y - y_0) + o(norm(vec(x - x_0, y - y_0)))
  $
    Какое условие на $mat(a, b; c, d)$ дает голоморфность $f$?
    $
      f(x + i y) = f(x_0 + i y_0) + (u + i v) ((x - x_0) + i (y - y_0)) + o(...)
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

#denote[
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

#th(name: "условие Коши-Римана")[
  Пусть $f: Omega --> CC$. $z_0 in Omega subset CC$. $f$ дифференциируема в $z_0$ как функция из $RR^2$ в $RR^2$. Тогда следующие условия равносильны:

  1. $f$ голоморфна в $z_0$.
  
  2. $dif_(z_0) f$ комплексно линеен.
  
  3. $(diff f)/(diff cj(z))(z_0) = 0$.

  4. Выполняется условие Коши-Римана: $ cases((diff Re f)/(diff x) (z_0) = (diff Im f)/(diff y) (z_0), (diff Im f)/(diff x) (z_0) = - (diff Re f)/(diff y) (z_0)) $
]

#proof[
  - "$1 <=> 2$": очевидно.

  - "$2 <=> 4$": матрица $dif_(z_0) f$:
    $
      mat((diff Re f)/(diff x), (diff Re f)/(diff y); (diff Im f)/(diff x), (diff Im f)/(diff y)),
    $
    а она комплексно линейна тогда и только тогда, когда выполняется условие Коши-Римана.
  - "$3 <=> 4$": $ (diff f)/(diff cj(z)) = 1/2 ((diff f)/(diff x) + i (diff f)/(diff y)) = 0 <=> (diff Re f)/(diff x) + i (diff Im f)/(diff x) = (diff f)/(diff x) = - i (diff f)/(diff y) = -i ((diff Re f)/(diff y) + i (diff Im f)/(diff y)). $
]

#denote[
  $f in H(Omega)$ значит, что $f: Omega --> CC$ и голоморфна во всех точках.
]

#follow[
  Если $f in H(Omega)$, и $Re f = const$, то $f = const$.
]

#proof[
  $ cases((diff Im f)/(diff x) = -(diff Re f)/(diff y) = 0 , (diff Im f)/(diff y) = (diff Re f)/(diff x) = 0) ==> Im f = const $
]

#th(name: "Коши")[
  Если $f in H(Omega)$, то $f(z) dif z$ --- локально точная.
]

#proof[

  *Первое докальательство*, для случая, когда $(diff f)/(diff x)$ и $(diff f)/(diff y)$ непрерывны. Знаем, что замкнутость и непрерывность частной производной влечет локальную точность. Проверим замкнутость. 
  $ f(z) dif z = f(z) dif x + i f(z) dif y. $
  Надо проверить, что $(diff f)/(diff y) = (diff (i f))/(diff x) = i (diff f)/(diff x)$. Это верно из $(diff f)/(diff cj(z)) = 0$.

  Но... мы хотим проверить это в общем случае: оказывается, что непрерывность есть всегда автоматически. Поэтому не будем добавлять это в формулировку, и докажем в общем случае.

  #TODO[картиночка]

  *Второе доказальство*, без ограничений на $f$. Возьмем круг $U subset Omega$. Надо доказать, что $integral_P omega = 0$ для любого прямоугольника $P$ из $U$. От противного. Пусть нашелся такой $P$, где $integral_P omega != 0$. Назовем этот интеграл $alpha(P)$. Разрежем его на 4 части, как на картинке. Тогда $alpha(P) = alpha(P') + alpha(P'') + alpha(P''') + alpha(P'''')$, значит $abs(alpha(P)) <= abs(alpha(P')) + abs(alpha(P'')) + abs(alpha(P''')) + abs(alpha(P''''))$. Пусть $P_1$ такой из $P'$, $P''$, $P'''$, $P''''$, что $sum(alpha(P_1)) >= 1/4 abs(alpha(P))$. Аналогично построим последовательность прямоугольников $P supset P_1 supset P_2 supset ...$, $alpha(P_n) >= 1/(4^n) abs(alpha(P))$ и есть $z_0$ лежащая во всех прямоугольниках. $f$ --- голоморфна в $z_0$,
  $ f(z) = f(z_0) + f'(z_0) (z - z_0) + abs(z - z_0) dot beta(z - z_0), $
  где $lim_(z->z_0) beta(z - z_0) = 0$. Тогда
  $ abs(alpha(P_n)) = abs(integral_(P_n) f(z) dif z) = abs(integral_(P_n) f(z_0) dif z + integral_(P_n) f'(z_0) (z - z_0) dif z + integral_(P_n) abs(z - z_0) beta(z - z_0) dif z). $
  Первый интеграл --- интеграл константы по замкнутому контуру, то есть $0$, второй тоже 0, если сослаться на первое доказательство. Значит,
  $
    4^n abs(alpha(P_n)) = 4^n abs(integral_(P_n) abs(z - z_0) beta(z - z_0) dif z) <= 4^n "периметр" P_n dot max ... <= \ <= 4^n "периметр"^2 P_n dot max_(z in P_n) abs(beta(z - z_0)) = "периметр"^2 P dot max_(z in P_n) abs(beta(z - z_0)) --> 0.
  $
  Противоречие.
]

#follow(plural: true)[
  1. Если $f in H(Omega)$ и $gamma$ --- стягиваемый в $Omega$ замкнутый путь, то $integral_gamma f(z) dif z = 0$.
  
  2. Если $f in H(Omega)$, $z_0 in Omega$, то у $z_0$ есть окрестность $U_(z_0)$ и функция $F in H(Omega)$ такая, что $F' = f$ в $U_(z_0)$.
]

#proof[
  1. Очевидно.

  2. $f(z) dif z$ локально точная, значит существует $U_(z_0)$ и $F: U_(z_0) --> CC$ --- первообразная формы $f(z) dif z$. Тогда
    $
      f(z) dif z = f(z) dif x + i f(z) dif y ==> (diff F)/(diff x) = f and (diff F)/(diff y) = i f.
    $
    То есть $(diff F)/(diff x) = i (diff F)/(diff y)$, значит первообразная голоморфна в окрестности, и $F' = (diff F)/(diff x) = f$.
]

#notice[
  Первообразная формы, и первообразная функции в данном случае --- одно и то же, то есть $F$ --- первообразная формы $f(z) dif z$ тогда и только тогда, когда $F' = f$.
]

#th(name: "модификация теоремы Коши")[
  Пусть $Delta$ --- прямая, паралелльная какой-то оси координат. $f in C(Omega)$ и $f in H(Omega without Delta)$. Форма $f(z) dif z$ все равно локально точная в $Omega$.
]

#proof[
  Проверим, что у каждой точки из $Omega$ есть окрестность, такая, что $integral_P f(z) dif z = 0$ для любого прямоугольника $P$ со сторонами параллельными осям, и прямоугольника из этой окрестности.

  #TODO[картиночка...]

  Если точка не лежит в $Delta$, то проведем рассуждения также, как в доказательстве теореме Коши. Интересен только случай, когда точка лежит на $Delta$.

  Если $P$ не пересекает $Delta$, то все как в предыдущей теореме. Иначе, разрежем прямоугольник по $Delta$, как на картинке. Остался случай, когда одна из сторон прямоугольника лежит в $Delta$.

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
    abs(integral_[a, b] (f(z) - f(z + i eps)) dif z) <= (b - a) max_(z in [a, b]) abs(f(z) - f(z + i eps))
  $
  Что делать с последней штукой? $f$ --- равномерно непрерывна, значит $ forall delta space exists eps > 0 space abs(omega - omega') <= eps ==> abs(f(omega) - f(omega')) < delta $
  Значит, можно сдлеать сколь угодно маленькую $delta$, и
  $
    abs(integral_[a, b] (f(z) - f(z + i eps)) dif z) <= (b - a) max_(z in [a, b]) abs(f(z) - f(z + i eps)) < delta (b - a).
  $
]

#follow[
  $f in C(Omega)$ и $f$ голоморфна в $Omega$ за исключением конечного количества точек. Тогда $f(z) dif z$ локально точная в $Omega$.
]

#proof[
  Если в $z_0$ есть голоморфность, то есть окрестность, в которой есть голоморфность, и можно просто сослаться на теорему Коши. Если в $z_0$ нет голоморфности, то возьмем маленький кружочек, который не задевает остальные точки, и удаляем из него прямую, содержащую точку. По модифицированной теореме, получили локальную точность.
]

#def[
  Пусть $gamma$ --- замкнутая кривая, не проходящая через $0$ (начало координат#footnote[для димы написал]). Пусть $r(t)$ и $phi(t)$ --- ее параметризация в полярных координатах. Пусть $r, phi: [a, b] --> RR$, и $r > 0$.

  _Индекс кривой (пути) относительно точки_ $ Ind(gamma, 0) := (phi(b) - phi(a)) / (2 pi). $

  Это целое число --- количество оборотов прямой около нуля, против часовой стрелки.

  #TODO[картинка]

  Индекс в точках, отличных от нуля, определяется аналогично.
]

#notice[
  Индекс можно посчитать, рассмотрев какой-нибудь луч из точки, и посчитав, сколько раз этот луч пересекается с прямой, и в каких направлениях. Если луч $n$ раз пересекает прямую, идущую против часовой стрелки, и $m$ раз --- по часовой стрелке, то индекс прямой равен $n - m$.

  #TODO[картинка]

  Доказательство трудное, нужно возиться, мы не будем.
]

#th[
  $gamma$ --- замкнутая прямая, не проходящая через $0$. Тогда $ integral_gamma (dif z)/z = 2 pi i dot Ind(gamma, 0). $
]

#proof[
  Берем параметризацию $gamma$ в полярных координатах, $z(t) = r(t) e^(i phi(t))$. Распишем дифференциал через параметризацию: $ dif z = r'(t) e^(i phi(t)) + r(t) i phi' e^(i phi(t)) dif t, $
  и интегрируем по ней:
  $
    integral_gamma (dif z)/z = integral_a^b (r'(t) e^(i phi(t)) + r(t) i phi'(t) e^(i phi(t)))/(r(t) e^(i phi(t))) dif t = \ = integral_a^b ((r'(t))/(r(t)) + i phi'(t)) dif t = underbrace(ln r(b) - ln r(a), 0) + i (phi(b) - phi(a)) = 2 pi i dot Ind(gamma, 0).
  $
  $r(b) = r(a)$, так как кривая замкнутая. Индекс возникает по определению.
]

#th(name: "Интегральная формула Коши")[
  $f in H(Omega)$, $a in Omega$, $gamma$ --- стягиваемый в $Omega$ путь, $gamma$ не проходит через $a$. Тогда $ integral_gamma (f(z))/(z - a) dif z = 2pi i f(a) Ind(gamma, a) $
]

#proof[
  $ g(z) := cases(
    (f(z) - f(a))/(z - a) "при" z != a,
    f'(a) "при" z = a 
  ) $
  Такая $g in C(Omega)$ и $g in H(Omega without {a})$. По следствию из теоремы выше про локальную точность голоморфной функции без конечного числа точек, $g$ --- локально точная, и $integral_gamma g(z) dif z = 0$.
  Тогда
  $
    0 = integral_gamma g(z) dif z = integral_gamma (f(z))/(z -a) dif z - integral_gamma f(a)/(z - a) dif z = \ = integral_gamma (f(z))/(z -a) dif z - f(a) integral_gamma (dif z)/(z - a) = integral_gamma (f(z))/(z -a) dif z - 2pi i f(a) Ind(gamma, a).
  $
]

#th[
  $f$ --- голоморфна в круге ${abs(z) < R}$. Тогда $f$ --- аналитична в этом круге.
]

#proof[
  Рассмотрим $abs(z) < r_1 < r < R$. По интегральной формуле коши для $gamma$ --- окружность радиуса $r$,
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
    (f(zeta) z^n) / zeta^(n = 1) <= M/r dot ((r_1)/r)^n.
  $
  Значит, есть равномерная сходимость.
]

#follow(plural: true)[
  1. Есть формула для коэффициентов:
    $
      a_n = 1/(2 pi i) integral_({abs(zeta) = r}) f(zeta)/(zeta^(n + 1)) dif zeta.
    $
  2. $f: Omega --> CC$. $f in H(Omega) <==> f "аналитична в" Omega$.

  3. $f in H(Omega) ==> f "бесконечно дифференцируема"$.

  4. $f in H(Omega) ==> f' in H(Omega)$.
]

#proof[
  1. Достается из доказательства.

  2. "$==>$": берем $B_R (a) in Omega$, по теореме $f(z)$ раксладывается в ряд в этом круге.

  3. Следует из аналитичности.

  4. Аналитичность + 2)
]

#def[
  $f: Omega --> RR$, $Omega subset RR^n$. $f$ --- гармоническая, если
  $
    (diff^2 f)/(diff x_1^2) + (diff^2 f)/(diff x_2^2) + ... + (diff^2 f)/(diff x_n^2) = 0.
  $

  Если $Omega subset CC$, то $
    (diff^2 f)/(diff x^2) + (diff^2 f)/(diff y^2) = 0.
  $
]

#follow(name: "продолжение", plural: true)[
  5. $f in H(Omega)$, значит $Re f$ и $Im f$ --- гармонические.
]

#proof[
  5. $ (diff^2 Re f)/(diff x^2) = (diff)/(diff x) ((diff Re f)/(diff x)) = (diff)/(diff x) ((diff Im f)/(diff y)) = (diff)/(diff y) ((diff Im f)/(diff x)) = (diff)/(diff y) (-(diff Re f)/(diff y)) = -(diff^2 Re f)/(diff y^2). $
]

#notice[
  Если $P$ --- гармоническая, то $exists Q$ --- гармоническая, такая, что $P + i Q$ --- голоморфная, и $Q$ --- единственная с точностью до прибавления константы.
]

#th(name: "Морера")[
  $f(z) dif z$ локально точная, тогда $f in H(Omega)$.
]

#proof[
  $f(z) dif z$ --- локально точная, значит, у нее локально есть первообразная у каждой точки. Что у формы, что у функции --- это одно и тоже, $F'$. Тогда $F' = f$, следовательно $F$ голоморфно в окрестности $z_0$. Значит, $f$ --- голоморфна в окрестности $z_0$.
]

#follow(plural: true)[
  $f in C(Omega)$ и $f$ голоморфна в $Omega without Delta$ (где $Delta$ --- прямая, паралелльная оси), или в $Omega$ за исключением конечного числа точек. Тогда $f in H(Omega)$.
]

#proof[
  Условие говорит о том, что $f(z) dif z$ локально точна, и можно применить теорему Морера.
]

#th[
  Собираем все вместе.

  $f: Omega --> CC$. Следующие условия равносильны:
  1. $f in H(Omega)$
  2. $f$ аналитична в $Omega$
  3. $f$ бесконечно дифференцируема в $Omega$
  4. $f$ локально имеет первообразную
  5. Форма $f(z) dif z$ локально точная
  6. Форма $f(z) dif z$ замкнута, и частные производные $f$ непрерывны, $f in C(Omega)$
  7. Интеграл по любому достаточно малому прямоугольнику (у любой точки есть окрестность, в которой все прямоугольники такие), со сторонами паралелльными осям, равен $0$, $f in C(Omega)$
]

#proof[
  - "$1 ==> 5$": теорема Коши.
  - "$5 ==> 1$": теорема Морера.
  - "$1 ==> 2$": теорема про аналитичность.
  - "$2 ==> 3$": очевидно.
  - "$3 ==> 1$": очевидно.
  - "$4 <==> 5$": первообразная формы $f(z) dif z$ и функции $f$ --- одно и тоже.
  - "$6 ==> 7$": формула Грина + свойство Коши-Римана под интегралом.
  - "$7 ==> 5$": критерий точности.
  - "$5 + 3 ==> 6$".
]

#th(name: "Неравенство Коши")[
  $f$ --- голоморфна в круге ${abs(z) < R}$, $f(z) = sum_(n = 0)^oo a_n z^n$. Тогда 
  $
    abs(a_n) <= M_r / r^n, "где" 0 < r < R " и " M_r := max_(abs(z) = r) abs(f(z)).
  $
]

#proof[
  $ abs(a_n) = abs(1 / (2pi i) integral_(abs(z) = r) f(z)/(z^(n + 1)) dif z) <= 1/cancel(2 pi) dot max_(abs(z) = r) abs(f(z)/(z^(n + 1))) dot cancel(2 pi) r = (r dot max_(abs(z) = r) abs(f(z))) / r^(n + 1) = M_r / r^n. $
]

#def[
  $f$ --- _целая_ функция, если $f in H(CC)$. Это всегда степенные ряды, у которых радиус сходимости равен бесконечности.
]

#examples[
  $exp$, $sin$, $cos$, $CC[x]$, ...
]

#th(name: "Лиувилля")[
  Если $f in H(CC)$ и ограниченная, то $f = const$.
]

#proof[
  $f(z) = sum_(n = 0)^oo a_n z^n$. Пусть $abs(f(z)) <= M$ для любого $z in CC$. Тогда $ abs(a_n) <= M_r/r^n <= M/r^n -->_(r -> +oo) 0 ==> a_n = 0. $
]

#th(name: "Основная теорема алгебры")[
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
  По теореме Лиувилля, $f equiv const$, значит $P equiv const$. Противоречие.
]

#follow[
  Если $P$ --- многочлен степени $n$, то $P(z) = c dot (z - z_1) dot (z - z_2) dot ... dot (z - z_n)$.
]

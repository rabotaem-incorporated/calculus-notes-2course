#import "../../utils/core.typ": *

== Голоморфные функции

#def[
  $Omega subset CC$, $f: Omega --> CC$, $z_0 in Omega$.

  $f$ называется _голоморфной_ в точке $z_0$, если существует предел (конечный, в $CC$ других нет),
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
  Доказываеться ровно также, как и для действительных функций.
]

#notice(plural: true)[
  1. $f(x, y) := f(x + i y)$, $x, y in RR$. Тогда
    $ 
      (diff f)/(diff x) (x_0, y_0) = lim_(h -> 0) (f(x_0 + h + i y_0) - f(x_0 + i y_0)) / h = f'(z_0) \
      (diff f)/(diff y) (x_0, y_0) = i lim_(h -> 0) (f(x_0 + i h + i y_0) - f(x_0 + i y_0)) / (i h) = i f'(z_0)
    $
    Значит, если $f$ голоморфно в точке $z_0$, то $(diff f)/(diff y)(z_0) = i (diff y)/(diff x) z_0$.
  
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
  $dif x = dif x + i dif y$, $dif cj(z) = dif x - i dif y$.
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
  Пусть $f: Omega --> CC$. $z_0 in Omega$. $f$ дифференциируема в $z_0$ как функция из $RR^2$ в $RR^2$. Тогда следующие условия равносильны:

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
  $ (diff Im f)/(diff x) = -(diff Re f)/(diff y) = 0 &==> Re f = const \ (diff Im f)/(diff y) = (diff Re f)/(diff x) = 0 &==> Im f = const $
]

#th(name: "Коши")[
  Если $f in H(Omega)$, то $f(z) dif z$ --- локально точная.
]

#proof[
  *Первое докальательство*, для случая, когда $(diff f)/(diff x)$ и $(diff f)/(diff y)$ непрерывно. Знаем, что замкнутость и непрерывность частной производной влечет локальную точность. Проверим замкнутость. 
  $ f(z) dif z = f(z) dif x + i f(z) dif y. $
  Надо проверить, что $(diff f)/(diff y) = (diff (i f))/(diff x) = i (diff f)/(diff x)$. Это верно из $(diff f)/(diff cj(z)) = 0$.

  Но... мы хотим проверить это в общем случае: оказывается, что непрерывность есть всегда автоматически. Поэтому не будем добавлять это в формулировку, и докажем в общем случае.

  *Второе доказальство*, без ограничений на $f$. Возьмем круг $U subset Omega$. Надо доказать, что $integral_P omega = 0$ для любого прямоугольника $P$ из $U$. От противного. Пусть нашелся такой $P$, где $integral_P omega != 0$. Назовем этот интеграл $alpha(P)$. Разрежем его на 4 части, как на картинке. Тогда $alpha(P) = alpha(P') + alpha(P'') + alpha(P''') + alpha(P'''')$, значит $abs(alpha(P)) <= abs(alpha(P')) + abs(alpha(P'')) + abs(alpha(P''')) + abs(alpha(P''''))$. Пусть $P_1$ такой из $P'$, $P''$, $P'''$, $P''''$, что $sum(alpha(P_1)) >= 1/4 abs(alpha(P))$. Аналогично построим последовательность прямоугольников $P supset P_1 supset P_2 supset ...$. $alpha(P_n) >= 1/(4^n) abs(alpha(P))$ и есть $z_0$ лежащая во всех прямоугольниках. $f$ --- голоморфна в $z_0$,
  $ f(z) = f(z_0) + f'(z_0) (z - z_0) + abs(z - z_0) dot beta(z - z_0), $
  где $lim_(z->z_0) beta(z - z_0) = 0$. Тогда
  $ abs(alpha(P_n)) = abs(integral_(P_n) f(z) dif z) = abs(integral_(P_n) f(z_0) dif z + integral_(P_n) f'(z_0) (z - z_0) dif z + integral_(P_n) abs(z - z_0) beta(z - z_0) dif z). $
  Первый интеграл --- интеграл константы по замкнутому контуру, то есть $0$, второй тоже 0, если сослаться на первое доказательство. Значит,
  $
    abs(alpha(P_n)) = abs(integral_(P_n) abs(z - z_0) beta(z - z_0) dif z) <= "периметр" P_n dot max ... <= \ <= "периметр"^2 P_n dot max_(z in P_n) abs(beta(z - z_0)) = 1/(4^n) "периметр"^2 P dot max_(z in P_n) abs(beta(z - z_0)).
  $
  Имеем,
  $
    0 < abs(alpha(P_n)) <= underbrace(("периметр" P)^2, const) dot underbrace(max_(z in P) abs(beta(z - z_0)), --> 0) --> 0.
  $
  Противоречие.
]

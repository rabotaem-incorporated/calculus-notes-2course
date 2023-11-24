#import "../../utils/core.typ": *

== Криволинейные интегралы

#remind[
  Путь --- отображение $gamma: [a, b] -> RR^n$ непрерывное.

  Пути эквивалентны ($gamma tilde tilde(gamma)$, где $gamma: [a, b] --> RR^n$ и $tilde(gamma): [c, d] --> RR^n$) когда существует непрерывная строго возрастающая биекция $tau: [a, b] -> [c, d]$ такая, что $gamma = tilde(gamma) compose tau$.

  Кривая --- класс эквивалентности путей.

  Параметрицация кривой --- конкретный представитель класса.
]

#def[
  _Криволинейный интеграл первого рода функции $f$ по гладкой кривой $s$_ (интеграл по длине дуги):
  $
    integral_gamma f dif s := integral_a^b f(gamma(t)) norm(gamma'(t)) dif t,
  $
  где $gamma$ --- какая-то параметризация $s$.

  Напомню, что норма производной равна $sqrt((gamma'_1(t))^2 + ... + (gamma'_n(t))^2)$.
]

#props[
  1. Не зависит от параметризации.
  2. Не зависит от направления.
  3. $integral_gamma dif s = l(gamma)$ --- формула длины гладкой кривой.
  4. Линейность $integral_gamma (alpha f + beta g) dif s = alpha integral_gamma f dif s + beta integral_gamma f dif s$
  5. Аддитивность по кривой: $gamma: [a, b] --> RR^n$ и $gamma_1 := gamma bar_[a, c]$, $gamma_2 := gamma bar_[c, b]$. Тогда $integral_gamma f dif s = integral_(gamma_1) f dif s + integral_(gamma_2) f dif s$.
  6. Неравенство сохраняется: если $f <= g$ на $gamma[a, b]$ (носитель кривой), то $integral_gamma f dif s <= integral_gamma g dif s$.
  7. $abs(integral_gamma) <= integral_gamma abs(f) dif s$.
]

#proof[
  1. Пусть $gamma = tilde(gamma) compose tau$.
  
    $
      integral_tilde(gamma) t dif s = integral_c^d f(tilde(gamma)(t)) norm(tilde(gamma)'(t)) dif t =^(t = tau(u)) = integral_a^b f(tilde(gamma)(tau(u))) norm(tilde(gamma)'(tau(u))) dot underbrace(tau'(u), >0) dif u = \
      = integral_a^b f(underbrace(tilde(gamma)(tau(u)), tilde(gamma) compose tau = gamma)) norm(underbrace(tau'(u) dot tilde(gamma)'(tau(u)), gamma ')) dif u = integral_a^b f(gamma(u)) norm(gamma') dif u = integral_gamma f dif s.
    $
  
  2. Тоже самое.

  3. Ну да, это и правда формула длины гладкой кривой.

  4. $ 
    integral_gamma (alpha f + beta g) dif s = integral_a^b (alpha f(gamma(t)) + beta g(gamma(t))) norm(gamma'(t)) dif t = alpha integral_gamma f dif s + beta integral_gamma f dif s
  $
  
  5. Аналогично, надо расписать по определению.

  6. Опять аналогично. Тут нормы неотрицательные, поэтому неравенства верны.

  7. $-abs(f) <= f <= abs(f)$ и 6.
]

#exercise[
  Интегральная сумма: если есть отрезок $[a, b]$ нарезанный каким-то дроблением в точках $a = t_0, t_1, t_2, ..., t_m = b$ и имеется оснащение $xi_1 in [t_0, t_1], xi_2 in [t_1, t_2], ..., xi_m in [t_(m - 1), t_m]$, то
  $
    integral_gamma f dif s = lim sum_(k = 1)^m f(gamma(xi_k)) dot l(gamma bar_[t_(k - 1), t_k]),
  $
  где $gamma$ --- гладкая кривая (конечной длины), а предел при мелкости дробления стремящейся к нулю.
]

#def[
  _Дифференциальной формой первого порядка_ называется формальная конструкция
  $
    omega := f_1 dif x_1 + f_2 dif x_2 + ... + f_n dif x_n,
  $
  где $f_1, ..., f_n$ --- функции от $n$ переменных.

  Далее мы будем интересоваться только дифференциальными формами первого порядка, поэтому порядок упоминать мы не будем.
]

#def[
  _Криволинейным интегралом второго рода_ (или _интегралом от дифференциальной формы_) называется
  $
    integral_gamma omega := integral_a^b sum_(k = 1)^n f_k (gamma(t)) gamma'_k (t) dif t.
  $
]

#props[
  1. Не зависит от параметризации.
  2. Меняет знак при изменении направления.
]

#proof[
  1. $ integral_tilde(gamma) omega = integral_c^d sum_(k = 1)^n f_k (tilde(gamma)(t)) tilde(gamma)'_k (t) dif t = integral_a^b sum_(k = 1)^n f_k (tilde(gamma)(tau(u))) tilde(gamma)'_k (tau(u)) tau'(u) dif u = integral_a^b sum_(k = 1)^n f_k (gamma(u)) gamma'_k (u) dif u. $
  
  2. Аналогично.
]

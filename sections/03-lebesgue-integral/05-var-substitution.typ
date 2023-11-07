#import "../../utils/core.typ": * 

== Замена переменной в интеграле Лебега

#def[
    Пусть $Omega_1$ и $Omega_2 subset RR^m$ открытые. $Phi: Omega_1 --> Omega_2$ называется _диффеоморфизмом_, если
    1. $Phi$ --- биекция,
    2. $Phi$ --- непрерывно дифференцируема на $Omega_1$,
    3. $Phi^(-1)$ --- непрерывно дифференцируема на $Omega_2$.
]

#th(name: "замена переменной в интеграле по мере Лебега")[
    $Omega subset RR^m$ открытое. $Phi: Omega --> tilde(Omega)$ диффеоморфизм. $f: tilde(Omega) --> overline(RR)$, $f >= 0$ измерима (или суммируема). Тогда $ integral_tilde(Omega) f dif lambda_m = integral_Omega f(Phi(x)) abs(Jj_Phi (x)) dif lambda_m (x), $
    где $Jj_phi(x) = det Phi' (x)$ --- якобиан.
]

#notice(name: "частные случаи")[
    1. Сдвиг. Прибавляем к каждому $x$ какой-то вектор. Тогда якобиан равен единице, так как матрица производной --- единичная.
        $ integral_(RR^m) f dif lambda_m = integral_(RR^m) f(x + a) dif lambda_m $
        Здесь мы подвинули $x$ на вектор $a$. Интегрируя функцию по $RR^m$, множество не меняется.
    
    2. Линейное отображение $Phi(x) = T x$. Тогда $Jj_Phi = det T$. Тогда
        $ integral_(RR^m) f dif lambda_m = abs(det T) integral_(RR^m) f(T_x) dif lambda_m (x) $
    
    3. Сжатие/растяжение: $Phi(x) = c x$. Тогда получается диагональная матрица с определителем $c^m$:
        $ integral_(RR^m) f dif lambda_m = abs(c)^m integral_(RR^m) f(c x) dif lambda_m (x) $
]

#lemma[
    $Phi: Omega -> tilde(Omega)$ диффеоморфизм, $Omega$, $tilde(Omega) subset RR^m$, $a in Omega$, $0 < k < m$. Тогда существует окрестность $U_a$ такая, что $Phi bar_(U_a) = Phi_1 compose Phi_2$, где $Phi_1$, $Phi_2$ --- диффеоморфизмы. $Phi_1$ оставляет на месте какие-то (не обязательно любые) $k$ координат, а $Phi_2$ остальные $m - k$ координат.
]

#proof[
    Пусть $x, u in RR^k$, $y, v in RR^(m - k)$. Порежем координаты: $Phi(x, y) = (phi(x, y), psi(x, y))$, где $phi$ действует в $RR^k$, а $psi$ в $RR^(m - k)$. Пусть $Phi_1(u, v) = (u, f(u, v))$ и $Phi_2(u, v) = (g(u, v), v)$. Тогда $ Phi_1 compose Phi_2 = Phi_1(g(u, v), v) = (g(u, v), f(g(u, v), v)). $
    Отсюда можно однозначно определить $g$: $g(u, v) = phi(u, v)$. Теперь $Phi_2$ определяется однозначно: $Phi_2(u, v) = (phi(u, v), v)$. Отсюда $psi(u, v) = f compose Phi_2(u, v)$. Получится формула для $f$: $f(x, y) = psi compose Phi_2^(-1)(x, y)$. Для того, чтобы это получилось, необходима обратимость $Phi_2$ в некоторой окрестности $U_a$ из ответа.

    Воспользуемся теоремой об обратной функции. Непрерывную дифференцируемость легко увидеть. Посмотрим на определитель $Phi'_2$:
    $ Phi'_2 = mat(phi'_u, phi'_v; 0, E) ==> det Phi'_2 = det phi'_u. $
    $phi'_u$ --- минор $k times k$ матрицы $Phi'$, так как это производные каких-то $k$ координат функции $Phi$. Так как $Phi$ непрерывно дифференцируемая биекция, то $det Phi != 0$, и у $Phi$ найдется какой-то ненулевой минор размера $k times k$. Это не обязательно угловой минор: может быть какой-то другой, поэтому переменные, возможно, придется переставить.
]

#follow[
    Эту лемму можно применить много раз.

    $Phi: Omega -> tilde(Omega)$ диффеоморфизм, $Omega, tilde(Omega) in RR^m$, $a in Omega$. Тогда найдется окрестность $U_a$ такая, что $Phi bar_(U_a) = Phi_1 compose Phi_2 compose ... compose Phi_m$, где каждая функция $Phi_i$ диффеоморфизм, который оставляет на месте все координаты, кроме одной.
]

#th(name: "Линделёфа")[
    Из любого покрытия $Omega subset RR^m$ открытыми множествами можно выбрать не более чем счетное подпокрытие.
]

#proof[
    Пусть $Omega subset Union_(alpha in I) G_alpha$, где $G_alpha$ открытые. Возьмем $a in Omega$. Найдется $beta in I$ такое, что $a in G_beta$. Оно открытое, поэтому $B_r (a) subset G_beta$. Пошевелим точку так, чтобы радиус и координаты точки стали рациональными, в нем все еще лежала точка $a$, то есть сделаем шар такой, что $a in B_tilde(r) (b) subset B_r (a) subset G_beta.$ Но таких шариков не более чем счетно. Для каждого шарика оставляем один элемент покрытия, который его содержит, получаем что хотели.
]

#th[
    Пусть $Phi: Omega -> tilde(Omega)$ --- диффеоморфизм, $Omega, tilde(Omega) in RR^m$. $A subset tilde(Omega)$ измеримо. Тогда $ lambda_m A = integral_(Phi^(-1) (A)) abs(Jj_Phi) dif lambda_m. $
]

#notice[
    Если теорема верна для конкретного $Phi$, то для того же $Phi$ верна формула замены переменной.
]

#proof[
    1. $f = bb(1)_A$. Формула замены переменной говорит, что $ integral_tilde(Omega) bb(1)_A dif lambda_m = lambda_m A = integral_(Phi^(-1) (A)) abs(Jj_Phi) dif lambda_m = integral_Omega underbrace(bb(1)_(Phi^(-1) (A)), bb(1)_A compose Phi) dif lambda_m = integral_Omega (bb(1)_A compose Phi) dot abs(Jj_Phi) dif lambda_m. $

    2. $f$ --- простая: верно по линейности.

    3. $f >= 0$ измеримая: записываем последовательность простых $0 <= phi_1 <= phi_2 <= ...$, $phi_n --> f$ поточечно. По теореме Леви получаем что хотим. Не буду писать, все уже поняли.

    4. $f$ суммируема: ну там поделили на плюс минус и вычли.
]

#let Omegat = $tilde(Omega)$
#let Omegatt = $tilde(Omegat)$

#proof(name: "теоремы")[

    *Шаг 1.* Пусть $Omega = Union U_n$ --- не более чем счетное объединение открытых множеств. Если теорема верна для каждого $U_n$, то она верна и для $Omega$. Пусть $A = usb A_n$, $A_n in U_n$. Тогда $Phi^(-1) (A_n)$ дизъюнктны, так как $Phi$ --- биекция. Тогда
    $ lambda A = sum lambda A_n = sum integral_(Phi^(-1) (A_n)) abs(Jj_Phi) dif lambda = integral_(Phi^(-1) (A)) abs(Jj_Phi) dif lambda. $

    *Шаг 2.* Если теорема верна для диффеоморфизмов $Phi$ и $Psi$, то она верна и для $Phi compose Psi$. Пусть $ Omega -->^Phi Omegat -->^Psi Omegatt, A subset Omegatt $
    Тогда
    $ lambda A = integral_(Psi^-1(A)) abs(Jj_psi) dif lambda =^((*)) integral_(Phi^-1(Psi^-1(A))) (abs(Jj_Psi) compose Phi) abs(Jj_Phi) dif lambda = \ integral_(Phi^-1(Psi^-1(A))) (abs(Jj_Psi) compose Phi) abs(Jj_Phi) dif lambda = integral_(Phi^-1(Psi^-1(A))) abs(det Psi'(Phi)) abs(Phi') dif lambda = \ integral_(Phi^-1(Psi^-1(A))) abs(det (Psi'(Phi) Phi')) dif lambda = integral_(Phi^-1(Psi^-1(A))) abs(det (Psi compose Phi)') dif lambda = integral_(Phi^-1(Psi^-1(A))) abs(Jj_(Phi compose Psi)) dif lambda. $
    Переход $(*)$ верен по теореме о замене переменной, которой, как мы выяснили, здесь можно пользоватся.

    *Шаг 3.* Пусть $m = 1$. $ integral_[a, b] abs(phi') dif lambda = abs(phi(a) - phi(b)) = lambda [phi(a), phi(b)]. $ Это формула Ньютона-Лейбница. 

    Теперь посмотрим на функцию на ячейке.
    $ integral_(a, b] abs(phi') dif lambda = lim_(n -> oo) integral_[a + 1/n, b] abs(phi') dif lambda = lim_(n -> oo) lambda [phi(a + 1/n), phi(b)] = lambda (phi(a), phi(b)]. $

    Теперь определим $nu A = integral_(phi^(-1)_A) abs(phi') dif lambda$ --- мера, которая на ячейках совпадает с $lambda$. Значит $nu = lambda$ по единственности продолжения. Значит и для всех остальных измеримых множеств формула работает.

    *Шаг 4.* Теперь осталось доказать теорему для диффеоморфизмов из леммы. Тогда по частям мы соберем теорему.

    $Phi: Omega --> Omegat$ диффеоморфизм, оставляющий на месте первые $m - 1$ координату. Пусть $(y, t)$, где $y in RR^(m - 1)$, $t in RR$ --- аргументы $Phi$. Тогда $Phi(y, t) = (y, phi(y, t))$.
    $ lambda_m Phi(A) =^"Кавальери" integral_(RR^(m - 1)) lambda_1 (Phi (A))_y dif lambda_(m - 1) (y). $
    Посмотрим на сечения поближе: $ (Phi(A))_y = {s in RR: (y, s) in Phi(A)} = phi(y, A_y) $
    так как для некоторого $t$ можно записать $s = phi(y, t)$.
    Значит
    $
        integral_(RR^(m - 1)) lambda_1 (Phi (A))_y dif lambda_(m - 1) (y) = integral_(RR^(m - 1)) lambda_1 (phi(y, A_y)) dif lambda_(m - 1) (y) = \ integral_(RR^(m - 1)) integral_(A_y) abs(phi'_t (y, t)) dif lambda_1 (t) dif lambda_(m - 1) (y).
    $
    В последнем переходе мы воспользовались предыдущим шагом. Мера $lambda_1$ равняется внутреннему интегралу, так как для одномерного случая мы уже это знаем. Посмотрим на $Phi'$:
    $
        Phi' = mat(E, 0; phi'_(y_1) ... phi'_(y_(m - 1)), phi'_t).
    $
    Значит
    $
        integral_(RR^(m - 1)) integral_(A_y) abs(phi'_t (y, t)) dif lambda_1 (t) dif lambda_(m - 1) (y) = integral_(RR^(m - 1)) integral_(A_y) abs(Jj_Phi) dif lambda_1 (t) dif lambda_(m - 1) (y) =^"т. Тонелли" integral_A abs(Jj_Phi) dif lambda_m.
    $

    #line(length: 100%)

    Теперь собираем доказательство из кусочков.

    Рассматриваем каждую точку $a in Omega$, $U_a$ --- окрестность из леммы, $Phi bar_(U_a) = Phi_1 compose Phi_2 compose ... compose Phi_m$, где $Phi_i$ оставляют $m - 1$ координату.

    По теореме Линделёфа оставляем не более чем счетное количество окрестностей. Шаг 1 говорит, что достаточно проверить для только этих $U_a$. Второй шаг говорит, что достаточно проверить утверждение для произвольного $Phi_j$, и для композиции всех теорема тоже будет верна.

    Шаг 4 осуществляет проверку для $Phi_j$.

    Теорема доказана.
]

#notice[
    Можно записать формулу по-другому:
    $ integral_(Phi(A)) f dif lambda_m = integral_A (f compose Phi) abs(Jj_Phi) dif lambda_m. $
    Здесь $Phi: Omega --> Omegat$ диффеоморфизм, $A subset Omega$.
]

#proof[
    $
        integral_(Phi(A)) f dif lambda_m = integral_(Omegat) bb(1)_(Phi(A)) dot f dif lambda_m = integral_Omega f compose Phi dot bb(1)_A dot abs(Jj_Phi) dif lambda = integral_A (f compose Phi) abs(Jj_Phi) dif lambda_m.
    $
]

#notice[
    $Phi: Omega --> Omegat$ такое, что $exists e in Omega$ и $tilde(e) in Omegat$, такое, что $lambda e = lambda tilde(e) = 0$, и $Phi bar_(Omega without e): Omega without e --> tilde(Omega) without tilde(e)$ --- диффеоморфизм, и то формула все равно верна.
]

 #example[
    Полярные координаты: $(r, t) ~~> (r cos t, r sin t)$, преобразовывающие "полосу" в плоскость без прямой.

    Тогда $ vec(r, t) -->^Phi vec(r cos t, r sin t), Phi' = mat(cos t, -r sin t; sin t, r cos t) ==> Jj_Phi = det Phi' = r cos^2 t + r sin^2 t = r. $
    Записываем формулу замены переменной (теорема Фубини позволяет записать интеграл по двумерному множеству как двойной):
    $
        integral_(RR^2) f dif lambda_2 = integral_([0, +oo)) integral_([0, 2pi]) r f (r cos t, r sin t) dif lambda_1 (t) dif lambda_1 (r). 
    $
    Подставим $f(x, y) = e^(-x^2 - y^2)$, $f(r cos t, r sin t) = e^(-r^2)$:
    $
        integral_(RR^2) e^(-x^2 - y^2) dif x dif y = integral_0^(+oo) integral_0^(2pi) r e^(-r^2) dif t dif r = 2pi integral_0^(+oo) r e^(-r^2) dif r = (- pi e^(-r^2)) bar_0^(+oo) = pi.
    $
    Кстати,
    $
        integral_(RR^2) e^(-x^2 - y^2) dif x dif y = integral_RR e^(-x^2) dif x dot integral_RR e^(-y^2) dif y = (integral_RR e^(-x^2) dif x)^2 ==> integral_RR e^(-x^2) dif x = sqrt(pi).
    $
    Этот интеграл иногда оказывается полезен.
 ]

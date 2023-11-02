#import "../../utils/core.typ": * 

== Замена переменной в интеграле Лебега

#def[
    Пусть $Omega_1$ и $Omega_2 subset RR^m$ открытые. $Phi: Omega_1 --> Omega_2$ называется _диффеоморфизмом_, если
    1. $Phi$ --- биекция,
    2. $Phi$ --- непрерывно дифференцируема на $Omega_1$,
    3. $Phi^(-1)$ --- непрерывно дифференцируема на $Omega_2$.
]

#th(name: "замена переменной в интеграле по мере Лебега")[
    $Omega subset RR^m$ открытое. $Phi: Omega --> tilde(Omega)$ диффеоморфизм. $f: tilde(Omega) --> overline(RR)$, $f >= 0$ суммируема. Тогда $ integral_tilde(Omega) f dif lambda_m = integral_Omega f(Phi(x)) abs(Jj_Phi (x)) dif lambda_m (x), $
    где $Jj_phi(x) = det Phi' (x)$ --- якобиан.
]

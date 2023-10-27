// shortcuts
#show "iff": "тогда и только тогда, когда"
#let iff = math.limits(sym.arrow.l.r.double.long)
#let imply = math.limits(sym.arrow.r.double.long)
#let since = math.limits(sym.arrow.l.double.long)
#let empty = sym.nothing.rev
#let maps = sym.arrow.long.bar
#let sim = sym.zws + sym.tilde + sym.zws
#let pc = sym.plus.circle
#let nsubg = sym.triangle.l.small
#let iso = sym.tilde.equiv
#let fg = sym.slash
#let usb = sym.union.sq.big
#let eps = sym.epsilon
#let Union = sym.union.big
#let UnionSq = sym.union.sq.big
#let Sect = sym.sect.big
#let limsup = $overline(lim)$
#let liminf = $underline(lim)$
#let INT(f, E: $E$, mu: $mu$) = $ integral_#E #f dif #mu $

// set fix
#let nothing = math.diameter
#let emptyset = math.diameter


// operators
#let sgn = math.op("sgn")
#let Inv = math.op("Inv")
#let Det = math.op("det")
#let lcm = math.op("lcm")
#let diag = math.op("diag")
#let sgn = math.op("sgn")
#let Lin = math.op("Lin")
#let Dim = math.op("dim")
#let id = math.op("id")
#let GL = math.op("GL")
#let Hom = math.op("Hom")
#let Ker = math.op("Ker")
#let Re = math.op("Re")
#let Im = math.op("Im")
#let Id = math.op("Id")
#let End = math.op("End")
#let rk = math.op("rk")
#let Tr = math.op("Tr")
#let ord = math.op("ord")
#let St = math.op("St")
#let char = math.op("char")
#let Irr = math.op("Irr")
#let arg = math.op("arg")
#let Int = math.op("Int")
#let Cl = math.op("Cl")
#let const = math.op("const")

// letters
#let Aa = math.cal($A$)
#let Bb = math.cal($B$)
#let Cc = math.cal($C$)
#let Dd = math.cal($D$)
#let Ee = math.cal($E$)
#let Ff = math.cal($F$)
#let Gg = math.cal($G$)
#let Hh = math.cal($H$)
#let Ii = math.cal($I$)
#let Jj = math.cal($J$)
#let Kk = math.cal($K$)
#let Ll = math.cal($L$)
#let Mm = math.cal($M$)
#let Nn = math.cal($N$)
#let Oo = math.cal($O$)
#let Pp = math.cal($P$)
#let Qq = math.cal($Q$)
#let Rr = math.cal($R$)
#let Ss = math.cal($S$)
#let Tt = math.cal($T$)
#let Uu = math.cal($U$)
#let Vv = math.cal($V$)
#let Ww = math.cal($W$)
#let Xx = math.cal($X$)
#let Yy = math.cal($Y$)
#let Zz = math.cal($Z$)

// functions
#let dotp(x, y) = $lr(angle.l #x, #y angle.r)$
#let hat(x) = math.accent(x, "^")

// amogus
#let amogus = symbol(
    "ඞ",
    ("adult", "ඞ"),
    ("tween", "ඩ"),
    ("toddler", "ධ"),
    ("baby", "ව"),
)

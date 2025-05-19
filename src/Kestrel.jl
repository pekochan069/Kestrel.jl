"""
https://github.com/codereport/blackbird
"""
module Kestrel

"""
I - Identity
"""
function i(x)
    x
end

"""
K - Kestrel
"""
function k(x, y)
    x
end

"""
S - Starling
"""
function s(f, g)
    (x) -> f(x, g(x))
end

"""
B - Bluebird
"""
function b(f, g)
    (x) -> f(g(x))
end

"""
BB - Bluebird^2
"""
function bb(f, g, h)
    (x) -> f(g(h(x)))
end

"""
BBB - Bluebird^3
"""
function bbb(f, g, h, i)
    (x) -> f(g(h(i(x))))
end

"""
B1 - Blackbird
"""
function b1(f, g)
    (x, y) -> f(g(x, y))
end

"""
C - Cardinal
"""
function c(f)
    (x, y) -> f(y, x)
end

"""
D2 - Dovekie
"""
function d2(f, g, h)
    (x, y) -> g(f(x), h(y))
end

"""
KI - Kite
"""
function ki(x, y)
    y
end

"""
Phi - Phoenix
"""
function phi(f, g, h)
    (x) -> g(f(x), h(x))
end

"""
Phi1 - Pheasant
"""
function phi1(f, g, h)
    (x, y) -> g(f(x, y), h(x, y))
end

"""
Psi - Psi Bird
"""
function psi(f, g)
    (x, y) -> f(g(x), g(y))
end

"""
W - Warbler
"""
function w(f)
    (x) -> f(x, x)
end

export i, k, s, b, bb, bbb, b1, c, d2, ki, phi, phi1, psi, w

module Curried

"""
I - Identity
"""
i = x -> x

"""
K - Kestrel
"""
k = x -> y -> x

"""
S - Starling
"""
s = f -> g -> x -> f(x)(g(x))

"""
B - Bluebird
"""
b = f -> g -> x -> f(g(x))

"""
BB - Bluebird^2
"""
bb = f -> g -> h -> x -> f(g(h(x)))

"""
BBB - Bluebird^3
"""
bbb = f -> g -> h -> i -> x -> f(g(h(i(x))))

"""
B1 - Blackbird
"""
b1 = f -> g -> x -> y -> f(g(x)(y))

"""
C - Cardinal
"""
c = f -> x -> y -> f(y)(x)

"""
D2 - Dovekie
"""
d2 = f -> g -> h -> x -> y -> g(f(x))(h(y))

"""
KI - Kite
"""
ki = x -> y -> y

"""
Phi - Phoenix
"""
phi = f -> g -> h -> x -> g(f(x))(h(x))

"""
Phi1 - Pheasant
"""
phi1 = f -> g -> h -> x -> y -> g(f(x)(y))(h(x)(y))

"""
Psi - Psi Bird
"""
psi = f -> g -> x -> y -> f(g(x))(g(y))

"""
W - Warbler
"""
w = f -> x -> f(x)(x)

export i, k, s, b, bb, bbb, b1, c, d2, ki, phi, phi1, psi, w

end

end

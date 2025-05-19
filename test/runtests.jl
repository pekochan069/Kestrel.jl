using Kestrel
using Kestrel.Curried 
using Test

const K = Kestrel
const KC = Kestrel.Curried

@testset "Kestrel.jl" begin

    # I
    @test K.i(1) == 1
    @test K.i(2) != 1
    # K
    @test K.k(1, 2) == 1
    @test K.k(1, 2) != 2
    # S
    @test K.s(K.k, K.i)(1) == 1
    @test K.s((x, y) -> x + y, K.i)(1) == 2
    # B
    @test K.b(K.i, K.i)(1) == 1
    @test K.b((x) -> x + 1, (x) -> x * 2)(1) == 3
    # BB
    @test K.bb(K.i, K.i, K.i)(1) == 1
    @test K.bb((x) -> x + 1, (x) -> x * 2, (x) -> x ^ 3)(1) == 3
    # BBB
    @test K.bbb(K.i, K.i, K.i, K.i)(1) == 1
    @test K.bbb((x) -> x + 1, (x) -> x * 2, (x) -> x ^ 3, (x) -> x + 1)(1) == 17
    # B1
    @test K.b1(K.i, K.k)(1, 2) == 1
    @test K.b1((x) -> x + 1, (x, y) -> x + y)(1, 2) == 4
    # C
    @test K.c(K.k)(1, 2) == 2
    @test K.c(K.k)(1, 2) != 1
    # D2
    @test K.d2(K.i, K.k, K.i)(1, 2) == 1
    @test K.d2(K.i, K.k, K.i)(1, 2) != 2
    # KI
    @test K.ki(1, 2) != 1
    @test K.ki(1, 2) == 2
    # Phi
    @test K.phi(K.i, K.k, K.i)(1) == 1
    # Phi1
    @test K.phi1(K.k, K.k, K.ki)(1, 2) == 1
    # Psi
    @test K.psi(K.k, K.i)(1, 2) == 1
    # W
    @test K.w(K.k)(1) == 1

    # Curried

    # I
    @test KC.i(1) == 1
    @test KC.i(2) != 1
    # K
    @test KC.k(1)(2) == 1
    @test KC.k(1)(2) != 2
    # S
    @test KC.s(KC.k)(KC.i)(1) == 1
    @test KC.s(x -> y -> x + y)(KC.i)(1) == 2
    # B
    @test KC.b(KC.i)(KC.i)(1) == 1
    @test KC.b((x) -> x + 1)((x) -> x * 2)(1) == 3
    # BB
    @test KC.bb(KC.i)(KC.i)(KC.i)(1) == 1
    @test KC.bb((x) -> x + 1)((x) -> x * 2)((x) -> x ^ 3)(1) == 3
    # BBB
    @test KC.bbb(KC.i)(KC.i)(KC.i)(KC.i)(1) == 1
    @test KC.bbb((x) -> x + 1)((x) -> x * 2)((x) -> x ^ 3)((x) -> x + 1)(1) == 17
    # B1
    @test KC.b1(KC.i)(KC.k)(1)(2) == 1
    @test KC.b1((x) -> x + 1)(x -> y -> x + y)(1)(2) == 4
    # C
    @test KC.c(KC.k)(1)(2) == 2
    @test KC.c(KC.k)(1)(2) != 1
    # D2
    @test KC.d2(KC.i)(KC.k)(KC.i)(1)(2) == 1
    @test KC.d2(KC.i)(KC.k)(KC.i)(1)(2) != 2
    # KI
    @test KC.ki(1)(2) != 1
    @test KC.ki(1)(2) == 2
    # Phi
    @test KC.phi(KC.i)(KC.k)(KC.i)(1) == 1
    # Phi1
    @test KC.phi1(KC.k)(KC.k)(KC.ki)(1)(2) == 1
    # Psi
    @test KC.psi(KC.k)(KC.i)(1)(2) == 1
    # W
    @test KC.w(KC.k)(1) == 1

end

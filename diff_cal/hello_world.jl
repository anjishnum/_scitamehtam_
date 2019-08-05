using SymPy
u = SymFunction("u")

@vars x y
@vars a positive=true

eqn = u'(x) - a * u(x) * (1 - u(x))
out = dsolve(eqn)

rhs(x) = x.rhs        # convenience to extract right hand side of an equation
eq = rhs(out)    # just the right hand side
C1 = first(setdiff(free_symbols(eq), (x,a))) # fish out constant
c1 = solve(eq(x=>0) - 1//2, C1)

eq(C1 => c1[1])

x0, y0 = 0, 1//2
dsolve(eqn, u(x), ics=(u, x0, y0))

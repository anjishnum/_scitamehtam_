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

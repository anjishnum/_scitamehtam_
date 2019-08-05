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

@vars k m positive=true
eqn = u''(x) + k/m*u(x)
dsolve(eqn)

@vars a positive=true
dsolve(eqn, x, ics = ((u, 0, -a), (u', 0, 0)))

# --PyError--
#g, l = symbols("g, l", positive=true)
#eqn = u''(x) + g/l*sin(u(x))
#dsolve(eqn)

eqn = u''(x) + g/l * u(x)
dsolve(eqn, x, ics=((u, 0, a), (u', 0, 0)))

out = dsolve(u'(x) - w/H * sqrt(1 + u(x)^2))
eqn = u'(x) - rhs(out)
out1 = dsolve(eqn)

@vars x0 y0 v0 alpha g real=true
@vars x y t
u = SymFunction("u")
a1 = dsolve(u''(t) + 0, t, ics=((u, 0, x0), (u', 0, v0 * cos(alpha))))
a2 = dsolve(u''(t) - g, t, ics=((u, 0, y0), (u', 0, v0 * sin(alpha))))
ts = solve(x - rhs(a1), t)[1]
y = simplify(rhs(a2)(t => ts))

gamma = symbols("gamma")
u = SymFunction("u")
a1 = dsolve(u''(t) + gamma * u'(t),     t, ics=((u, 0, x0), (u', 0, v0 * cos(alpha))))
a2 = dsolve(u''(t) + gamma * u'(t) + g, t, ics=((u, 0, y0), (u', 0, v0 * sin(alpha))))
ts = solve(x - rhs(a1), t)[1]
y = simplify(rhs(a2)(t => ts))

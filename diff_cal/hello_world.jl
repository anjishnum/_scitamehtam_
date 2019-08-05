using SymPy
u = SymFunction("u")

@vars x y
@vars a positive=true

eqn = u'(x) - a * u(x) * (1 - u(x))

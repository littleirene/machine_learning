#higher_order_function.py
def add(x, y, f):
	return f(x) + f(y)
print add(-5, 6, abs)
#tail_recursive.py

def fact_iter(num, product):
	if num == 1:
		print product
	return fact_iter(num - 1, num * product)
def fact(n):
	return fact_iter(n,1)
fact(5)
fact(5,1)


#map_reduce.py
import math
def stand(s):
	return s[0].upper() + s[1:].lower()
def prod(num1, num2):
	return num1 * num2


def char2int(s):
	return {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9}[s]
def fn(x,y):
	return x * 10 + y
def str2int(s):
	return reduce(fn, map(char2int, s))


def is_odd(n):
	return n % 2 ==1

def not_empty(s):
	return s and s.strip()


def not_prime(n):
	if n == 1:
		return True
	for num in range(2, int(math.sqrt(n))+1):
		#print range(2, int(math.sqrt(n))+1)
		#print num
		if n % num == 0:
			return True
	return False 

print map(stand, ['adam', 'LISA', 'barT'])
print reduce(prod, [1,2,3,4])
print str2int('1123443')
print filter(is_odd, [1,2,3,4,5,6,7,8,9])
print filter(not_empty, ['A', '', 'B', None, 'C', ' '])
#print range(1,10)
print filter(not_prime, range(100))
#print not_prime(9)

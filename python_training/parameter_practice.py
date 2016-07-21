#parameter_practice.py
#!/usr/bin/env python
def calc(*numbers):
	sum = 0
	for i in numbers:
		sum = sum + i * i
	return sum
def user(name, age, **kw):
	print 'name:', name, 'age:', age, 'other:', kw
def function(name, age=18, *args, **kw):
	print 'name:', name, 'age:', age, 'args:', args, 'other:', kw
print calc()
print calc(1,2)
user('irene', 18)
user('irene', 18, city='Beijing')
function('irene')
function('irene', 20, 'lala',city='Beijing')
function('irene', 20, 'lala', 'haha', city='Beijing')
args = (1, 2, 3, 4)
kw = {'city': 'Wuhan'}
function(*args, **kw)


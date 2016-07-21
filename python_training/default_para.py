#default_para.py
#!/usr/bin/env python
def pow(x,n=2):
	sum = 1
	if n != 2:
		while n>0:
			sum = sum * x
			n=n-1
	else:
		sum = x * x
	return sum
print pow(3)
print pow(3,3)

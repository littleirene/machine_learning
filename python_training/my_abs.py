#!/usr/bin/env/my_abs.py python
def my_abs(x):
    if not isinstance(x, (int, float)):
        raise TypeError('bad operand type')
    if x >= 0:
        return x
    else:
        return -x
print my_abs(10)
print my_abs('str')
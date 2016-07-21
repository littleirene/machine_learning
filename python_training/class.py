#!/usr/bin/env python

class Student(object):

	def __init__(self, name, score):
		self.name = name
		self.score = score

	def print_score(self):
		print '%s: %s' % (self.name, self.score)

	def get_grade(self):
		if self.score >= 90:
			print 'A'
		elif self.score >= 60:
			print 'B'
		else:
			print 'C'


stu = Student('irene', 90)
stu.print_score()
stu.get_grade()
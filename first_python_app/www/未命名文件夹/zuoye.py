#!/usr/bin/env python

class Memento(object):
	'''
	memo
	'''
	def __init__(self, versionid = 'None', content = '1', operation = '1'):
		self.versionid = versionid
		self.content = content
		self.operation = operation

	def getVersionid(self):
		return self.versionid

	def setVersionid(self, versionid):
		self.versionid = versionid

	def getContent(self):
		return self.content

	def setContent(self, content):
		self.content = content

	def getOperation(self):
		return self.operation

	def setOperation(self, operation):
		self.operation = operation

def copy(a, b):
	a.versionid = b.versionid
	a.content = b.content
	a.operation = b.operation
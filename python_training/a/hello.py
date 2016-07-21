#!/usr/bin/env python3
# -*- coding:utf-8 -*- 

def application(environ, start_response):
    #environ 一个包含所有HTTP请求信息的dict对象
    #start_response 一个发送HTTP响应的函数
    start_response('200 OK', [('Content-Type', 'text/html')])
    #发送HTTP响应的Header
    return '<h1>Hello, %s!</h1>' % (environ['PATH_INFO'][1:] or 'web')
    #从environ里读取PATH_INFO，这样可以显示更加动态的内容

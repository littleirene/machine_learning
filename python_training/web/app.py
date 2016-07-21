#!/usr/bin/env python3
# -*- coding:utf-8 -*-

from flask import Flask, request, render_template

app = Flask(__name__)

#python装饰器功能，将路径‘／’和方法get、post映射到函数home
@app.route('/', methods=['GET', 'POST'])
def home():
    return render_template('home.html')

#python装饰器功能，将路径‘／signin’和方法get映射到函数signin_form
@app.route('/signin', methods=['GET'])
def signin_form():
    return render_template('form.html')

#python装饰器功能，将路径‘／signin’和方法post映射到函数signin
@app.route('/signin', methods=['POST'])
def signin():
    username = request.form['username']
    password = request.form['password']
    if username=='admin' and password=='password':
        return render_template('signin-ok.html', username=username)
    return render_template('form.html', message='Bad username or password', username=username)

if __name__ == '__main__':
    app.run(debug = True)
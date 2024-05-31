import os
import bottle
from bottle import route, run, template

@route('/')
@route('/name/<name>')
def index(name=None):
    return template("/Users/valerijzolotuhin/bottle/venv/index_html.tpl.sb-a9041105-MqA44b", author='Real Python')


@route('/main', method='POST')
def main():
     return template("/Users/valerijzolotuhin/bottle/venv/index_html.tpl.sb-a9041105-MqA44b", author='Real Python')

@route('/theory', method = 'POST')
def theory():
    return template("/Users/valerijzolotuhin/bottle/venv/theory_html.tpl", author='Real Python')

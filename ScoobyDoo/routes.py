"""
Routes and views for the bottle application.
"""

from xml.etree.ElementTree import tostring
from bottle import route, view, request, template
from datetime import datetime
from scipy.optimize import linprog
import numpy as np

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/sevaPF', method=['GET', 'POST'])
@view('sevaP')
def sevaPr():
    """Renders the about page."""
    solution = 'No solution found.'
    debug_info = ''
    if request.method == 'POST':
        result, debug_info = solve_lp(request)
        solution = result.get('solution', 'No solution found.')
    
    return dict(
        title='SevaP',
        year=datetime.now().year,
        solution=solution,
        debug_info=debug_info
    )

@route('/sevaT')
@view('sevaT')
def about():
    """Renders the about page."""
    return dict(
        title='SevaT',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/petyaP')
@view('petyaP')
def about():
    """Renders the about page."""
    return dict(
        title='Практика',
        message='Решение прямых ЗЛП.',
        writeCount1='Число переменных = ',
        writeCount2='Число ограничений = ',
        textButton1='Ввести размеры матрицы',
        textButton2='Получить исходное опорное решение',
        textButton3='Следующее решение',
        writeTable1='Введите коэффициенты целевой функции: F = ',
        writeTable2='Введите коэффициенты системы ограничений:',
        writeTable3='Улучшение опорного решения:',
        warning1='Введите корректно цифру от 1 до 30 для кол-во переменных.',
        warning2='Введите корректно цифру от 1 до 15 для кол-во ограничений.',
        stepText='Шаг № ',
        findSolution='Оптимальное решение найдено: ',
        year=datetime.now().year
    )

@route('/petyaT')
@view('petyaT')
def about():
    """Renders the about page."""
    return dict(
        title='Теория',
        message='Подробный разбор симплекс-метода.',
        year=datetime.now().year
    )
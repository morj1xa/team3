"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime

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

@route('/sevaP')
@view('sevaP')
def about():
    """Renders the about page."""
    return dict(
        title='SevaP',
        message='Your application description page.',
        year=datetime.now().year
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
        writeTable1='Введите коэффициенты целевой функции: F = ',
        writeTable2='Введите коэффициенты системы ограничений:',
        writeTable3='Улучшение опорного решения:',
        warning1='Введите корректно цифру от 1 до 30 для кол-во переменных.',
        warning2='Введите корректно цифру от 1 до 15 для кол-во ограничений.',

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

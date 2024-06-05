from turtle import title
from bottle import route,run, view, request, template
from datetime import datetime
from scipy.optimize import linprog
import numpy as np
import logging
import re
import sympy as sp

def solve_lp(request):
    debug_info = 'start otlad<br>'
    try:
        # Получаем данные из формы
        objective_function = request.forms.get('function')
        constraints = request.forms.get('constraints').strip().split(',')
        variables = request.forms.get('variables').strip().split(',')
        
        # Отладочная информация
        debug_info += f"get func: {objective_function}<br>"
        debug_info += f"get ogr: {constraints}<br>"
        debug_info += f"get per: {variables}<br>"

        # Решаем задачу линейного программирования
        result, more_debug_info = solve_linear_programming(objective_function, constraints, variables)
        debug_info += more_debug_info
        return result, debug_info
    except Exception as e:
        debug_info += f"Error in solve_lp: {e}<br>"
        return {"error": "An error occurred during solving."}, debug_info

def solve_linear_programming(objective_function, constraints, variables):
    debug_info = '<h3 style="color: white;">Debug Information:</h3><br>'
    try:
       
        if not objective_function or not constraints:
            return {"error": "Invalid input format."}

        c = [float(coef.split('*')[0].strip()) for coef in objective_function.split('+')]
        
        A_ub = []
        b_ub = []

        debug_info += f'<strong style="color: white;">Objective Function (c):</strong> {objective_function}<br>'
        debug_info += f'<strong style="color: white;">Constraints (A_ub, b_ub):</strong><br>'

        for constraint in constraints:
            parts = constraint.strip().split('<=')
            expression = parts[0]
            constraint_value = parts[1]
            coefficients = []
            for variable in variables:
                term = sp.parse_expr(variable)
                coef = float(sp.diff(expression, term))
                coefficients.append(coef)
            A_ub.append(coefficients)
            b_ub.append(float(constraint_value))
            
            debug_info += f'<strong style="color: white;">Constraint:</strong> {coefficients} <= {constraint_value}<br>'
        if len(A_ub) == 0:
            return {"error": "No constraints provided."}

        debug_info += f'<strong style="color: white;">A_ub:</strong> {A_ub}<br>'
        debug_info += f'<strong style="color: white;">b_ub:</strong> {b_ub}<br>'

        A_ub = np.array(A_ub)
        b_ub = np.array(b_ub)
        c = np.array(c)

        res = linprog(c, A_ub=A_ub, b_ub=b_ub, method='simplex')
        
        debug_info += f'<strong style="color: white;">Result of linprog:</strong> {res}<br>'

        if res.success:
            solution = {variable.strip(): value for variable, value in zip(variables, res.x)}
            solution_str = '<br>'.join([f'<strong style="color: white;">{key}:</strong> {value}' for key, value in solution.items()])
            debug_info += f'<h3 style="color: white;">Solution:</h3> {solution_str}'
            return {"solution": solution}, debug_info
        else:
            return {"error": "No optimal solution found."}, debug_info
    except Exception as e:
        debug_info += f'<strong style="color: white;">Error in solve_linear_programming:</strong> {e}<br>'
        return {"error": "An error occurred during solving."}, debug_info
run(host='localhost', port=8080, debug=True)
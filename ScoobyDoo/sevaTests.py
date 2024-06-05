import unittest
from solution import solve_linear_programming

class sevaTests(unittest.TestCase):
    
    def test_optimal_solution(self):
        objective_function = "3*x1 + 2*x2 + 4*x3"
        constraints = ["2*x1 + 3*x2 + x3 <= 5", "4*x1 + x2 <= 11", "x1 + x2 + x3 <= 8"]
        variables = ["x1", "x2", "x3"]
        solution, debug_info = solve_linear_programming(objective_function, constraints, variables)
        self.assertEqual(solution, {'solution': {'x1': 0.0, 'x2': 0.0, 'x3': 0.0}} )
        
    def test_no_optimal_solution(self):
        objective_function = "3*x1 + 2*x2 + 4*x3"
        constraints = ["x1 + x2 + x3 >= 20"]
        variables = ["x1", "x2", "x3"]
        solution, debug_info = solve_linear_programming(objective_function, constraints, variables)
        self.assertTrue("error" in solution)
        self.assertEqual(solution["error"], "An error occurred during solving.")
        
    def test_invalid_input(self):
        objective_function = "3*x1 + 2*x2 + 4*x3"
        constraints = ["2*x1 + 3*x2 + x3 <= 5" " 4*x1 + x2 <= 11", " x1 + x2 + x3 <= 8"]
        variables = ["x1", "x2", "x3"]
        solution, debug_info = solve_linear_programming(objective_function, constraints, variables)
        self.assertTrue("error" in solution)
        self.assertEqual(solution["error"], "An error occurred during solving.")
        
    def test_empty_constraints(self):
        objective_function = "3*x1 + 2*x2 + 4*x3"
        constraints = []
        variables = ["x1", "x2", "x3"]
        solution, debug_info = solve_linear_programming(objective_function, constraints, variables)
        self.assertTrue("error" in solution)
        self.assertEqual(solution["error"], "No constraints provided.")
        
if __name__ == '__main__':
    unittest.main()
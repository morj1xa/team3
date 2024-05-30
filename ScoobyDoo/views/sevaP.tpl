% rebase('layout.tpl', title=title, year=year)

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linear Programming Solver</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Linear Programming Solver</h1>

        <div class="section">
            <h2>Primal LP Problem</h2>
            <label for="objective">Objective Function:</label>
            <input type="text" id="objective" placeholder="Enter objective function coefficients">
            <!-- Add more input fields for constraints if needed -->
        </div>

        <div class="section">
            <h2>Dual LP Problem</h2>
            <label for="dual-objective">Dual Objective Function:</label>
            <input type="text" id="dual-objective" placeholder="Enter dual objective function coefficients">
            <!-- Add more input fields for dual constraints if needed -->
        </div>

        <button onclick="solveLP()">Solve</button>

        <div class="results" id="results">
            <!-- Results will be displayed here -->
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
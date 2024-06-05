% rebase('layout.tpl', title=title or 'Linear Programming Solver', year=year or '2023')

<!DOCTYPE html>
<html>
<head>
    <title>{{title}}</title>
</head>
<body>
    <div class="seva-pract-window">
        <h1 class="theory-seva-h1">Linear Programming Solver</h1>
        <form method="post" action="/sevaPF">
            <div class="input-div">
                <div class="input-container input-floating">
                    <input type="text" class="input-field" id="function" placeholder="" name="function" required>
                    <label for="function" class="input-label">Objective Function (Minimize)</label>
                </div>
                <div class="textarea-container textarea-floating">
                    <textarea class="textarea-field" id="constraints" placeholder="" name="constraints" required></textarea>
                    <label for="constraints" class="textarea-label">Constraints (one per line)</label>
                </div>
                <div class="input-container input-floating">
                    <input type="text" class="input-field" placeholder="" id="variables" name="variables" required>
                    <label for="variables" class="input-label">Variables (comma-separated)</label>
                </div>
                <div class="button-container">
                    <input class="btn" type="submit">Solve</input>
                </div>
            </div>
        </form>
        <h2 class="theory-seva-h2">Solution</h2>
        <p class="theory-sevaT">{{solution}}</p>
        <h2 class="theory-seva-h2">Debug Information:</h2>
        <p class="theory-sevaT">{{!debug_info}}</p>
    </div>
</body>
</html>
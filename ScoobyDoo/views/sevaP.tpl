% rebase('layout.tpl', title=title, year=year)

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linear Programming Solver</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/glpk.js/4.65.0/glpk.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</head>
<body>
    <div class="seva-pract-window">
        <h1 class="theory-seva-h1">Linear Programming Solver</h1>
        <form id="lp-form">
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
                  <button class="btn">Solve</button>
            </div>
        </div>
        
        </form>
        <div>
            <h2 class="theory-seva-h2">Solution</h2>
            <div id="solution"></div>
        </div>
        
        
    </div>
        
</body>
</html>
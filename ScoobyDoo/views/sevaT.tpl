% rebase('layout.tpl', title=title, year=year)
<!DOCTYPE html>
<html lang="en">


<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
    </script>

<div class="seva-t">
    <img class="vector-4" src="/static/assets/vectors/vector_1_x2.svg" />
    <img class="vector-2" src="/static/assets/vectors/vector_2_x2.svg" />
    <img class="vector-3" src="/static/assets/vectors/vector_3_x2.svg" />
    <div class="rectangle-2">
        <span class="theory">
            theory
        </span>
        <title>Dual Problem for Linear Programming (LP) and its Solution</title>
        </head>
        <body>
            <h1 class="theory-seva-h1">Dual Problem for Linear Programming (LP) and its Solution</h1>

            <p class="theory-sevaT">For the given Linear Programming (LP) problem, let's formulate the dual problem and discuss the process of solving it.</p>

            <h2 class="theory-seva-h2">Linear Programming (LP):</h2>
            <p class="theory-sevaT">The LP problem is typically formulated as follows:</p>
            <p class="theory-sevaT">Minimize \( \mathbf{c}^T \mathbf{x} \) subject to \( \mathbf{Ax} \leq \mathbf{b} \), \( \mathbf{x} \geq \mathbf{0} \)</p>
            <p class="theory-sevaT">Where:</p>
            <ul class="theory-sevaT">
                <li>\( \mathbf{c} \) is the coefficient vector of the objective function,</li>
                <li>\( \mathbf{x} \) is the solution variable vector,</li>
                <li>\( \mathbf{A} \) is the coefficient matrix of the constraints,</li>
                <li>\( \mathbf{b} \) is the right-hand side vector of the constraints.</li>
            </ul>

            <h2 class="theory-seva-h2">Dual Problem:</h2>
            <p class="theory-sevaT">The dual problem is associated with the LP problem and is formulated as follows:</p>
            <p class="theory-sevaT">Maximize \( \mathbf{y}^T \mathbf{b} \) subject to \( \mathbf{y}^T \mathbf{A} \leq \mathbf{c} \), \( \mathbf{y} \geq \mathbf{0} \).</p>
            <p class="theory-sevaT">Where:</p>
            <ul class="theory-sevaT">
                <li>\( \mathbf{y} \) is the vector of dual variables.</li>
            </ul>

            <h2 class="theory-seva-h2">Solution of the Dual Problem:</h2>
            <ol class="theory-sevaT">
                <li><strong>Formulation of the Dual Problem:</strong> We start by formulating the dual problem based on the given LP problem.</li>
                <li><strong>Finding the Solution:</strong> After formulating the dual problem, we can use standard LP solving methods to find its solution. This could involve the simplex method, interior point method, etc.</li>
                <li><strong>Interpreting the Solution:</strong> The solution of the dual problem provides information about the price of each resource or constraint in the LP problem. This information can be valuable for understanding the impact of changes in resources on the optimal solution of the LP problem.</li>
            </ol>

            <p class="theory-sevaT">Applying the dual problem approach allows us to gain additional insights into the LP problem, which can be useful for understanding and optimizing the system.</p>
        </body>
        </html>
    </div>
    

</div>
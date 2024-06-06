% rebase('layout.tpl', title=title, year=year)

<!DOCTYPE html>
<html lang="en">


<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/scipy/dist/scipy.min.js"></script>



<div class="petya-p">
    <img class="vector-4" src="/static/assets/vectors/vector_1_x2.svg" />
    <img class="vector-2" src="/static/assets/vectors/vector_2_x2.svg" />
    <img class="vector-3" src="/static/assets/vectors/vector_3_x2.svg" />
    <body>
        <div class="rectangle-2">
            <span class="theory2">
                {{ title }}
            </span>
            <title>{{ message }}</title>
            </head>
                <h1 class="theory-petya-h1"><center>{{ message }}</center></h1>
                <div class="input-container input-floating"><center>
                    <h2 class="theory-seva-h2">{{writeCount1}}</h2>
                    <input type="text" class="input-field" style="max-width: 80px; font-size: 20px; text-align: center; font-weight: bold;" placeholder="" id="variables" name="variables" required>
                </center></div>

                <div class="input-container input-floating"><center>
                    <h2 class="theory-seva-h2">{{writeCount2}}</h2>
                    <input type="text" class="input-field" style="max-width: 80px; font-size: 20px; text-align: center; font-weight: bold;" placeholder="" id="restrictions" name="restrictions" required>    
                </center></div>

                <div class="button-container-big-gun"><center>
                      <button class="btn-big-gun" onClick="sizeClick()">{{textButton1}}</button>
                </center></div>

                <div id="textTable1"><h2 class="theory-seva-h2"></h2></div>

                <center><div id="table-container1"></div></center> <!-- контейнер для таблицы -->

                <div id="textTable2"><h2 class="theory-seva-h2"></h2></div>

                <center><div id="table-container2"></div></center> <!-- контейнер для таблицы -->

                <div class="button-container-big-gun"><center>
                      <button class="btn-big-gun" onClick="updateClick()">{{textButton2}}</button>
                </center></div>

                <div id="textTable3"><h2 class="theory-seva-h2"></h2></div>

                <center><div id="table-container3"></div></center> <!-- контейнер для таблицы -->

                <div class="button-container-big-gun">
                      <button class="btn-big-gun" onClick="nextSolution()">{{textButton3}}</button>
                </div>

                <div id="stepHeader"><h2 class="theory-seva-h2"></h2></div>
            </html>
        </div>

        <script> 
            function simplexMethod(c, A, b) {
                // Инициализация базисного плана
                let basis = [];
                for (let i = 0; i < b.length; i++) {
                    basis.push(i + c.length);
                }

                // Добавление фиктивных переменных
                let tableau = [];
                for (let i = 0; i < b.length; i++) {
                    tableau.push([...A[i], 1, b[i]]);
                }
                tableau.unshift([...c, 0]);

                while (true) {
                    // Находим входящую переменную
                    let entering = null;
                    for (let j = 0; j < tableau[0].length - 1; j++) {
                        if (tableau[0][j] > 0) {
                            entering = j;
                            break;
                        }
                    }
                    if (entering === null) break; // Решение найдено

                    // Находим выходящую переменную
                    let minRatio = Infinity;
                    let departing = null;
                    for (let i = 1; i < tableau.length; i++) {
                        if (tableau[i][entering] > 0) {
                            let ratio = tableau[i][tableau[i].length - 1] / tableau[i][entering];
                            if (ratio < minRatio) {
                                minRatio = ratio;
                                departing = i;
                            }
                        }
                    }
                    if (departing === null) {
                        // Нет ограничений на входящую переменную, задача не ограничена
                        return null;
                    }

                    // Пересчет таблицы
                    for (let i = 0; i < tableau.length; i++) {
                        if (i !== departing) {
                            let factor = tableau[i][entering] / tableau[departing][entering];
                            for (let j = 0; j < tableau[i].length; j++) {
                                tableau[i][j] -= factor * tableau[departing][j];
                            }
                        }
                    }

                    // Обновление базиса
                    basis[departing - 1] = entering;
                }

                // Формирование результата
                let result = {};
                for (let i = 0; i < c.length; i++) {
                    result[i] = 0;
                }
                for (let i = 0; i < basis.length; i++) {
                    result[basis[i]] = tableau[i + 1][tableau[i + 1].length - 1];
                }

                console.log(result); // Вывод результата в консоль

                return result;
            }


            /*// Функция для вызова симплекс метода и обновления таблицы
            function simplexMethod() {
                var variablesValue = parseInt(document.getElementById('variables').value);
                var restrictionsValue = parseInt(document.getElementById('restrictions').value);

                // Считывание коэффициентов функции цели
                var table1 = document.getElementById('table-container1').getElementsByTagName('table')[0];
                var row1 = table1.getElementsByTagName('tr')[1];
                var inputs1 = row1.getElementsByTagName('input');
                var c = [];
                for (var i = 0; i < inputs1.length; i++) {
                    c.push(parseFloat(inputs1[i].value) || 0);
                }

                // Считывание коэффициентов ограничений
                var table2 = document.getElementById('table-container2').getElementsByTagName('table')[0];
                var rows2 = table2.getElementsByTagName('tr');
                var A = [];
                var b = [];
                for (var i = 1; i < rows2.length; i++) { // начинаем с 1, чтобы пропустить заголовок
                    var inputs2 = rows2[i].getElementsByTagName('input');
                    var rowA = [];
                    for (var j = 0; j < inputs2.length - 1; j++) {
                        rowA.push(parseFloat(inputs2[j].value) || 0);
                    }
                    A.push(rowA);
                    b.push(parseFloat(inputs2[inputs2.length - 1].value) || 0);
                }

                // Использование функции линейного программирования из библиотеки scipy
                var result = scipy.optimize.linprog(c, A_ub=A, b_ub=b, method='simplex');
    
                // Обновление значения F
                var table3 = document.getElementById('table-container3').getElementsByTagName('table')[0];
                var row3 = table3.getElementsByTagName('tr')[1]; // Получаем первую строку таблицы (индекс 1)
                var cells = row3.getElementsByTagName('td'); // Получаем все ячейки строки
                cells[0].getElementsByTagName('input')[0].value = result.fun.toFixed(2); // Обновление значения F

                console.log(result);
            }*/    

            var a = [];
            var Value;

            function sizeClick() {
                var variablesValue = parseInt(document.getElementById('variables').value);
                var restrictionsValue = parseInt(document.getElementById('restrictions').value);

                // Проверка на ввод числа от 0 до 30
                if (variablesValue < 0 || variablesValue >= 30 || isNaN(variablesValue)) {
                    alert("{{ warning1 }}");
                    return false;
                }

                // Проверка на ввод числа от 0 до 15
                if (restrictionsValue < 0 || restrictionsValue >= 15 || isNaN(restrictionsValue)) {
                    alert("{{ warning2 }}");
                    return false;
                }

                document.getElementById("textTable1").getElementsByTagName("h2")[0].textContent = "{{writeTable1}}";
                document.getElementById("textTable2").getElementsByTagName("h2")[0].textContent = "{{writeTable2}}";

                // Первая таблица
                var tableHTML = '<table border="1">';
                tableHTML += '<tr>';
                for (var j = 1; j <= variablesValue; j++) {
                    tableHTML += '<th>x' + j + '</th>';
                }
                tableHTML += '</tr>';
                tableHTML += '<tr>';
                for (var k = 0; k < variablesValue; k++) {
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;"></td>';
                }
                tableHTML += '</tr>';
                tableHTML += '</table>';

                var tableContainer = document.getElementById('table-container1');
                if (tableContainer.firstChild) {
                    tableContainer.removeChild(tableContainer.firstChild);
                }
                tableContainer.insertAdjacentHTML('beforeend', tableHTML);

                // Вторая таблица
                tableHTML = '<table border="1">';
                tableHTML += '<tr>';
                tableHTML += '<th></th>';
                for (var j = 1; j <= variablesValue; j++) {
                    tableHTML += '<th>x' + j + '</th>';
                }
                tableHTML += '<th>b</th>';
                tableHTML += '</tr>';
                for (var i = 1; i <= restrictionsValue; i++) {
                    tableHTML += '<tr>';
                    tableHTML += '<th>' + i + '</th>';
                    for (var k = 0; k < variablesValue; k++) {
                        tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;"></td>';
                    }
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;"></td>';
                    tableHTML += '</tr>';
                }
                tableHTML += '</table>';

                tableContainer = document.getElementById('table-container2');
                if (tableContainer.firstChild) {
                    tableContainer.removeChild(tableContainer.firstChild);
                }
                tableContainer.insertAdjacentHTML('beforeend', tableHTML);

                // Инициализация матрицы a
                a = new Array(restrictionsValue).fill().map(() => new Array(variablesValue + 1).fill(0));

                return true;
            }

            function updateClick() {
                var variablesValue = parseInt(document.getElementById('variables').value);
                var restrictionsValue = parseInt(document.getElementById('restrictions').value);

                // Проверка на ввод числа от 0 до 30
                if (variablesValue < 0 || variablesValue >= 30 || isNaN(variablesValue)) {
                    alert("{{ warning1 }}");
                    return false;
                }

                // Проверка на ввод числа от 0 до 15
                if (restrictionsValue < 0 || restrictionsValue >= 15 || isNaN(restrictionsValue)) {
                    alert("{{ warning2 }}");
                    return false;
                }

                document.getElementById("textTable3").getElementsByTagName("h2")[0].textContent = "{{writeTable3}}";

                // Считывание значений из первой таблицы
                var table1 = document.getElementById('table-container1').getElementsByTagName('table')[0];
                var row1 = table1.getElementsByTagName('tr')[1];
                var inputs1 = row1.getElementsByTagName('input');
                var mas = [];
                for (var i = 0; i < inputs1.length; i++) {
                    mas.push(parseFloat(inputs1[i].value) || 0);
                }

                // Считывание значений из второй таблицы
                var table2 = document.getElementById('table-container2').getElementsByTagName('table')[0];
                var rows2 = table2.getElementsByTagName('tr');
                for (var i = 1; i < rows2.length; i++) { // начинаем с 1, чтобы пропустить заголовок
                    var inputs2 = rows2[i].getElementsByTagName('input');
                    for (var j = 0; j < inputs2.length; j++) {
                        a[i - 1][j] = parseFloat(inputs2[j].value) || 0;
                    }
                }

                /*// Считывание значений из первой таблицы (коэффициенты функции цели)
                var table1 = document.getElementById('table-container1').getElementsByTagName('table')[0];
                var row1 = table1.getElementsByTagName('tr')[1];
                var inputs1 = row1.getElementsByTagName('input');
                var c = [];
                for (var i = 0; i < inputs1.length; i++) {
                    c.push(parseFloat(inputs1[i].value) || 0);
                }

                // Считывание значений из второй таблицы (коэффициенты ограничений)
                var table2 = document.getElementById('table-container2').getElementsByTagName('table')[0];
                var rows2 = table2.getElementsByTagName('tr');
                var A = [];
                var b = [];
                for (var i = 1; i < rows2.length; i++) { // начинаем с 1, чтобы пропустить заголовок
                    var inputs2 = rows2[i].getElementsByTagName('input');
                    var rowA = [];
                    for (var j = 0; j < inputs2.length - 1; j++) {
                        rowA.push(parseFloat(inputs2[j].value) || 0);
                    }
                    A.push(rowA);
                    b.push(parseFloat(inputs2[inputs2.length - 1].value) || 0);
                }

                // Вызов функции simplexMethod() с полученными данными
                Value = simplexMethod(c, A, b);*/

                // Третья таблица
                var tableHTML = '<table border="1">';
                tableHTML += '<tr>';
                tableHTML += '<th>Basis</th>';
                tableHTML += '<th>BP</th>';
                for (var j = 1; j <= variablesValue; j++) {
                    tableHTML += '<th>x' + j + '</th>';
                }
                tableHTML += '</tr>';

                // Первая строка с F
                tableHTML += '<tr>';
                tableHTML += '<th>F</th>';
                tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" value="' + 0 + '" readonly></td>';
                for (var j = 0; j < variablesValue; j++) {
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" value="' + (mas[j] * -1).toFixed(2) + '" readonly></td>';
                    //tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" value="' + (c[j] * -1).toFixed(2) + '" readonly></td>';

                }
                tableHTML += '</tr>';

                // Остальные строки
                for (var i = 0; i < restrictionsValue; i++) {
                    tableHTML += '<tr>';
                    tableHTML += '<th>x' + (i + 10) + '</th>'; // Заголовки строк
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" value="' + a[i][variablesValue].toFixed(2) + '" readonly></td>'; // Столбец BP
                    for (var j = 0; j < variablesValue; j++) {
                        tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" value="' + a[i][j].toFixed(2) + '" readonly></td>';
                    }
                    tableHTML += '</tr>';
                }
                tableHTML += '</table>';

                var tableContainer = document.getElementById('table-container3');
                if (tableContainer.firstChild) {
                    tableContainer.removeChild(tableContainer.firstChild);
                }
                tableContainer.insertAdjacentHTML('beforeend', tableHTML);

                var count = 0; // Инициализация переменной count
                var stepText = "{{stepText}}"; // Инициализация переменной step
                var step = stepText + count; // Инициализация переменной step

                step = stepText + count; // Добавляем текущее значение count к строке step
                count++;
                document.getElementById("stepHeader").getElementsByTagName("h2")[0].textContent = step; // Обновляем содержимое <h2> элемента

                //simplexMethod(); // Вызов функции для нахождения оптимального решения

                return true;
            }

            var count = 1; // Инициализация переменной count
            var stepText = "{{stepText}}"; // Инициализация переменной step
            var step = stepText + count; // Инициализация переменной step

            function nextSolution() {
                var table3 = document.getElementById('table-container3').getElementsByTagName('table')[0];
                var row3 = table3.getElementsByTagName('tr')[1]; // Получаем первую строку таблицы (индекс 1)
                var cells = row3.getElementsByTagName('td'); // Получаем все ячейки строки
                var fValue = cells[0].getElementsByTagName('input')[0].value.trim(); // Значение в ячейке под шапкой "F"

                var solutionText = "{{findSolution}}" + fValue; // Строка с решением
                //var solutionText = "{{findSolution}}" + Value; // Строка с решением

                if (count < 9) {
                    step = stepText + count; // Добавляем текущее значение count к строке step
                    count++;
                    document.getElementById("stepHeader").getElementsByTagName("h2")[0].textContent = step; // Обновляем содержимое <h2> элемента
                }
                else document.getElementById("stepHeader").getElementsByTagName("h2")[0].textContent = solutionText;
                console.log(solutionText);
            }           
        </script>
    </body>
</div>


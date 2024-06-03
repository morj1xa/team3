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
                    <input type="text" class="input-field" placeholder="" id="variables" name="variables" required>
                </center></div>

                <div class="input-container input-floating"><center>
                    <h2 class="theory-seva-h2">{{writeCount2}}</h2>
                    <input type="text" class="input-field" placeholder="" id="restrictions" name="restrictions" required>    
                </center></div>

                <div class="button-container-big-gun"><center>
                      <button class="btn-big-gun">{{textButton1}}</button>
                </center></div>

                <h2 class="theory-seva-h2">{{writeTable1}}</h2>

                <div id="table-container1"></div> <!-- контейнер для таблицы -->

                <h2 class="theory-seva-h2">{{writeTable2}}</h2>

                <div id="table-container2"></div> <!-- контейнер для таблицы -->

                <div class="button-container-big-gun"><center>
                      <button class="btn-big-gun">{{textButton2}}</button>
                </center></div>
            </html>
        </div>

        <script> 
        //первая таблица
            document.querySelector('.btn-big-gun').addEventListener('click', function() { 
                var variablesValue = document.getElementById('variables').value; 
                var tableHTML = '<table border="1">';
            
                tableHTML += '<tr>'; // Создаем первую строку с заголовками
                for (var j = 1; j <= variablesValue; j++) { 
                    tableHTML += '<th>x' + j + '</th>'; // Создаем заголовки x1, x2, ..., xn
                } 
                tableHTML += '</tr>';
            
                tableHTML += '<tr>'; // Создаем вторую строку с пустыми ячейками для ввода
                for (var k = 0; k < variablesValue; k++) { 
                    tableHTML += '<td><input type="text"></td>'; // Создаем пустые ячейки для ввода
                } 
                tableHTML += '</tr>';
             
                tableHTML += '</table>'; 
            
                // Удаляем старую таблицу, если она существует
                var tableContainer = document.getElementById('table-container1');
                if (tableContainer.firstChild) {
                    tableContainer.removeChild(tableContainer.firstChild);
                }
            
                // Добавляем новую таблицу
                tableContainer.insertAdjacentHTML('beforeend', tableHTML);
            }); 
        </script>
        
        <script>
        //вторая таблица
            document.querySelector('.btn-big-gun').addEventListener('click', function() {
                var variablesValue = document.getElementById('variables').value;
                var restrictionsValue = document.getElementById('restrictions').value;
                var tableHTML = '<table border="1">';

                // Создаем заголовки для столбцов
                tableHTML += '<tr>';
                tableHTML += '<th></th>'; // Пустая ячейка в верхнем левом углу
                for (var j = 1; j <= variablesValue; j++) {
                    tableHTML += '<th>x' + j + '</th>'; // Создаем заголовки x1, x2, ..., xn
                }
                tableHTML += '</tr>';

                // Создаем строки с заголовками для строк
                for (var i = 1; i <= restrictionsValue; i++) {
                    tableHTML += '<tr>';
                    tableHTML += '<th>' + i + '</th>'; // Создаем заголовки 1, 2, ..., n для строк
                    for (var k = 0; k < variablesValue; k++) {
                        tableHTML += '<td><input type="text"></td>'; // Создаем пустые ячейки для ввода
                    }
                    tableHTML += '</tr>';
                }

                tableHTML += '</table>';

                // Удаляем старую таблицу, если она существует
                var tableContainer = document.getElementById('table-container2');
                if (tableContainer.firstChild) {
                    tableContainer.removeChild(tableContainer.firstChild);
                }

                // Добавляем новую таблицу
                tableContainer.insertAdjacentHTML('beforeend', tableHTML);
            });
        </script>
    </body>
</div>


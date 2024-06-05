% rebase('layout.tpl', title=title, year=year)

<!DOCTYPE html>
<html lang="en">


<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
    </script>


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

                <center><div id="table-container1"></div></center> <!-- ��������� ��� ������� -->

                <div id="textTable2"><h2 class="theory-seva-h2"></h2></div>

                <center><div id="table-container2"></div></center> <!-- ��������� ��� ������� -->

                <div class="button-container-big-gun"><center>
                      <button class="btn-big-gun" onClick="updateClick()">{{textButton2}}</button>
                </center></div>

                <div id="textTable3"><h2 class="theory-seva-h2"></h2></div>

                <center><div id="table-container3"></div></center> <!-- ��������� ��� ������� -->

                <div class="button-container-big-gun">
                      <button class="btn-big-gun" onClick="nextSolution()">{{textButton3}}</button>
                </div>

                <div id="stepHeader"><h2 class="theory-seva-h2"></h2></div>
            </html>
        </div>

        <script> 
            var a = [];

            function sizeClick() {
                var variablesValue = parseInt(document.getElementById('variables').value);
                var restrictionsValue = parseInt(document.getElementById('restrictions').value);

                // �������� �� ���� ����� �� 0 �� 30
                if (variablesValue < 0 || variablesValue >= 30 || isNaN(variablesValue)) {
                    alert("{{ warning1 }}");
                    return false;
                }

                // �������� �� ���� ����� �� 0 �� 15
                if (restrictionsValue < 0 || restrictionsValue >= 15 || isNaN(restrictionsValue)) {
                    alert("{{ warning2 }}");
                    return false;
                }

                document.getElementById("textTable1").getElementsByTagName("h2")[0].textContent = "{{writeTable1}}";
                document.getElementById("textTable2").getElementsByTagName("h2")[0].textContent = "{{writeTable2}}";

                // ������ �������
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

                // ������ �������
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

                // ������������� ������� a
                a = new Array(restrictionsValue).fill().map(() => new Array(variablesValue + 1).fill(0));

                return true;
            }

            function updateClick() {
                var variablesValue = parseInt(document.getElementById('variables').value);
                var restrictionsValue = parseInt(document.getElementById('restrictions').value);

                // �������� �� ���� ����� �� 0 �� 30
                if (variablesValue < 0 || variablesValue >= 30 || isNaN(variablesValue)) {
                    alert("{{ warning1 }}");
                    return false;
                }

                // �������� �� ���� ����� �� 0 �� 15
                if (restrictionsValue < 0 || restrictionsValue >= 15 || isNaN(restrictionsValue)) {
                    alert("{{ warning2 }}");
                    return false;
                }

                document.getElementById("textTable3").getElementsByTagName("h2")[0].textContent = "{{writeTable3}}";

                // ���������� �������� �� ������ �������
                var table1 = document.getElementById('table-container1').getElementsByTagName('table')[0];
                var row1 = table1.getElementsByTagName('tr')[1];
                var inputs1 = row1.getElementsByTagName('input');
                var mas = [];
                for (var i = 0; i < inputs1.length; i++) {
                    mas.push(parseFloat(inputs1[i].value) || 0);
                }

                // ���������� �������� �� ������ �������
                var table2 = document.getElementById('table-container2').getElementsByTagName('table')[0];
                var rows2 = table2.getElementsByTagName('tr');
                for (var i = 1; i < rows2.length; i++) { // �������� � 1, ����� ���������� ���������
                    var inputs2 = rows2[i].getElementsByTagName('input');
                    for (var j = 0; j < inputs2.length; j++) {
                        a[i - 1][j] = parseFloat(inputs2[j].value) || 0;
                    }
                }

                // ������ �������
                var tableHTML = '<table border="1">';
                tableHTML += '<tr>';
                tableHTML += '<th>Basis</th>';
                tableHTML += '<th>BP</th>';
                for (var j = 1; j <= variablesValue; j++) {
                    tableHTML += '<th>x' + j + '</th>';
                }
                tableHTML += '</tr>';

                // ������ ������ � F
                tableHTML += '<tr>';
                tableHTML += '<th>F</th>';
                tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" value="' + 0 + '" readonly></td>';
                for (var j = 0; j < variablesValue; j++) {
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" value="' + (mas[j] * -1).toFixed(2) + '" readonly></td>';
                }
                tableHTML += '</tr>';

                // ��������� ������
                for (var i = 0; i < restrictionsValue; i++) {
                    tableHTML += '<tr>';
                    tableHTML += '<th>x' + (i + 10) + '</th>'; // ��������� �����
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" value="' + a[i][variablesValue].toFixed(2) + '" readonly></td>'; // ������� BP
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

                var count = 0; // ������������� ���������� count
                var stepText = "{{stepText}}"; // ������������� ���������� step
                var step = stepText + count; // ������������� ���������� step

                step = stepText + count; // ��������� ������� �������� count � ������ step
                count++;
                document.getElementById("stepHeader").getElementsByTagName("h2")[0].textContent = step; // ��������� ���������� <h2> ��������
                return true;
            }
        </script>

        <script>
            var count = 1; // ������������� ���������� count
            var stepText = "{{stepText}}"; // ������������� ���������� step
            var step = stepText + count; // ������������� ���������� step
            
            var findText = "{{findSolution}}";
            var solution = 123;
            var solution = findText + solution; // ������������� ���������� step

            function nextSolution() {
                if (count < 9) {
                    step = stepText + count; // ��������� ������� �������� count � ������ step
                    count++;
                    document.getElementById("stepHeader").getElementsByTagName("h2")[0].textContent = step; // ��������� ���������� <h2> ��������
                }
                else document.getElementById("stepHeader").getElementsByTagName("h2")[0].textContent = solution;
            }           
        </script>
    </body>
</div>


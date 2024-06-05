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
            function sizeClick() {
                var variablesValue = document.getElementById('variables').value;
                var restrictionsValue = document.getElementById('restrictions').value; 

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
                document.getElementById("textTable1").getElementsByTagName("h2")[0].textContent = "{{writeTable1}}"; // ��������� ���������� <h2> ��������
                document.getElementById("textTable2").getElementsByTagName("h2")[0].textContent = "{{writeTable2}}"; // ��������� ���������� <h2> ��������

                //������ �������
                var tableHTML = '<table border="1">';
            
                tableHTML += '<tr>'; // ������� ������ ������ � �����������
                for (var j = 1; j <= variablesValue; j++) { 
                    tableHTML += '<th>x' + j + '</th>'; // ������� ��������� x1, x2, ..., xn
                } 
                tableHTML += '</tr>';
            
                tableHTML += '<tr>'; // ������� ������ ������ � ������� �������� ��� �����
                for (var k = 0; k < variablesValue; k++) { 
                    tableHTML += '<td><input type="text"  style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;"></td>'; // ������� ������ ������ ��� �����
                } 
                tableHTML += '</tr>';
             
                tableHTML += '</table>'; 
            
                // ������� ������ �������, ���� ��� ����������
                var tableContainer = document.getElementById('table-container1');
                if (tableContainer.firstChild) {
                    tableContainer.removeChild(tableContainer.firstChild);
                }
            
                // ��������� ����� �������
                tableContainer.insertAdjacentHTML('beforeend', tableHTML);


                //������ ������� 
                var tableHTML = '<table border="1">';

                // ������� ��������� ��� ��������
                tableHTML += '<tr>';
                tableHTML += '<th></th>'; // ������ ������ � ������� ����� ����
                for (var j = 1; j <= variablesValue; j++) {
                    tableHTML += '<th>x' + j + '</th>'; // ������� ��������� x1, x2, ..., xn
                }
                tableHTML += '<th>b</th>'; // ��������� ��������� ��� ������� b
                tableHTML += '</tr>';

                // ������� ������ � ����������� ��� �����
                for (var i = 1; i <= restrictionsValue; i++) {
                    tableHTML += '<tr>';
                    tableHTML += '<th>' + i + '</th>'; // ������� ��������� 1, 2, ..., n ��� �����
                    for (var k = 0; k < variablesValue; k++) {
                        tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;"></td>'; // ������� ������ ������ ��� �����
                    }
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;"></td>'; // ��������� ������ ��� ����� b
                    tableHTML += '</tr>';
                }

                tableHTML += '</table>';

                // ������� ������ �������, ���� ��� ����������
                var tableContainer = document.getElementById('table-container2');
                if (tableContainer.firstChild) {
                    tableContainer.removeChild(tableContainer.firstChild);
                }

                // ��������� ����� �������
                tableContainer.insertAdjacentHTML('beforeend', tableHTML);
                return true;
            }
        </script>

        <script> 
            function updateClick() {
                var variablesValue = document.getElementById('variables').value;
                var restrictionsValue = document.getElementById('restrictions').value; 
                //������ ������ �������
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

                document.getElementById("textTable3").getElementsByTagName("h2")[0].textContent = "{{writeTable3}}"; // ��������� ���������� <h2> ��������
                //������ ������� 
                var tableHTML = '<table border="1">';

                // ������� ��������� ��� ��������
                tableHTML += '<tr>';
                tableHTML += '<th>Basis</th>'; // ������ ������ � ������� ����� ����

                tableHTML += '<th>BP</th>'; // ��������� ��������� ��� ������� ��

                for (var j = 1; j <= variablesValue; j++) {
                    tableHTML += '<th>x' + j + '</th>'; // ������� ��������� x1, x2, ..., xn
                }
                tableHTML += '</tr>';

                // ������� ������ � ����������� ��� �����
                tableHTML += '<tr>';
                tableHTML += '<th>F</th>'; // ��������� ��������� ��� ������ F
                for (var k = 0; k < variablesValue; k++) {
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" readonly></td>'; // ������� ������ ������ ��� �����
                }
                tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" readonly></td>'; // ������� ������ ������ ��� �����
                tableHTML += '</tr>';
                for (var i = 1; i <= restrictionsValue; i++) {
                    tableHTML += '<tr>';
                    tableHTML += '<th>x' + (9+i) + '</th>'; // ������� ��������� 1, 2, ..., n ��� �����
                    for (var k = 0; k < variablesValue; k++) {
                        tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" readonly></td>'; // ������� ������ ������ ��� �����
                    }
                    tableHTML += '<td><input type="text" style="width: 100%; font-size: 16px; text-align: center; font-weight: bold;" readonly></td>'; // ��������� ������ ��� ����� ��
                    tableHTML += '</tr>';
                }

                tableHTML += '</table>';

                // ������� ������ �������, ���� ��� ����������
                var tableContainer = document.getElementById('table-container3');
                if (tableContainer.firstChild) {
                    tableContainer.removeChild(tableContainer.firstChild);
                }

                // ��������� ����� �������
                tableContainer.insertAdjacentHTML('beforeend', tableHTML);
                return true;
            }
        </script>

        <script>
            var count = 0; // ������������� ���������� count
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


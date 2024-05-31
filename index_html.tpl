<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Транспортная задача</title>
    <!-- Подключение библиотеки DataTables через CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #30393E; /* Темный фон */
            color: #FAEFEB; /* Белый текст */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px; /* отступ сверху */
            margin-bottom: 20px; /* отступ снизу */
        }
        table, th, td {
            border: 1px solid black;
            margin-left: 100px;
        }
        th, td {
            padding: 10px;
            text-align: center;
            color: black; /* черный текст */
        }
        th {
            color: #FAEFEB; /* Белый текст для заголовков */
        }
        input {
            width: 100%;
            box-sizing: border-box;
            border: none;
            text-align: center;
        }
         .controls input[type="number"] {
            width: 50px; /* Уменьшаем ширину поля ввода */
        }
        .controls {
            margin-bottom: 30px; /* отступ снизу */
        }
        h1 {
            color: #74C8CB; /* Голубой заголовок */
        }
        .controls label {
            color: #FAEFEB; /* Белый текст для меток */
            margin-right: 50px;
            margin-left: 50px;
        }
        .controls input[type="number"] {
            background-color: #74C8CB; /* Голубой фон для инпутов чисел */
            color: #30393E; /* Текст на голубом фоне */
            padding: 5px;
            border-radius: 5px;
            border: none;
            margin-right: 10px; /* отступ справа */
        }
        .controls button {
            background-color: #74C8CB; /* Голубая кнопка */
            color: #30393E; /* Текст на голубой кнопке */
            padding: 10px 20px;
            border: none;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .controls button:hover {
            background-color: #6C9CA4; /* Цвет кнопки при наведении */
        }
    </style>
</head>
<body>

<h1>Транспортная задача</h1>

<div class="controls">
    <label for="numSuppliers">Количество поставщиков: </label>
    <input type="number" id="numSuppliers" value="3" min="1">
    <label for="numConsumers">Количество потребителей: </label>
    <input type="number" id="numConsumers" value="3" min="1">
    <button id="createTableBtn">Создать таблицу</button>
      <form action="/theory" method="post" id="theoryForm">
        <button type="submit">Перейти к теории</button>
    </form>
</div>

<div id="tableContainer"></div>

<script>
    function generateTable() {
        const numSuppliers = parseInt(document.getElementById('numSuppliers').value);
        const numConsumers = parseInt(document.getElementById('numConsumers').value);
        const tableContainer = document.getElementById('tableContainer');

        // Clear existing table content
        tableContainer.innerHTML = '';

        // Create table
        const table = document.createElement('table');
        table.id = 'transportation';
        table.className = 'display';
        tableContainer.appendChild(table);

        const tableHead = document.createElement('thead');
        table.appendChild(tableHead);

        const tableBody = document.createElement('tbody');
        table.appendChild(tableBody);

        // Create table headers
        const headerRow1 = document.createElement('tr');
        const headerRow2 = document.createElement('tr');

        const thSupplier = document.createElement('th');
        thSupplier.rowSpan = 2;
        thSupplier.textContent = 'Поставщик/Потребитель';
        headerRow1.appendChild(thSupplier);

        const thSupply = document.createElement('th');
        thSupply.rowSpan = 2;
        thSupply.textContent = 'Запас/Потребность';
        headerRow1.appendChild(thSupply);

        for (let i = 1; i <= numConsumers; i++) {
            const thConsumer = document.createElement('th');
            thConsumer.textContent = `Потребитель ${i}`;
            headerRow1.appendChild(thConsumer);

            const thInput = document.createElement('th');
            const input = document.createElement('input');
            input.type = 'number';
            input.value = 0;
            thInput.appendChild(input);
            headerRow2.appendChild(thInput);
        }

        tableHead.appendChild(headerRow1);
        tableHead.appendChild(headerRow2);

        // Create table body
        for (let i = 1; i <= numSuppliers; i++) {
            const row = document.createElement('tr');

            const supplierCell = document.createElement('td');
            supplierCell.textContent = `Поставщик ${i}`;
            row.appendChild(supplierCell);

            const supplyCell = document.createElement('td');
            const supplyInput = document.createElement('input');
            supplyInput.type = 'number';
            supplyInput.value = 0;
            supplyCell.appendChild(supplyInput);
            row.appendChild(supplyCell);

            for (let j = 1; j <= numConsumers; j++) {
                const costCell = document.createElement('td');
                const costInput = document.createElement('input');
                costInput.type = 'number';
                costInput.value = 0;
                costCell.appendChild(costInput);
                row.appendChild(costCell);
            }

            tableBody.appendChild(row);
        }

        // Initialize DataTable
        $('#transportation').DataTable({
            paging: false,
            searching: false,
            info: false
        });
    }

    // Обработчик события нажатия на кнопку "Создать таблицу"
    document.getElementById('createTableBtn').addEventListener('click', function() {
        generateTable();
    });

    // Функция для перехода на страницу "theory"
   

</script>

</body>
</html>


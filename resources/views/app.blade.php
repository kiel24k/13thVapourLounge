<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Client title</title>

    @vite('resources/css/app.css')
</head>

<body>
    <div id="app"></div>

    @vite('resources/js/app.js')
</body>

<style>
    :root {
        --table-head-color: rgb(240, 246, 249);
        --floating-border-radius: 10px;
        --floating-box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    * {
        font-family:-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        font-size: 14px;
    }

    body {
        background: rgb(254,254,255);
    }
</style>

</html>

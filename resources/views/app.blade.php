<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>13thVapourLounge</title>
    <link rel="icon" type="image/gif" href="/image/shopcover.jpg">

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
        font-family: font-family: system-ui, Avenir, Helvetica, Arial, sans-serif;
        font-size: 14px;
    }

    body {
        background: rgb(242, 249, 255);
    }

    .p-popover {
        z-index: 99;
    }
</style>

</html>

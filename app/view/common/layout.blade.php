<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>浏览页面</title>
    <link rel="stylesheet" href="/app/admin/component/pear/css/pear.css"/>
    <link rel="stylesheet" href="/app/admin/admin/css/reset.css"/>
    @yield('css')
</head>
<body class="pear-container">

@yield('content')

<script src="/app/admin/component/layui/layui.js"></script>
<script src="/app/admin/component/pear/pear.js"></script>
<script src="/app/admin/admin/js/permission.js"></script>
<script src="/app/admin/admin/js/common.js"></script>

@yield('js')

</body>
</html>

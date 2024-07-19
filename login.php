<?php
session_start();
include 'lib/config.php';

// Redireccionar si el usuario ya ha iniciado sesión
if (isset($_SESSION['usuario'])) {
    header("Location: index.php");
    exit();
}

// Procesar el formulario de inicio de sesión
if (isset($_POST['login'])) {
    $usuario = trim(mysqli_real_escape_string($connect, $_POST['usuario']));
    $contrasena = trim(mysqli_real_escape_string($connect, $_POST['contrasena']));

    $query = mysqli_query($connect, "SELECT * FROM usuarios WHERE usuario = '$usuario'");
    $contar = mysqli_num_rows($query);

    if ($contar == 1) {
        $row = mysqli_fetch_array($query);
        if (password_verify($contrasena, $row['contrasena'])) {
            $_SESSION['usuario'] = $usuario;
            $_SESSION['id'] = $row['id_use'];
            $_SESSION['avatar'] = $row['avatar'];
            header('Location: index.php');
            exit();
        } else {
            $error_message = 'Los datos ingresados no son correctos';
        }
    } else {
        $error_message = 'Los datos ingresados no son correctos';
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bienvenido a REDSOCIAL</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href=""><b>RED</b>SOCIAL</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Bienvenido a REDSOCIAL</p>

        <form action="" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="Usuario" name="usuario" pattern="[A-Za-z_-0-9]{1,20}" required>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Contraseña" name="contrasena" pattern="[A-Za-z_-0-9]{1,20}" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <!-- /.col -->
                <div class="col-xs-12">
                    <button type="submit" name="login" class="btn btn-primary btn-block btn-flat">Iniciar Sesión</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <?php
        // Mostrar mensaje de error si existe
        if (!empty($error_message)) {
            echo '<div class="alert alert-danger">' . $error_message . '</div>';
        }
        ?>

        <br>

        <a href="#">Olvidé mi contraseña</a><br>
        <a href="registro.php" class="text-center">Registrarme en REDSOCIAL</a>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>
</html>

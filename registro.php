<?php
session_start();
include 'lib/config.php';

// Si ya está logueado, redirigir a la página principal
if (isset($_SESSION['usuario'])) {
    header("Location: index.php");
    exit();
}

// Verificar si el formulario ha sido enviado
if (isset($_POST['registrar'])) {
    // Conexión a la base de datos
    $nombre = mysqli_real_escape_string($connect, trim($_POST['nombre']));
    $email = mysqli_real_escape_string($connect, trim($_POST['email']));
    $usuario = mysqli_real_escape_string($connect, trim($_POST['usuario']));
    $contrasena = trim($_POST['contrasena']);
    $repcontrasena = trim($_POST['repcontrasena']);

    $comprobarusuario = mysqli_num_rows(mysqli_query($connect, "SELECT usuario FROM usuarios WHERE usuario = '$usuario'"));
    $comprobaremail = mysqli_num_rows(mysqli_query($connect, "SELECT email FROM usuarios WHERE email = '$email'"));

    if ($comprobarusuario >= 1) {
        $error_message = "El nombre de usuario está en uso, por favor escoja otro.";
    } elseif ($comprobaremail >= 1) {
        $error_message = "El email ya está en uso, por favor escoja otro o verifique si tiene una cuenta.";
    } elseif ($contrasena != $repcontrasena) {
        $error_message = "Las contraseñas no coinciden.";
    } else {
        $contrasenaHashed = password_hash($contrasena, PASSWORD_BCRYPT);
        $insertar = mysqli_query($connect, "INSERT INTO usuarios (nombre, email, usuario, contrasena, fecha_reg, avatar) VALUES ('$nombre', '$email', '$usuario', '$contrasenaHashed', NOW(), 'defect.jpg')");

        if ($insertar) {
            $success_message = "Felicidades, se ha registrado correctamente.";
            header("Refresh: 2; url = login.php");
            exit();
        } else {
            $error_message = "Hubo un error al registrarse, por favor inténtelo de nuevo.";
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Red Social - Registro</title>
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
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href=""><b>RED</b>SOCIAL</a>
    </div>

    <div class="register-box-body">
        <p class="login-box-msg">Regístrate en REDSOCIAL</p>

        <?php if (isset($error_message)) { ?>
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <?php echo $error_message; ?>
            </div>
        <?php } elseif (isset($success_message)) { ?>
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <?php echo $success_message; ?>
            </div>
        <?php } ?>

        <form action="" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="nombre" class="form-control" placeholder="Nombre completo" value="<?php echo htmlspecialchars($_POST['nombre'] ?? '', ENT_QUOTES); ?>" required>
                <span class="glyphicon glyphicon-star form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="email" name="email" class="form-control" placeholder="Email" value="<?php echo htmlspecialchars($_POST['email'] ?? '', ENT_QUOTES); ?>" required>
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" name="usuario" class="form-control" placeholder="Usuario" value="<?php echo htmlspecialchars($_POST['usuario'] ?? '', ENT_QUOTES); ?>" required>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="contrasena" class="form-control" placeholder="Contraseña" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="repcontrasena" class="form-control" placeholder="Repita la contraseña" required>
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-10">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="check" required> Acepto los <a href="#">términos y condiciones</a>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-12">
                    <button type="submit" name="registrar" class="btn btn-primary btn-block btn-flat">Registrarme</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <br>
        <a href="login.php" class="text-center">Tengo actualmente una cuenta</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

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

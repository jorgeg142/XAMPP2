<?php
require('lib/config.php');
$id = mysqli_real_escape_string($connect,$_GET['id']);
?>

                <center>
                <?php
                require('lib/config.php');
                $fotosa = mysqli_query($connect,"SELECT ruta FROM fotos WHERE usuario = '$id'");
                while($fot=mysqli_fetch_array($fotosa))
                {
                
                ?>
                  <a href="publicaciones/<?php echo $fot['ruta'];?>"><img src="publicaciones/<?php echo $fot['ruta'];?>" width="19%"> </a>
                  
                  
                <?php
                }
                ?>
                </center>

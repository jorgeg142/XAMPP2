<script>
$(document).ready(function() {
  $('.dropdown-menu a').click(function() {
    // Realizar una llamada AJAX para actualizar la base de datos
    $.ajax({
      url: 'actualizar_notificaciones.php',
      type: 'POST',
      data: { 'resetear_notificaciones': true },
      success: function(data) {
        // Actualizar el número de notificaciones en el menú desplegable
        $('.label-warning').text('0');
      }
    });
  });
});
</script>
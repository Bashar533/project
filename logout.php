<?php
    include('template.php'); 
?>
<?php
    $_SESSION = array();
    session_destroy();
    header("Location:index.php");
?>
<?php
    include_once('footer.php');
?>


<?php
    include_once('template.php');
    if (isset($_GET['id']) and isset($_SESSION['userId'])) {
        $id = $mysqli->real_escape_string($_GET['id']);
        $query = <<<END
            DELETE FROM products
            WHERE id = '{$id}'
        END;
        $mysqli->query($query);
        header('Location:products.php');
    }
    echo $navigation;
    include_once('footer.php');
?>
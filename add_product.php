<?php
    include_once('template.php');
    $content = <<<END
        <h1>Add product</h1>
        <form method="post" action="add_product.php">
            <input type="text" name="name" placeholder="Productname"><br>
            <input type="text" name="price" placeholder="Price"><br>
            <textarea name="description" placeholder="Description"></textarea><br>
            <input type="submit" value="Add product">
            <input type="reset" value="reset">
        </form>
    END;
    echo $navigation;
    echo $content;
    include_once('footer.php');
    if (isset($_POST['name'])) {
        $name = $mysqli->real_escape_string($_POST['name']);
        $price = $mysqli->real_escape_string($_POST['price']);
        $desc = $mysqli->real_escape_string($_POST['description']);
        $query = <<<END
            INSERT INTO products(name,price,description)
            VALUES('{$name}',{$price},'{$desc}')
        END;
        if ($mysqli->query($query) == TRUE) {
            echo htmlspecialchars('Product added to the database!');
        }
        else {
            echo htmlspecialchars("Could not query database" . $mysqli->errno . " : " . $mysqli->error);
        }
    }
?>
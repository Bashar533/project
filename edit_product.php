<?php
    include_once('template.php');
    echo $navigation;
    $content = 'Edit Product';
    if (isset($_GET['id'])) {
        if (isset($_POST['name'])) {
            $name = $mysqli->real_escape_string($_POST['name']);
            $price = $mysqli->real_escape_string($_POST['price']);
            $desc = $mysqli->real_escape_string($_POST['description']);
            $id = $mysqli->real_escape_string($_GET['id']);
            $query = <<<END
                UPDATE products
                SET name = '{$name}',
                price = '{$price}',
                description = '{$desc}'
                WHERE id = '{$id}'
            END;
            $mysqli->query($query);
        }
        $id = $mysqli->real_escape_string($_GET['id']);
        $query = <<<END
            SELECT * FROM products
            WHERE id = '{$id}'
        END;
        $res = $mysqli->query($query);
        if ($res->num_rows > 0) {
            $row = $res->fetch_object();
            $content = <<<END
                <form method="post" action="edit_product.php?id={$row->id}">
                    <input type="text" name="name" value="{$row->name}"><br>
                    <input type="text" name="price" value="{$row->price}"><br>
                    <textarea name="description">{$row->description}</textarea><br>
                    <input type="submit" value="save">
                </form>
            END;
        }
    }
    else {
        echo htmlspecialchars(string: 'No chosen product!');
        echo '<br>';
    }
    echo $content;
    include_once('footer.php');
?>
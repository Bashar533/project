<?php
    require_once('template.php');
    $content = '<h1>Products</h1>';
    $query   = <<<END
        SELECT * FROM products
        ORDER BY created_at DESC
    END;

    if (!$mysqli) {
        die(htmlspecialchars('Database connection failed'));
    }

    $res = $mysqli->query($query);

    $content .= '<div class="container">';
    $content .= '<table>';
    $content .= '<thead>';
    $content .= '<tr>';
    $content .= '<th>Name</th>';
    $content .= '<th>Price (€)</th>';
    $content .= '<th>Description</th>';
    if (isset($_SESSION['username']) && $_SESSION['username'] == 'admin') {
        $content .= '<th>Actions</th>'; // Add an "Actions" column for admin controls
    }
    $content .= '</tr>';
    $content .= '</thead>';
    $content .= '<tbody>';

    if ($res && $res->num_rows > 0) {
        while ($row = $res->fetch_object()) {
            $content .= '<tr>';
            $content .= "<td>{$row->name}</td>";
            $content .= "<td>{$row->price}</td>";
            $content .= "<td><a href='product_details.php?id={$row->id}'>View Description</a></td>";
            if (isset($_SESSION['username']) && $_SESSION['username'] == 'admin') {
                $content .= <<<HTML
                    <td>
                        <a href="delete_product.php?id={$row->id}" onclick="return confirm('Are you sure?')">Remove</a> |
                        <a href="edit_product.php?id={$row->id}">Edit</a>
                    </td>
                HTML;
            }
            $content .= '</tr>';
        }
    } else {
        $content .= '<tr><td colspan="4">No products found.</td></tr>';
    }

    $content .= '</tbody>';
    $content .= '</table>';
    $content .= '</div>';

    echo $navigation;
    echo $content;

    include_once('footer.php');
?>

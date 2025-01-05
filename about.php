<?php
    include('template.php');
    $content = <<<END
        <h1>About this website</h1>
        <p>Work in progress</p>
        <h3>Send a message</h3>
        <form action="send.php" method="post">
            <input type="text" name="name" placeholder="Name">
            <br>
            <textarea name="msg" placeholder="Message"></textarea>
            <br>
            <input type="submit" value="Send">
        </form>
    END;
    echo $navigation;
    echo $content;
    include_once('footer.php');
?>
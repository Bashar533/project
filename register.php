<?php
    include('template.php');
    if (isset($_POST['username']) and isset($_POST['password'])) {
        $username = $mysqli->real_escape_string($_POST['username']);
        $pwd = $mysqli->real_escape_string($_POST['password']);
        $fname = $mysqli->real_escape_string($_POST['fname']);
        $lname = $mysqli->real_escape_string($_POST['lname']);
        $email = $mysqli->real_escape_string($_POST['email']);
        $query = <<<END
            INSERT INTO users(username,password,email,fname,lname)
            VALUES('{$username}','{$pwd}','{$email}','{$fname}','{$lname}')
        END;
        if ($mysqli->query($query) !== TRUE) {
            die(htmlspecialchars("Could not query database" . $mysqli->errno . " : " . $mysqli->error));
        } 
    } 
    $content = <<<END
        <form method="post" action="register.php">
            <input type = "text" name="username" placeholder="username" ><br> 
            <input type="password" name="password" placeholder="password"><br> 
            <input type="text" name="email" placeholder="email"><br>
            <input type="text" name="fname" placeholder="first name"><br> 
            <input type="text" name="lname" placeholder="last name"><br> 
            <input type="submit" value="Register">
            <input type="Reset" value="reset">
        </form>
    END;
    echo $navigation;
    echo $content;
    include_once('footer.php');
?>
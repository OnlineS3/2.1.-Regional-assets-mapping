
<?php
function conn_db() {
    $servername = 'mysql.s3platform.eu';
    $username = 'intelelv';
    $password = 'eC5R&VqXzL0S';
    $dbname = 'assetsmapping';

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    mysqli_set_charset($conn,"utf8");
    
    // Check connection
    if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
    } 

    return $conn;
}
?>
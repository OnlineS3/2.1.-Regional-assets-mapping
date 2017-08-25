<?php
    include 'php-src/onlineS3/db_connector/connection.php';
    $conn = conn_db();
    include 'php-src/onlineS3/db_connector/exec_sql.php';
    include 'php-src/onlineS3/gen_fun/str_fun.php';
    include 'php-src/onlineS3/import/files_fun.php';
    include 'php-src/files_func/eu_imp.php';
    
    $self = $_SERVER['REQUEST_URI'];
    
    echo "<form action='$self' id='admin-form' method='post'>";
    
    echo "<div id='admin'>";
    
    echo "<div class='import-data'>
        <p style='font-weight: bold;  font-size: 13px; display: inline-block;'>Import Eurostat Data:</p>
        <input class='btn-primary' id='tool' name='import-eu' value='Import Data' type='submit' >
        </div>";
    
    echo "</div>";

    //import regional data files
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        import_eu_files($conn);
    }
    echo "</form>";

?>
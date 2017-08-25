<?php

    include 'php-src/onlineS3/db_connector/connection.php';
    $conn = conn_db();
    include 'php-src/onlineS3/db_connector/exec_sql.php';
    include 'php-src/db_func/load_report.php';
    
    $user_id=1;

    $contents = load_contents($conn);
    $categories = $contents[0];
    $cat_contents = $contents[1];
    
    echo "<div id='report-contents'/>";
    
    echo "<p class='content-header'>Overall Variable Structure</p>";
    
    $i=0;
    foreach($categories as $cat) {
        
        $cat_label = $cat['description'];
        $cat_id = $cat['cat_id'];
        
        echo "<label for='$cat_id' class='cat-label $cat_id '>$cat_label</label>";
        
        echo "<input id='$cat_id' class='cat-check hide' type='checkbox' checked/>";
         
        echo "<div class='category-block'>";

        echo "<ul class='road $current'>";

        $variables = $cat_contents[$cat_id];
        
        if (!$variables) { continue; }
        
        foreach($variables as $var) {
            $var_id = $var['description'];
            $tbl_count = get_variable_status($conn,$user_id,$cat_id,$var_id);
            $checked = ($tbl_count > 0) ? 'checked' : '';
            
            echo "<li><a href='#' class='$checked'>";
            echo $var['description'];
            echo "</a></li>";
        }
        
        echo "</ul>";

        echo "</div>";
        
        $i++;
    }

    echo "</div>";
    
    
    
?>
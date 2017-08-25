<?php

    include 'php-src/onlineS3/db_connector/connection.php';
    $conn = conn_db();
    include 'php-src/onlineS3/db_connector/exec_sql.php';
    include 'php-src/onlineS3/db_connector/save_tbl.php';
    include 'php-src/onlineS3/gen_fun/str_fun.php';
    include 'php-src/onlineS3/gen_fun/form_fun.php';
    include 'php-src/onlineS3/gen_fun/array_fun.php';
    include 'php-src/forms/filters.php';
    include 'php-src/forms/render_tbl.php';
    include 'php-src/db_func/save_report.php';
    include 'php-src/db_func/load_report.php';
    include 'php-src/handler/export_func.php';
    
    $group_type = 'region';
    $graph_type = 'bar';
    $home = 'http://' . $_SERVER['SERVER_NAME'] . '/region_profile/home';
    $user_id = 1;
    
//    echo 'http://' . $_SERVER['SERVER_NAME'] . '/region_profile/home';
    
    $user_id = 1;

    // set title
    echo "<h2>Regional Assets Mapping</h2>";
    echo "<form action ='$home' id='main-form' method='post'>";

    $vars = exec_select($conn, "SELECT var_id, var_name, cat_id, description FROM variable WHERE var_id != '' order BY description");
    $vars_arr = json_encode($vars);
    
    echo "<div class='cate-container'>";
    
    $checked = ($_POST['cat']) ? (($_POST['cat'] == 'geo') ? 'checked' : '') : 'checked';
    echo "<input id='geo' type='checkbox' class='hide cat' name='cat' value='geo' onchange='return setCategory({vars: $vars_arr, cat:this.value });' $checked>";
    echo "<a href='#'><label class='cate-rect current' for='geo'><i class='icon fa fa-globe' aria-hidden='true'></i><span style='padding-top: .5rem;'>Geography</span> "
        . "<span style='visibility: hidden; margin-top: -.5rem;'>-</span></label></a>";
    
    $checked = ($_POST['cat'] == 'dem') ? 'checked' : '';
    echo "<input id='dem' type='checkbox' class='hide cat' name='cat' value='dem' onchange='return setCategory({vars: $vars_arr, cat:this.value });' $checked>";                 
    echo "<a href='#'><label class='cate-rect' for='dem'><i class='icon fa fa-male' aria-hidden='true'></i><span>Demography and Society</span></label></a>";
    
    $checked = ($_POST['cat'] == 'eco') ? 'checked' : '';
    echo "<input id='eco' type='checkbox' class='hide cat' name='cat' value='eco' onchange='return setCategory({vars: $vars_arr, cat:this.value });' $checked>";
    echo "<a href='#'><label class='cate-rect' for='eco'><i class='icon fa fa-euro' aria-hidden='true'></i><span>Economy and Labour</span></label></a>";
    
    $checked = ($_POST['cat'] == 'sec') ? 'checked' : '';
    echo "<input id='sec' type='checkbox' class='hide cat' name='cat' value='sec' onchange='return setCategory({vars: $vars_arr, cat:this.value });' $checked>";
    echo "<a href='#'><label class='cate-rect' for='sec'><i class='icon fa fa-industry' aria-hidden='true'></i><span>Sectoral Structure</span></label></a>";
    
    $checked = ($_POST['cat'] == 'bus') ? 'checked' : '';
    echo "<input id='bus' type='checkbox' class='hide cat' name='cat' value='bus' onchange='return setCategory({vars: $vars_arr, cat:this.value });' $checked>";
    echo "<a href='#'><label class='cate-rect' for='bus'><i class='icon fa fa-building-o' aria-hidden='true'></i><span>Business Characteristics</span></label></a>";
    
    $checked = ($_POST['cat'] == 'ino') ? 'checked' : '';
    echo "<input id='ino' type='checkbox' class='hide cat' name='cat' value='ino' onchange='return setCategory({vars: $vars_arr, cat:this.value });' $checked>";
    echo "<a href='#'><label class='cate-rect' for='ino'><i class='icon fa fa-laptop' aria-hidden='true'></i><span>Innovation System</span></label></a>";
    
    echo "</div>";

    echo "<div class='row void-2'></div>";
    
    echo "<div class='section-content filters'>";

    $filters = draw_filters($conn, $category);

    echo "<input type='text' value='$category' class='cat_id hide' />";
    
    echo "</div>";
    
    // button area
    echo "<hr class='hr-secondary hide'>";
    echo "<div class='btn-area'>";
    
    echo "<button class='button btn-secondary' id='my-clear' onclick='return clearFilters()'>"
            . "Reset <img class='reset-icon' src='images/reset.png' width='15'></button>";
    
    
    echo "<input class='button btn-primary' id='search' name='search' value='Search' type='submit'/>"
        . "<i class='fa fa-search' id='search-icon' aria-hidden='true'></i>";
    
    echo "</div>";
    
    echo "<div class='row void-3 hide'></div>";
    
    // draw results
    $cls = 'main-section accordion-primary rd-table ' . $filters['show'];
    
    include 'php-src/forms/fill_results.php';  
    include 'php-src/handler/post_events.php';
    
    echo "</div>";
    echo "<input type='submit' id='export-report-2' class='hide' name='export-report' value='Export'/>";
    
    echo "</form>";
    
    // close the connection
    $conn->close();
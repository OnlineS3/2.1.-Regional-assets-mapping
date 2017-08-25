<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['insert-tbl'])) {

    $regions = $_POST['sel-region']; $variables = $_POST['sel-var']; $cat_id = $_POST['cat'];
    $filter_col = ($_POST['group-by']=='reg') ? $variables[0] : $regions[0];
    $tbl_data = get_cur_table();
    $res = show_results($conn,$filters,$tbl_data);
    show_chart($res);
    
    $tbl_id = insert_tbl($conn, $user_id, $cat_id, $filter_col, $_POST['group-by'], $tbl_data);
}

if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['insert-chart'])) {
    
    $regions = $_POST['sel-region']; $variables = $_POST['sel-var']; $cat_id = $_POST['cat'];
    $filter_col = ($_POST['group-by']=='reg') ? $variables[0] : $regions[0];
    $tbl_data = get_cur_table();
    $res = show_results($conn,$filters,$tbl_data);
    show_chart($res);
    
    $chart_data = $_POST['wd_chart'];
    
    insert_chart($conn, $user_id, $cat_id, $filter_col, $chart_data);
}

if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['export-report'])) {
    
    $user_id=1;
    
    export_report($conn,$user_id);
    
    ?>    
        <script type="text/javascript">
            $("#export-report-dir").wordExport();
        </script>

    <?php
    
    $regions = $_POST['sel-region']; $variables = $_POST['sel-var']; $cat_id = $_POST['cat'];
    $filter_col = ($_POST['group-by']=='reg') ? $variables[0] : $regions[0];
    $tbl_data = get_cur_table();
    $res = show_results($conn,$filters,$tbl_data);
    show_chart($res);
}
    
function get_cur_table() {
    $tbl_data=$row_data=array();
    $row=$last_row='';
    foreach ($_POST as $name => $value) {
        
        if (substr($name, 0, 3)==='tbl') {
            
            $row = substr($name, 4, strlen($name) - strripos($name, ':') - 1);
            
            if($row !== $last_row && $row!='0'){    // new row
                array_push($tbl_data, $row_data);
                $row_data=array();
            }
            
            array_push($row_data, $value);  // insert val
            
            $last_row = $row;
        }
     }
     array_push($tbl_data, $row_data);  // insert last row
     
     return $tbl_data;
}

function show_chart($data) {
    
    if(!$data) {
        return;
    }
    
    $_2d_data = $data['2d_data'];
    $vars = $data['vars'];
    
    // generates graph data
    $bar_data = json_encode($_2d_data);
    $line_data = json_encode(data_combine($_2d_data));
    
    
    $chart_type = $_POST['chart_type'];
    
    if($chart_type=='bar') {
        ?>
            <script type='text/javascript'>
                renderBarChart({ container: "graph", data: <?php echo $bar_data ?>, vars: <?php echo $vars ?> });
            </script>
        <?php
    } elseif ($chart_type=='line') {
        ?>
            <script type='text/javascript'>
                renderLineGraph({ container: "graph", data: <?php echo $line_data ?>, vars: <?php echo $vars ?> });
            </script>
        <?php
    }

}
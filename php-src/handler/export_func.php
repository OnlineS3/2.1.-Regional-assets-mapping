<?php

function export_report($conn,$user_id) {
    
    echo "<div id='export-report-dir' class='hide'>"; 
    
    // set title
    echo "<h2>Regional Assets Mapping - <span>report</span></h2>";
    $report = load_report($conn, $user_id);   
       
    if($report){    
        foreach($report as $cat_id=>$cat_data) {
            $res = exec_select($conn, "SELECT description FROM category WHERE cat_id='$cat_id' LIMIT 1");
            $cat_label = $res[0]['description'];
            
            if ($current != $cat_id) {
                echo "<h3>$cat_label</h3>";
            }
            
            $cat_tbls = $cat_data[0];
            
            foreach ($cat_tbls as $tbl) {
                $group_id = $tbl[1];
                $group_type = $tbl[2];
                $cols = $tbl[3];
                $table_data = $tbl[4];
                
                $group_lb_sql = exec_select($conn, "SELECT * FROM variable WHERE var_id = '$group_id' LIMIT 1");
                $group_label = $group_lb_sql[0]['description'];
        
                echo "<h4>$group_label</h4>";
    
                render_tbl($cols, $table_data, $group_type, false, true);
                
            }
            
            $cat_charts = $cat_data[1];
            
            $i=0;
            foreach ($cat_charts as $chart) {
                $group_id = $chart[1];
                $chart_data = $chart[2];
                echo "<br>";
                
                $group_lb_sql = exec_select($conn, "SELECT * FROM variable WHERE var_id = '$group_id' LIMIT 1");
                $group_label = $group_lb_sql[0]['description'];
                
                echo "<h4>$group_label</h4>";
  
                $name = $cat_id . '_' . $i . '.png';
                $file = UPLOAD_DIR . $name;
                $img = str_replace('data:image/png;base64,', '', $chart_data);
                $img = str_replace(' ', '+', $img);
                $data = base64_decode($img);

                $success = file_put_contents($file, $data);

                if ($success) {
                    $src = 'files/tmp_img/' . $name;
                    echo "<img src='$src' height='296' width='550'>";
                }
                
                $i++;
            }
            
            $cur_cat = $cat_id;
        }
    }
    
    echo '</div>';
    echo '<button id="export-word-dir" class="button btn-primary right hide">Export Doc</button>';
    
}

function export_report_back($conn,$user_id) {
    $cur_cat = '';
    $user_id = 1;
    
//    $report = load_report($conn, $user_id);
//    
//    if($report){    
//        foreach($report as $report_tbl) {
//            $cat_id = $report_tbl[0];$group_id = $report_tbl[1];$cols = $report_tbl[2];$table_data = $report_tbl[3];
//            $res = exec_select($conn, "SELECT cat_descr FROM rp_category WHERE cat_id='$cat_id' LIMIT 1");
//            $cat_label = $res[0]['cat_descr'];
//            
//            $group_lb_sql = exec_select($conn, "SELECT * FROM variable WHERE var_id = '$group_id' LIMIT 1");
//            $group_label = $group_lb_sql[0]['description'];
//    
//            $wd_str .= "<p class='tbl-caption'>$group_label</p>";
//            $wd_str .= "<p class='tbl-subcaption'>complementary description</p>";
//            $wd_str .= create_wd_str($cols,$table_data,'val');
//            $wd_str .= '<br>';
//            
//            $cur_cat = $cat_id;
//        }
//    }
//    
//    $wd_str = normalize_input($wd_str);
//    echo "<textarea class='hide' id='wd-str' rows='10' cols='60' name='comment' form='usrform'>$wd_str</textarea>";
//    
    
    $report = load_report($conn, $user_id);   
    
    $wd_str = "Regional Assets Mapping - report";
    
    if($report){    
        foreach($report as $cat_id=>$cat_data) {
             //$group_id = $report_tbl[1];$cols = $report_tbl[2];$table_data = $report_tbl[3];
            
            $res = exec_select($conn, "SELECT description FROM category WHERE cat_id='$cat_id' LIMIT 1");
            $cat_label = $res[0]['description'];
            
            if ($current != $cat_id) {
                $wd_str .= "<p>Category: $cat_label</p>";
            }
            
            $cat_tbls = $cat_data[0];
            
            foreach ($cat_tbls as $tbl) {
                $group_id = $tbl[1];
                $cols = $tbl[2];
                $table_data = $tbl[3];
                
                $group_lb_sql = exec_select($conn, "SELECT * FROM variable WHERE var_id = '$group_id' LIMIT 1");
                $group_label = $group_lb_sql[0]['description'];
         
                $wd_str .= "<p>Variable: $group_label</p>";
                $wd_str .= create_wd_str($cols,$table_data,'val');
                $wd_str .= '<br>';

            }
            
            $cat_charts = $cat_data[1];
            
            $i=0;
            foreach ($cat_charts as $chart) {
                $group_id = $chart[1];
                $chart_data = $chart[2];
                
                $group_lb_sql = exec_select($conn, "SELECT * FROM variable WHERE var_id = '$group_id' LIMIT 1");
                $group_label = $group_lb_sql[0]['description'];
                
                $name = $cat_id . '_' . $i . '.png';
                $file = UPLOAD_DIR . $name;
                
                $img = str_replace('data:image/png;base64,', '', $chart_data);
                $img = str_replace(' ', '+', $img);
                $data = base64_decode($img);

                $success = file_put_contents($file, $data);

                if ($success) {
                    $src = 'files/tmp_img/' . $name;
                    $img_html = '<img src="' . $src . '" width="700">';
                    $wd_str .= "<p class='graph-caption'>$group_label</p>";
                    $wd_str .= $img_html;
                    $wd_str .= '<br>';
                }
                
                $i++;
            }
            
            $cur_cat = $cat_id;
            
            $wd_str .= "<br><br>";
        }
    }
    
    $wd_str = normalize_input($wd_str);
    
    echo "<textarea class='hide' id='wd-str' rows='10' cols='60' name='comment' form='usrform'>$wd_str</textarea>";
    
}

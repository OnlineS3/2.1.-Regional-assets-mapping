
<?php
    include 'php-src/onlineS3/db_connector/connection.php';
    $conn = conn_db();
    include 'php-src/onlineS3/db_connector/exec_sql.php';
    include 'php-src/onlineS3/gen_fun/str_fun.php';
    include 'php-src/onlineS3/gen_fun/form_fun.php';
    include 'php-src/forms/render_tbl.php';
    include 'php-src/db_func/load_report.php';

    $user_id = 1;
    $current = '';
    define('UPLOAD_DIR', 'files/tmp_img/');
    
    echo "<div id='report'>"; 
    
    // set title
    echo "<h2>Regional Assets Mapping - <span>report</span></h2>";
       
    $report = load_report($conn, $user_id);   
    
    if($report){    
        foreach($report as $cat_id=>$cat_data) {
            $res = exec_select($conn, "SELECT description FROM category WHERE cat_id='$cat_id' LIMIT 1");
            $cat_label = $res[0]['description'];
            
            if ($current != $cat_id) {
                echo "<p class='category-caption'>$cat_label</p>";
                echo "<textarea placeholder='Insert your comments for this category ... ' id='$cat_id' class='textarea-primary user-comments' cols='125' rows='7'></textarea>";
            }
            
            echo "<div class='report-section'>";
            
            $cat_tbls = $cat_data[0];
            
            foreach ($cat_tbls as $tbl) {
                $group_id = $tbl[1];
                $group_type = $tbl[2];
                $cols = $tbl[3];
                $table_data = $tbl[4];
                
                echo "<div class='tbl-container'>";
            
                $group_lb_sql = exec_select($conn, "SELECT * FROM variable WHERE var_id = '$group_id' LIMIT 1");
                $group_label = $group_lb_sql[0]['description'];
        
                echo "<p class='tbl-caption'>$group_label</p>";
    
                render_tbl($cols, $table_data, $group_type, false, true);
                
                echo "</div>";
            }
            
            $cat_charts = $cat_data[1];
            
            $i=0;
            foreach ($cat_charts as $chart) {
                $group_id = $chart[1];
                $chart_data = $chart[2];
                echo "<div class='graph-container'>";
            
                $group_lb_sql = exec_select($conn, "SELECT * FROM variable WHERE var_id = '$group_id' LIMIT 1");
                $group_label = $group_lb_sql[0]['description'];
                
                $name = $cat_id . '_' . $i . '.png';
                $file = UPLOAD_DIR . $name;
                
                $img = str_replace('data:image/png;base64,', '', $chart_data);
                $img = str_replace(' ', '+', $img);
                $data = base64_decode($img);

                $success = file_put_contents($file, $data);

                if ($success) {
                    $src = '../files/tmp_img/' . $name;
                    echo "<img src='$src' alt='image' width='700'>";
                }
                echo "</div>";
                
                $i++;
            }
            echo "</div>";
            
            $cur_cat = $cat_id;
        }
    }
    
    echo "</div>";
    
    echo "<div id='export-report' class='hide'>"; 
    
    // set title
    echo "<h2>Regional Assets Mapping - <span>report</span></h2>";
       
    if($report){    
        foreach($report as $cat_id=>$cat_data) {
            $res = exec_select($conn, "SELECT description FROM category WHERE cat_id='$cat_id' LIMIT 1");
            $cat_label = $res[0]['description'];
            
            if ($current != $cat_id) {
                echo "<h3>$cat_label</h3>";
                echo "<h5 id='$cat_id' class='user-comments'></h5>";
                echo "<br>";
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
                $src = '../files/tmp_img/' . $name;
                echo "<img src='$src' alt='image'>";
                
                $i++;
            }
            
            $cur_cat = $cat_id;
        }
    }
    
    echo "</div>";
    
    echo "<div class='popup-btn'>";
    echo '<button id="export-word" class="button btn-primary right">Export Doc</button>';
    echo '<button id="export-pdf" class="button btn-disabled right" onclick="exportReport2Pdf({ report_id: \'report\', filename: \'online_pdf.pdf\' });" disabled>Export Pdf</button>';
    echo "</div>";
       
?>
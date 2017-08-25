
<?php
    $show_graph = $_POST['show_graph'];
    $group_type = $_POST['group-by'];	
    $tbl_id = $_POST['tbl_id'];

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['search'])) {
        show_results($conn,$filters );
    }
  
    function show_results($conn,$filters,$assoc_data=null) {
        // get filters
        $regions = $_POST['sel-region'];
        $variables = $_POST['sel-var'];
        $years = $_POST['sel-year'];
        $years_ls = $filters['years'];
        $group_type = $_POST['group-by'];
        
        if(!$regions || !$variables) {
            return;
        }
        
        
        $cat_id = $_POST['cat'];
        $group_data = ($group_type=='reg') ? $regions : $variables;
        $filter_col = ($group_type=='reg') ? $variables[0] : $regions[0];
        
        if($group_type=='reg') {
            $group_lb_sql = exec_select($conn, "SELECT var.*, in_data.unit AS unit FROM variable var JOIN in_data ON in_data.var_id = var.var_id AND var.var_id = '$filter_col' LIMIT 1");
            $group_label = $group_lb_sql[0]['description'] . ' - ' .$group_lb_sql[0]['var_name'];
            $unit = $group_lb_sql[0]['unit']; 
            $legends = $group_data;
            
            
        } else {
            $group_lb_sql = exec_select($conn, "SELECT concat(reg_id, ' - ', label) as description FROM region WHERE reg_id = '$filter_col' LIMIT 1");
            $group_label = $group_lb_sql[0]['description'];
            $legends = get_vars_label($conn,$group_data);
        }
        
        echo "<div class='section-content tbl-results section'>";
        echo "<input type='text' name='group_id' value='$filter_col' class='hide' />";
        echo "<p class='tbl-caption'>$group_label</p>";
        echo "<p class='tbl-subcaption'>$unit</p>";
        
        // search in db
        if (!$assoc_data) {
            $assoc_data=$graph_data=$_2d_data=array(); 
        
            foreach($group_data as $group_col) {
                $_2dVals=$graphVals=array();

                $sql = create_sql($group_col,$filter_col,$years_ls,$group_type);
                $row = exec_select($conn, $sql);    // gets results from db 

                // generates table data
                array_push($assoc_data, $row);  

                // generates export && graph data
                array_push($_2dVals, $row[0]['tbl_lb']);
                if($group_type=='var') {
                    array_push($_2dVals, $row[0]['var_name']);
                    array_push($_2dVals, $row[0]['unit']);
                }
                
                array_push($graphVals, $row[0]['graph_lb']);
                foreach($row as $cell) {
                    array_push($_2dVals, $cell['val']); // gets values
                    array_push($graphVals, $cell['val']);
                }

                array_push($_2d_data, $_2dVals);   // adds to export data
                array_push($graph_data, $graphVals);   // adds to graph data
            }
            
            $type = ($group_type=='var') ? 'Variable' : 'Region';
            
            // adds columns for region group 
            $graph_cols = $years;
            if($group_type=='var') {
                array_unshift($years, 'Unit');
                array_unshift($years, 'Code');
            }
            array_unshift($years, $type);
            array_unshift($_2d_data, $years);
            
            // renders data in table format 
            render_tbl($years, $assoc_data, $group_type); 
            
        } else {
            $_2d_data = $assoc_data;
            $graph_data = $assoc_data;
            $graph_cols = $years;
            array_unshift($years, '');
            render_tbl(null,$assoc_data,'var', true); 
        }
        
        // normalizes export 
        $export_data = zero_array(round_array($_2d_data));  // normalizes array
        $export_data[0][0]=($group_type=='var') ? 'Variable' : 'Region';
        $export_data = json_encode($export_data); // rounds and converts to json
        
        // generates report data
        array_unshift($assoc_data, $years);
        
        // generates graph data
        array_unshift($graph_cols, '');
        array_unshift($graph_data, $graph_cols);
        $bar_data = json_encode($graph_data);
        $line_data = json_encode(data_combine($graph_data));
        $vars = json_encode($legends);
        
        // renders export buttons
        echo "<div class='new-btns'>";
        echo "<div class='ddl-menu-primary'>";
        echo "<button class='ddl-menu-button btn-primary button' onclick='return false;'>Download &nbsp; ";
        echo "<i class='fa fa-download' aria-hidden='true'></i></button>";
        echo "<div class='ddl-menu-content'>";
        $csv_name = $group_label.'.csv';
        $xls_name = $group_label.'.xlsx';
        echo "<a href='#' onclick='return export2csv({ data: $export_data, filename: \"$csv_name\" });'>Download CSV <i class='fa fa-file-excel-o' aria-hidden='true'></i></a>";
        echo "<a href='#' onclick='return export2xls({ data: $export_data, filename: \"$xls_name\" });'>Download XLS <i class='fa fa-file-excel-o' aria-hidden='true'></i></a>";
        echo "</div>";
        echo "</div>";

        echo "<div class='ddl-menu-primary'>";
        echo "<button class='ddl-menu-button btn-primary button' onclick='return false;'>Show Graph &nbsp; ";
        echo "<i class='fa fa-area-chart' aria-hidden='true'></i></button>";
        echo "<div class='ddl-menu-content'>";
        echo "<a href='#' onclick='return renderBarChart"
            . "({ container: \"graph\", data: $bar_data, vars: $vars, group_type: \"$group_type\", title: \"$group_label\", sub_title: \"$unit\" });'>Bar Chart <i class='fa fa-bar-chart' aria-hidden='true'></i></a>";
        echo "<a href='#' onclick='return renderLineGraph({ container: \"graph\", data: $line_data, vars: $vars, group_type: \"$group_type\", title: \"$group_label\", sub_title: \"$unit\" });'>"
            . "Line Graph <i class='fa fa-line-chart' aria-hidden='true'></i></a>";
        echo "</div>";
        echo "</div>";
        
        echo "<input class='tooltip-container button btn-primary-alt insert-btn ' name='insert-tbl' type='submit' value='Insert to Report'/>"
            . "<i class='fa fa-file-pdf-o insert-icon' aria-hidden='true'></i>";
       
        echo "</div>";
    
        // renders data in graph format
        echo "<div class='section-content section graph-container hide'>";
        include 'php-src/forms/graph_container.php';
        echo "</div>";
        
        return array('2d_data'=>$_2d_data,'vars'=>$vars);
    }
        
    function data_combine($data) {
        $comp_array=$region_codes=array();
        $i=0;
        foreach($data as $row) {
            $y=0;
            if($i==0){$i++; continue;}
            $region=array();
            foreach($row as $cell) {
                if($y==0){$y++; continue;}
                $region_codes[$i] = $data[$i][0];
                $region[$y-1]['year']=$data[0][$y];
                $region[$y-1]['value']=(float)str_replace(',','',$data[$i][$y]);
                $y++;
            }
            
            array_push($comp_array,$region);
            $i++;
        }
        
        $comp_array = array_combine($region_codes,$comp_array);
        
        return $comp_array;
    }
    
    function get_vars_label($conn,$vars) {
        $sql = 'SELECT var_name FROM variable WHERE var_id IN ("' . implode('","',$vars) . '")';
        $res = exec_select($conn, $sql);
        $out = array();
        
        foreach($res as $cell) {
            array_push($out, $cell['var_name']);
        }
        return $out;
    }
    
    function create_sql($group_col,$filter_col,$years_ls,$group_type) {
        $sql = '';
        if ($group_type==='reg') {  // limit 1 when 2 rows in one year, region and variable
            $sql = "SELECT DISTINCT year_id AS col_label, null AS val, "
                    . "concat('$group_col', ' - ', rr.label) AS tbl_lb, '$group_col' AS graph_lb, '' AS var_name, '' AS unit
                FROM year 
                JOIN region rr ON rr.reg_id = '$group_col'
                WHERE year_id IN ('$years_ls') AND 
                NOT EXISTS 
                        (SELECT rd.year_id 
                    FROM in_data rd 
                    JOIN region rr ON rr.reg_id = rd.reg_id 
                    WHERE rr.reg_id = '$group_col' AND rd.var_id = '$filter_col' AND rd.year_id = year.year_id) 
                UNION SELECT rd.year_id AS col_label, rd.val AS val, 
                concat('$group_col', ' - ', rr.label) AS tbl_lb, '$group_col' AS graph_lb, '' AS var_name, '' AS unit
                FROM in_data rd 
                JOIN region rr ON rr.reg_id = rd.reg_id 
                WHERE rr.reg_id = '$group_col' AND 
                        rd.var_id = '$filter_col' AND 
                    (rd.year_id IN ('$years_ls')) 
                ORDER BY col_label";
        } else {
            $sql = "SELECT DISTINCT year_id AS col_label, null AS val, rv.description AS tbl_lb, '$group_col' AS graph_lb, rv.var_name AS var_name, '' AS unit
                FROM year 
                JOIN variable rv ON rv.var_id = '$group_col'
                JOIN region rr ON rr.reg_id = '$filter_col'
                WHERE year_id IN ('$years_ls') AND 
                NOT EXISTS 
                        (SELECT rd.year_id 
                    FROM in_data rd 
                    JOIN variable rv ON rv.var_id = rd.var_id 
                    JOIN region rr ON rr.reg_id = rd.reg_id AND rr.reg_id = '$filter_col'
                    WHERE rv.var_id = '$group_col' AND rd.year_id = year.year_id) 
                UNION SELECT rd.year_id AS col_label, rd.val AS val, 
                rv.description AS tbl_lb, '$group_col' AS graph_lb, rv.var_name AS var_name, rd.unit AS unit
                FROM in_data rd 
                JOIN variable rv ON rv.var_id = rd.var_id 
                JOIN region rr ON rr.reg_id = rd.reg_id AND rr.reg_id = '$filter_col'
                WHERE rd.var_id = '$group_col' AND 
                    (rd.year_id IN ('$years_ls')) 
                ORDER BY col_label";
            }
            
        return $sql;
    } 

?>

<?php
    
    function load_contents($conn) {
        $categories=$variables=$cate_contents=array();
        
        $sql = "SELECT * FROM category ORDER BY cat_id";
        $categories = exec_select($conn, $sql);
        
        foreach ($categories as $cate) {
            $cat_id = $cate['cat_id'];
            $sql = "SELECT * FROM variable WHERE cat_id='$cat_id' AND var_id!='' ORDER BY description";
            
            $variables = exec_select($conn, $sql);
            $cate_contents[$cat_id] = $variables;
        }
           
        return array($categories,$cate_contents);
    }
    
    function get_variable_status($conn,$user_id,$cat_id,$var_id) {
        $sql = "SELECT count(1) AS count "
                . "FROM report_tbl tbl "
                . "JOIN report ON report.report_id = tbl.report_id "
                . "JOIN variable var ON var.var_id = tbl.group_id "
                . "WHERE tbl.cat_id = '$cat_id' AND "
                . "var.description = '$var_id' AND "
                . "report.user_id = $user_id "
                . "UNION SELECT count(1) AS count "
                . "FROM report_charts chart "
                . "JOIN report ON report.report_id = chart.report_id "
                . "JOIN variable var ON var.var_id = chart.group_id "
                . "WHERE chart.cat_id = '$cat_id' AND "
                . "var.description = '$var_id' AND "
                . "report.user_id = $user_id "
                . "ORDER BY count DESC";
        
        $res = exec_select($conn, $sql);
        
        $tbl_count = $res[0]['count'];
        
        return $tbl_count;
    }
    
    function load_tbl_cols($conn,$tbl_id) {
        $cols = array();
        $sql = "SELECT col_label 
                FROM col_head
                WHERE tbl_id = $tbl_id";
        $res = exec_select($conn, $sql);
        
        for($i=0;$i<count($res);$i++) {
            $cols[$i] = $res[$i]['col_label'];
        }
        return $cols;
    }
    
    function load_tbl_data($conn,$tbl_id) {
        $data=array();
        $sql = "SELECT row_id FROM row_head WHERE tbl_id = $tbl_id";
        $rows = exec_select($conn, $sql);
        
        foreach($rows as $row) {
            $row_id = $row['row_id'];
            $sql = "SELECT col.col_label, cell.val, row.row_label as tbl_lb
                FROM cell_data cell
                JOIN col_head col ON col.col_id = cell.col_id
                JOIN row_head row ON row.row_id = cell.row_id AND row.row_id = $row_id
                WHERE col.tbl_id = row.tbl_id AND 
                       col.tbl_id = $tbl_id;";
            
            $row = exec_select($conn, $sql);
            
            array_push($data, $row);
        }
        
        return $data;
    }
    
    function load_tbl($conn,$tbl_id) {
        $load = true;
        $report=array();
        $report_tbl = array();
        
        $sql = "SELECT cat_id, group_id, group_type FROM report_tbl WHERE tbl_id = $tbl_id ORDER BY cat_id";
        $res = exec_select($conn, $sql);
        $cat_id = $res[0]['cat_id'];
        $group_id = $res[0]['group_id'];
        $group_type = $res[0]['group_type'];
        
        $cols = load_tbl_cols($conn,$tbl_id);
        $data = load_tbl_data($conn,$tbl_id);
        
        if(count($cols)==0) { $load=false; $msg = 'No table cols found !'; }
        if(count($data)==0) { $load=false; $msg .= 'No table data found !'; }
        
        if ($load) {
            array_push($report_tbl,$cat_id,$group_id,$group_type,$cols,$data);
            array_push($report,$report_tbl);
        }
        
        if ($load) {
            return $report_tbl;
        } else {
            return $msg;
        }
    }
    
    function load_chart($conn,$chart_id) {
        $load = true;
        $report_chart = array();
        
        $sql = "SELECT cat_id, group_id, chart_data FROM report_charts WHERE chart_id = $chart_id ORDER BY cat_id";
        $res = exec_select($conn, $sql);
        $cat_id = $res[0]['cat_id'];
        $group_id = $res[0]['group_id'];
        $chart_data = $res[0]['chart_data'];
        
        if(count($chart_data)==0) { $load=false; $msg = 'No chart_data found !'; }
        
        if ($load) {
            array_push($report_chart,$cat_id,$group_id,$chart_data);
        }
        
        if ($load) {
            return $report_chart;
        } else {
            return $msg;
        }
    }
    
    function load_categories($conn,$report_id) {
        $sql = "SELECT DISTINCT cat_id 
                FROM report_tbl
                WHERE report_id = $report_id
                UNION
                SELECT DISTINCT cat_id 
                FROM report_charts
                WHERE report_id = $report_id";
        $categories = exec_select($conn, $sql);
        
        return $categories;
    }
    
    function load_report($conn,$user_id) {
       
        $report = array();
        
        $res = exec_select($conn, "SELECT report_id FROM report WHERE report.user_id = $user_id");
        $report_id = $res[0]['report_id'];
        
        if($report_id) {
            $categories = load_categories($conn,$report_id);
        }
        
        if ($categories) {
            
            foreach ($categories as $cat) {
                $cat_tbls=$cat_charts=array();
                $cat_id = $cat['cat_id'];

                $sql = "SELECT tbl_id FROM report_tbl tbl WHERE tbl.report_id = $report_id AND tbl.cat_id = '$cat_id'";
                $tables = exec_select($conn, $sql);

                if($tables) {
                    foreach($tables as $table) {
                        $table_id = $table['tbl_id'];
                        $tbl_data = load_tbl($conn,$table_id);

                        array_push($cat_tbls,$tbl_data);
                    }
                }

                $sql = "SELECT chart_id FROM report_charts chart WHERE chart.report_id = $report_id AND chart.cat_id = '$cat_id'";
                $charts= exec_select($conn, $sql);

                if($charts) {
                    foreach($charts as $chart) {
                        $chart_id = $chart['chart_id'];
                        $chart = load_chart($conn,$chart_id);

                        array_push($cat_charts,$chart);
                    }
                }

                $report[$cat_id] = array($cat_tbls,$cat_charts);
            }
        
        }
        
        return $report;
    }

?>


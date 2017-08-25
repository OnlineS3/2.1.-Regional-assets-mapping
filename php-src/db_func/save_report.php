<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function insert_report($conn, $user_id) {
    $sql = "SELECT report_id FROM report WHERE user_id = $user_id";
    $report = exec_select($conn, $sql);
    
    $report_id = $report[0]['report_id'];
    
    if ($report_id > 0) { // if report exists
        return $report_id;
    } else {    // else create a report
        $report_id = exec_ins($conn, "INSERT INTO report (user_id) VALUES ($user_id)");
        return $report_id;
    }
    
}

// insert table to report
function insert_tbl($conn, $user_id, $cat_id, $group_id, $group_type, $tbl_data) {
   
    try {
        $report_id = insert_report($conn, $user_id);
        
        if(!$report_id > 0) {return null;}

        $tbl_id = exec_ins($conn, "INSERT INTO report_tbl (report_id, cat_id, group_id, group_type) VALUES ($report_id,'$cat_id','$group_id','$group_type')");
        
        if(!$tbl_id > 0) {return null;}

        // insert header
        $x = 0;
        foreach ($tbl_data as $row) {
            if ($x > 0) {break;}
            $y = 0;
            foreach ($row as $val) {
                
                $col_id = exec_ins($conn, "INSERT INTO col_head (tbl_id, col_label) VALUES ($tbl_id, '$val')");

                $header[$y++] = $col_id;
            }
            $x++;
        }

        // insert rows
        $x=0;
        foreach ($tbl_data as $row) {
            if($x==0) {$x++; continue;}
            $row_lb = $row[0];
//            $row_lb = utf8_encode($row_lb);
            $row_lb = utf8_decode($row_lb);
            $row_id = exec_ins($conn, "INSERT INTO row_head (tbl_id, row_label) VALUES ($tbl_id, '$row_lb')");

            if (!$row_id > 0) {continue;}
            // insert cell value
            $y = 0;
            foreach ($row as $cell) {
                if($y==0) {$y++;continue;}
                // reg_id and ref_col ara stored in row
                exec_ins($conn, "INSERT INTO cell_data (col_id, row_id, val) VALUES ($header[$y], $row_id, '$cell')");
                $y++;
            }
            $x++;
        }
    } catch (Exception $ex) {
        echo 'error: ' .$e->getMessage();
        return null;
    }
    
    return $tbl_id;
}

// insert table to report
function insert_chart($conn, $user_id, $cat_id, $group_id, $chart_data) {
   
    try {
        $report_id = insert_report($conn, $user_id);
        
        if(!$report_id > 0) {return null;}

        $chart_id = exec_ins($conn, "INSERT INTO report_charts (report_id, cat_id, group_id, chart_data) VALUES ($report_id,'$cat_id','$group_id','$chart_data')");
        
        if(!$chart_id > 0) {return null;}

    } catch (Exception $ex) {
        echo 'error: ' .$e->getMessage();
        return null;
    }
    
    return $tbl_id;
}
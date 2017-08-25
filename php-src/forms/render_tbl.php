<?php 
    // renders the results in table format
    function render_tbl($cols, $in_tbl, $group_type, $by_post=false, $by_report=false) {
        if (!$in_tbl) {return null;}
        
        echo "<div class='tbl-div'>";
        
        $tablesorter = ($by_report==1) ? '' : 'tablesorter';
        $tableid = ($by_report==1) ? '' : 'tbl-sort';
        
        echo "<table class='tbl-dt tbl-third show $tablesorter' id='$tableid'>";

        // header cols
        if ($cols ){
            $j=0;
            echo "<thead>";
            echo "<tr>";
            foreach($cols as $val) {
                $cell_size = ($j==0) ? 'large' : 'medium';
                $val = ($j==0) ? (($group_type=='var') ? 'Variable' : 'Region') : $val;
                echo "<th class='$cell_size center'>";
                if (!$by_report) {
                    echo "<input name='tbl:0:$j' id='tbl:0:$j' value='$val' class='hide'>";
                }
                echo $val;
                echo "</th>";
                $j++;
            }
            echo "</tr>";
            echo "</thead>";
        }

        $i = ($by_post) ? 0 : 1;
        echo "<tbody>";
        foreach($in_tbl as $x => $row) {
            
            echo "<tr>";
            $even = ($i%2==0) ? 'odd' : 'even';
            // left col
            $j=0;
            foreach($row as $val) {
                $region = ($by_post) ? '' : $val['tbl_lb'];
                $var_name = ($by_post) ? '' : $val['var_name'];
                $unit = ($by_post) ? '' : (($val['unit'] == '') ? '&#8208;&#8208;' : $val['unit']);
                
                $val = ($by_post) ? $val : $val['val'];
                $val = (is_float($val)) ? number_format($val,2,".","") : $val;
                $val = (is_null($val)) ? 0 : $val;
                $text = ($val=="0") ? '&#8208;&#8208;' : $val;
                
                if (!$by_post && $j==0) {
                    echo "<td class='text-left large'>";
                    if (!$by_report) {
                        echo "<input name='tbl:$i:$j' id='tbl:$i:$j' value='$region' class='hide'>";
                    }
                    echo $region;
                    echo "</td>";
                    $j++;
                }
                
                if (!$by_post && !$by_report && $j==1 && $group_type == 'var') {
                    echo "<td class='text-center medium'>";
                        if (!$by_report) {
                            echo "<input name='tbl:$i:$j' id='tbl:$i:$j' value='$var_name' class='hide'>";
                        }
                        echo $var_name;
                    echo "</td>";
                    $j++;
                }
                
                if (!$by_post && !$by_report && $j==2 && $group_type == 'var') {
                    echo "<td class='text-center medium'>";
                        if (!$by_report) {
                            echo "<input name='tbl:$i:$j' id='tbl:$i:$j' value='$var_name' class='hide'>";
                        }
                        echo $unit;
                    echo "</td>";
                    $j++;
                }
                
                // if float -> right format
                $text_align = ($by_post && $j==0) ? 'text-left' : 'text-right';
                echo "<td class='$text_align medium'>";
                if (!$by_report) {
                    echo "<input name='tbl:$i:$j' id='tbl:$i:$j' value='$val' class='hide'>";
                }
                echo $text;
                echo "</td>";
                $j++;
            }
            echo "</tr>";
            $i++;
        }
        echo "</tbody>";
        echo "</table>";
        
        echo "</div>";
        
        return array('row_no'=>$i, 'col_no'=>$j);
    }
    
    /*
    * create word html
    */
   function create_wd_str($cols, $tbl_data, $col=null) {
       $wd_str = '';
       $wd_str .= "<table>";
       $wd_str .= "<tr>";
            
        foreach($cols as $cell) {
            $wd_str .= "<td>$cell</td>";
        }

        $wd_str .= "</tr>";

        foreach($tbl_data as $row) {
            $wd_str .= "<tr>";

            $i = 0;
            foreach($row as $cell) {

                if ($col && $i==0) {
                    $val = $cell['row_label'];
                    $wd_str .= "<td>$val</td>";
                }
                $val = ($col) ? ($cell['val']) : $cell;
                $wd_str .= "<td>$val</td>";
                $i++;
            }
            $wd_str .= "</tr>";

        }
       $wd_str .= "</table>";

       return $wd_str;
   }
?>

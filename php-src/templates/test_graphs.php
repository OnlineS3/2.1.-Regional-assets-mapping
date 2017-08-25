<?php
    $self = $_SERVER['REQUEST_URI'];
    
    echo "<form action='$self' id='admin-form' method='post'>";
    echo "<input id='tool' name='import-eu' value='Import Data' type='submit'>";
  
    //import regional data files
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        testing_graphs();
    }
    
    echo "</form>";
    
    function testing_graphs() {
	
	// [['','2010','2011','2012','2013'],['AT12','19617','21106','22196','22041'],['AT21','427','378','277','256']];
	
	$_2d_data = array(array('Region','2010','2011','2012','2013'),array('AT12','19617','21106','22196','22041'),array('AT21','427','378','277','256'));
	
        $x_label = 'year';
        $val_label = 'value';
        
	$assoc_data = _2d2assoc($_2d_data,$x_label,$val_label);
	$bar_data = json_encode($_2d_data);
	$line_data = json_encode($assoc_data);
        
	echo "<br><a href='#' onclick='return renderBarChart ({ container: \"graph\", data: $bar_data, title: \"Air Transport: Passengers carried per annum\" });'>Export Bar Chart</a>";
	echo "<br><a href='#' onclick='return renderLineGraph({ container: \"graph\", data: $line_data, title: \"Air Transport: Passengers carried per annum\" });'>Export Line Graph</a>";
	
	include 'graph_container.html';
    }

    // converts a 2d array to assoc
    function _2d2assoc($data, $x_label, $val_label) {
        $comp_array=$region_codes=array();
        $i=0;
        foreach($data as $row) {
            $y=0;
            if($i==0){$i++; continue;}
            $region=array();
            foreach($row as $cell) {
                if($y==0){$y++; continue;}
                $region_codes[$i] = $data[$i][0];
                $region[$y-1] = array_combine(array($x_label,$val_label),array($data[0][$y],(float)str_replace(',','',$data[$i][$y])));
                $y++;
            }
            
            array_push($comp_array,$region);
            
            $i++;
        }
        
        $comp_array = array_combine($region_codes,$comp_array);

        return $comp_array;
    }
    
?>

<?php

function draw_filters($conn, $cat) {
    // get db data
    $reg_res = exec_select($conn, "SELECT * FROM region WHERE reg_id <> '' ORDER BY reg_id");
    $year_res = exec_select($conn, "SELECT * FROM year");

    $regions = $vars = $years = '';

    // get post data
    if (isset($_POST['sel-region'])) {
        foreach ($_POST['sel-region'] as $option) {
            $regions .= "'". $option . "'" . ","; 
        }
        $regions = substr($regions, 1, strlen($regions)-3);
    } else {
        $regions = $_POST['regions'];
    }

    if (isset($_POST['sel-var'])) {
        foreach ($_POST['sel-var'] as $option) {
            $vars .= "'". $option . "'" . ","; 
        }
        $vars = substr($vars, 1, strlen($vars)-3);
    } else {
        $vars = $_POST['vars'];
    }

    if (isset($_POST['sel-year'])) {
        foreach ($_POST['sel-year'] as $check) {
            $years .= "'". $check . "'" . ","; 
        }
        $years = substr($years, 1, strlen($years)-3);
    } else {
        $years = $_POST['years'];
    }
    
    
    
    $show = (isset($_POST['search'])) ? 'show' : '';
    
    echo "<input type='text' name='regions' id='regions' class='hide' value=$regions>";
    echo "<input type='text' name='vars' id='vars' class='hide' value=$vars>";
    echo "<input type='checkbox' name='years[]' class='chk-year hide' value=$years>";

    // fill filters
    echo "<div class='year-section chk-primary'>";
    
    echo "<p class='title'>Year:</p>";
    
    $checked_init = array('2010','2011','2012','2013','2014','2015','2016');
    echo "<input type='checkbox' class='choose-year' name='sel-year[]' id='chk-0' value='All' $checked />";
    echo "<label for='chk-0' class='check'>All</label>";
    for($x = 1; $x < count($year_res); $x++) {
        $year = $year_res[$x]['year_id'];
        $init = (in_array($year, $checked_init)) ? 'checked_init' : '';
        $checked = ((isset($_POST['sel-year']) && contains($years,$year)) || (empty($_POST) && in_array($year, $checked_init))) ? 'checked' : '';
        echo "<input type='checkbox' name='sel-year[]' id='chk-$x' value='$year' class='choose-year $init' $checked/>";
        echo "<label for='chk-$x' class='check'>$year</label>";
    }
    echo "</div>";
    
    echo "<div class='choose-region'>";
    
    echo "<p id='choose-region-lb' class='title'>Choose regions to include in your search: </p>";
    
    $region_multiple = ($_POST['group-by'] == 'var') ? '' : 'multiple';
    $var_multiple = ($_POST['group-by'] == 'var') ? 'multiple' : '';
    
    echo "<select id ='region' class='chosen-select' data-placeholder='Choose regions ' name='sel-region[]' $region_multiple >";
        for($x = 0; $x < count($reg_res); $x++) {
            $region_id = $reg_res[$x]['reg_id'];
            $region_label = $reg_res[$x]['label'];
            $checked = (isset($_POST['sel-region']) and contains($regions, $region_id)) ? 'selected' : '';
            echo "<option value='$region_id' $checked>$region_id - $region_label</option>";
        }
    echo "</select>";
    
    echo "</div>";
    
    echo "<div class='choose-variable'>";
    
    echo "<p id='choose-var-lb' class='title'>Filter by variable: </p>";
    
    $cat_id = ($_POST['cat']) ? $_POST['cat'] : 'geo';
    $var_res = exec_select($conn, "SELECT var_id, var_name, cat_id, description FROM variable WHERE var_id != '' AND cat_id='$cat_id' ORDER BY description");
    
    echo "<select id ='variable' class='chosen-select' data-placeholder='Choose the variable.. ' name='sel-var[]' $var_multiple required>";
    for($x = 0; $x < count($var_res); $x++) {
        $var_id = $var_res[$x]['var_id'];
        $var_label = $var_res[$x]['description'] . ' - ' . $var_res[$x]['var_name'];
        $selected = (isset($_POST['sel-var']) and contains($vars, $var_id)) ? 'selected' : '';
        echo "<option value='$var_id' $selected>$var_label</option>";
    }
    echo "</select>";
    
    echo "</div>";
    
    echo "<div class='row void'></div>";
    
    echo "<div class='group-type radio-primary right'>";

    echo "<p class='italic'>Group by:</p>";

    echo "<div>";
    $region_checked = (isset($_POST['group-by'])) ? (($_POST['group-by']=='reg') ? "checked" : "") : "checked";
    echo "<input class='group-by' type='radio' id='group-region' value='reg' name='group-by' $region_checked/>";
    echo "<label for='group-region'>Variable</label>";
    echo "</div>";
    echo "<div>";
    $var_checked = ($_POST['group-by']=='var') ? "checked" : "";
    echo "<input class='group-by' type='radio' id='group-variable' value='var' name='group-by' $var_checked/>";
    echo "<label for='group-variable'>Region</label>";
    echo "</div>";

    echo "</div>";
    
    $show = ($show) ? $show : $_POST['show'];

    echo "<input type='text' name='show' class='hide' value=$show>";

    // return filters
    $filters = array('regions'=>$regions, 'vars'=>$vars, 'years'=>$years, 'show'=>$show);

    return $filters;
} 	
?>
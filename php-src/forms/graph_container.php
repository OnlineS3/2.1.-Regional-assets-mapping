<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//

//echo "<div class='my-radio'>";
//echo "<div class='radio-primary'>";
//echo "<div><input id='bar' type='radio' name='graph-type' value='bar' onchange='return renderBarChart({ container: \"graph\", data: $data });'/>"
//    . "<label for='bar'>Bar Chart</label></div>";
//echo "<div><input id='line' type='radio' name='graph-type' value='line' onchange='return renderLineGraph({ container: \"graph\", data: $graph_data, vars: $vars });'/>"
//    . "<label for='line'>Line Graph</label></div>";
//echo "</div>";
//echo "</div>";

echo "<input type='text' id='chart_type' value='' name='chart_type' class='hide'/>";
// secret image for export
echo "<input type='text' id='wd_chart' name='wd_chart' class='hide'/>";
    
//echo "<p class='graph-caption'>$group_label</p>";
//echo "<p class='graph-subcaption'>$unit</p>";

$legends_lb = ($group_type=='var') ? 'variables' : 'regions';
if (count($legends) > 30) {
    echo "<p class='graph-up'>* Only 30 $legends_lb can be displayed in the graph</p>";
}

echo "<div id='graph'></div>";

echo "<div class='new-btns'>";

echo "<button class='button btn-secondary-alt' onclick='return exportSvg2PNG"
    . "({ container: \"export-svg\", filename: \"online_graph.png\" });'>Export as Image"
    . "&nbsp; <i class='fa fa-file-image-o' aria-hidden='true'></i></button>";
echo "</button>";


echo "<input class='button btn-primary-alt insert-btn' name='insert-chart' type='submit' value='Insert to Report'/>"
        . "<i class='fa fa-file-pdf-o insert-icon' aria-hidden='true'></i>";

echo "</div>";


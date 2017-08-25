
<?php

// my theme for online
function my_theme_enqueue_styles() {
    $parent_style = 'parent-style';

    wp_enqueue_style( 'child-style',
        get_stylesheet_directory_uri() . 'style.css',
        array( $parent_style ),
        wp_get_theme()->get('Version')
    );
    
    wp_enqueue_style( 'chosen', get_stylesheet_directory_uri() . '/css/external/chosen/chosen.css' );
    wp_enqueue_style( 'layout_wrps', get_stylesheet_directory_uri() . '/css/layout_wrps.css' );
    wp_enqueue_style( 'svg', get_stylesheet_directory_uri() . '/css/jquery.svg.css' );
    wp_enqueue_style( 'font-awesome', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' );
    wp_enqueue_style( 'open-sans', 'http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400&subset=latin,greek');
    wp_enqueue_style( 'base', get_stylesheet_directory_uri() . '/css/base.css' );
    wp_enqueue_style( 'layout2', get_stylesheet_directory_uri() . '/css/layout.css' );
    wp_enqueue_style( 'header', get_stylesheet_directory_uri() . '/css/header.css' );
    wp_enqueue_style( 'footer', get_stylesheet_directory_uri() . '/css/footer.css' );
    wp_enqueue_style( 'test', get_stylesheet_directory_uri() . '/css/common.css' );
    wp_enqueue_style( 'fonts', get_stylesheet_directory_uri() . '/css/fonts.css' );
    wp_enqueue_style( 'utils', get_stylesheet_directory_uri() . '/css/utils.css' );
    wp_enqueue_style( 'ddl_menu', get_stylesheet_directory_uri() . '/css/ddl_menu.css' );
    wp_enqueue_style( 'table', get_stylesheet_directory_uri() . '/css/table.css' );
    wp_enqueue_style( 'sidebar', get_stylesheet_directory_uri() . '/css/sidebar.css' );
    wp_enqueue_style( 'd3', get_stylesheet_directory_uri() . '/css/d3.css' );
    wp_enqueue_style( 'popup', get_stylesheet_directory_uri() . '/css/popup.css' );
    wp_enqueue_style( 'tooltip', get_stylesheet_directory_uri() . '/css/tooltip.css' );
    wp_enqueue_style( 'print', get_stylesheet_directory_uri() . '/css/print.css' );
    wp_enqueue_style( 'images', get_stylesheet_directory_uri() . '/css/images.css' );
    wp_enqueue_style( 'tablesorter', get_stylesheet_directory_uri() . '/css/tablesorter.css' );
    wp_enqueue_style( 'centreforcities', get_stylesheet_directory_uri() . '/css/centreforcities.css' );
    
    wp_enqueue_style( 'beta', get_stylesheet_directory_uri() . '/css/beta.css' );
    
//    wp_enqueue_style( 'line', get_stylesheet_directory_uri() . '/css/region_profile/line.scss' );
    wp_enqueue_style( 'plain', get_stylesheet_directory_uri() . '/css/region_profile/plain.css' );
    wp_enqueue_style( 'main', get_stylesheet_directory_uri() . '/css/region_profile/main.css' );
    wp_enqueue_style( 'report', get_stylesheet_directory_uri() . '/css/region_profile/report.css' );
    wp_enqueue_style( 'admin', get_stylesheet_directory_uri() . '/css/region_profile/admin.css' );
}

add_action( 'wp_enqueue_scripts', 'my_theme_enqueue_styles' );

function my_theme_enqueue_scripts() {
    $parent_script = 'parent-script';

    wp_enqueue_script('child-script',
        get_stylesheet_directory_uri().'/js/main.js',
        array('jquery'),
        wp_get_theme()->get('Version')
    );
 
    wp_enqueue_script( 'jquerybase', get_stylesheet_directory_uri() . '/js/jquery/jquery-3.1.1.min.js');
    wp_enqueue_script( 'jquery64', get_stylesheet_directory_uri() . '/js/jquery/jquery.base64.js');
    
    wp_enqueue_script('jquery');
    
    wp_enqueue_script( 'd3_v3', get_stylesheet_directory_uri() . '/js/d3/d3.v3.min.js', array('jquery') );
    wp_enqueue_script( 'tip', get_stylesheet_directory_uri() . '/js/d3/d3.tip.v0.6.3.js', array('jquery') );
    
    wp_enqueue_script( 'alasql', get_stylesheet_directory_uri() . '/js/external/alasql.min.js', array('jquery') );
    wp_enqueue_script( 'xlsx', get_stylesheet_directory_uri() . '/js/external/xlsx.core.min.js', array('jquery') );
    wp_enqueue_script( 'html2canvas', get_stylesheet_directory_uri() . '/js/external/html2canvas.js', array('jquery') );
    wp_enqueue_script( 'html_docx', get_stylesheet_directory_uri() . '/js/external/html-docx.js', array('jquery') );
    wp_enqueue_script( 'jspdf', get_stylesheet_directory_uri() . '/js/external/jspdf.min.js', array('jquery') );
    wp_enqueue_script( 'validator', get_stylesheet_directory_uri() . '/js/external/jquery.validate.js', array('jquery') );
    wp_enqueue_script( 'additional', get_stylesheet_directory_uri() . '/js/external/additional-methods.js', array('jquery') );
    wp_enqueue_script( 'chosen', get_stylesheet_directory_uri() . '/js/external/chosen/chosen.jquery.js', array('jquery') );
    wp_enqueue_script( 'chosen_proto', get_stylesheet_directory_uri() . '/js/external/chosen/chosen.proto.js', array('jquery') );
    wp_enqueue_script( 'scrollbar', get_stylesheet_directory_uri() . '/js/testScroll.js', array('jquery') );
    wp_enqueue_script( 'layout', get_stylesheet_directory_uri() . '/js/layout.js', array('jquery') );
    wp_enqueue_script( 'xls2json', get_stylesheet_directory_uri() . '/js/xls2json.js', array('jquery') );
    wp_enqueue_script( 'gen', get_stylesheet_directory_uri() . '/js/gen.js', array('jquery') );
    wp_enqueue_script( 'uploadFile', get_stylesheet_directory_uri() . '/js/uploadFile.js', array('jquery') );
    wp_enqueue_script( 'table2png', get_stylesheet_directory_uri() . '/js/html2img.js' , array('jquery'));
    wp_enqueue_script( 'json2csv', get_stylesheet_directory_uri() . '/js/json2csv.js', array('jquery') );
    wp_enqueue_script( 'json2xls', get_stylesheet_directory_uri() . '/js/json2xls.js', array('jquery') );
    wp_enqueue_script( 'svg2png', get_stylesheet_directory_uri() . '/js/svg2png.js', array('jquery') );
    wp_enqueue_script( 'openPopup', get_stylesheet_directory_uri() . '/js/openPopup.js', array('jquery') );
    wp_enqueue_script( 'clearTable', get_stylesheet_directory_uri() . '/js/clearTable.js', array('jquery') );
    wp_enqueue_script( 'html2pdf', get_stylesheet_directory_uri() . '/js/html2pdf.js', array('jquery') );
    wp_enqueue_script( 'table2word', get_stylesheet_directory_uri() . '/js/html2docx.js', array('jquery') );
    wp_enqueue_script( 'graph', get_stylesheet_directory_uri() . '/js/graph.js', array('jquery') );
    wp_enqueue_script( 'tablesorter', get_stylesheet_directory_uri() . '/js/external/tablesorter/tablesorter.js', array('jquery') );
    
    wp_enqueue_script( 'images', get_stylesheet_directory_uri() . '/js/images.js', array('jquery') );
    
    wp_enqueue_script( 'why', get_stylesheet_directory_uri() . '/js/external/FileSaver.js', array('jquery') );
    wp_enqueue_script( 'wordexport', get_stylesheet_directory_uri() . '/js/external/jquery.wordexport.js', array('jquery') );
    
    wp_enqueue_script( 'main', get_stylesheet_directory_uri() . '/js/region_profile/main.js', array('jquery') );
    wp_enqueue_script( 'ajax_actions', get_stylesheet_directory_uri() . '/js/region_profile/ajaxFunc.js', array('jquery') );
    wp_enqueue_script( 'bar_chart', get_stylesheet_directory_uri() . '/js/region_profile/drawBar.js', array('jquery') );
    wp_enqueue_script( 'line_graph', get_stylesheet_directory_uri() . '/js/region_profile/drawLine.js', array('jquery') );
    wp_enqueue_script( 'profile_popup', get_stylesheet_directory_uri() . '/js/region_profile/openPopup.js', array('jquery') );
    wp_enqueue_script( 'clear_form', get_stylesheet_directory_uri() . '/js/region_profile/clearForm.js', array('jquery') );
    wp_enqueue_script( 'insert_chart', get_stylesheet_directory_uri() . '/js/region_profile/insertChart.js', array('jquery') );
}

add_action( 'wp_enqueue_scripts', 'my_theme_enqueue_scripts' );

remove_filter( 'the_content', 'wpautop' );

?>

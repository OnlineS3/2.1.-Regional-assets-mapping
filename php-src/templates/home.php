
<?php

//    phpinfo();
    
    include 'header.html';

    echo "<div class='region_profile'>";
    
    $about_hide = $_SERVER["REQUEST_METHOD"] == "POST" ? 'hide' : '';
    
    echo "<div id='about' class='section-page $about_hide'>";
    include 'about.php';
    echo "</div>";

    echo "<div id='guide' class='section-page hide'>";
    include 'guide.php';
    echo "</div>";

    echo "<div id='docs' class='section-page hide'>";
    include 'docs.php';
    echo "</div>";
    
    $tool_hide = $_SERVER["REQUEST_METHOD"] == "POST" ? '' : 'hide';
    
    echo "<div id='tool' class='section-page $tool_hide'>";
    include 'tool.php';
    echo "</div>";
    
    
    
    echo "</div>";
    // include header and categories
    include 'menu.php';
    include 'sidebar.php';
    include 'footer.html';
//    
//    include 'php-src/templates/header.html';
//    
//    include 'php-src/templates/footer.html';
//    
    
?>
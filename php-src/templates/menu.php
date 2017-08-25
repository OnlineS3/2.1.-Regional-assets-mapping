
    <?php $home = $_SERVER['REQUEST_URI']; 
    
    echo "<div class='r-sidebar $tool_hide tool-sidebar' id='categories-bar'>"; ?>
    
    <div class='cat-caption'>
        <p>My Report</p>
    </div>
     
    <!--<p class="not-ready">This functionality will be available in the final version of the OnlineS3 Platform</p>-->
    
    <ul>

        <li style=''>
            <img src='images/export.png' id='export-img' width='16'>
            <button class='btn-empty' onclick='$("#export-report-2").click()'>
            <!--<button class='btn-empty' onclick='alert("test")'>-->
            Export
        </li>

        <?php 
            $group = json_encode($rg_group);
            $report = ($report) ? $report : '';
            $report = json_encode($report);
        ?>

        <li>
            <img src='images/preview-alt.png' width='16'>
            <button class='btn-empty' onclick='return openPopup({ url: "preview", name:"popup", height:"large" })'>
            Preview
            </button>
        </li>

        <li>
            <img src='images/structure-2.png' width='16'>
            <button class='btn-empty' onclick='return openPopup({ url: "contents", name:"contents", height:"large" })'>
            Status
        </li>

    <ul>
    
    </div>
   
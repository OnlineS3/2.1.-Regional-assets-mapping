
<?php

    function import_eu_files($conn) {
        $project_dir = 'C:/xampp/htdocs/region_profile';
        
        $imp_dir = $project_dir . '/files/test_import/source';
        $unzip_dir = $project_dir . '/files/test_import/csv_unzip';
        $excel_dir = $project_dir . '/files/test_import/csv_xls';
        
        try {
            if (file_exists($unzip_dir)) {
                deleteDir($unzip_dir);            
            } 
            mkdir($unzip_dir, 0777, true);

            if (file_exists($excel_dir)) {
                deleteDir($excel_dir);            
            } 
            mkdir($excel_dir, 0777, true);
            
            // clear table
            $conn->query('DELETE FROM in_data');
            if ($conn->error) { echo $conn->error; return false; } 

            // create temporary table
            $conn->query('DROP TABLE IF EXISTS in_data_tmp');
            if ($conn->error) { echo $conn->error; return false; } 
            $conn->query('CREATE TABLE in_data_tmp AS SELECT var_id, reg_id, year_id, unit, cast(val AS char) as val FROM in_data');
            if ($conn->error) { echo $conn->error; return false; } 
            
            // read file names
            $files = get_files_by_dir($imp_dir);

            for ($i=0;$i<count($files);$i++) {
                $path = $files[$i]['path'];

                // unzip file
                if (strpos($path,'.zip') > 0) {
                    if (!unzip_file($path,$unzip_dir)) {
                        echo '<br> unzip error in ' . $path;
                    }
                }

                // convert excel files to csv
                if (strpos($path,'.xls') > 0) {
                    xls2csv($path, $excel_dir);
                }
            }

            // load csv files to db
            load2db($conn, $unzip_dir);
            
            // load excel files to db
            load2db($conn, $excel_dir);

            $sql = "INSERT INTO in_data 
                    SELECT var_id, reg_id, year_id, unit, sum(coalesce(cast(replace(replace(val,':',''),',','') as decimal(10,2)),0)) as val 
                    FROM region_profile.in_data_tmp 
                    WHERE reg_id not like 'European Union%' AND unit <> 'Percentage'
                    group by var_id, reg_id, year_id, unit
                    UNION 
                    SELECT var_id, reg_id, year_id, unit, avg(coalesce(cast(replace(replace(val,':',''),',','') as decimal(10,2)),0)) as val 
                    FROM region_profile.in_data_tmp 
                    WHERE reg_id not like 'European Union%' AND unit = 'Percentage'
                    group by var_id, reg_id, year_id, unit";
            $conn->query($sql);
            if ($conn->error) { echo $conn->error; return false; } 
            
            echo '<br> ' . mysqli_affected_rows($conn) . ' rows inserted.';

            $conn->query('DROP TABLE in_data_tmp');
            if ($conn->error) { echo $conn->error; return false; }  
        } catch (Exception $ex) {
            echo 'Message: ' .$e->getMessage();
            return false;
        }
        
        return true;
    }
    
    function load2db($conn, $unzip_dir) {
        // read file names
        $files = scandir($unzip_dir);
        
        // load files
        for ($i=0; $i<count($files); $i++) {
            if ($files[$i] != '.' && $files[$i] != '..') {
                $filename = $unzip_dir . '/' . $files[$i];
                $var = pathinfo($files[$i], PATHINFO_FILENAME);

                if (csv2db($conn, $filename, $var)) {
                    echo ' <br> ' . $files[$i] . ' inserted.';
                } else {
                    echo ' <br> ' . $files[$i] . ' not inserted !';
                }
            }
        }
    }
    
    function csv2db($conn, $file, $variable) {
        //$file_dt = fopen($file, "r") or die("Unable to open file!");
        $file_dt = fopen("C:\\xampp\\htdocs\\region_profile\\files\\test_import\\csv_unzip\\demo_r_d2jan.csv", "r") or die("Unable to open file!");
        $labels = fgets($file_dt);

        $labels = str_replace('"','',$labels);
        $fields = str2array($labels);

        $col_str = $set_str = '';

        for ($y=0;$y<count($fields);$y++) {
            $col_str .= '@col' . ($y+1) . ',';

            if (strtolower($fields[$y]) == 'geo') {
                $set_str .= 'reg_id = @col' . ($y+1) . ', ';
            }
            if (strtolower($fields[$y]) == 'time') {
                $set_str .= 'year_id = @col' . ($y+1) . ', ';
            }
            if (strtolower($fields[$y]) == 'unit') {
                $set_str .= 'unit = @col' . ($y+1) . ', ';
            }
            if (strtolower($fields[$y]) == 'value') {
                $set_str .= 'val = @col' . ($y+1);
            }
        }
        $col_str = substr($col_str,0,strlen($col_str)-1);

        fclose($file_dt);
        
        if ($col_str && $set_str) {
            $enclose_str = '"';

            $sql = "LOAD DATA INFILE '$file' 
                    INTO TABLE in_data_tmp 
                    FIELDS TERMINATED BY ','
                    OPTIONALLY ENCLOSED BY '\"'
                    LINES TERMINATED BY '\n'
                    IGNORE 1 LINES
                    ($col_str)
                    set $set_str;";

            $conn->query($sql);
            if ($conn->error) { echo $conn->error; return false; } 

            $conn->query("UPDATE in_data_tmp SET var_id = '$variable' WHERE coalesce(var_id, '') = ''");
            if ($conn->error) { echo $conn->error; return false; } 
        }
        
        return true;
    }
	
?>
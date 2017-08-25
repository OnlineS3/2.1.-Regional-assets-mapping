
/*
 * exports xlsx file
 * @param {json} data 
 * @param {string} filename  
 */
var export2xls = function(args) {
    
    arr_data = args.data;
    var filename = (args.filename) ? args.filename : 'online_xls.xls';
    
    if (arr_data === null) {
        document.getElementById("app-alert").innerHTML = 'The table provided is empty !';
        return false;
    }
    
    try {
        // saves data to xls format
        alasql("SELECT * INTO XLSX('" + filename + "',{headers:false}) FROM ? ",[arr_data]);
    }
    catch(err) {
        document.getElementById("app-alert").innerHTML = err.message;
        return false;
    }
    return false;
};


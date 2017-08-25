/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function setCategory(args) {
    
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var cat = args.cat;
            var vars = args.vars;
            
            filterByCat(cat,vars);
        }
    };
    xmlhttp.open("POST", window.location.href, true);
    xmlhttp.send();
}

/*
 * filters variables by category
 */
function filterByCat(cat, vars){
    // converts json to string
    var varsByCat=[[]],obj,j=0,variable=[];
    vars = JSON.parse(JSON.stringify(vars));
    
    for (var i = 0; i < vars.length; i++) {
        obj = vars[i];
        if(obj['cat_id']===cat) {
            variable = [];
            variable[0]=vars[i]['var_id'];
            variable[1]=vars[i]['description'] + ' - ' + vars[i]['var_name'];
            varsByCat[j++]=variable;
        } 
    }
    
    $('#categories').val(varsByCat);
    $('#variable').empty();
    $('#variable_chosen').css('width','20rem');
    for (var i=0; i<varsByCat.length; i++) {
        $('#variable').append($('<option>', {
            value: varsByCat[i][0],
            text: varsByCat[i][1]
        }));
        $('#variable').trigger("chosen:updated");
    }

}

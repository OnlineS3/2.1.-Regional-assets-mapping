/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var insertChart = function(args) {
    
    html2canvas($('#export-svg'), {
        onrendered: function (canvas) {
            $('#wd_chart').val('');
            var data = canvas.toDataURL('image/png');
            $('#wd_chart').val(data);
        }
    });
}
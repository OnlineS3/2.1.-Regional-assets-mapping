/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 $(document).ready(function(){
    $('textarea.user-comments').mouseleave(function() {
        var area_id = $(this).attr('id');
        var area_text = $(this).val();
        var p_id = 'h5.user-comments' + '#' + area_id;
        $(p_id).empty();
        $(p_id).append(area_text);
    });
    
    $("#export-word").click(function() {
        $("#export-report").wordExport();
    });
    
    $("#export-word-dir").click(function() {
        $("#export-report-dir").wordExport();
    });

     $('#report').parents('.site').css('background','none');
     
     $('.choose-year#chk-0').on('change', function() {
        if(this.checked) {
            $('.choose-year').prop('checked', true);
        }
     });
     
    // uncheck other categories
    $('.cat').on('change', function() {
        
        $('.cat').not(this).prop('checked', false); 
        $(this).prop('checked', true);
        
        return false;
    });
    
    $(".chosen-select").chosen();
    
    $('.group-by').on('change', function() {
        if ($(this).val()==='reg') {
            
            var region = $('#region');
            region.chosen('destroy');
            region.attr('multiple', 'multiple');
            region.chosen();
            
            var variable = $('#variable');
            variable.chosen('destroy');
            variable.removeAttr('multiple');
            variable.chosen();
            
            $('#choose-region-lb').text('Choose regions to include in your search:');
            $('#choose-var-lb').text('Filter by variable:');
            
        } else {
            
            var region = $('#region');
            region.chosen('destroy');
            region.removeAttr('multiple');
            region.chosen();
            
            var variable = $('#variable');
            variable.chosen('destroy');
            variable.attr('multiple', 'multiple');
            variable.chosen();
            
            $('#choose-region-lb').text('Filter by region:');
            $('#choose-var-lb').text('Choose variables to include in your search:');
            
        }
        $('#region').trigger("chosen:updated");
        $('#variable').trigger("chosen:updated");
    });
    
    $('#secondary').append($('#menu-bar'));
    
    $('footer').append($('#online-footer'));
    
    $("#tbl-sort").tablesorter(); 
    
    $('.tbl-dt').scrollbar();
    
    $.validator.setDefaults({ ignore: ":hidden:not(.chosen-select)" });
     
    $('#main').validate();  
});

$(document).on('submit',function(){
    $("#variable option").each(function(){
        var val = $(this).val();
        
        // Add $(this).val() to your list
    });
});
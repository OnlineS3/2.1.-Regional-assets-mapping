/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var clearFilters = function(args) {
    
    $('.cat').prop('checked', false);
    $('#geo').prop('checked', true);
    $('#geo').trigger('click');
    
    $('.choose-year').prop('checked', false);
    $('.choose-year.checked_init').prop('checked', true);
    
    $('#region').val('').trigger('chosen:updated');
    
    $('#variable option:selected').prop("selected", false);
    $('#variable').trigger("chosen:updated");
    
    
    $('#group-region').prop('checked', true);
    
    // filterByCat('geo', vars) // add this !!!!
    
    return false;
};

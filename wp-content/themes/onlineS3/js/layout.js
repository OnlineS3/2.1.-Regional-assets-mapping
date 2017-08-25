/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
//    $('#secondary').append($('#categories-bar'));
//    $('.plain').parents('.site-content, .site-inner').css('width','850');
//    $('.plain').parents('.site').css('background','#f8f9f9');
    
//    $('.site-header-main').append($('#site-header'));
    
//    $('.site-footer').append($('#site-footer'));
            
    $("#site-header .menu ul li a, .access-tool").click(function() {
        var link_id = 'div#' + $(this).attr('id');
        $(this).parents().find('#site-header ul li a').removeClass('active');
        $(this).parents().find('.section-page').addClass('hide');
        $(this).addClass('active');
        $('#categories-bar').addClass('hide');
        $(link_id).removeClass('hide');
        $('.tool-sidebar').addClass('hide');
        $('.base-sidebar').removeClass('hide');
        $('#download-guide').addClass('hide');
        $('#download-guide').addClass('hide');
        $(this).parents().find('#categories-bar').css('margin-top', '5rem');
        return false;
    });
    
    
//    $(".menu ul li a#tool").click(function() {
//        $('#categories-bar').removeClass('hide');
//    });
    
    $("a#tool, a#tool-btn").click(function() {
        $('.tool-sidebar').removeClass('hide');
        $('.base-sidebar').addClass('hide');
        $('div#about, div#guide, div#about').addClass('hide');
        $('div#tool').removeClass('hide');
    });
    
//    $(".main-menu ul li a#tool, .access-tool").click(function() {
//        $('#categories-bar').css('margin-top', '11rem');
//    });
    
    $("#site-header .menu ul li a#guide").click(function() {
        $('#download-guide').removeClass('hide');
    });
    
    
});

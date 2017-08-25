
/*
 * Opens report to new window
 * @param {string} url 
 * @param {string} name
 * @param {number} rows 
 * @param {number} cols 
 * @param {json} group 
 */
var openPopup = function(args) {
    
    var height=(args.height) ? args.height : '';
    var width=(args.width) ? args.width : '';
    switch(width) {
        case 'large':
            win_width = screen.width - (.4 * screen.width);
            break;
        case 'medium':
            win_width = screen.width - (.52 * screen.width);
            break;
        case 'small':
            win_width = screen.width - (.6 * screen.width);
            break;
        default:
            win_width = screen.width - (.55 * screen.width);
    }
    
    switch(height) {
        case 'large':
            win_height = screen.height - (.2 * screen.height);
            break;
        case 'medium':
            win_height = screen.height - (.25 * screen.height);
            break;
        case 'small':
            win_height = screen.height - (.6 * screen.height);
            break;
        default:
            win_height = screen.height - (.25 * screen.height);
    }
    
//    var win_height = (args.height) ? args.height : 800;
//    var win_width = (args.width) ? args.width : 1000;
    var win_left = ((1-(win_width/screen.width))/ 2)*screen.width;
    var win_top = ((1-(win_height/screen.height))/ 2)*screen.height;

    var url = args.url;
    var name = args.name;
    
    // opens the window
    var myWindow = window.open(url, name,
        "scrollbars=yes, height=" + win_height + ", width = " + win_width + ", left = " + win_left + ", top = " + win_top);
    myWindow.focus();
  
    
    return false;
};

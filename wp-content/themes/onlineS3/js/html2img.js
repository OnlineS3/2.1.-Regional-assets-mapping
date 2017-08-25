
/*
 * exports dom element to png image
 * @param {numeric} tbl_id 
 * @param {string} filename  
 */
var exportElem2png = function(args) {
    
    var img_elem = $('#'+args.tbl_id);  // gets image div
    var filename = (args.filename) ? args.filename : 'OnlineTable.png';
    
    var max_width = img_elem.css('max-width');
    var max_height = img_elem.css('max-height');
    
    // clears max-width to capture the whole image
    img_elem.css('max-width','none').css('max-height','none').css('padding', '2rem');
    
    try {
        html2canvas(img_elem, {
            onrendered: function (canvas) {
                // resets max width & height
                img_elem.css('max-width',max_width).css('max-height',max_height);
                
                theCanvas = canvas;
                if (theCanvas.msToBlob) { //for IE
                    var png_data = theCanvas.msToBlob();
                    window.navigator.msSaveBlob(png_data, filename);
                } else {
                    var png_data = theCanvas.toDataURL("image/png");    // image to url
                    png_data = png_data.replace(/^data:image\/png/, "data:application/octet-stream");

                    var a = document.createElement("a");    // create tmp link
                    a.download = filename;
                    a.href = png_data;
                    document.querySelector("body").appendChild(a);
                    a.click();
                    document.querySelector("body").removeChild(a);
                }
            }
        });
    }
    catch(err) {
        document.getElementById("app-alert").innerHTML = err.message;
        return false;
    }
    
    return false;
};

/*
 * convert dom element to img
 * @param {numeric} tbl_id  
 */
var convertElem2img = function(elem_id) {
    var img_elem = document.getElementById(elem_id);
    var img, imgDataUrl;
    
    html2canvas(img_elem, {
        onrendered: function(canvas) {
            //get a drawing context from canvas
            var context = canvas.getContext("2d");
            
            //convert canvas data to an image data url
            var img = new Image();
            if (theCanvas.msToBlob) { //for IE
                imgDataUrl = theCanvas.msToBlob();
            } else {
                imgDataUrl = canvas.toDataURL();
            }
            img.src = imgDataUrl;
            img.id = elem_id + '_img';
            
            document.getElementById('export-tbl').appendChild(img);
            
            var png_data = theCanvas.toDataURL("image/png");    // image to url
            png_data = png_data.replace(/^data:image\/png/, "data:application/octet-stream");
            
            return img;
        }
    });
    
    
    
};
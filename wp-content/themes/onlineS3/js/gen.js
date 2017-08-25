
/*
 * concats arrays and removes dublicates
 * @param {2darray} array 
 */
function arrayUnique(array) {
    var a = array.concat();
    for(var i=0; i<a.length; ++i) {
        for(var j=i+1; j<a.length; ++j) {
            if(a[i] === a[j])
                a.splice(j--, 1);
        }
    }
    return a;
}

/*
 * returns first cols from 2d array
 * @param {2darray} array 
 */
function getRowHeaders(array) {
    var row_headers=[];
    for(var i=1;i<array.length;i++) {
        row_headers[i-1] = array[i][0];
    }
    return row_headers;
}

/*
 * returns row data from 2darray
 * removing row and col headers
 * @param {2darray} array 
 */
function getRowData(array) {
    var rowData=[[]], cols=[], cell_val;
    for(var i=1;i<array.length;i++) {
        cols=[];
        for(var y=1;y<array[i].length;y++) {
            cell_val = array[i][y];
            cols[y-1] = (typeof cell_val === 'string') ? Number(replaceAll(cell_val, ",", "")) : cell_val;
        }
        rowData[i-1]=cols;
    }
    return rowData;
}

/*
 * massive replacing
 * @param {string} str 
 * @param {string} find 
 * @param {string} replace 
 */
function replaceAll(str, find, replace) {
    return str.replace(new RegExp(find, 'g'), replace);
}

/*
 * removes zero elements from 2d array
 * @param {2darray} array 
 */
function removeZero(data) {
    var out=[],j=0;
    for(var i=0;i<data.length;i++) {
        if(data[i]['value']>0) {
            out[j++] = data[i];
        }
    }
    
    return out;
}


function getColNo(array) {
    for(var i=0;i<array.length;i++) {
        return array[i].length;
    }
}

// format number to string
function formatNumber(n, dp, st, sd){
    var w=n.toFixed(dp), k=w|0, b=n < 0 ? 1 : 0,
        u=Math.abs(w-k), d=(''+u.toFixed(dp)).substr(2, dp),
        s=''+k, i=s.length, r='';
    while ((i-=3)> b) {r=st+s.substr(i,3)+r;}
    return s.substr(0, i+3)+r+ (d ? sd+d: '');
};

// convert json to array
function json2arr(json) {
    json = JSON.stringify(json);
    var parsed = JSON.parse(json);
    var arr = [];

    for(var x in parsed){
      arr.push(parsed[x]);
    }
    
    return arr;
}
 
 // call loadP and unloadP when body loads/unloads and scroll position will not move
function getScrollXY() {
    var x = 0, y = 0;
    if(typeof(window.pageYOffset)==='number') {
        // Netscape
        x = window.pageXOffset;
        y = window.pageYOffset;
    } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
        // DOM
        x = document.body.scrollLeft;
        y = document.body.scrollTop;
    } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
        // IE6 standards compliant mode
        x = document.documentElement.scrollLeft;
        y = document.documentElement.scrollTop;
    }
    return [x, y];
}
           
function setScrollXY(x, y) {
    window.scrollTo(x, y);
}

function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)===' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ)===0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function loadP(pageref){
    x=readCookie(pageref+'x');
    y=readCookie(pageref+'y');
    setScrollXY(x,y);
}

function unloadP(pageref){
    s=getScrollXY();
    createCookie(pageref+'x',s[0],0.1);
    createCookie(pageref+'y',s[1],0.1);
}
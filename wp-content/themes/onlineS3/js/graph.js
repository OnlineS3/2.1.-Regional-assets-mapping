/*
 * renders legends (circles and texts) 
 * at the bottom of the page
 * @param {svg} svg 
 * @param {number} height  
 * @param {array} variables
 * @param {array} colors
 */
function renderLegend(svg, height, variables, colors, group_type) {
    var lg_width = (group_type === 'var') ? 95 : 54;
    var lg_x = (group_type === 'var') ? 8.5 : 8;
    var y_line = (group_type === 'var') ? 7 : 12;
    
    legend = svg
        .append("g")
        .attr("transform", "translate(65,-10)")
        .attr("font-family", "sans-serif")
        .attr("font-size", 10)
        .attr("text-anchor", "start")
        .style("cursor", "pointer")
        .selectAll("g")
        .data(variables)
        .attr("width",function(d, i) { return d.length * 10; })
        
        .enter().append("g")
        .on("click", function(d){
            // check if line is visible
            var opacity = d3.select("."+ d).attr("opacity");
            if (opacity==1) {   // hide line if unchecked
                d3.selectAll("."+d).attr("opacity", "0");
                d3.selectAll("#"+d).attr("fill", "#c0c0c0");
            } else {    // show line if checked
                d3.selectAll("."+d).attr("opacity", "1");
                d3.selectAll("#"+d).attr("fill", "#686868");
            }
        })
        .attr("transform", function(d, i) {
            var x_order = i % y_line;
            var y_order = Math.floor(i/y_line);
            
//            var previous_elem = this.previousElementSibling;
//            var x_start = (previous_elem) ? previous_elem.__data__.length * 8 + previous_elem.getBoundingClientRect().x : 0;
            return "translate(" + x_order * lg_width + "," + y_order * 15 + ")";
        });

    // draw the circle image
    legend.append("line")          
        .style("stroke", function(d, i) { return colors[i]; }) 
        .style("stroke-width", 2)
        .attr("x1", -6)     
        .attr("y1", height-3)      
        .attr("x2", 6)    
        .attr("y2", height-3)
        .attr("id", function(d) { return String(d) });

    legend.append("circle")
        .attr("cx", 0)
        .attr("cy", height-3)
        .attr("style", "fill: white")
        .attr("stroke",  function(d, i) { return colors[i]; })
        .attr("stroke-width", "1")
        .attr("id", function(d) { return String(d) })
        .attr("r", 3.6);

    legend.append("rect")
        .attr("id", function(d, i) { return d; })
        .attr("rx", 0)
        .attr("ry", 0)
        .attr("x", -7)
        .attr("y", height-12)
        .attr("height", 20)
        .attr("width", lg_width)
        .attr('fill','none')
        .style("fill-opacity", 1e-06)
        .style("fill", "#fff")
        .style("stroke", "none")
        .style("cursor", "pointer");

    // draw the legend text
    legend.append("text")
        .attr("x", 10)
        .attr("y", height)
        .attr("text-anchor", "start")
        .attr('fill','#686868')
        .attr("id", function(d) { return String(d) })
        .text(function(d) { return d; });

    return svg;
}

/*
 * renders background grey boxes and lines
 * at the bottom of the page
 * @param {svg} svg 
 * @param {number} width  
 * @param {number} height  
 * @param {number} y_ticks
 */
function renderBackBoxes(svg, width, height, y_ticks) {
    var color, box_height, box_width, y_current=40;
    var x_start = 30;
    
    box_height = height / y_ticks; // calc box height
    box_width = width-40; // calc box width
    
    for (var i=0; i<y_ticks; i++) {
        color = (i%2===0) ? '#ffffff' : '#f7f7f7';  // set color
        
        // draw rectangle
        svg.append("rect")
            .attr('x',x_start)
            .attr('y',y_current)
            .attr('width',box_width)
            .attr('height',box_height)
            .attr('fill',color)
            .attr('fill-opacity',0.5);
    
        // draw dotted line
        svg.append("line")          
            .style("stroke", '#999999')
            .style("stroke-opacity", 1) 
            .style("stroke-width", 1)
            .style("shape-rendering","crispEdges")
            .style("stroke-dasharray",1)
            .attr("x1", x_start)     
            .attr("y1", y_current)      
            .attr("x2", x_start + box_width)    
            .attr("y2", y_current)
            .attr("fill","none");
    
        y_current += box_height; 
    }
    
    return svg;
}
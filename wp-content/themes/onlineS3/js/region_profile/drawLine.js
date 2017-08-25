
/*
 * renders line graph
 * @param {json} data 
 * @param {string} container  
 * @param {number} width
 * @param {number} height
 * @param {string} title
 */

function renderLineGraph(args) {
    try {
        var data_list = args.data;
        var container = (args.container) ? '#' + args.container : 'bar';
        var width = (args.width) ? args.width : 750;
        var height = (args.height) ? args.height : 410;
        var title = args.title;
        var sub_title = args.sub_title;
        var variables = args.vars;
        var key_val, line_data=[], current_data=[];
        
        // set dimensions
        $(container).empty();  // clear container div

        var margin = {top: 30, right: 30, bottom: 30, left: 30},
        width = width - margin.left - margin.right,
        height = height - margin.top - margin.bottom;
        
        var content_height = height-90,
            content_y = 10;
 
        if (variables.length > 30) {
            variables = variables.slice(0,29);
        }
 
        // creates variables and line data
        var data = [];
        var var_keys = [];
        for(var k in data_list) var_keys.push(k);
        for (var i=0; i<var_keys.length; i++) {
            key_val = var_keys[i];
            current_data = data_list[key_val];  // data per variable
            
            if(current_data !== undefined) {
                var var_data=[];
                for (var j=0; j<current_data.length; j++) {
                    var_data = arrayUnique(var_data.concat(current_data[j]));
                }
                line_data[i] = var_data;    // data per line

                data = arrayUnique(data.concat(var_data));  // overall data
            }
        }
        
        var max_val = d3.max(data, function(d) {return d.value;});
        max_val = 1.15 * max_val;
        
        // creates x domain
        var x = d3.scale.ordinal()
            .domain(data.map(function(d){return d.year;}))
            .rangePoints([40, width]);
        
        // creates y domain
        var y_domain=[], y_tick=0, tick_count=5;
        for(var i=0; i<tick_count; i++) {
            y_domain[i] = (max_val > 100) ? formatNumber(y_tick,0,'','.') : formatNumber(y_tick,2,'','.');
            y_tick += max_val/5;
        }
        
        var y0 = d3.scale.ordinal()
            .domain(y_domain)
            .rangeBands([height-80, content_y]);
    
        var y = d3.scale.linear()
            .domain([0, max_val])
            .range([height-80, content_y]);
    
        // creates x Axis
        var xAxis = d3.svg.axis()
            .scale(x)
            .orient("bottom");
    
        // creates y Axis
        var yAxis = d3.svg.axis()
            .scale(y0)
            .orient("right");
    
        // creates svg container
        var svg = d3.selectAll(container).append("svg")
            .attr("id", "export-svg")
            .attr("style", "background-color:white")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
            .attr("style", "background-color:white");
        
        // add the X Axis
        svg.append("g")
            .attr("transform", "translate(0," + (height - 50) + ")")
            .attr("style", "background-color:white")
            .call(customXAxis);
    
        // Add the Y Axis
        svg.append("g")
            .attr("transform", "translate(10,56)")
            .call(customYAxis);
    
        // draws the border of the chart
        svg.append("rect")
            .attr('x',30)
            .attr('y',40)
            .attr('width',width-21)
            .attr('height',content_height)
            .attr("fill", "none")
            .style('stroke-opacity','#8D8D8D')
            .style('stroke-opacity',1)
            .style('stroke-linejoin','miter')
            .style('fill','none')
            .style('background-color','white')
            .style('stroke','#9da2aa');
        
        // draws inner background boxes
        svg = renderBackBoxes(svg, width+20, content_height, tick_count);
        
        // color vals
        var colors = ['#2685cb','#fec81b' ,'#fc3026','#4ad95a','#4b4ad3','#fee45f',
            '#3366cc','#66aa00', '#dddd22','#7db8ff', '#999999','#dc3912', '#994C00',
            '#2685cb','#fec81b' ,'#fc3026','#4ad95a','#4b4ad3','#fee45f','#2d687e',
            '#3366cc','#66aa00', '#dddd22','#7db8ff', '#999999','#dc3912', '#994C00','#2d687e','#dc3912'
        ];
        
        // draws the lines
        for (var j=0;j<variables.length;j++) {
            svg = renderLine(svg,line_data[j],x,y,colors[j],variables[j]);
        }
        
        // appends title for the graph
        // appends title for the graph
        svg.append("text")
            .attr("x", 4)             
            .attr("y", 0)
            .attr("text-anchor", "start")  
            .style("font-size", "13px") 
            .style("fill","#5C5A5A")
            .style("font-weight","bold")
            .style("font-family", "verdana")
            .text(title);
    
        svg.append("text")
            .attr("x", 4)             
            .attr("y", 20)
            .attr("text-anchor", "start")  
            .style("font-size", "12px") 
            .style("fill","#565656")
            .style("font-style","italic")
            .style("font-family", "verdana")
            .text(sub_title);
        
        // renders legents
        svg = renderLegend(svg, height, variables, colors, args.group_type);
          
        // displays graph
        $(container).parent().removeClass('hide');
        
        $('#chart_type').val('line');
        
        function customYAxis(g) {
            g.call(yAxis);
            g.selectAll("line").style('fill','none').style('stroke','none');
            g.selectAll("text").style('font-size','11px').style('text-anchor','end').style('font-family','tahoma');
            g.selectAll("text").style('fill','#5C5A5A');
            g.selectAll(".tick line").style('display', 'none');
            g.selectAll("path").style('display', 'none');
        }
        
        function customXAxis(g) {
            g.call(xAxis);
            g.selectAll("path").style('fill','#fff');
            g.selectAll("line").style('stroke','none');
            g.selectAll("text").style('font-size','11px').style('text-anchor','middle').style('font-family','tahoma');
            g.selectAll("text").style('fill','#5C5A5A');
            g.selectAll(".minor").fill('stroke-opacity',.5);
        }
        
        // creates png data for the report
        svg2img(args.container);
        
    } catch (err) {
        // displays exception error
        alert(err.message);
        return false;
    }
    
    return false;	
}


/*
 * renders lines inside graph
 * @param {svg} svg 
 * @param {array} data  
 * @param {array} x
 * @param {array} y
 * @param {string} color
 * @param {string} order
 */
function renderLine(svg, data, x, y, color, order) {
    
    // removes zero data
    data = removeZero(data);
    
    // creates tooltip
    var tip = d3.tip()
        .attr('class', 'd3-tip')
        .offset([-10, 0])
        .html(function(d) {
            return order + ', ' + d.year + ', ' + d.value;
        });
    
    svg.call(tip);
    
    // defines the line
    var valueline = d3.svg.line()
        .x(function(d) { return x(d.year); })
        .y(function(d) { return y(d.value)+30; });

    // adds the valueline path
    svg.append("path")
        .data([data])
        .attr("style", "background-color:white")
        .attr("stroke", color)
        .attr("stroke-width", "2")
        .attr("class", order)
        .attr("d", valueline)
        .attr("opacity", "1")
        .style("fill","none")
        .style("stroke-width",1);
       
    
    // adds the circle in points
    var circleAttrs = {
        cx: function(d) { return xScale(d.x); },
        cy: function(d) { return yScale(d.y); },
        r: 8
    };
    
    // adds the scatterplot
    svg.selectAll("dot")
        .data(data)
        .enter().append("circle")
        .attr("class", order)
        .attr("fill", "#fff")
        .attr("stroke", color)
        .attr("stroke-width", "1")
        .attr("r", 3)
        .attr("cx", function(d) { return x(d.year); })
        .attr("cy", function(d) { return y(d.value)+30; })
        .on('mouseover', // shows tooltip
            function(d, i, j) { 
                tip.show(d, i, j); 
                d3.select(this)
                    .transition()
                    .duration(100)
                    .attr('r',4);
            }
        )
        .on('mouseout', // hides tooltip
            function(d, i, j) { 
                tip.hide(d, i, j); 
                d3.select(this)
                    .attr('r',3);
            }
        );

    return svg;
}



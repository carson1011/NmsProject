console.log("nms-dhtml.js");
let html;
$().ready(function nms_paneldev(){
    console.log("nms_paneldev");

    html = '<div class="panel-bordered">';
    html += '<div class="panel-heading bg-gray-200">';
    html += '<div class="row m-1">';
    html += '<div class="col-md-4 my-1">'
    html += '<h5 class="panel-title my-2">'+
        '인원 현황' + '</h5>';
    html += '<div class="panel-body">';
    html += '<div class="row">';
    html += '<div class="col-md-6">';
    html += '<div class="row">';

    html += '</div>';
    html += '</div>'; //row
    html += '</div>'; //penel-body
    html += '</div>'; //col-md-4 my-1
    html += '</div>'; //row m-1
    html += '</div>'; //panel-heading bg-gray-200
    html += '</div>'; //panel-bordered

    console.log(html);
    $('#nms_paneldev').empty();
    $('#nms_paneldev').append(html);
});




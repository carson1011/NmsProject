console.log("device.js");

function getMaplist() {
    $.ajax({
        type: 'GET',
        url: '/device/test/',
        contentType: 'application/json;charset=utf-8'
    }).done(function (result) {
        console.log(result);

    })
}


function getDeviceList(tree_id) {
    $.ajax({
        type: 'GET',
        url: '/device/devicelist/' + tree_id,
        contentType: 'application/json;charset=utf-8'
    }).done(function (result) {
        console.log(result)
    })
};

function insertDevice(cmtdata) {
    let header = $('meta[name="_csrf_header"]').attr('content');
    let token = $('meta[name="_csrf"]').attr('content');
    $.ajax({
        type: 'POST',
        url: '/device/deviceinput',
        data: JSON.stringify(cmtData),
        contentType: 'application/json;charset=utf-8',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    }).done(function (result) {

    });
}

function updateDevice(cmtdata) {
    let header = $('meta[name="_csrf_header"]').attr('content');
    let token = $('meta[name="_csrf"]').attr('content');
    $.ajax({
        type: 'POST',
        url: '/device/devicemodify',
        data: JSON.stringify(cmtData),
        contentType: 'application/json;charset=utf-8',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    }).done(function (result) {

    });
}
function deleteDevice(cmtdata) {
    let header = $('meta[name="_csrf_header"]').attr('content');
    let token = $('meta[name="_csrf"]').attr('content');
    $.ajax({
        type: 'POST',
        url: '/device/deviceremove',
        data: JSON.stringify(cmtData),
        contentType: 'application/json;charset=utf-8',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    }).done(function (result) {

    });
}

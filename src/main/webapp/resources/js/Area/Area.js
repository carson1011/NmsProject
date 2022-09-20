console.log('Area.js');

function Area_TreeHead(sName,iid,children) {
    console.log("area.js check");
    let html =
`<div class="card shadow" >
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col-5">
            <h6 class="m-0 font-weight-bold text-dark">Edit Area</h6>
        </div>
        <div class="col-1 align-items-end">
            <a  type="button" class="btn btn-warning"
            data-toggle="modal" data-target="#EditModal">
                <span class="icon text-white-50"></span>
                <span class="text">Edit</span>
            </a>  
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-2">
                Area
            </div>
            <div class="col-4">
                <input type="text" id="area_root_name" class="form-control form-control-sm" 
                style="width: 200px" value="${sName}">
                <input type="hidden" id="area_root_iid" class="form-control form-control-sm" 
                style="width: 200px" value="${iid}" >
            </div>
        </div>
    </div>
</div>
<div class="card shadow mt-2" >
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col-5">
            <h6 class="m-0 font-weight-bold text-dark">Add Under Area</h6>
        </div>
        <div class="col-1 align-items-end">
            <a type="button" class="btn btn-facebook" 
            data-toggle="modal" data-target="#AddModal">
                <span class="icon text-white-50"></span>
                <span class="text">Add</span>
            </a>  
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-2">
                <div>
                    Area
                </div>
                <div class="mt-4">
                    Area_Description
                </div>                
            </div>
            <div class="col-4">
                <input type="text" id="area_add_name" class="form-control form-control-sm" style="width: 200px" >
                <input type="text" id="area_add_desc" class="form-control form-control-sm mt-3" style="width: 400px" >
            </div>
        </div>
    </div>
</div>`;

    $('#Area_InfoPanel').empty();
    $('#Area_InfoPanel').append(html);
}

function Area_TreeChild(sName,iid,sDesc,children) {
    let html =
        `<div class="card shadow" >
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col-5">
            <h6 class="m-0 font-weight-bold text-dark">Edit Area</h6>
        </div>
        <div class="col-3 align-items-end">
            <a type="button" class="btn btn-warning float-right"
            data-toggle="modal" data-target="#EditModal">
                <span class="icon text-white-50"></span>
                <span class="text">Edit</span>
            </a>
            <a type="button" class="btn btn-danger float-right" style="margin-right: 15px"
            data-toggle="modal" data-target="#RemoveModal">
                <span class="icon text-white-50"></span>
                <span class="text">Remove</span>
            </a>  
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-2">
                Area
            </div>
            <div class="col-4">
                <input type="text" id="area_root_name" class="form-control form-control-sm" 
                style="width: 200px" value="${sName}">
                <input type="hidden" id="area_root_iid" class="form-control form-control-sm" 
                style="width: 200px" value="${iid}" >
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-2">
                Area Description       
            </div>  
            <div class="col-4">
                <input type="text" id="area_root_desc" class="form-control form-control-sm" 
                style="width: 400px" value="${sDesc}">
            </div>
        </div>
    </div>
</div>
<div class="card shadow mt-2" >
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col-5">
            <h6 class="m-0 font-weight-bold text-dark">Add Under Area</h6>
        </div>
        <div class="col-3 align-items-end " >
            <a type="button" class="btn btn-facebook float-right"
             data-toggle="modal" data-target="#AddModal">
                <span class="icon text-white-50"></span>
                <span class="text">Add</span>
            </a>  
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-2">
                <div>
                    Adding Area
                </div>
                <div class="mt-4">
                    Area Description
                </div>                
            </div>
            <div class="col-4">
                <input type="text" id="area_add_name" class="form-control form-control-sm" style="width: 200px" >
                <input type="text" id="area_add_desc" class="form-control form-control-sm mt-3" style="width: 400px" >
            </div>
        </div>
    </div>
</div>`;

    $('#Area_InfoPanel').empty();
    $('#Area_InfoPanel').append(html);
}

function refreshMemList(){
    location.reload();
}

function insertMap(cmtdata){
    let header = $('meta[name="_csrf_header"]').attr('content');
    let token = $('meta[name="_csrf"]').attr('content');
    $.ajax({
        type: 'POST',
        url: '/area/addmap',
        data: JSON.stringify(cmtData),
        contentType: 'application/json;charset=utf-8',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    }).done(function (result) {
        refreshMemList();
    });
}

function updateMapHead(dmtdata){
    let header = $('meta[name="_csrf_header"]').attr('content');
    let token = $('meta[name="_csrf"]').attr('content');
    $.ajax({
        type: 'POST',
        url: '/area/modifymaphead',
        data: JSON.stringify(cmtData),
        contentType: 'application/json;charset=utf-8',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    }).done(function (result) {
        refreshMemList();
    });
}

function deleteMap(cmtdata){
    let header = $('meta[name="_csrf_header"]').attr('content');
    let token = $('meta[name="_csrf"]').attr('content');
    $.ajax({
        type: 'POST',
        url: '/area/removemap',
        data: JSON.stringify(cmtData),
        contentType: 'application/json;charset=utf-8',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    }).done(function (result) {
        refreshMemList();
    });
}
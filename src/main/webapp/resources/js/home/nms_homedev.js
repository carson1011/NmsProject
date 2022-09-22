console.log('nms_homedev.js')

function homedev_mapHead(streeHead_children) {
    let html_homedev_mapHead_Area = "";
    streeHead_children.forEach(function (element) {
        html_homedev_mapHead_Area += `<div class="mt-2">
                                          <input type="text" class="form-control form-control-sm" value="${element}" readonly="">
                                      </div>`
    })
    let html =
        `
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col-12 mt-1">
            <h6 class="font-weight-bold text-dark ">Area Count Status</h6>
        </div>
    </div>
    <div class="card-body" style="height: 423px">
        <div class="row">
            <div class="col-3">
                <label class="font-weight-bold text-dark ml-2">Area</label>
                <div id="homedev_mapHead_Area">
                    ${html_homedev_mapHead_Area}
                </div>
            </div>
            <div class="col-3">
                <label class="font-weight-bold text-dark ml-2">In</label>
                <div id="homedev_mapHead_In"></div>            
            </div>
            <div class="col-3">
                <label class="font-weight-bold text-dark ml-2">Out</label>
                <div id="homedev_mapHead_Out"></div>
            </div>
            <div class="col-3">
                <label class="font-weight-bold text-dark ml-2">Occupants</label>
                <div id="homedev_mapHead_Occupants"></div>
            </div>
        </div>
    </div>
        `


    $('#nms_devPanel').empty();
    $('#nms_devPanel').append(html);
}

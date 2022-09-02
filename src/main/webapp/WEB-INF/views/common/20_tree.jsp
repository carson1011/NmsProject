<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


    <div class="card-heading bg-gray-200">
        <div class="row m-1">
            <div class="col-md-4 my-1">
                <h5 class="panel-title my-2">Section</h5>
            </div>
            <div class="col-md-8 text-right panel-heading-right my-2">
                <button id="openallnode" class="btn btn-sm bg-gray-400">
                    <i class="fas fa-fw fa-arrow-down"></i>
                </button>
                <button id="closeallnode" class="btn btn-sm bg-gray-400">
                    <i class="fas fa-fw fa-arrow-up"></i>
                </button>
            </div>
        </div>
    </div>

    <div class="card-body bg-gray-200">
        <div class="scroll-content" style="height: 515px">
            <div id="treeview"></div>
        </div>
        <button id="test_btn" onclick="nms_paneldev()"/>
    </div>



<script>
    BuildTree();

    $('#treeview').bind('select_node.jstree', function (event, data) {
        let tree_id = data.instance.get_node(data.selected).id;
        let tree_text = data.instance.get_node(data.selected).text;
        let tree_parent = data.instance.get_node(data.selected).parent;
        console.log("treeid:" + tree_id);
        console.log("treetxt:" + tree_text);
        console.log("treept:" + tree_parent);
        getDeviceList(tree_id);
    });

    function BuildTree() {
        $('#treeview').jstree({
            'core': {
                'data': {
                    "url": '/nms/treelist',
                    "dataType": 'json'
                    /*                    'data': function (node) {
                                            return {'iId': node.iId};
                                        }*/
                }
            }
        }).bind('ready.jstree', function (event, data) {
            /*$("#treeview").jstree("open_all");*/
            console.log(data);
        });
    }


    $(document).on('click', '#test_btn', function () {
        let Id = 4;
        let name = "testtext";
        cmtData = {iid: Id, sname: name};
        insertDevice(cmtData);
    });
    /* 전체열기 */
    $('#openallnode').on('click', function () {
        console.log("openAllnode");
        $("#treeview").jstree("open_all");
    });
    /* 전체닫기 */
    $('#closeallnode').on('click', function () {
        console.log("closeAllnode");
        $("#treeview").jstree("close_all");
    });

</script>
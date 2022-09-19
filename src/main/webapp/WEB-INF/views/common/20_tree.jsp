<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/jstree/jstree.js"></script>
<script src="/resources/jstree/jstree.min.js"></script>
<link rel="stylesheet" href="/resources/jstree/style.min.css">
<div class="card shadow">
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col-5">
            <h5 class="m-0 font-weight-bold text-dark">Section</h5>
        </div>
        <div class="col-7 text-right">
<%--            <button id="openallnode" class="btn btn-sm bg-gray-400">
                <i class="fas fa-fw fa-arrow-alt-circle-down"></i>
            </button>
            <button id="closeallnode" class="btn btn-sm bg-gray-400">
                <i class="fas fa-fw fa-arrow-alt-circle-up"></i>
            </button>--%>
        </div>
    </div>
    <div class="card-body">
        <div class="scroll-content" style="height: 515px">
            <div id="treeview"></div>
        </div>
    </div>
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


    function BuildTree(){
        $('#treeview').jstree({
            'core': {
                'data': {
                    "url": '/nms/treelist',
                    "dataType": 'json'
                }
            }
        }).bind('ready.jstree', function (event, data) {
            data.instance.open_all();
        })
    }

/*    /!* 전체열기 *!/
    $('#openallnode').on('click', function () {
        $('#treeview').bind('ready.jstree', function(data){
            data.instance.open_all();
        })
        console.log("openAllnode");
    });
    /!* 전체닫기 *!/
    $('#closeallnode').on('click', function () {
        $('#treeview').bind('ready.jstree', function(data){
            data.instance.close_all();
        })
        console.log("closeAllnode");
    });*/

</script>

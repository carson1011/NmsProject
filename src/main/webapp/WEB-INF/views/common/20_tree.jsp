<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/jstree/jstree.js"></script>
<script src="/resources/jstree/jstree.min.js"></script>
<link rel="stylesheet" href="/resources/jstree/style.min.css">

<% String sLocation = (String) request.getAttribute("Url_location"); %>
<div class="card shadow">
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col">
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
        let tree_desc = data.instance.get_node(data.selected).original.sdesc;
        let tree_children = data.instance.get_node(data.selected).children;

        if ("<%=sLocation%>" == 'Area') {
            let tree_children_txt = [];
            let stree_children_hasDev = [];
            let itree_children_hasDev = [];

            if (hasDev.includes(tree_id)) {
                stree_children_hasDev.push(tree_text);
                itree_children_hasDev.push(tree_id);
            }

            for (let i = 0; i < tree_children.length; i++) {
                tree_children_txt[i] = ' ' + data.instance.get_node(tree_children[i]).text;
                if (hasDev.includes(tree_children[i])) {
                    stree_children_hasDev.push(data.instance.get_node(tree_children[i]).text);
                    itree_children_hasDev.push(tree_children[i]);
                }
            }
            if (tree_id == 1)
                Area_TreeHead(tree_text, tree_id);
            else {
                Area_TreeChild(tree_text, tree_id, tree_desc, tree_children, tree_children_txt, itree_children_hasDev, stree_children_hasDev);
            }
        }
        console.log(data);
        /*console.log("treeid:" + tree_id);
        console.log("treetxt:" + tree_text);
        console.log("treept:" + tree_parent);
        console.log("treeds:" + tree_desc);
        console.log("tree_children:" + tree_children);
        console.log("itree_children_hasDev:" + itree_children_hasDev);*/

        if(tree_parent != '#' && tree_parent != 1)
            getDeviceList(tree_id);
    });


    function BuildTree() {
        $('#treeview').jstree({
            'core': {
                'data': {
                    "url": '/nms/treelist',
                    "dataType": 'json'
                }
            }
        }).bind('ready.jstree', function (event, data) {
            data.instance.open_all();
            /*start home instance*/
            let itreeHead_children = data.instance.get_node(1).children;
            let streeHead_children = [];
            itreeHead_children.forEach(function (element){
                streeHead_children.push(data.instance.get_node(element).text);
            })
            console.log(streeHead_children);
            if("<%=sLocation%>" == 'Home'){
                homedev_mapHead(streeHead_children);
            }
            /*end home instance*/
            /*start Area instance*/
            if ("<%=sLocation%>" == 'Area') {
                let tree_id = data.instance.get_node(1).id;
                let tree_text = data.instance.get_node(1).text;
                Area_TreeHead(tree_text, tree_id);
            }
            /*end Area instace*/
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

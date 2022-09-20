<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card shadow">
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col-5">
            <h6 class="m-0 font-weight-bold text-dark">Edit Area</h6>
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-2 text-center">
                Area
            </div>
            <%--<c:if --%>
            ${tree_id_Area}
            <div class="col-4">
                <input type="text" id="area_root_name" name="sName" class="form-control form-control-sm" style="width: 200px">
            </div>
        </div>
    </div>
</div>



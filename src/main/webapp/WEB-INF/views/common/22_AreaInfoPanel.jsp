<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card shadow" >
    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
        <div class="col-5">
            <h6 class="m-0 font-weight-bold text-dark">Edit Area</h6>
        </div>
        <div class="col-1 align-items-end">
            <a id="MaplistEditBtn" type="button" class="btn btn-warning">
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
                       style="width: 200px" >
                <input type="hidden" id="area_root_iid" class="form-control form-control-sm"
                       style="width: 200px"  >
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
            <a id="MaplistAddBtn" type="button" class="btn btn-facebook"
               data-toggle="modal" data-target="#devAddModal">
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
                <input type="text" id="area_add" class="form-control form-control-sm" style="width: 200px" >
                <input type="text" id="area_add_note" class="form-control form-control-sm mt-3" style="width: 400px" >
            </div>
        </div>
    </div>
</div>
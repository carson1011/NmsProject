<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
  <div class="col-12 card shadow mt-2 mb-2 ">
    <div style="margin-left: 20px; margin-top:15px;
                                    margin-bottom: 10px">
      <label style="font-weight: bold; font-size: 22px; margin-top: 7px;"> 인원 현황</label>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-xl-4 col-md-6 mb-2">
    <div class="card border-left-primary shadow h-100 py-1">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
              Total Member
            </div>
            <div class="h5 mb-0 font-weight-bold text-dark">
              <input id="Total_Cnt" type="text"
                     class="form-control bg-white border-0 small"
                     placeholder="0" readonly="">
            </div>
          </div>

          <div class="col-auto">
            <i class="fas fa-person-booth fa-2x text-dark"></i>
          </div>
        </div>
        <row>
          <div class="col">
            <div class="progress progress-sm mr-2">
              <div id="Total_cnt_bar" class="progress-bar bg-primary"
                   role="progressbar"
                   style="width: 70%" aria-valuenow="50" aria-valuemin="0"
                   aria-valuemax="100"></div>
            </div>
          </div>
        </row>
      </div>
    </div>
  </div>
  <div class="col-xl-4 col-md-6 mb-2">
    <div class="card border-left-success shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
              In Count
            </div>
            <div class="h5 mb-0 font-weight-bold text-dark">
              <input id="Total_In_Cnt" type="text"
                     class="form-control bg-white border-0 small"
                     placeholder="0" readonly="">
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-door-open fa-2x text-dark"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-xl-4 col-md-6 mb-2">
    <div class="card border-left-info shadow h-100 py-2">
      <div class="card-body">
        <div class="row no-gutters align-items-center">
          <div class="col mr-2">
            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
              Out Count
            </div>
            <div class="row no-gutters align-items-center">
              <div class="col-auto">
                <div class="h5 mb-0 mr-3 font-weight-bold text-dark">
                  <input id="Total_Out_Cnt" type="text"
                         class="form-control bg-white border-0 small"
                         placeholder="0" readonly="">
                </div>
              </div>
            </div>
          </div>
          <div class="col-auto">
            <i class="fas fa-door-closed fa-2x text-dark"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
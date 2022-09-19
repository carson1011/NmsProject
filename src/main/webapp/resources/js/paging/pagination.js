console.log("pagination.js");

function fn_prev(page, range, rangeSize) {
    console.log("fn-prev");
    var page = ((range - 2) * rangeSize) + 1;
    var range = range - 1;
    var url = "/device/devmngmt";
    if(page > 0 && range > 0 ){
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }
}



//페이지 번호 클릭
function fn_pagination(page, range, rangeSize, searchType, keyword) {
    console.log("fn-pagination");
    var url = "/device/devmngmt";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    location.href = url;
}



//다음 버튼 이벤트

function fn_next(page, range, rangeSize) {
    console.log("fn-next");
    var page = parseInt((range * rangeSize)) + 1;
    var range = parseInt(range) + 1;
    var url = "/device/devmngmt";
    url = url + "?page=" + page;
    url = url + "&range=" + range;
    location.href = url;

}
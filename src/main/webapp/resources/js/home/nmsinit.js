
console.log("nmsinit.js");
var hasDev = [];
 $(document).ready( function (){
    $.ajax({
        type: 'GET',
        url: '/device/deviceAlllist/',
        contentType: 'application/json;charset=utf-8'
    }).done(function (result) {
        for(let i=0;i<result.length; i++){
            hasDev[i] = result[i].iid.toString();
        }
    })
})






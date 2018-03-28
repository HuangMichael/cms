/**
 * Created by huangbin on 2018-3-1 09:46:42.

 */


$(function () {
    dataTableName = "#workOrderListTable";
    docName = "维修单信息";
    mainObject = "workOrderRepair";
    var searchVue = new Vue({
        el: "#searchBox"
    });


    searchModel = [
        {"param": "orderDesc", "paramDesc": "工单描述"},
        {"param": "orderState", "paramDesc": "工单状态"},
        {"param": "status", "paramDesc": "状态"}
    ];


    var grid = $(dataTableName).bootgrid({
        selection: true,
        ajax: true,
        post: function () {
            return {
                id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
            };
        },
        url: "/" + mainObject + "/data",
        converters: {
            showOrderState: {
                to: showOrderState
            },
            showStatus: {
                to: showStatus
            },
            showReportType: {
                to: showReportType
            },
            showEqName: {
                to: showEqName
            },
            showLocName: {
                to: showLocName
            },
            showEqClassName: {
                to: showEqClassName
            }
        }
    })


    $("#searchBtn").trigger("click");


    initSelect();


});




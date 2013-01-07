/**
 * Created with IntelliJ IDEA.
 * User: Mary
 * Date: 1/7/13
 * Time: 9:30 AM
 * To change this template use File | Settings | File Templates.
 */

var loadOverlayAttachmentPhase = function (remoteAddress, saveAddress, saveCallback, loadCallback, params) {
    if (!params)
        params = {}
    $.ajaxSettings.traditional = true;
    $.ajax({
        type:"GET",
        url:remoteAddress
    }).done(function (response) {
            var r = $("#ajax-form" + remoteAddress.hashCode());
            if (!r.length)
                r = $("<form id='ajax-form" + remoteAddress.hashCode() + "' enctype='multipart/form-data' action='" + saveAddress + "'></form>")
            r.html("")

            r.dialog({
                modal:true,
                width:params.width,
                resizable:false,
                buttons:{
                    'ذخیره':function () {
                        if (params && params.beforeSubmit)
                            params.beforeSubmit();
                        if((params.confirm=='Y' && confirm("Are-you-sure"))||params.confirm=='N' ){
                            r.ajaxSubmit({
                                url:saveAddress,
                                type:"post",
                                success:function (resp) {
                                    if (params && params.afterSave)
                                        params.afterSave(resp)
                                    if (saveCallback) {
                                        saveCallback(resp)
                                    }
                                }
                            })
                        }
                        $(this).dialog("close");
                    },
                    "انصراف":function () {
                        $(this).dialog("close");
                    }
                },
                close:function () {
                    r.html("")
                }
            })
            if (params && params.width) {
                r.dialog("option", "width", params.width)
                r.dialog("option", "position", "top")
            }

            r.append(response);
            if (loadCallback)
                loadCallback(response);
        });
}

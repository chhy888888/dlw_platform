
/**
 * 查询字典表一级列表
 * @param str	属性
 */
 function getDictionariesOne(str){
	$.ajax({
        url: "http://localhost:8080/system/getSystemDictionaries",
        data:{ sd_flag:str },
        type : "post",
        dataType: "text",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function (dataInfo) {
        	var strHtml = "<option value = '0'>请选择</option>";
        	var data = $.parseJSON(dataInfo);
        	if(data.message){
        		for(var i = 0 ; i < data.data.length ; i++ ){
        			strHtml += "<option value = '"+data.data[i].sd_id+"'>"+data.data[i].sd_item+"</option>";
        		}
        		$("#"+str).empty().append(strHtml);
        	}else{
        		alert(data.data);
        	}
        }
    });
}
/**
 * 查询下级列表
 * @param str
 */
function getDictionariesTwo(){
	var str = $("#area").val(); 
	$.ajax({
        url: "http://localhost:8080/system/getSystemDictionariesSubnode",
        data:{ sd_parentid:str },
        type : "post",
        dataType: "text",
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        success: function (dataInfo) {
        	var strHtml = "<option value = '0'>请选择</option>";
        	var data = $.parseJSON(dataInfo);
        	if(data.message){
        		for(var i = 0 ; i < data.data.length ; i++ ){
        			strHtml += "<option value = '"+data.data[i].sd_id+"'>"+data.data[i].sd_item+"</option>";
        		}
        		$("#Countryinfo").empty().append(strHtml);
        	}else{
        		alert(data.data);
        	}
        }
    });
}



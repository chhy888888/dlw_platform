<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String fc_id = request.getAttribute("fc_fnid")+"";
%>
<!DOCTYPE html>
<html>
  <head>
    <title>进度</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="<%=basePath %>css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath %>css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath %>css/styles.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath %>css/style.css" type="text/css" rel="stylesheet"/>
    <!-- <script src="resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="resources/scripts/prototypePre.js"></script>
    <script src="data/document.js"></script>
    <script src="resources/scripts/prototypePost.js"></script>
    <script src="files/进度/data.js"></script> -->
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript">
     /*  $axure.utils.getTransparentGifPath = function() { return 'resources/images/transparent.gif'; };
      $axure.utils.getOtherPath = function() { return 'resources/Other.html'; };
      $axure.utils.getReloadPath = function() { return 'resources/reload.html'; }; */
      var  fc_id = "<%=fc_id%>";
      $(function(){
    	  getZsxyInfo();
    	  getSpInfo();
    	  getXyInfo();
    	  getFileInfo();
      });
      // 获取正式协议详情
      function getZsxyInfo(){
			var fn_code = $("#fn_code").val();
			var fn_datetimeQ = $("#fn_datetimeQ").val();
			var fn_datetimeJ = $("#fn_datetimeJ").val();
			var uls = "<%=basePath %>/financing/getZsxyXqInfo";
			uls = uls;
			$.ajax({
				type : "post",
				url : uls,
				data : {fn_id:fc_id},
				dataType : "text",
				async : false,
				success : function(dataInfo) {
					//格式化
					var data = $.parseJSON(dataInfo);
					//合同要点
					var htyd = data.getfinancingNeedsProductInfo;
					//备注
					var bz = data.fn_remark_cn;
					for(key in data){
						$("#"+key).html($("#"+key).html()+data[key]);
					}
				}
			});
		}
      //获取商品列表
      function getSpInfo(){
			var uls = "<%=basePath %>/financing/getfinancingNeedsProductInfo";
			uls = uls;
			$.ajax({
				type : "post",
				url : uls,
				data : {fnp_fnid:fc_id},
				dataType : "text",
				async : false,
				success : function(dataInfo) {
					//格式化
					var data = $.parseJSON(dataInfo);
				}
			});
		}
      //获取协议阶段内容
      function getXyInfo(){
			var uls = "<%=basePath %>/financing/getfinancingContractInfo";
			uls = uls;
			$.ajax({
				type : "post",
				url : uls,
				data : {fc_fnid:fc_id},
				dataType : "text",
				async : false,
				success : function(dataInfo) {
					alert("dataInfo>>>"+dataInfo);
					//fc_commercialinvoice - fc_advancecharge) *
					//格式化
					var data = $.parseJSON(dataInfo);
				}
			});
		}
      //获取附近列表
      function getFileInfo(){
    	  var uls = "<%=basePath %>/financing/getFileList";
			uls = uls;
			$.ajax({
				type : "post",
				url : uls,
				data : {af_fnid:fc_id},
				dataType : "text",
				async : false,
				success : function(dataInfo) {
					//格式化
					var data = $.parseJSON(dataInfo);
				}
			});
      }
    </script>
  </head>
  <body>
    <body>
    <div id="base" class="">

      <!-- Unnamed (矩形) -->
      <div id="u929" class="ax_default box_1">
        <div id="u929_div" class=""></div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u930" class="ax_default box_1">
        <div id="u930_div" class=""></div>
        <div id="u930_text" class="text ">
          <p><span>融资需求信息</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u931" class="ax_default box_1">
        <div id="u931_div" class=""></div>
        <div id="u931_text" class="text ">
          <p><span>融资流程</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u932" class="ax_default box_1">
        <div id="u932_div" class=""></div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u933" class="ax_default box_1">
        <div id="u933_div" class=""></div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u934" class="ax_default box_2">
        <div id="u934_div" class=""></div>
        <div id="u934_text" class="text ">
          <p><span>2、上传正式</span></p><p><span>合同</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u935" class="ax_default button">
        <div id="u935_div" class=""></div>
        <div id="u935_text" class="text ">
          <p><span>下载</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u936" class="ax_default label">
        <div id="u936_div" class=""></div>
        <div id="u936_text" class="text ">
          <p><span>保理上传的</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u937" class="ax_default button">
        <div id="u937_div" class=""></div>
        <div id="u937_text" class="text ">
          <p><span>下载</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u938" class="ax_default label">
        <div id="u938_div" class=""></div>
        <div id="u938_text" class="text ">
          <p><span>卖家上传的</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u939" class="ax_default label">
        <div id="u939_div" class=""></div>
        <div id="u939_text" class="text ">
          <p><span>xxxxxxxxxx.doc</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u940" class="ax_default label">
        <div id="u940_div" class=""></div>
        <div id="u940_text" class="text ">
          <p><span>xxxxxxxxxx.doc</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u941" class="ax_default button">
        <div id="u941_div" class=""></div>
        <div id="u941_text" class="text ">
          <p><span>参考翻译下载</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u942" class="ax_default box_1">
        <div id="u942_div" class=""></div>
        <div id="u942_text" class="text ">
          <p><span>取消订单</span></p>
        </div>
      </div>

      <!-- Unnamed (组 合) -->
      <div id="u943" class="ax_default" data-left="660" data-top="1223" data-width="607" data-height="950">

        <!-- Unnamed (矩形) -->
        <div id="u944" class="ax_default label">
          <div id="u944_div" class=""></div>
          <div id="u944_text" class="text ">
            <p><span>融资比例：&nbsp; &nbsp; 80%</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u945" class="ax_default label">
          <div id="u945_div" class=""></div>
          <div id="u945_text" class="text ">
            <p><span style="color:#3399FF;">保理融资款</span><span>： USD 800,000&nbsp;&nbsp; </span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u946" class="ax_default label">
          <div id="u946_div" class=""></div>
          <div id="u946_text" class="text ">
            <p><span>保理尾款：&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; USD 200,000&nbsp;&nbsp; </span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u947" class="ax_default label">
          <div id="u947_div" class=""></div>
          <div id="u947_text" class="text ">
            <p><span>预付款</span></p><p><span>付款凭证：</span></p>
          </div>
        </div>

        <!-- Unnamed (占位符) -->
        <div id="u948" class="ax_default placeholder">
          <img id="u948_img" class="img " src="<%=basePath %>images/进度/u948.png"/>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u949" class="ax_default label">
          <div id="u949_div" class=""></div>
          <div id="u949_text" class="text ">
            <p><span>付款时间：2019/09/12</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u950" class="ax_default label">
          <div id="u950_div" class=""></div>
          <div id="u950_text" class="text ">
            <p><span>保理融资款付款凭证：</span></p>
          </div>
        </div>

        <!-- Unnamed (占位符) -->
        <div id="u951" class="ax_default placeholder">
          <img id="u951_img" class="img " src="<%=basePath %>images/进度/u948.png"/>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u952" class="ax_default label">
          <div id="u952_div" class=""></div>
          <div id="u952_text" class="text ">
            <p><span>付款时间：2019/09/12</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u953" class="ax_default label">
          <div id="u953_div" class=""></div>
          <div id="u953_text" class="text ">
            <p><span>保理尾款实付</span></p><p><span>付款凭证：</span></p>
          </div>
        </div>

        <!-- Unnamed (占位符) -->
        <div id="u954" class="ax_default placeholder">
          <img id="u954_img" class="img " src="<%=basePath %>images/进度/u948.png"/>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u955" class="ax_default label">
          <div id="u955_div" class=""></div>
          <div id="u955_text" class="text ">
            <p><span>付款时间：2019/09/12</span></p>
          </div>
        </div>

        <!-- Unnamed (水平线) -->
        <div id="u956" class="ax_default line">
          <img id="u956_img" class="img " src="<%=basePath %>images/进度/u956.png"/>
        </div>

        <!-- Unnamed (水平线) -->
        <div id="u957" class="ax_default line">
          <img id="u957_img" class="img " src="<%=basePath %>images/进度/u956.png"/>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u958" class="ax_default label">
          <div id="u958_div" class=""></div>
          <div id="u958_text" class="text ">
            <p><span style="color:#3399FF;">预付款金额</span><span>： USD 200,000&nbsp;&nbsp; </span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u959" class="ax_default label">
          <div id="u959_div" class=""></div>
          <div id="u959_text" class="text ">
            <p><span>预付款付款时间（预估）：2019/12/08</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u960" class="ax_default label">
          <div id="u960_div" class=""></div>
          <div id="u960_text" class="text ">
            <p><span>应收账款： USD 1,000,000&nbsp;&nbsp; </span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u961" class="ax_default label">
          <div id="u961_div" class=""></div>
          <div id="u961_text" class="text ">
            <p><span style="color:#3399FF;">保理尾款实付：&nbsp; </span><span style="color:#000000;">USD&nbsp; 186,849.32</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u962" class="ax_default label">
          <div id="u962_div" class=""></div>
          <div id="u962_text" class="text ">
            <p><span>融资利息：&nbsp; USD&nbsp; 13,150.68</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u963" class="ax_default label">
          <div id="u963_div" class=""></div>
          <div id="u963_text" class="text ">
            <p><span>计息天数：&nbsp; x天</span></p>
          </div>
        </div>

        <!-- Unnamed (组 合) -->
        <div id="u964" class="ax_default" data-left="702" data-top="1878" data-width="15" data-height="53">

          <!-- Unnamed (垂直线) -->
          <div id="u965" class="ax_default line">
            <img id="u965_img" class="img " src="<%=basePath %>images/进度/u965.png"/>
          </div>

          <!-- Unnamed (椭圆形) -->
          <div id="u966" class="ax_default ellipse">
            <img id="u966_img" class="img " src="<%=basePath %>images/进度/u966.png"/>
          </div>

          <!-- Unnamed (椭圆形) -->
          <div id="u967" class="ax_default ellipse">
            <img id="u967_img" class="img " src="<%=basePath %>images/进度/u966.png"/>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u968" class="ax_default paragraph">
          <div id="u968_div" class=""></div>
          <div id="u968_text" class="text ">
            <p><span>计息开始时间：&nbsp; 2018/09/12&nbsp;&nbsp; (保理支付融资款日期)</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u969" class="ax_default paragraph">
          <div id="u969_div" class=""></div>
          <div id="u969_text" class="text ">
            <p><span>计息结束时间：&nbsp; 2018/12/12&nbsp;&nbsp; (买家实际支付尾款日期)</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u970" class="ax_default label">
          <div id="u970_div" class=""></div>
          <div id="u970_text" class="text ">
            <p><span>年利率：&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 10%</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u971" class="ax_default label">
          <div id="u971_div" class=""></div>
          <div id="u971_text" class="text ">
            <p><span>（提示：买家应支付尾款日期为&nbsp; &nbsp; 2018/12/10）</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u972" class="ax_default label">
        <div id="u972_div" class=""></div>
        <div id="u972_text" class="text ">
          <p><span>报关单金额：&nbsp;&nbsp; </span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u973" class="ax_default label">
        <div id="u973_div" class=""></div>
        <div id="u973_text" class="text ">
          <p><span>预付款金额：&nbsp;&nbsp; </span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u974" class="ax_default paragraph">
        <div id="u974_div" class=""></div>
        <div id="u974_text" class="text ">
          <p><span>提示：平台不对翻译内容/准确性承担法律风险</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u975" class="ax_default label">
        <div id="u975_div" class=""></div>
        <div id="u975_text" class="text ">
          <p><span>提单时间：</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u976" class="ax_default line">
        <img id="u976_img" class="img " src="<%=basePath %>images/进度/u976.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u977" class="ax_default box_1">
        <div id="u977_div" class=""></div>
        <div id="u977_text" class="text ">
          <p><span>第一步：意向/保密协议阶段</span></p>
        </div>
      </div>

      <!-- Unnamed (组 合) -->
      <div id="u978" class="ax_default" data-left="660" data-top="140" data-width="607" data-height="88">

        <!-- Unnamed (矩形) -->
        <div id="u979" class="ax_default box_1">
          <div id="u979_div" class=""></div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u980" class="ax_default box_2">
          <div id="u980_div" class=""></div>
          <div id="u980_text" class="text ">
            <p><span>资金方</span></p><p><span>意向报价</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u981" class="ax_default label">
          <div id="u981_div" class=""></div>
          <div id="u981_text" class="text ">
            <p><span>年利率</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u982" class="ax_default label">
          <div id="u982_div" class=""></div>
          <div id="u982_text" class="text ">
            <p><span>应收账款的融资比例</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u983" class="ax_default paragraph">
          <div id="u983_div" class=""></div>
          <div id="u983_text" class="text ">
            <p><span>8%-10%</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u984" class="ax_default paragraph">
          <div id="u984_div" class=""></div>
          <div id="u984_text" class="text ">
            <p><span>80%</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u985" class="ax_default line">
        <img id="u985_img" class="img " src="<%=basePath %>images/进度/u985.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u986" class="ax_default box_1">
        <div id="u986_div" class=""></div>
        <div id="u986_text" class="text ">
          <p><span>第二步：签订正式协议阶段</span></p>
        </div>
      </div>

      <!-- Unnamed (组 合) -->
      <div id="u987" class="ax_default" data-left="659" data-top="307" data-width="607" data-height="113">

        <!-- Unnamed (矩形) -->
        <div id="u988" class="ax_default box_1">
          <div id="u988_div" class=""></div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u989" class="ax_default box_2">
          <div id="u989_div" class=""></div>
          <div id="u989_text" class="text ">
            <p><span>1、签订正式</span></p><p><span>协议</span></p>
          </div>
        </div>

        <!-- Unnamed (组 合) -->
        <div id="u990" class="ax_default" data-left="762" data-top="327" data-width="306" data-height="64">

          <!-- Unnamed (矩形) -->
          <div id="u991" class="ax_default label">
            <div id="u991_div" class=""></div>
            <div id="u991_text" class="text ">
              <p><span>年利率</span></p>
            </div>
          </div>

          <!-- Unnamed (矩形) -->
          <div id="u992" class="ax_default label">
            <div id="u992_div" class=""></div>
            <div id="u992_text" class="text ">
              <p><span>应收账款的融资比例</span></p>
            </div>
          </div>

          <!-- Unnamed (矩形) -->
          <div id="u993" class="ax_default paragraph">
            <div id="u993_div" class=""></div>
            <div id="u993_text" class="text ">
              <p><span>待资金方给出/10%</span></p>
            </div>
          </div>

          <!-- Unnamed (矩形) -->
          <div id="u994" class="ax_default paragraph">
            <div id="u994_div" class=""></div>
            <div id="u994_text" class="text ">
              <p><span>待资金方给出/80%</span></p>
            </div>
          </div>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u995" class="ax_default line">
        <img id="u995_img" class="img " src="<%=basePath %>images/进度/u995.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u996" class="ax_default box_1">
        <div id="u996_div" class=""></div>
        <div id="u996_text" class="text ">
          <p><span>第三步：买方确权</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u997" class="ax_default line">
        <img id="u997_img" class="img " src="<%=basePath %>images/进度/u985.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u998" class="ax_default box_1">
        <div id="u998_div" class=""></div>
        <div id="u998_text" class="text ">
          <p><span>第四步：付款</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u999" class="ax_default box_1">
        <div id="u999_div" class=""></div>
      </div>

      <!-- Unnamed (组 合) -->
      <div id="u1000" class="ax_default" data-left="949" data-top="683" data-width="241" data-height="106">

        <!-- Unnamed (矩形) -->
        <div id="u1001" class="ax_default label">
          <div id="u1001_div" class=""></div>
          <div id="u1001_text" class="text ">
            <p><span>确权方式</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1002" class="ax_default paragraph">
          <div id="u1002_div" class=""></div>
          <div id="u1002_text" class="text ">
            <p><span style="font-family:'Arial Negreta', 'Arial Normal', 'Arial';font-weight:700;">一次签署三方：</span></p><p><span style="font-family:'Arial Normal', 'Arial';font-weight:400;">签署一次三方（买方、卖方、资金方）应收账款转让协议，具体每笔订单通过电子邮件确认，无需再次签署三方应收账款转让协议</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1003" class="ax_default box_2">
        <div id="u1003_div" class=""></div>
        <div id="u1003_text" class="text ">
          <p><span>计算公式说明</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1004" class="ax_default paragraph">
        <div id="u1004_div" class=""></div>
        <div id="u1004_text" class="text ">
          <p><span>1）xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1005" class="ax_default paragraph">
        <div id="u1005_div" class=""></div>
        <div id="u1005_text" class="text ">
          <p><span>2）xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1006" class="ax_default paragraph">
        <div id="u1006_div" class=""></div>
        <div id="u1006_text" class="text ">
          <p><span>3）xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1007" class="ax_default box_2">
        <div id="u1007_div" class=""></div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1008" class="ax_default label">
        <div id="u1008_div" class=""></div>
        <div id="u1008_text" class="text ">
          <p><span>2. 核保额度</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u1009" class="ax_default line">
        <img id="u1009_img" class="img " src="<%=basePath %>images/进度/u1009.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1010" class="ax_default label">
        <div id="u1010_div" class=""></div>
        <div id="u1010_text" class="text ">
          <p><span>3. 商品信息</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u1011" class="ax_default line">
        <img id="u1011_img" class="img " src="<%=basePath %>images/进度/u1009.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1012" class="ax_default label">
        <div id="u1012_div" class=""></div>
        <div id="u1012_text" class="text ">
          <p><span>5. 备注</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u1013" class="ax_default line">
        <img id="u1013_img" class="img " src="<%=basePath %>images/进度/u1013.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1014" class="ax_default paragraph">
        <div id="u1014_div" class=""></div>
        <div id="u1014_text" class="text ">
          <p><span>保险公司：<span id="fn_insurer"></span></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1015" class="ax_default paragraph">
        <div id="u1015_div" class=""></div>
        <div id="u1015_text" class="text ">
          <p><span>授信额度：USD <span id="fn_creditlimit"></span>&nbsp; </span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1016" class="ax_default label">
        <div id="u1016_div" class=""></div>
        <div id="u1016_text" class="text ">
          <p><span id="xmfbz">信息发布者：</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1017" class="ax_default label">
        <div id="u1017_div" class=""></div>
        <div id="u1017_text" class="text ">
          <p><span>1. 买家信息</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u1018" class="ax_default line">
        <img id="u1018_img" class="img " src="<%=basePath %>images/进度/u1018.png"/>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u1019" class="ax_default line">
        <img id="u1019_img" class="img " src="<%=basePath %>images/进度/u1019.png"/>
      </div>

      <!-- Unnamed (表格) -->
      <div id="u1020" class="ax_default">

        <!-- Unnamed (单元格) -->
        <div id="u1021" class="ax_default table_cell">
          <img id="u1021_img" class="img " src="<%=basePath %>images/进度/u1021.png"/>
          <div id="u1021_text" class="text ">
            <p><span>HS编码</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1022" class="ax_default table_cell">
          <img id="u1022_img" class="img " src="<%=basePath %>images/进度/u1022.png"/>
          <div id="u1022_text" class="text ">
            <p><span>标准商品全名</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1023" class="ax_default table_cell">
          <img id="u1023_img" class="img " src="<%=basePath %>images/进度/u1022.png"/>
          <div id="u1023_text" class="text ">
            <p><span>名称</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1024" class="ax_default table_cell">
          <img id="u1024_img" class="img " src="<%=basePath %>images/进度/u1022.png"/>
          <div id="u1024_text" class="text ">
            <p><span>数量</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1025" class="ax_default table_cell">
          <img id="u1025_img" class="img " src="<%=basePath %>images/进度/u1025.png"/>
          <div id="u1025_text" class="text ">
            <p><span>单位</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1026" class="ax_default table_cell">
          <img id="u1026_img" class="img " src="<%=basePath %>images/进度/u1026.png"/>
          <div id="u1026_text" class="text ">
            <p><span>xxxxxxxx</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1027" class="ax_default table_cell">
          <img id="u1027_img" class="img " src="<%=basePath %>images/进度/u1027.png"/>
          <div id="u1027_text" class="text ">
            <p><span>xxx</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1028" class="ax_default table_cell">
          <img id="u1028_img" class="img " src="<%=basePath %>images/进度/u1027.png"/>
          <div id="u1028_text" class="text ">
            <p><span>wine</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1029" class="ax_default table_cell">
          <img id="u1029_img" class="img " src="<%=basePath %>images/进度/u1027.png"/>
          <div id="u1029_text" class="text ">
            <p><span>3</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1030" class="ax_default table_cell">
          <img id="u1030_img" class="img " src="<%=basePath %>images/进度/u1030.png"/>
          <div id="u1030_text" class="text ">
            <p><span>千克/kg</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1031" class="ax_default table_cell">
          <img id="u1031_img" class="img " src="<%=basePath %>images/进度/u1031.png"/>
          <div id="u1031_text" class="text ">
            <p><span>xxxxxxxx</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1032" class="ax_default table_cell">
          <img id="u1032_img" class="img " src="<%=basePath %>images/进度/u1032.png"/>
          <div id="u1032_text" class="text ">
            <p><span>xxxx</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1033" class="ax_default table_cell">
          <img id="u1033_img" class="img " src="<%=basePath %>images/进度/u1032.png"/>
          <div id="u1033_text" class="text ">
            <p><span>wine</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1034" class="ax_default table_cell">
          <img id="u1034_img" class="img " src="<%=basePath %>images/进度/u1032.png"/>
          <div id="u1034_text" class="text ">
            <p><span>3</span></p>
          </div>
        </div>

        <!-- Unnamed (单元格) -->
        <div id="u1035" class="ax_default table_cell">
          <img id="u1035_img" class="img " src="<%=basePath %>images/进度/u1035.png"/>
          <div id="u1035_text" class="text ">
            <p><span>千克/kg</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1036" class="ax_default box_2">
        <div id="u1036_div" class=""></div>
        <div id="u1036_text" class="text ">
          <p><span>说明</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1037" class="ax_default paragraph">
        <div id="u1037_div" class=""></div>
        <div id="u1037_text" class="text ">
          <p><span>公司名：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span id="mfmc"></span></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1038" class="ax_default paragraph">
        <div id="u1038_div" class=""></div>
        <div id="u1038_text" class="text ">
          <p><span>联系人：&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <span id="fn_contacts"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1039" class="ax_default paragraph">
        <div id="u1039_div" class=""></div>
        <div id="u1039_text" class="text ">
          <p><span>联系电话：&nbsp; &nbsp; &nbsp; <span id="fn_phone"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1040" class="ax_default paragraph">
        <div id="u1040_div" class=""></div>
        <div id="u1040_text" class="text ">
          <p><span>注册地址：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;  <span id="fn_address"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1041" class="ax_default paragraph">
        <div id="u1041_div" class=""></div>
        <div id="u1041_text" class="text ">
          <p><span>买方银行Swift Code：&nbsp; &nbsp; &nbsp;&nbsp;<span id="fn_bankswiftcode"></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1042" class="ax_default paragraph">
        <div id="u1042_div" class=""></div>
        <div id="u1042_text" class="text ">
          <p><span>买方银行名称：&nbsp; &nbsp; &nbsp; &nbsp; <span id="fn_bankname"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1043" class="ax_default paragraph">
        <div id="u1043_div" class=""></div>
        <div id="u1043_text" class="text ">
          <p><span>注册号：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span id="fn_regnumber"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1044" class="ax_default paragraph">
        <div id="u1044_div" class=""></div>
        <div id="u1044_text" class="text ">
          <p><span>税号：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<span id="fn_taxnumber"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1045" class="ax_default paragraph">
        <div id="u1045_div" class=""></div>
        <div id="u1045_text" class="text ">
          <p><span>年营业额：&nbsp; &nbsp; &nbsp;&nbsp; USD <span id="fn_yearturnover"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1046" class="ax_default paragraph">
        <div id="u1046_div" class=""></div>
        <div id="u1046_text" class="text ">
          <p><span>历史交易记录：&nbsp; &nbsp; &nbsp;&nbsp; <span id="fn_tradehistory"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1047" class="ax_default paragraph">
        <div id="u1047_div" class=""></div>
        <div id="u1047_text" class="text ">
          <p><span>最近一年合作金额：<span id="fn_cooperateamount_lastyear"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1048" class="ax_default paragraph">
        <div id="u1048_div" class=""></div>
        <div id="u1048_text" class="text ">
          <p><span>买方确权邮件地址：<span id="fn_email"></span></span></p>
        </div>
      </div>

      <!-- Unnamed (组 合) -->
      <div id="u1049" class="ax_default" data-left="32" data-top="150" data-width="601" data-height="165">

        <!-- Unnamed (矩形) -->
        <div id="u1050" class="ax_default label">
          <div id="u1050_div" class=""></div>
          <div id="u1050_text" class="text ">
            <p><span>买方名称</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1051" class="ax_default label">
          <div id="u1051_div" class=""></div>
          <div id="u1051_text" class="text ">
            <p><span>买方国家/地区</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1052" class="ax_default label">
          <div id="u1052_div" class=""></div>
          <div id="u1052_text" class="text ">
            <p><span>商品名称</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1053" class="ax_default label">
          <div id="u1053_div" class=""></div>
          <div id="u1053_text" class="text ">
            <p><span>剩余账期/买方账期</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1054" class="ax_default label">
          <div id="u1054_div" class=""></div>
          <div id="u1054_text" class="text ">
            <p><span>出口合同金额</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1055" class="ax_default label">
          <div id="u1055_div" class=""></div>
          <div id="u1055_text" class="text ">
            <p><span>预付款付款时间（预估）</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1056" class="ax_default label">
          <div id="u1056_div" class=""></div>
          <div id="u1056_text" class="text ">
            <p><span>保险授信77788</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1057" class="ax_default label">
          <div id="u1057_div" class=""></div>
          <div id="u1057_text" class="text ">
            <p><span>信息有效期</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1058" class="ax_default label">
          <div id="u1058_div" class=""></div>
          <div id="u1058_text" class="text ">
            <p><span>预付款比例</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1059" class="ax_default label">
          <div id="u1059_div" class=""></div>
          <div id="u1059_text" class="text ">
            <p><span>结算方式</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1060" class="ax_default label">
          <div id="u1060_div" class=""></div>
          <div id="u1060_text" class="text ">
            <p><span id="spmc"></span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1061" class="ax_default label">
          <div id="u1061_div" class=""></div>
          <div id="u1061_text" class="text ">
            <p><span id="fn_name"></span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1062" class="ax_default label">
          <div id="u1062_div" class=""></div>
          <div id="u1062_text" class="text ">
            <p><span id="fn_country"></span></p>
          </div>
        </div>

        <!-- Unnamed (水平线) -->
        <div id="u1063" class="ax_default line">
          <img id="u1063_img" class="img " src="<%=basePath %>images/进度/u1063.png"/>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1064" class="ax_default label">
          <div id="u1064_div" class=""></div>
          <div id="u1064_text" class="text ">
            <p><span id="fn_accountperiod"></span>天/<span id="fn_remainderperiod"></span>天</p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1065" class="ax_default paragraph">
          <div id="u1065_div" class=""></div>
          <div id="u1065_text" class="text ">
            <p>USD <span id="fn_contractamount"></span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1066" class="ax_default paragraph">
          <div id="u1066_div" class=""></div>
          <div id="u1066_text" class="text ">
            <p><span id="fn_advancescale"></span>%</p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1067" class="ax_default paragraph">
          <div id="u1067_div" class=""></div>
          <div id="u1067_text" class="text ">
            <p><span id="fn_advancepaydate"></span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1068" class="ax_default paragraph">
          <div id="u1068_div" class=""></div>
          <div id="u1068_text" class="text ">
            <p><span id="fn_settlementmethod"></span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1069" class="ax_default paragraph">
          <div id="u1069_div" class=""></div>
          <div id="u1069_text" class="text ">
            <p><span>CNY 700,000 /未核保</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1070" class="ax_default paragraph">
          <div id="u1070_div" class=""></div>
          <div id="u1070_text" class="text ">
            <p><span id="xxyxq"></span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1071" class="ax_default paragraph">
          <div id="u1071_div" class=""></div>
          <div id="u1071_text" class="text ">
            <p><span id="fn_accountreceivable"></span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1072" class="ax_default label">
          <div id="u1072_div" class=""></div>
          <div id="u1072_text" class="text ">
            <p><span>应收账款（预估）</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1073" class="ax_default label">
        <div id="u1073_div" class=""></div>
        <div id="u1073_text" class="text ">
          <p><span id="fn_code">项目编号：</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1074" class="ax_default label">
        <div id="u1074_div" class=""></div>
        <div id="u1074_text" class="text ">
          <p><span id="fbsj">发布时间：</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1075" class="ax_default label">
        <div id="u1075_div" class=""></div>
        <div id="u1075_text" class="text ">
          <p><span>4.</span></p>
        </div>
      </div>

      <!-- Unnamed (文件) -->
      <div id="u1076" class="ax_default box_2">
        <img id="u1076_img" class="img " src="<%=basePath %>images/进度/u1076.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1077" class="ax_default label">
        <div id="u1077_div" class=""></div>
        <div id="u1077_text" class="text ">
          <p><span>待资金方签订</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1078" class="ax_default label">
        <div id="u1078_div" class=""></div>
        <div id="u1078_text" class="text ">
          <p><span>心里底价</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1079" class="ax_default paragraph">
        <div id="u1079_div" class=""></div>
        <div id="u1079_text" class="text ">
          <p><span id="fn_floorprice">&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span> %</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u1080" class="ax_default line">
        <img id="u1080_img" class="img " src="<%=basePath %>images/保理报价列表/u824.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1081" class="ax_default label">
        <div id="u1081_div" class=""></div>
        <div id="u1081_text" class="text ">
          <p><span>没有上传内容，则没有操作按钮</span></p>
        </div>
      </div>

      <!-- Unnamed (组 合) -->
      <div id="u1082" class="ax_default" data-left="664" data-top="835" data-width="371" data-height="257">

        <!-- Unnamed (矩形) -->
        <div id="u1083" class="ax_default paragraph">
          <div id="u1083_div" class=""></div>
          <div id="u1083_text" class="text ">
            <p><span>出口合同</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1084" class="ax_default paragraph">
          <div id="u1084_div" class=""></div>
          <div id="u1084_text" class="text ">
            <p><span>提单</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1085" class="ax_default paragraph">
          <div id="u1085_div" class=""></div>
          <div id="u1085_text" class="text ">
            <p><span>商业发票（CI）：USD 300，000</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1086" class="ax_default paragraph">
          <div id="u1086_div" class=""></div>
          <div id="u1086_text" class="text ">
            <p><span>报关单</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1087" class="ax_default paragraph">
          <div id="u1087_div" class=""></div>
          <div id="u1087_text" class="text ">
            <p><span>商品检验</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1088" class="ax_default label">
          <div id="u1088_div" class=""></div>
          <div id="u1088_text" class="text ">
            <p><span>CI(预付款)</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1089" class="ax_default paragraph">
          <div id="u1089_div" class=""></div>
          <div id="u1089_text" class="text ">
            <p><span>CI(尾款1)</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1090" class="ax_default paragraph">
          <div id="u1090_div" class=""></div>
          <div id="u1090_text" class="text ">
            <p><span>CI(尾款2)</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1091" class="ax_default label">
          <div id="u1091_div" class=""></div>
          <div id="u1091_text" class="text ">
            <p><span>本次融资出口单据</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1092" class="ax_default paragraph">
          <div id="u1092_div" class=""></div>
          <div id="u1092_text" class="text ">
            <p><span>最终解释权归各家资金方所有</span></p>
          </div>
        </div>

        <!-- Unnamed (占位符) -->
        <div id="u1093" class="ax_default placeholder">
          <img id="u1093_img" class="img " src="<%=basePath %>images/进度/u1093.png"/>
        </div>

        <!-- Unnamed (占位符) -->
        <div id="u1094" class="ax_default placeholder">
          <img id="u1094_img" class="img " src="<%=basePath %>images/进度/u1093.png"/>
        </div>

        <!-- Unnamed (占位符) -->
        <div id="u1095" class="ax_default placeholder">
          <img id="u1095_img" class="img " src="<%=basePath %>images/进度/u1095.png"/>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1096" class="ax_default button">
          <div id="u1096_div" class=""></div>
          <div id="u1096_text" class="text ">
            <p><span>下载</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1097" class="ax_default button">
          <div id="u1097_div" class=""></div>
          <div id="u1097_text" class="text ">
            <p><span>下载</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1098" class="ax_default button">
          <div id="u1098_div" class=""></div>
          <div id="u1098_text" class="text ">
            <p><span>下载</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1099" class="ax_default button">
          <div id="u1099_div" class=""></div>
          <div id="u1099_text" class="text ">
            <p><span>下载</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1100" class="ax_default button">
          <div id="u1100_div" class=""></div>
          <div id="u1100_text" class="text ">
            <p><span>下载</span></p>
          </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u1101" class="ax_default button">
          <div id="u1101_div" class=""></div>
          <div id="u1101_text" class="text ">
            <p><span>下载</span></p>
          </div>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1102" class="ax_default label">
        <div id="u1102_div" class=""></div>
        <div id="u1102_text" class="text ">
          <p><span>USD 1，260，000</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1103" class="ax_default label">
        <div id="u1103_div" class=""></div>
        <div id="u1103_text" class="text ">
          <p><span>USD 260，000</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1104" class="ax_default paragraph">
        <div id="u1104_div" class=""></div>
        <div id="u1104_text" class="text ">
          <p><span>2018/12/03</span></p>
        </div>
      </div>

      <!-- Unnamed (合同要点-不可编辑) -->

      <!-- Unnamed (矩形) -->
      <div id="u1106" class="ax_default label">
        <div id="u1106_div" class=""></div>
        <div id="u1106_text" class="text ">
          <p><span>&nbsp; . 合同要点</span></p>
        </div>
      </div>

      <!-- Unnamed (水平线) -->
      <div id="u1107" class="ax_default line">
        <img id="u1107_img" class="img " src="<%=basePath %>images/国际保理详情页/u327.png"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1108" class="ax_default label">
        <div id="u1108_div" class=""></div>
        <div id="u1108_text" class="text ">
          <p><span>1.应收账款是否能转让</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1109" class="ax_default label">
        <div id="u1109_div" class=""></div>
        <div id="u1109_text" class="text ">
          <p><span>2.支付全部货款之前，商品所有权问题</span></p>
        </div>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1110" class="ax_default checkbox">
        <label for="u1110_input" style="position: absolute; left: 0px;">
          <div id="u1110_text" class="text ">
            <p><span>A&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1110_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1111" class="ax_default checkbox">
        <label for="u1111_input" style="position: absolute; left: 0px;">
          <div id="u1111_text" class="text ">
            <p><span>B&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1111_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1112" class="ax_default checkbox">
        <label for="u1112_input" style="position: absolute; left: 0px;">
          <div id="u1112_text" class="text ">
            <p><span>C&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1112_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1113" class="ax_default checkbox">
        <label for="u1113_input" style="position: absolute; left: 0px;">
          <div id="u1113_text" class="text ">
            <p><span>A&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1113_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1114" class="ax_default checkbox">
        <label for="u1114_input" style="position: absolute; left: 0px;">
          <div id="u1114_text" class="text ">
            <p><span>B&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1114_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1115" class="ax_default checkbox">
        <label for="u1115_input" style="position: absolute; left: 0px;">
          <div id="u1115_text" class="text ">
            <p><span>C&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1115_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1116" class="ax_default label">
        <div id="u1116_div" class=""></div>
        <div id="u1116_text" class="text ">
          <p><span>3.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</span></p>
        </div>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1117" class="ax_default checkbox">
        <label for="u1117_input" style="position: absolute; left: 0px;">
          <div id="u1117_text" class="text ">
            <p><span>A&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1117_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1118" class="ax_default checkbox">
        <label for="u1118_input" style="position: absolute; left: 0px;">
          <div id="u1118_text" class="text ">
            <p><span>B&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1118_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (复选框) -->
      <div id="u1119" class="ax_default checkbox">
        <label for="u1119_input" style="position: absolute; left: 0px;">
          <div id="u1119_text" class="text ">
            <p><span>C&nbsp; xxxxxxxx</span></p>
          </div>
        </label>
        <input id="u1119_input" type="checkbox" value="checkbox"/>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1120" class="ax_default box_1">
        <div id="u1120_div" class=""></div>
        <div id="u1120_text" class="text ">
          <p><span>√</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1121" class="ax_default box_1">
        <div id="u1121_div" class=""></div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1122" class="ax_default box_1">
        <div id="u1122_div" class=""></div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1123" class="ax_default box_1">
        <div id="u1123_div" class=""></div>
        <div id="u1123_text" class="text ">
          <p><span>√</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1124" class="ax_default box_1">
        <div id="u1124_div" class=""></div>
        <div id="u1124_text" class="text ">
          <p><span>√</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1125" class="ax_default box_1">
        <div id="u1125_div" class=""></div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1126" class="ax_default box_1">
        <div id="u1126_div" class=""></div>
        <div id="u1126_text" class="text ">
          <p><span>√</span></p>
        </div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1127" class="ax_default box_1">
        <div id="u1127_div" class=""></div>
      </div>

      <!-- Unnamed (矩形) -->
      <div id="u1128" class="ax_default box_1">
        <div id="u1128_div" class=""></div>
      </div>
    </div>
  </body>
</html>

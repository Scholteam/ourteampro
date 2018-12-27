var MAJORS = {
		"软件工程" : [ "springmvc","Android应用","软件构造" ],
		"纺织" : [ "纺织应用化学","现代纺织加工技术","纺织最优化设计与分析" ],
		"数学" : [ "线性代数","高等数学","离散数学" ],
		"汉语" : [ "语言学概论","中国现当代汉语史","民间文学" ],
};
$(document).ready(function() {
	$.each(MAJORS, function(key, value) {
		var $tmajor = $("<option>" + key + "</option>"); /* 动态添加 */
		$("#tmajor").append($tmajor);
	});
	$("#tmajor").on("change", function() { /* 先清空当前市数据，防止数据叠加 */
		$("#tclass").empty(); /* 获得当前省 */
		var tmajor = $("#tmajor option:selected").text(); /* 根据省获得当前市 */
		var tclasses = MAJORS[tmajor];
		$.each(tclasses, function(index, tclass) {
			var $tclass = $("<option>" + tclass + "</option>");
			$("#tclass").append($tclass);
		})
	}); /* 触发change事件 triggerHandler方法不会引起浏览器默认的行为,而仅仅是执行绑定到change事件的处理程序. */
	$("#tmajor").triggerHandler("change");
});
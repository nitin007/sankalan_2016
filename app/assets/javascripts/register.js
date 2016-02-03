$(function(){
    $("#next_btn").click(function(){
	if($("#team").val().length<4)
	{
	    $("label[for='team']").after("<span class='incorrect-value' style='color:red'></br>(Team name length min. 4)</span>");
	}
	if($("#pwd").val().length<6)
	{
	    $("label[for='pwd']").after("<span class='incorrect-value' style='color:red'></br>(Password length min. 6)</span>");
	}
	if($("#pwd").val()!=$("#re-pwd").val())
	{
	    $("label[for='re-pwd']").after("<span class='incorrect-value' style='color:red'></br>(Password is not equal)</span>");
	}
	setTimeout(function(){
	    $(".incorrect-value").fadeOut();
	    $(".incorrect-value").remove();
	}, 3000);
    });
});

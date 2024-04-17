console.log("Reply New Button -> Modal window Load........");

$(function() {
	
    var modal = $(".modal");
    
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='replyer']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
	
    $("#addReplyBtn").on("click", function(e){
    	
        modal.find("input").val("");
        modalInputReplyDate.closest("div").hide();
        modal.find("button[id !='modalCloseBtn']").hide();
        
        modalRegisterBtn.show();
        
        $(".modal").modal("show");        
    });

	$("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
    
//    var bnoValue = '<c:out value="${board.bno}"/>';
	var bnoValue = $("#operForm").find("#bno").val();
    var replyUL = $(".chat");
    
    var pageUI = $(".panel-footer");
    
    modalRegisterBtn.on("click",function(e){
        
        var reply = {
		              reply: modalInputReply.val(),
		              replyer:modalInputReplyer.val(),
		              bno:bnoValue
		            };
        
        replyService.add(reply, function(result){
          
          	alert(result);
			
			modal.find("input").val("");
			modal.modal("hide");
			
//			showList(1);
			replyList.showList(-1, bnoValue, replyUL, pageUI);
          
        });
	});
});


























<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

console.log("Reply Modal Module........");

$(function () {
	
	var bnoValue = '<c:out value="${board.bno}"/>';
//  var bnoValue = '219';
	var replyUL = $(".chat");
  
	showList(1);
    
//     var replyList = (function() {
    
    function showList(page){
      
		replyService.getList(
			{bno:bnoValue, page: page|| 1 }
			, 
			function(list) {
	        
		        var str="";
				if(list == null || list.length == 0){
		        
		        	replyUL.html("");
		        
		        	return;
		    	}
				
				for (var i = 0, len = list.length || 0; i < len; i++) {
		           str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
		           str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
		           str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
		           str +="    <p>"+list[i].reply+"</p></div></li>";
		        }
		
		    	replyUL.html(str);
	
	      	});//end function
      
   	}//end showList */
	
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
    
    var bnoValue = '<c:out value="${board.bno}"/>';
    
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
			
			
			var replyUL = $(".chat");
			
			replyList.showList(1, bnoValue, replyUL);
// 			replyList.showList(1);
			showList(1);
          
        });
	});
    
    //댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
      	var rno = $(this).data("rno");
      
		replyService.get(rno, function(reply){
		
		   modalInputReply.val(reply.reply);
		   modalInputReplyer.val(reply.replyer);
		   modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
		  					   .attr("readonly","readonly");
		   modal.data("rno", reply.rno);
		   
		   modal.find("button[id !='modalCloseBtn']").hide();
		   modalModBtn.show();
		   modalRemoveBtn.show();
		   
		   $(".modal").modal("show");
		      
		});
    });
    
    modalModBtn.on("click", function(e){
        
        var reply = {rno:modal.data("rno"), 
        			 reply: modalInputReply.val()};
        }
        
        replyService.update(reply, function(result){
              
          alert(result);
          modal.modal("hide");
          showList(1);
          
        });
        
	});
    
    modalRemoveBtn.on("click", function (e){
  	  
		var rno = modal.data("rno");
		
		replyService.remove(rno, function(result){
		      
		    alert(result);
		    modal.modal("hide");
		    showList(1);
		    
		});
    	  
	});
    
});

</script>



















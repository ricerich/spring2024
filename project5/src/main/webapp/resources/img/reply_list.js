console.log("Reply List Module........");

//$(function () {
//	  
////	var bnoValue = '<c:out value="${board.bno}"/>';
////  var bnoValue = '219';
//
//	var operForm = $("#operForm");
//	var bnoValue = operForm.find("#bno").val();
//
//	var replyUL = $(".chat");
	
	
  
//	showList(1);
    
     var replyList = (function() {
    
	    function showList(page, bnoValue, replyUL ){
	      
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
	   	
 	    return {
 	    	showList : showList
 		};
	   	
     })();
    
//     replyList.showList(1);
//});
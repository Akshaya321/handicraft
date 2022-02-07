// JavaScript Document
//this function get two parameters. 1:email-specify the value of email feild. 2:id- the id of corresproding label
function validateEmail(email,id){
	var b=/^([a-z A-Z 0-9_\-\.])+\@[a-z A-Z 0-9_\-\.]+\.([a-z A-Z]{2,4})+$/;
	if(email==''){
	document.getElementById(id).innerHTML="<font color='red'>please enter a email address*</font>";
	}	
	else if(!b.test(email)){	
	document.getElementById(id).innerHTML="<font color='red'>invali email address*</font>";
	}
	else{
	document.getElementById(id).innerHTML="<font color='red'></font>";
	}
}

function validateNull(fieldValue,id){
	if(fieldValue==''){
	document.getElementById(id).innerHTML="<font color='red'>Donot leave this field blank</font>";
	}
	else{
	document.getElementById(id).innerHTML="<font color='red'></font>";
	}
}
function validateOption(optn,id){
	alert(optn); 
		if(optn=='-select-'||optn=='-Select-'){
	document.getElementById(id).innerHTML="<font color='red'>Please select correct value</font>";
	}
	else{
	document.getElementById(id).innerHTML="<font color='red'></font>";

	}

}
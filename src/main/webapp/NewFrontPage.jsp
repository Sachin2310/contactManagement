<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<script type="text/javascript">
		//ajax script
		let element = document.getElementsByClassName("button");
		.addEventListener('click',() => {
			
			let text = element.innerText;
			let set ;
			if(text.equals("login")){
				set= "LoginView.html";
			}
			else{
				set="signUp.jsp";
			}
			
			const xhr = new XMLHttpRequest();
			xhr.open("get", set , true);
			xhr.onload = () => {
				if(this.readyState==4 && this.status==200){
					location.href= set;
				}
			});
			xhr.send()
		});
	</script>


</head>
<body>
	<button>login</button> <button>signUp</button>
</body>
</html>
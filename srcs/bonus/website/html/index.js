const cookieTime = 86400; //One day in seconds
const colorbackground = document.getElementById("background");

colorbackground.addEventListener("change", function() {
	document.body.setAttribute("style","background-color: "+this.value+";")
	document.cookie = "color="+ this.value +"; max-age=" + cookieTime;
});

// init page with cookie value

var value = ("; "+ document.cookie).split("; color=");
if (value.length === 2)
{
	value = value.pop().split("; ").shift();
	
	// update values
	colorbackground.value=value;
	document.body.setAttribute("style","background-color: "+value+";")
	
	// update cookie time
	document.cookie = "color="+ value +"; max-age=" + cookieTime;
}

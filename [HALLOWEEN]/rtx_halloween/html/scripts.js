var halloweenresourcename = "rtx_halloween";

var scarehandler = new Howl({
  src: "sounds/jumpscare.mp3",
  volume: 1.0,
});

function closeMain() {
	$("body").css("display", "none");
}

function openMain() {
	$("body").css("display", "block");
}

function halloweencreatorPrepareInterface() {
  let reformated1 = document.getElementById("cameraspeeddata");
  var value = (reformated1.value-reformated1.min)/(reformated1.max-reformated1.min)*100
  reformated1.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'  
  let reformated2 = document.getElementById("lookspeedxdata");
  var value = (reformated2.value-reformated2.min)/(reformated2.max-reformated2.min)*100
  reformated2.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'  
  let reformated3 = document.getElementById("lookspeedydata");
  var value = (reformated3.value-reformated3.min)/(reformated3.max-reformated3.min)*100
  reformated3.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'  
  let reformated4 = document.getElementById("translatesnapdata");
  var value = (reformated4.value-reformated4.min)/(reformated4.max-reformated4.min)*100
  reformated4.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'  
  let reformated5 = document.getElementById("rotationsnapdata");
  var value = (reformated5.value-reformated5.min)/(reformated5.max-reformated5.min)*100
  reformated5.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'  
}

halloweencreatorPrepareInterface();

document.getElementById("cameraspeeddata").oninput = function() {
  var value = (this.value-this.min)/(this.max-this.min)*100
  this.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'
};

document.getElementById("lookspeedxdata").oninput = function() {
  var value = (this.value-this.min)/(this.max-this.min)*100
  this.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'
};

document.getElementById("lookspeedydata").oninput = function() {
  var value = (this.value-this.min)/(this.max-this.min)*100
  this.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'
};

document.getElementById("translatesnapdata").oninput = function() {
  var value = (this.value-this.min)/(this.max-this.min)*100
  this.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'
};

document.getElementById("rotationsnapdata").oninput = function() {
  var value = (this.value-this.min)/(this.max-this.min)*100
  this.style.background = 'linear-gradient(to right, #ff4500 0%, #ff4500 ' + value + '%, #ccccc8 ' + value + '%, #ccccc8 100%)'
};

$(".closehalloweencurving").click(function(){
	$.post('https://'+halloweenresourcename+'/closecurving', JSON.stringify({}));
});

$(".closehalloweendecoration").click(function(){
	$.post('https://'+halloweenresourcename+'/closedecorationedit', JSON.stringify({}));
});

window.addEventListener('message', function (event) {

	var item = event.data;
	if (item.message == "infonotifyshow") {
		document.getElementsByClassName("infonotifytext")[0].innerHTML = item.infonotifytext;
		openMain();
		$("#infonotifyshow").show();	
	}
	
	if (item.message == "halloweencreatorcreatorshow") {		
		$("#cameraspeeddata").val(""); 
		$("#lookspeedxdata").val(""); 
		$("#lookspeedydata").val(""); 
		$("#translatesnapdata").val(""); 
		$("#rotationsnapdata").val(""); 
		halloweencreatorPrepareInterface();
		$("#posmoretranslate").addClass("active");
		$("#posmorerotation").removeClass("active");
		$("#spacebuttonworld").addClass("active");
		$("#spacebuttonlocal").removeClass("active");		
		$("#halloweenpossshow").show();	
		openMain();
	}		
	
	if (item.message == "halloweenprogressbarshow") {
		document.getElementsByClassName("halloweenprogressbartext")[0].innerHTML = item.halloweenprogressbartext;
		$('.halloweenprogressbarmaincontainerdata').css("width", "0%")	
		$("#halloweenprogressbarshow").show();	
		openMain();
	}		
		
	if (item.message == "updatehalloweenprogressbar") {
		$('.halloweenprogressbarmaincontainerdata').css("width", item.progressbardata+"%")
	}		
		
	if (item.message == "halloweencurvingshow") {
		$("#halloweencurvingshow").show();	
		openMain();
	}		
				
		
	if (item.message == "hide") {
		$("#infonotifyshow").hide();	
	}
		
	if (item.message == "hidecreator") {
		$("#halloweenpossshow").hide();	
	}	
	
	if (item.message == "hideprogress") {
		$("#halloweenprogressbarshow").hide();	
	}	
	
	if (item.message == "hidecurving") {
		$("#halloweencurvingshow").hide();	
	}		
	
	if (item.message == "playscaresound") {
		scarehandler.load();
		scarehandler.play();
	}		
	
	if (item.message == "updateinterfacedata") {
		halloweenresourcename = item.halloweenresourcenamedata;
		let root = document.documentElement;
		root.style.setProperty('--color', item.interfacecolordata);	
	}
});

$("#posmoretranslate").click(function () {
	$(this).addClass("active");
	$("#posmorerotation").removeClass("active");
	$.post('https://'+halloweenresourcename+'/halloweencreatorchangemode', JSON.stringify({
		modetype: "translate"
	})); 		
});

$("#posmorerotation").click(function () {
	$(this).addClass("active");
	$("#posmoretranslate").removeClass("active");
	$.post('https://'+halloweenresourcename+'/halloweencreatorchangemode', JSON.stringify({
		modetype: "rotate"
	})); 	
});

$("#spacebuttonworld").click(function () {
	$(this).addClass("active");
	$("#spacebuttonlocal").removeClass("active");
	$.post('https://'+halloweenresourcename+'/halloweencreatorchangespace', JSON.stringify({
		spacetype: "world"
	})); 		
});

$(".createhalloweenposbutton").click(function () {
	$.post('https://'+halloweenresourcename+'/halloweencreatorobjectdone', JSON.stringify({}));
});

$(".pumpkintype1select").click(function () {
	$.post('https://'+halloweenresourcename+'/selectcurving', JSON.stringify({
		curvingtype: 1
	})); 	
});

$(".pumpkintype2select").click(function () {
	$.post('https://'+halloweenresourcename+'/selectcurving', JSON.stringify({
		curvingtype: 2
	})); 	
});

$(".pumpkintype3select").click(function () {
	$.post('https://'+halloweenresourcename+'/selectcurving', JSON.stringify({
		curvingtype: 3
	})); 	
});

$("#spacebuttonlocal").click(function () {
	$(this).addClass("active");
	$("#spacebuttonworld").removeClass("active");
	$.post('https://'+halloweenresourcename+'/halloweencreatorchangespace', JSON.stringify({
		spacetype: "local"
	})); 	
});

function cameraspeedchange(e) {
	$.post('https://'+halloweenresourcename+'/halloweencreatorspeedchange', JSON.stringify({
		speedtype: "camera",
		speeddata: e.value
	})); 
}

function lookspeedxchange(e) {
	$.post('https://'+halloweenresourcename+'/halloweencreatorspeedchange', JSON.stringify({
		speedtype: "lookx",
		speeddata: e.value
	})); 
}

function lookspeedychange(e) {
	$.post('https://'+halloweenresourcename+'/halloweencreatorspeedchange', JSON.stringify({
		speedtype: "looky",
		speeddata: e.value
	})); 
}

function translatesnapchange(e) {
	$.post('https://'+halloweenresourcename+'/halloweencreatorsnapchange', JSON.stringify({
		snaptype: "translate",
		snapdata: e.value
	})); 
}

function rotationsnapchange(e) {
	$.post('https://'+halloweenresourcename+'/halloweencreatorsnapchange', JSON.stringify({
		snaptype: "rotate",
		snapdata: e.value
	})); 
}
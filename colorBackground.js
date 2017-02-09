var usedColors = {};

function isUsed(randomColor) {
  return usedColors[randomColor] === true;
}

function colorBackground() {
  var randomColor = '#' + Math.floor(Math.random() * 16777215).toString(16);

  if (!isUsed(randomColor)){
    usedColors[randomColor] = true;
    document.getElementById("viewport").style["background-color"] = randomColor;
  }
}

var myVar = setInterval(function(){ colorBackground() }, 1000);
setTimeout(function(){clearInterval(myVar);},10000);

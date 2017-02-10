
var colorBackground = (function(){
  var usedColors = {};

  var isUsed = function(randomColor) {
    return usedColors[randomColor] === true;
  }

  var getRandomColor =  function(){
    var randomColor = '#' + Math.floor(Math.random() * 16777215).toString(16);
    if (isUsed(randomColor)){
      getRandomColor();
    }
    usedColors[randomColor] = true;
    return randomColor;
  }

  var color = function() {
    document.getElementById("body").style["background-color"] = getRandomColor();
  }

  return {
    colorBackground: color
   };
})();


var colorBackground_id = setInterval(function(){ colorBackground.colorBackground() }, 1000);
setTimeout(function(){clearInterval(colorBackground_id);},10000);

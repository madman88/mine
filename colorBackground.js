
var colorBackground = {
  usedColors: {},

  isUsed: function(randomColor) {
    return this.usedColors[randomColor] === true;
  },

  getRandomColor: function(){
    var randomColor = '#' + Math.floor(Math.random() * 16777215).toString(16);
    if (this.isUsed(randomColor)){
      this.getRandomColor();
    }
    this.usedColors[randomColor] = true;
    return randomColor;
  },

  colorBackground: function() {
    document.getElementById("body").style["background-color"] = this.getRandomColor();
  }
};


var colorBackground_id = setInterval(function(){ colorBackground.colorBackground() }, 1000);
setTimeout(function(){clearInterval(colorBackground_id);},10000);

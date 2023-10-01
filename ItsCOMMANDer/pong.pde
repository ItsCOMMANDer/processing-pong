class PongPlayer {
  int colorRed;
  int colorGreen;
  int colorBlue;
  int colorOpacity;
  
  int startX;
  int startY;
  
  int endX;
  int endY;
  
  PongPlayer(int startX, int startY, int endX, int endY, int colorRed, int colorGreen, int colorBlue) {
    this.startX = startX;
    this.startY = startY;
    this.endX = endX;
    this.endY = endY;
    
    this.colorRed = colorRed;
    this.colorGreen = colorGreen;
    this.colorBlue = colorBlue;
    this.colorOpacity = colorOpacity;
  }
}

class PongBall {
  int ballWidth;
  int ballHeight;
  int centerX;
  int centerY;
  
  int colorRed;
  int colorGreen;
  int colorBlue;
  int colorOpacity;
  
  int ballTop;
  int ballBotom;
  int ballLeft;
  int ballRight;
  
  PongBall(int centerX, int centerY, int ballWidth, int ballHeight, int colorRed, int colorGreen, int colorBlue, int colorOpacity) {
    this.centerX = centerX;
    this.centerY = centerY;
    this.ballWidth = ballWidth;
    this.ballHeight = ballHeight;
    
    this.colorRed = colorRed;
    this.colorGreen = colorGreen;
    this.colorBlue = colorBlue;
    this.colorOpacity = colorOpacity;
    
     this.ballTop = this.centerY - ballHeight / 2;
     this.ballBotom = this.centerY + ballHeight / 2;
     this.ballLeft = this.centerX - ballWidth / 2;
     this.ballRight = this.centerX + ballWidth / 2;
  }
}

PFont font;
JSONObject config;

void setup() {
  size(800, 600);
  frameRate(-1);
  windowResizable(true);
  
  config = new JSONObject();
  config = loadJSONObject("data/config.json");
  
  String fontFile = config.getString("font");
  
  font = createFont(fontFile, 32);
  
  background(#00000000);  

  noFill();
  
}

void draw() {
  textFont(font, 64);
  text("Pong", width/2-96, 64);
  stroke(#ffffff);
  rect((width / 2) - 128, 128, 528, 64);
}









/*
config.setString("font", "data/PixeloidSans.ttf");
  saveJSONObject(config, "data/new.json");
*/
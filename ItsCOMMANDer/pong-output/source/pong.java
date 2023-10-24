/* autogenerated by Processing revision 1293 on 2023-10-23 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.io.File;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class pong extends PApplet {



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

public void setup() {
  /* size commented out by preprocessor */;
  frameRate(-1);
  windowResizable(true);

  String configFilePath = sketchPath("data/config.json");

  File file = new File(configFilePath);

  if (file.exists()) {
    println("JSON file exists.");
  } else {
    println("JSON file does not exist.");
    exit();
  }
  
  config = loadJSONObject("data/config.json");
  String fontFile = config.getString("font");
  font = createFont(fontFile, 32);
  
  background(0x00000000);  

  textAling(CENTER);
  noFill();
  
}

public void draw() {
  textFont(font, 64);
  text("Pong", width/2-96, 64);
  stroke(0xFFFFFFFF);
  rect((width / 2) - 128, 128, 528, 64);
}


  public void settings() { size(800, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pong" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
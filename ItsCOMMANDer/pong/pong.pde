import java.io.File;
import java.util.ArrayList;

class ButtonColor {
  int outlineRed;
  int outlineGreen;
  int outlineBlue;

  int fieldRed;
  int fieldGreen;
  int fieldBlue;

  int textRed;
  int textGreen;
  int textBlue;
  ButtonColor(int outlineRed, int outlineGreen, int outlineBlue,
              int fieldRed, int fieldGreen, int fieldBlue,
              int textRed,  int textGreen,  int textBlue) {
      this.outlineRed = outlineRed;
      this.outlineGreen = outlineGreen;
      this.outlineBlue = outlineBlue;
      
      this.fieldRed = fieldRed;
      this.fieldGreen = fieldGreen;
      this.fieldBlue = fieldBlue;

      this.textRed = textRed;
      this.textGreen = textGreen;
      this.textBlue = textBlue;
  }
}


ArrayList<Integer> buttonStartX = new ArrayList<>();
ArrayList<Integer> buttonStartY = new ArrayList<>();
ArrayList<Integer> buttonEndX = new ArrayList<>();
ArrayList<Integer> buttonEndY = new ArrayList<>();

ArrayList<Runnable> buttonHandlers = new ArrayList<>();
ArrayList<String> buttonName = new ArrayList<>();
  
ArrayList<ButtonColor> buttonColor = new ArrayList<>();
ArrayList<Integer> buttonOutlineWidth = new ArrayList<>();

  ArrayList<PFont> buttonFont = new ArrayList<>();
ArrayList<String> buttonText = new ArrayList<>();
ArrayList<Integer> buttonTextSize = new ArrayList<>();

class MenuButton {
    int startX;
    int startY;
    int endX;
    int endY;

    int outlineWidth;

    String text;
    int textSize;
    PFont font;

    String buttonName;
    ButtonColor color;

    MenuButton(String buttonName,
              int startX, int startY,
              int endX, int endY,
              String text, int textSize, PFont font,
              int outlineWidth,
              Runnable functionHandler,
              ButtonColor color) {

        this.startX = startX;
        this.startY = startY;
        this.endX = endX;
        this.endY = endY;

        this.text = text;
        this.textSize = textSize;
        this.font = font;

        this.outlineWidth = outlineWidth;
        this.buttonName = buttonName;
        this.color = color;

        buttonStartX.add(startX);
        buttonStartY.add(startY);
        buttonEndX.add(endX);
        buttonEndY.add(endY);

        buttonHandlers.add(functionHandler);
        buttonName.add(buttonName);
        
        color.add(color);
        buttonOutlineWidth.add(outlineWidth);
        
        buttonFont.add(font);
        buttonText.add(text);
        buttonTextSize.add(textSize);
    }
    public void renderButton(String buttonToRender) {
      int buttonDataIndex = -1;
      for(int i = 0; i < buttonName.size(); i++) {
        if(buttonName.get(i).equals(buttonToRender)) {
          buttonDataIndex = i;
          break;
        }
      }
      if(buttonDataIndex == -1) {
        println("Button " + buttonToRender + " not found.");
        return;
      }
      fill(color(buttonColor.fieldRed.get(buttonDataIndex),buttonColor.fieldGreen.get(buttonDataIndex),buttonColor.fieldBlue.get(buttonDataIndex)));
      rect(buttonStartX.get(buttonDataIndex),buttonStartY.get(buttonDataIndex),
          buttonEndX.get(buttonDataIndex),buttonEndY.get(buttonDataIndex));
      noFill();
      stroke(color(buttonColor.outlineRed.get(buttonDataIndex),buttonColor.outlineGreen.get(buttonDataIndex),buttonColor.outlineBlue.get(buttonDataIndex)));
      strokeWidth(buttonOutlineWidth.get(buttonDataIndex));
      rect(buttonStartX.get(buttonDataIndex),buttonStartY.get(buttonDataIndex),
          buttonEndX.get(buttonDataIndex),buttonEndY.get(buttonDataIndex));

      textSize(buttonTextSize.get(buttonDataIndex));
      fill(color(buttonColor.textRed.get(buttonDataIndex),buttonColor.textGreen.get(buttonDataIndex),buttonColor.textBlue.get(buttonDataIndex)));
      text(buttonText.get(buttonDataIndex), (max(startX.get(buttonDataIndex), endX.get(buttonDataIndex)) - min(startX.get(buttonDataIndex), endX.get(buttonDataIndex)))/2, (max(startY.get(buttonDataIndex), endY.get(buttonDataIndex)) - min(startY.get(buttonDataIndex), endY.get(buttonDataIndex))) / 2);
    }
}

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
  //setting up enviroment settring
  size(1000, 720);
  frameRate(-1);

  //checking for existance of config file
  String configFilePath = sketchPath("data/config.json");

  File file = new File(configFilePath);

  if (file.exists()) {
    println("JSON file exists.");
  } else {
    println("JSON file does not exist.");
    exit();
  }
  
  //pulling  data from config file
  config = loadJSONObject("data/config.json");
  String fontFile = config.getString("font");

  //setting up font and text
  font = createFont(fontFile, 32);
  textAlign(CENTER);
  textFont(font, 64);


  background(#00000000);  

  noFill();
  
}

void draw() {
  text("Pong", width/2, 64);
  stroke(#ffffff);
  rect((width / 2) - 128, 128, 528, 64);
}

void keyTyped() {
  print(key);
}
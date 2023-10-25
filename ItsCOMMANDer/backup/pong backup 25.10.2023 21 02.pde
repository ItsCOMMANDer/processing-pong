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

class ButtonData {
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
}

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

        buttonData.buttonStartX.add(startX);
        buttonData.buttonStartY.add(startY);
        buttonData.buttonEndX.add(endX);
        buttonData.buttonEndY.add(endY);

        buttonData.buttonHandlers.add(functionHandler);
        buttonData.buttonName.add(buttonName);
        
        buttonData.color.add(color);
        buttonData.buttonOutlineWidth.add(outlineWidth);
        
        buttonData.buttonFont.add(font);
        buttonData.buttonText.add(text);
        buttonData.buttonTextSize.add(textSize);
    }
    public void renderButton(String buttonName) {
      int buttonDataIndex;
      for(int i = 0; i < buttonData.buttonName.size(); i++) {
        if(buttonData.buttonName.get(i).equals(buttonName)) {
          buttonDataIndex = i;
          break;
        }
      }
      fill(color(buttonData.buttonColor.fieldRed.get(buttonDataIndex),buttonData.buttonColor.fieldGreen.get(buttonDataIndex),buttonData.buttonColor.fieldBlue.get(buttonDataIndex)));
      rect(buttonData.buttonStartX.get(buttonDataIndex),buttonData.buttonStartY.get(buttonDataIndex),
          buttonData.buttonEndX.get(buttonDataIndex),buttonData.buttonEndY.get(buttonDataIndex));
      noFill();
      stroke(color(buttonData.buttonColor.outlineRed.get(buttonDataIndex),buttonData.buttonColor.outlineGreen.get(buttonDataIndex),buttonData.buttonColor.outlineBlue.get(buttonDataIndex)));
      strokeWidth(buttonData.buttonOutlineWidth.get(buttonDataIndex));
      rect(buttonData.buttonStartX.get(buttonDataIndex),buttonData.buttonStartY.get(buttonDataIndex),
          buttonData.buttonEndX.get(buttonDataIndex),buttonData.buttonEndY.get(buttonDataIndex));

      textSize(buttonData.buttonTextSize.get(buttonDataIndex));
      fill(color(buttonData.buttonColor.textRed.get(buttonDataIndex),buttonData.buttonColor.textGreen.get(buttonDataIndex),buttonData.buttonColor.textBlue.get(buttonDataIndex)));
      text(buttonData.buttonText.get(buttonDataIndex), (max(buttonData.startX.get(buttonDataIndex), buttonData.endX.get(buttonDataIndex)) - min(buttonData.startX.get(buttonDataIndex), buttonData.endX.get(buttonDataIndex)))/2, (max(buttonData.startY.get(buttonDataIndex), buttonData.endY.get(buttonDataIndex)) - min(buttonData.startY.get(buttonDataIndex), buttonData.endY.get(buttonDataIndex))) / 2);
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
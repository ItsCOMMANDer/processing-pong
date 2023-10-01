// NOT A FINISHED PROJECT.
// THis is at most a prove of concept that was created over the course of a schoolday, due to boredom.

void setup()
{
  size(1000, 600);
  background(0,0,0);
}

int yl = 200;
int yr = 200;
int x = 500;
int y = 300;
String direcX = "plus";
String direcY = "minus";
String miss;

void draw()
{
  background(0,0,0);
  fill(250, 250, 250);
  rect(10, yl, 10, 200);
  rect(980, yr, 10, 200);
  
  Ball();
  miss = " ";
  Controls();
}

public void Ball()
{
  circle(x, y, 25);
  
  if((x >= 975 && y < yr) || (x >= 975 && y > (yr+200)))
  {
    miss = "right";
    miss();
  }
  else if(x >= 975 && y > yr)
  {
    direcX = "minus";
    println("HIT R");
    yr-=25;
  }
  else if(direcX == "plus")
  {
    x+=5;
  }
  
  if((x <= 25 && y < yl) || (x <= 25 && y > (yl+200)))
  {
    miss = "left";
    miss();
  }
  else if(x <= 25 && (y > yl && y < (yl+200)))
  {
    direcX = "plus";
    println("HIT L");
  }
  
  if(x <= 25 && (y > yl && y < (yl+20)))
  {
    direcX = "plus";
    if(y < (yl + 100))
    {
      direcY = "minus";
    }
    else if(y > (yl + 100))
    {
      direcY = "plus";
    }
  }
  else if(direcX == "minus")
  {
    x-=5;
  }
  
  if(y <= 25)
  {
    direcY = "plus";
  }
  else if(direcY == "minus")
  {
    y-=3;
  }
  if(y >= 575)
  {
    direcY = "minus";
  }
  else if( direcY == "plus")
  {
    y+=3;
  }
}

public void Controls()
{
  if(y < (yr + 100))
  {
    yr-=2;
  }
  else if(y > (yr + 100))
  {
    yr+=2;
  }
  
  if(keyPressed)
  {
    if(key == 'w')
    {
      yl-=5;
    }
    else if(key == 's')
    {
      yl+=5;
    }
  }
}

public void miss()
{
    fill(255, 0, 0);
    textSize(128);
    text("MISS", 400, 250);
    pause();
    reset();
}

public void reset()
{
  x = 500;
  y = 300;
  int r = int(random(0,1));
  if(r == 0)
  {
    direcX = "plus";
    direcY = "plus";
  }
  else
  {
    direcX = "minus";
    direcY = "minus";
  }
  
  if(miss != " ")
  {
    println("Miss: " + miss);
  } 
}

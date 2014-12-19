private SpaceShip SS_Wicked;
private Star[]starField=new Star[250];
private Laser Lazer;
private Asteroid [] Galactoid;
public void setup()
{
  size(1500, 1000);
  background(0);
  SS_Wicked=new SpaceShip();
  SS_Wicked.setX(width/2);
  SS_Wicked.setY(height/2);
  Lazer=new Laser();
  for (int i=0; i<starField.length; i++) {
    starField[i]=new Star();
  }
  Galactoid = new Asteroid[10];
  for (int i=0; i<Galactoid.length; i++) {
    Galactoid[i] = new Asteroid();
  }
}
public void draw()
{
  if (SS_Wicked.getHyperspacing()==false)
  {
    fill(0, 0, 0);
    rect(0, 0, width, height);
    fill(255, 255, 255);
    for (int i=0; i<starField.length; i++) {
      starField[i].show();
    }
  }
  if (SS_Wicked.getHyperspacing()==true || SS_Wicked.getAccelerating()==true)
  {
    if (SS_Wicked.getHyperspacing()==true)
    {
      fill(0, 0, 0, 20);
      rect(0, 0, width, height);
      for (int i=0; i<starField.length; i++) {
        starField[i].show();
      }
      SS_Wicked.setHyperspaceCounter(SS_Wicked.getHyperspaceCounter()+1);
      if (SS_Wicked.getHyperspaceCounter()>6)
      {
        SS_Wicked.setHyperspacing(false);
      }
    }
  }
  for (int i=0; i<Galactoid.length; i++)
  {
    Galactoid[i].move();
    Galactoid[i].show();
  }
  SS_Wicked.move();
  Lazer.move();
  Lazer.show();
  SS_Wicked.show();
  if (SS_Wicked.getAccelerating()==true) {
    SS_Wicked.accelerate(.1);
  }
  if (SS_Wicked.getLeftTurn()==true) {
    SS_Wicked.rotate(-20);
  }
  if (SS_Wicked.getRightTurn()==true) {
    SS_Wicked.rotate(20);
  }
  if (SS_Wicked.getBraking()==true) {
    SS_Wicked.brake();
  }
}
public void keyPressed()
{
  if (key=='h')
  {
    SS_Wicked.setHyperspacing(true);
    SS_Wicked.hyperspace();
  }
  if (key==' ') {
    Lazer.setFired(true);
  }
  if (key==CODED)
  {
    if (keyCode==UP) {
      SS_Wicked.setAccelerating(true);
    }
    if (keyCode==LEFT) {
      SS_Wicked.setLeftTurn(true);
    }
    if (keyCode==RIGHT) {
      SS_Wicked.setRightTurn(true);
    }
    if (keyCode==DOWN) {
      SS_Wicked.setBraking(true);
    }
  }
}
public void keyReleased()
{
  if (key==CODED)
  {
    if (keyCode==UP) {
      SS_Wicked.setAccelerating(false);
    }
    if (keyCode==LEFT) {
      SS_Wicked.setLeftTurn(false);
    }
    if (keyCode==RIGHT) {
      SS_Wicked.setRightTurn(false);
    }
    if (keyCode==DOWN) {
      SS_Wicked.setBraking(false);
    }
  }
}

class Star
{
  private double myX, myY;
  private int myColor;
  public Star()
  {
    myX=Math.random()*1501;
    myY=Math.random()*1001;
    myColor=color(255, 255, 255);
  }
  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, 2, 2);
  }
}
class SpaceShip extends Floater
{
  private int sides;
  private boolean accelerating, leftTurn, rightTurn, braking, hyperspacing;
  private int hyperspaceCounter;
  public SpaceShip()
  {
    sides=1;
    hyperspaceCounter=0;
    corners=4;
    myColor=color(110, 110, 110);
    xCorners=new int[corners];
    yCorners=new int[corners];
    xCorners[0]=12*sides; 
    yCorners[0]=0*sides;
    xCorners[1]=-12*sides; 
    yCorners[1]=-8*sides;
    xCorners[2]=-6*sides; 
    yCorners[2]=0*sides;
    xCorners[3]=-12*sides; 
    yCorners[3]=8*sides;
   
    myCenterX=0; 
    myCenterY=0;
    myDirectionX=0; 
    myDirectionY=0;
    myPointDirection=0;
    accelerating=false; 
    braking=false;
    leftTurn=false; 
    rightTurn=false;
    hyperspacing=false;
  }
  public void setX(int x) {
    myCenterX=x;
  }
  public int getX() {
    return (int)(myCenterX);
  }
  public void setY(int y) {
    myCenterY=y;
  }
  public int getY() {
    return (int)(myCenterY);
  }
  public void setDirectionX(double x) {
    myDirectionX=x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY=y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection=degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void setAccelerating(boolean x) {
    accelerating=x;
  }
  public boolean getAccelerating() {
    return accelerating;
  }
  public void setLeftTurn(boolean x) {
    leftTurn=x;
  }
  public boolean getLeftTurn() {
    return leftTurn;
  }
  public void setRightTurn(boolean x) {
    rightTurn=x;
  }
  public boolean getRightTurn() {
    return rightTurn;
  }
  public void setBraking(boolean x) {
    braking=x;
  }
  public boolean getBraking() {
    return braking;
  }
  public void setHyperspacing(boolean x) {
    hyperspacing=x;
  }
  public boolean getHyperspacing() {
    return hyperspacing;
  }
  public void setHyperspaceCounter(int x) {
    hyperspaceCounter=x;
  }
  public int getHyperspaceCounter() {
    return hyperspaceCounter;
  }
  public void hyperspace()
  {
    setX((int)(Math.random()*1401+100));
    setY((int)(Math.random()*901+100));
    setDirectionX(0);
    setDirectionY(0);
    setPointDirection((int)(Math.random()*361));
  }
  public void brake()
  {
    if (myDirectionX<=10 && myDirectionY<=10 && myDirectionX>=-10 && myDirectionY>=-10)
    {
      setDirectionX(0);
      setDirectionY(0);
    }
  }
  public void move () //move the floater in the current direction of travel
  {
    if (myDirectionX>=10) {
      myDirectionX=10;
    }
    if (myDirectionX<=-10) {
      myDirectionX=-10;
    }
    if (myDirectionY>=10) {
      myDirectionY=10;
    }
    if (myDirectionY<=-10) {
      myDirectionY=-10;
    }
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    if (myCenterX >width)
    {
      myCenterX = 0;
    } else if (myCenterX<0)
    {
      myCenterX = width;
    }
    if (myCenterY >height)
    {
      myCenterY = 0;
    } else if (myCenterY < 0)
    {
      myCenterY = height;
    }
  }
  public void show () //Draws the floater at the current position
  {
    fill(myColor);
    stroke(myColor);
    double dRadians = myPointDirection*(Math.PI/180);
    int xRotatedTranslated, yRotatedTranslated;
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      //rotate and translate the coordinates of the floater using current direction
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);
      vertex(xRotatedTranslated, yRotatedTranslated);
    }
    endShape(CLOSE);

  }
}
class Laser
{
  private double myX, myY, myPointDirection, mySpeed;
  private int myColor;
  private boolean fired, flying;
  public Laser()
  {
    myX=SS_Wicked.getX();
    myY=SS_Wicked.getY();
    myPointDirection=SS_Wicked.getPointDirection();
    mySpeed=15;
    myColor=color(0, 0, 0);
    fired=false;
    flying=false;
  }
  public double getX() {
    return myX;
  }
  public void setX(double x) {
    myX=x;
  }
  public double getY() {
    return myY;
  }
  public void setY(double y) {
    myY=y;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void setPointDirection(double x) {
    myPointDirection=x;
  }
  public double getSpeed() {
    return mySpeed;
  }
  public void setSpeed(int s) {
    mySpeed=s;
  }
  public boolean getFired() {
    return fired;
  }
  public void setFired(boolean x) {
    fired=x;
  }
  public void move()
  {
    if (fired==false && flying==false)
    {
      myX=SS_Wicked.getX();
      myY=SS_Wicked.getY();
      myPointDirection=SS_Wicked.getPointDirection();
    }
    if (fired==true && flying==false)
    {
      myX=SS_Wicked.getX();
      myY=SS_Wicked.getY();
      myPointDirection=SS_Wicked.getPointDirection();
      flying=true;
    }
    if (flying==true && fired==true)
    {
      myColor=color(255, 0, 0);
      double dRadians=myPointDirection*(Math.PI/180);
      myX=myX+Math.cos(dRadians)*mySpeed;
      myY=myY+Math.sin(dRadians)*mySpeed;
      if (myX>width || myX<0 || myY>height || myY<0)
      {
        myColor=color(0, 0, 0);
        fired=false;
        flying=false;
      }
    }
  }
  public void show()
  {
    strokeWeight(3);
    stroke(myColor);
    double dRadians=myPointDirection*(Math.PI/180);
    line((int)myX, (int)myY, (int)(myX+5*Math.cos(dRadians)), (int)(myY+5*Math.sin(dRadians)));
  }
}
class Asteroid extends Floater
{
  double myRotSpeed;
  int myDirectionOfRot;
  Asteroid()
  {
    int sides=1;
    corners=6;
    xCorners=new int[corners];
    yCorners=new int[corners];
    xCorners[0]=10*sides; 
    yCorners[0]=0*sides;
    xCorners[1]=4*sides; 
    yCorners[1]=4*sides;
    xCorners[2]=-7*sides; 
    yCorners[2]=12*sides;
    xCorners[3]=-7*sides; 
    yCorners[3]=12*sides;
    xCorners[4]=-9*sides; 
    yCorners[4]=-9*sides;
    xCorners[5]=8*sides; 
    yCorners[5]=-8*sides;
    myColor=color(90, 90, 90);
    myDirectionX=Math.random()*2-0.95;
    myDirectionY=Math.random()*2-0.95;
    myPointDirection=0;
    double x=Math.random();
    if (x<=0.5) {
      myDirectionOfRot=1;
    }
    if (x>0.5) {
      myDirectionOfRot=-1;
    }
    myRotSpeed=Math.random()*10;
    int i=(int)(Math.random()*5);
    if (i==1)
    {
      myCenterX=Math.random()*20;
      myCenterY=Math.random()*20;
    }
    if (i==2)
    {
      myCenterX=Math.random()*20+500;
      myCenterY=Math.random()*20;
    }
    if (i==3)
    {
      myCenterX=Math.random()*20;
      myCenterY=Math.random()*20+500;
    }
    if (i==4)
    {
      myCenterX=Math.random()*20+1000;
      myCenterY=Math.random()*20+1000;
    }
  }
  public void setX(int x) {
    myCenterX=x;
  }
  public int getX() {
    return (int)(myCenterX);
  }
  public void setY(int y) {
    myCenterY=y;
  }
  public int getY() {
    return (int)(myCenterY);
  }
  public void setDirectionX(double x) {
    myDirectionX=x;
  }
  public double getDirectionX() {
    return myDirectionX;
  }
  public void setDirectionY(double y) {
    myDirectionY=y;
  }
  public double getDirectionY() {
    return myDirectionY;
  }
  public void setPointDirection(int degrees) {
    myPointDirection=degrees;
  }
  public double getPointDirection() {
    return myPointDirection;
  }
  public void move () //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myDirectionX and myDirectionY
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    //wrap around screen
    if (myCenterX >width)
    {
      myCenterX = 0;
    } else if (myCenterX<0)
    {
      myCenterX = width;
    }
    if (myCenterY >height)
    {
      myCenterY = 0;
    } else if (myCenterY < 0)
    {
      myCenterY = height;
    }
    rotate(myDirectionOfRot*(int)(Math.random()*5+1));
  }
}
abstract class Floater
{
  protected int corners; //the number of corners, a triangular floater has 3
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY; //holds center coordinates
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
  protected double myPointDirection; //holds current direction the ship is pointing in degrees
  abstract public void setX(int x);
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();
  //Accelerates the floater in the direction it is pointing (myPointDirection)
  public void accelerate (double dAmount)
  {
    //convert the current direction the floater is pointing to radians
    double dRadians =myPointDirection*(Math.PI/180);
    //change coordinates of direction of travel
    myDirectionX += ((dAmount) * Math.cos(dRadians));
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }
  public void rotate (int nDegreesOfRotation)
  {
    myPointDirection+=nDegreesOfRotation;
  }
  public void move () //move the floater in the current direction of travel
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    if (myCenterX >width)
    {
      myCenterX = 0;
    } else if (myCenterX<0)
    {
      myCenterX = width;
    }
    if (myCenterY >height)
    {
      myCenterY = 0;
    } else if (myCenterY < 0)
    {
      myCenterY = height;
    }
  }
  public void show () //Draws the floater at the current position
  {
    fill(myColor);
    stroke(myColor);
    double dRadians = myPointDirection*(Math.PI/180);
    int xRotatedTranslated, yRotatedTranslated;
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);
      vertex(xRotatedTranslated, yRotatedTranslated);
    }
    endShape(CLOSE);
  }
}

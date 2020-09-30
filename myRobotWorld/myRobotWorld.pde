World myRobotWorld;  //Set myRobotWorld as object of World
void setup() {
  size(720, 720);
  myRobotWorld = new World(12, 12);     //Instance World that have 12*12 size
}

void draw() {
  background(40);  //Draw black background
  noStroke();
  myRobotWorld.drawLine();      //Draw World line
  myRobotWorld.drawWorld();     //Draw all of World
}


class Robot {
  int row, column, size;     //Set row, column, size as attribute
  float heightPerBlock, widthPerBlock, radian;  //Set height,wieght per block and degree as attribute

  Robot(int row, int column, int size, float widthPerBlock, float heightPerBlock) {
    radian = 0;                //set start degree is 0 radian
    this.row = row;
    this.column = column;
    this.size = size;
    this.widthPerBlock = widthPerBlock;
    this.heightPerBlock = heightPerBlock;
  }

  void move(int args) {    //move method to move row with args
    radian = acos(args);   //calculate new degree  before move
    row += args;           //move to row with -1,1(backward, forward)
  }

  void turn(int args) {   //turn method to turn column with args
    column += args;       //turn to column with -1,1 (left,right)
    radian = asin(args);  //calculate new degree
  }

  void drawRobot() {   //draw robot
    fill(255);
    ellipse(widthPerBlock*row + widthPerBlock/2, heightPerBlock*column + heightPerBlock/2, size, size);
    stroke(245);
    strokeWeight(10);
    line(widthPerBlock*row + widthPerBlock/2+cos(radian-PI/3)*size/2, heightPerBlock*column + heightPerBlock/2+sin(radian-PI/3)*size/2,
      widthPerBlock*row + widthPerBlock/2+cos(radian-PI/4)*(size), heightPerBlock*column + heightPerBlock/2+sin(radian-PI/4)*size);
    line(widthPerBlock*row + widthPerBlock/2+cos(radian+PI/3)*size/2, heightPerBlock*column + heightPerBlock/2+sin(radian+PI/3)*size/2,
      widthPerBlock*row + widthPerBlock/2+cos(radian+PI/4)*(size), heightPerBlock*column + heightPerBlock/2+sin(radian+PI/4)*size);
    noStroke();
    fill(0);
    ellipse(widthPerBlock*row + widthPerBlock/2+cos(radian-PI/3)*size/4, heightPerBlock*column + heightPerBlock/2+sin(radian-PI/3)*size/4, size/4, size/4);
    ellipse(widthPerBlock*row + widthPerBlock/2+cos(radian+PI/3)*size/4, heightPerBlock*column + heightPerBlock/2+sin(radian+PI/3)*size/4, size/4, size/4);
  }

  int getRow() {
    return row;
  }

  int getColumn() {
    return column;
  }
}

class Wall {
  int row, column, size;      //Set row, column, size as attribute
  float widthPerBlock, heightPerBlock;  //Set width,height per block as attribute


  Wall(int row, int column, int size, float widthPerBlock, float heightPerBlock) {

  }

  void drawWall() {

  }

  int getRow() {
    return 0;
  }

  int getColumn() {
    return 0;
  }
}

class Objective {
  int row, column, size; //Set row, column, size as attribute
  float widthPerBlock, heightPerBlock;  //Set width,height per block as attribute

  Objective(int row, int column, int size, float widthPerBlock, float heightPerBlock) {
    this.row = row;
    this.column = column;
    this.size = size;
    this.widthPerBlock = widthPerBlock;
    this.heightPerBlock = heightPerBlock;
  }


  void drawObjective() {
    fill(255, 100, 80); //fill red
    ellipse(widthPerBlock*row + widthPerBlock/2, heightPerBlock*column + heightPerBlock/2, size, size); //draw circle object
  }

  int getRow() {
    return row;
  }

  int getColumn() {
    return column;
  }
}

class World {
  int row, column; //set row, column as attribute
  float widthPerBlock;  //set height,width as attribute
  float heightPerBlock;
  Robot myRobot;        //set myRobot that is Robot object as attribute
  Objective myObjective;  //set myObject that is Objective object as attribute
  Wall[] myWall;         //set myWall that is Wall[] object as attribute

  World(int row, int column) {
    this.row = row;
    this.column = column;
    heightPerBlock = height/column;  //calculate height,width per block
    widthPerBlock = width/row;

    myRobot = new Robot(1, 2, 40, widthPerBlock, heightPerBlock);    //instance myRobot at 1,2 size =40 ,and send width,heigh per block
    myObjective =  new Objective(11, 11, 40, widthPerBlock, heightPerBlock); //instance myObject at 11,11 size =40 ,and send width,heigh per block
  }

  void drawLine() { //draw line
    fill(255);
    for (int i = 0; i<=row; i++) {
      rect(widthPerBlock*i, 0, 2, height);  //draw horizontal line
    }
    for (int j = 0; j<=column; j++) {
      rect(0, heightPerBlock*j, width, 2);  //draw vertical line
    }
  }

  void drawWorld() {
    myObjective.drawObjective();    //draw objective
    myRobot.drawRobot();     //draw robot

  }
}

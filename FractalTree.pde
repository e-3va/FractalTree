private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(218, 245, 247);   
  stroke(29, 84, 39);
  strokeWeight(10);
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2, 10);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle, int s) 
{   
  double angle1 = angle + branchAngle*2;
  double angle2 = angle - branchAngle*2;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  strokeWeight(s);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength >= smallestBranch){
    drawBranches(endX1,endY1,branchLength, angle1, s-1);
    drawBranches(endX2,endY2,branchLength, angle2, s-1);
  }
} 

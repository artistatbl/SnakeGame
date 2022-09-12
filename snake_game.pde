//Jean Daly
PImage welcomescreen;
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w=30, h=30, snakes=20, direction = 0, foodx =15, foody = 15, speed = 8;
int[]x_direction={0, 0, 1, -1}, y_direction={1, -1, 0, 0};
boolean gameover=false;


void setup() {
 welcomescreen= loadImage("background.png");
  game = 10;
  x.add(0);
  y.add(15);
  //image(welcomescreen, 0 , 0);
  size(600, 600);
}
void draw() {
  background(0); // back color
  fill(135, 245, 66);
  for (int i = 0; i< x.size (); i++) rect(x.get(i)*snakes, y.get(i)*snakes, snakes, snakes);
  if (!gameover) {
    fill(255, 0, 0); //food color
    ellipse(foodx*snakes+10, foody*snakes+10, snakes, snakes); //food
    textAlign(LEFT); //SCORE
    textSize(30);
    fill(245, 242, 242);
    text("score: "+x.size(), 10, 10, width- 20, 50);


    if (frameCount%speed==0) {
      x.add(0, x.get(0) + x_direction[direction]);
      y.add(0, y.get(0) + y_direction[direction]);

      if (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >=h) gameover=true;
      for (int i = 1; i<x.size(); i++)
        if (x.get(0)==x.get(i)&&y.get(0)==y.get(i)) gameover = true;

      if (x.get(0) == foodx && y.get(0)== foody) {
        if (x.size()%2==0 && speed>=2) speed-=1; // increase speed
        foodx = (int)random(0, w);
        foody = (int)random(0, w);
      } else {
        x.remove(x.size()-1); //when the snakes eat is removes one
        y.remove(y.size()-1); //when the snakes eat is removes one
      }
    }
  } else {
    fill(255);
    imageMode(CENTER);
    image(welcomescreen, width/2, height/2);

    text("High Score: "+ x.size() , 20, 50);
    if (keyCode == ENTER) {
      x.clear();
      y.clear();
      x.add(0);
      y.add(15);
      direction = 2;
      speed = 8;
      gameover = false;
    }
  }
}
void keyPressed() {
  int newdir=keyCode == DOWN? 0:(keyCode== UP?1:(keyCode == RIGHT?2:(keyCode == LEFT?3:-1)));
  if (newdir !=-1) direction = newdir;
}

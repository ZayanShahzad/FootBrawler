Ball ball;
Ball ball1;

// variable to hold the catcher object
Catcher catcher;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  // construct the ball, parameters are speed and width
  ball = new Ball(2, 30, color(255, 0, 0));
    ball1 = new Ball(2, 30, color(0, 0, 255));
  // construct the catcher, parameters are speed, width, and height
  catcher = new Catcher(3, 140, 20);
}

void draw() {
  background(0);
  showScore();  // display the score at the top of the screen
  catcher.display();  // call the function to display the catcher
  ball.display(); // call the function to display the ball
  ball1.display();
  catcher.move();  // call the function to move the catcher
  ball.move(); // call the function to move the ball
    ball1.move();
  catcher.checkCaught(ball); // check if the ball is touching the catcher
  catcher.checkCaught(ball1);
}

void showScore() {
  fill(255);
  textSize(20);
  int theScore = catcher.getScore();
  text("Score: " + theScore, 10, 50);
}

void keyPressed() {
  // keyboard controls are:
  // x move right
  // z move left
  // s stop the movement
  if (key == 'z' || key == 'x' || key == 's') {
    // pass the z, x, or s to the catcher
    catcher.setCatcherControl(key);
  }
}

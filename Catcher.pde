class Catcher {
  private float catcherX; // x coordinate of the catcher
  private float catcherY; // y coordinate of the catcher
  private float catcherWidth; // width of the catcher
  private float catcherSpeed; // speed of the catcher
  private float catcherHeight; // height of the catcher
  private char catcherControl; // key pressed to control the catcher
  private int catcherScore;  // the number of balls caught

  public Catcher(float cSpeed, float cWidth, float cHeight) {
    catcherX = width / 2; // catcher starts in the center
    catcherY = height - 100; // position the catcher near the bottom
    catcherSpeed = cSpeed;
    catcherWidth = cWidth;
    catcherHeight = cHeight;
    catcherScore = 0;
  }

  public void display() {
    fill(255, 0, 0);
    rect(catcherX, catcherY, catcherWidth, catcherHeight);
  }

  public void move() {
    if (catcherControl == 'x') { // x moves right
      catcherX = catcherX + catcherSpeed;
    } else if (catcherControl == 'z') { // z moves left
      catcherX = catcherX - catcherSpeed;
    } else if (catcherControl == 's') { // s stops the catcher
      catcherX = catcherX; // effectively does nothing
    }

    // Prevent the catcher from going off-screen
    catcherX = constrain(catcherX, catcherWidth / 2, width - catcherWidth / 2);
  }

  public void checkCaught(Ball ball) {
    if (ball.getX() > (catcherX - catcherWidth / 2) &&
      ball.getX() < (catcherX + catcherWidth / 2) &&
      ball.getY() + ball.getWidth() / 2 >= catcherY - catcherHeight / 2 &&
      ball.getY() - ball.getWidth() / 2 <= catcherY + catcherHeight / 2) {
      increaseScore();
      ball.reset(); // reset the ball position
    }
  }

  public void increaseScore() {
    catcherScore++;
  }

  public int getScore() {
    return catcherScore;
  }

  public void setCatcherControl(char k) {
    catcherControl = k;
  }
}

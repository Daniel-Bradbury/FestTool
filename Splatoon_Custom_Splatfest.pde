PFont font;
PImage button1, button2;
PImage[] splatico=new PImage[2];
int team1, team2;
boolean showMain=true, winScreen=false;

void setup() {
  size(1280, 720);
  textAlign(CENTER);
  font = createFont("Splatoon2", 64);
  textFont(font, 64);
  background(0);
  text("Loading..",width/2,height/2);
  teamColours();
  background = new Movie(this, "bg.mp4");
  background.loop();
  cursorSetup();
  button1=loadImage("button1.png");
  button2=loadImage("button2.png");
  splatico[0]=loadImage("splatico1.png");
  splatico[1]=loadImage("splatico2.png");
}
import processing.video.*;
Movie background;

void mouseClicked() {
  if (rectCollision(100, height/2-button1.height/2, button1.width, button1.height)) {
    team1+=1;
  }
  if (rectCollision(width-100-button1.width, height/2-button1.height/2, button1.width, button1.height)) {
    team2+=1;
  }

  if (rectCollision(2, 2, button2.width, button2.height)) {
    colourid+=1;
    if (colourid==9) {
      colourid=1;
    }
  }
  if (rectCollision(width/2-button2.width/2, 500, button2.width, button2.height)) {
    showMain=false;
    winScreen=true;
  }
}

void draw() {
  tint(teamc[1][colourid]);
  image(background, 0, 0, background.width/2, background.height, 0, 0, background.width/2, background.height);
  tint(teamc[2][colourid]);
  image(background, background.width/2, 0, background.width/2, background.height, background.width/2, 0, background.width, background.height);
  tintReset();
  if (showMain) {
    pushMatrix();
    translate(width-1, height-1);
    scale(-1, -1);
    tint(teamc[2][colourid]);
    image(button1, 100, height/2-button1.height/2);
    popMatrix();
    tint(teamc[1][colourid]);
    image(button1, 100, height/2-button1.height/2);
    tint(100, 100, 100);

    image(button2, width/2-button2.width/2, 500);
    tint(teamc[1][colourid], 227.5);
    image(button2, 2, 2);
    tint(0, 100);
    image(button2, 2, 2);
    pushMatrix();
    scale(0.5, 0.5);
    tint(teamc[1][colourid]);
    image(splatico[0], 5+splatico[0].width/4, 2+splatico[0].height/4);
    tint(teamc[2][colourid]);
    image(splatico[1], 6+splatico[0].width/4, 3+splatico[0].height/4);
    popMatrix();
    tintReset();
    text("Pearl", 100+button1.width/2, height/2+20);
    text("Marina", width-100-button1.width+button1.width/2, height/2+20);
    textSize(25);
    text("Finish", width/2+1, 580);
    textSize(64);
  }
  if (winScreen) {
    if (team1>team2) {
      text("The results are a win for Team Pearl!", width/2, height/2);
    } else {
      if (team1<team2) {
        text("The results are a win for Team Marina!", width/2, height/2);
      } else {
        text("The results are a draw!", width/2, height/2);
      }
    }
  }
  cursorDraw();
}

void movieEvent(Movie m) {
  m.read();
}

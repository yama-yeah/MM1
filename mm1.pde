/*
 * Sample Avatar 1
 * 
 * 顔だけのサンプル
 */

import ddf.minim.*;
Minim minim;
AudioPlayer player;

Avatar avatar;
boolean f=false;
float sound_level;
float temp_x=0,temp_y=0;
int delta_x=0;
int delta_y=0;

void setup() {
  noCursor();
  frameRate(10);
  size(800, 1080);
  avatar = new Avatar();
  minim = new Minim(this);  //初期化
  player = minim.loadFile("sound/self.mp3");  //sample.mp3をロードする
  player.play();  //再生
}

void draw() {
  background(0, 102, 153);
  sound_level = player.left.level()*1000;
  if(f){
    textSize(30);
    text("https://zenn.dev/antman/books/7767fc7ada0338",0,1000);
  }
  avatar.draw(mouseX, mouseY);
  //saveFrame("frames/######.png");
}
void stop(){
  player.close();
  minim.stop();
  super.stop();
}

void keyPressed() {
  switch(key) {
  case '1':
    avatar.state = "breath";
    break;
  case '2':
    avatar.state = "talk";
    break;
  case '3':
    avatar.state = "sleep";
    break;
  case '4':
    avatar.state = "smile";
    break;
  case '5':
    avatar.state = "anger";
    break;
  case '6':
    avatar.state = "surprised";
    break;
  case '+':
    avatar.onSwing();
    break;
  case '-':
    avatar.getClip("right_arm").setRotation(-PI/360);
    println("right_arm_rad"+avatar.getClip("right_arm").rad%PI/PI);
    break;
  case ' ':
    f=!f;
    break;
  default:
    avatar.state = "normal";
    avatar.getClip("root").setRotation(0);
    break;
  }
}

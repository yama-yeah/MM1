/*
 * Sample Avatar 1
 * 
 * 顔だけのサンプル
 */

Avatar avatar;
boolean f=true;

void setup() {
  noCursor();
  frameRate(10);
  size(800, 1080);
  avatar = new Avatar();
  minim = new Minim(this);  //初期化
  //player = minim.loadFile("sound/sample.mp3");  //sample.mp3をロードする
  //player.play();  //再生
}

void draw() {
  background(0, 102, 153);
  avatar.draw(mouseX, mouseY);
  //saveFrame("frames/######.png");

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
    avatar.getClip("right_arm").setRotation(PI/360);
    break;
  case ' ':
    text('https://zenn.dev/books/7767fc7ada0338/edit',Width/w,1000);
  default:
    avatar.state = "normal";
    break;
  }
}

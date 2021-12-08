
/**
 * Sample Avatar
 * 
 * 顔だけのサンプル
 */


class Avatar {
  String state;
  ArrayList<Clip> layers;
  int BASE_WIDTH=191;

  Avatar() {
    this.state = "normal"; //"normal", "breath", "talk", "sleep", "smile", "anger", "surprised"

    layers = new ArrayList<Clip>();
    layers.add(new Clip("root", 0, 0, 0, 0,1,1,0));
    
    layers.add(new Clip("body",0,1000,0,0,3,3,0));
    layers.add(new Clip("face", 0, -250*3, 0, 150*7,0.17,0.17,0));
    layers.add(new Clip("lip", 12*7, 65*7, 0, 0,1,1,0));
    layers.add(new Clip("eye_r", 47*7, -30, 0, 0,1,1,0));
    layers.add(new Clip("eye_l", -25*7, -50, 0, 0,1,1,0));
    layers.add(new Clip("right_arm", 47*7, -30, 0, 0,0.5,0.5,PI/2));

    this.getClip("face").setParent(this.getClip("root"));
    this.getClip("lip").setParent(this.getClip("face"));
    this.getClip("eye_l").setParent(this.getClip("face"));
    this.getClip("eye_r").setParent(this.getClip("face"));
    this.getClip("body").setParent(this.getClip("face"));
    this.getClip("right_arm").setParent(this.getClip("body"));
    //this.getClip("eyebrow_l").setParent(this.getClip("face"));
    //this.getClip("eyebrow_r").setParent(this.getClip("face"));
    //this.getClip("glass").setParent(this.getClip("face"));

    this.getClip("face").images.add(0, loadImage("face1.png"));
    //this.getClip("lip").images.add(0, loadImage("lip.png"));
    this.getClip("lip").images.add(0, loadImage("data/open_lip.png"));
    //this.getClip("lip").images.add(2, loadImage("lip_anger.png"));
    //this.getClip("lip").images.add(3, loadImage("lip_smile.png"));
    //this.getClip("lip").images.add(4, loadImage("lip_surprised.png"));
    this.getClip("eye_l").images.add(0, loadImage("left_eye.png"));
    //this.getClip("eye_l").images.add(1, loadImage("eye_l_anger.png"));
    //this.getClip("eye_l").images.add(2, loadImage("eye_l_sleep.png"));
    //this.getClip("eye_l").images.add(3, loadImage("eye_l_surprised.png"));
    this.getClip("eye_r").images.add(0, loadImage("right_eye.png"));
    //this.getClip("eye_r").images.add(1, loadImage("eye_r_anger.png"));
    //this.getClip("eye_r").images.add(2, loadImage("eye_r_sleep.png"));
    //this.getClip("eye_r").images.add(3, loadImage("eye_r_surprised.png"));
    this.getClip("body").images.add(0, loadImage("body.png"));
    this.getClip("right_arm").images.add(0, loadImage("short_eda.png"));
    //this.getClip("face").setScale(0.2, 0.2);
    //this.getClip("body").setScale(3, 3);
    this.getClip("eye_r").setRotation(PI/40);
    this.getClip("lip").setScale(0.8, 0.7);

  }

  void draw(int x, int y) {
    switch(this.state) {
    case "nomal":
      this.normal();
      break;
    case "breath":
      this.breath();
      break;
    case "talk":
      this.talk();
      break;
    case "sleep":
      this.sleep();
      break;
    case "smile":
      this.smile();
      break;
    case "anger":
      this.anger();
      break;
    case "surprised":
      this.surprised();
      break;
    default:
      this.normal();
      break;
    }
    this.layers.get(0).setTranslation(x, y);
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).draw();
    }
  }

  Clip getClip(String name) {
    for (int i=0; i<layers.size(); i++) {
      if (layers.get(i).name == name) {
        return layers.get(i);
      }
    }
    return null;
  }

  void normal() {
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).num = 0;
      //layers.get(i).setRotation(0.0);
      //layers.get(i).setScale(1, 1);
    }
  }

  void breath() {
    for (int i=0; i<layers.size(); i++) {
      if (layers.get(i).name =="root") {
        if (frameCount % 4 < 2) {
          layers.get(i).setRotation(PI/100.0);
        } else {
          layers.get(i).setRotation(-PI/100.0);
        }
      }
    }
  }

  void talk() {
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).setScale(1.0, 1.0);
    }
    if (frameCount % 4 < 2) {
      this.getClip("lip").num = 0;
    } else {
      this.getClip("lip").num = 1;
    }
  }

  void sleep() {
    this.getClip("eye_l").num = 2;
    this.getClip("eye_r").num = 2;
  }

  void smile() {
    this.getClip("lip").num = 3;
    this.getClip("eye_l").num = 0;
    this.getClip("eye_r").num = 0;
    this.getClip("eyebrow_l").setRotation(PI/8.0);
    this.getClip("eyebrow_r").setRotation(-PI/8.0);
  }

  void anger() {
    this.getClip("lip").num = 2;
    this.getClip("eye_l").num = 1;
    this.getClip("eye_r").num = 1;
    this.getClip("eyebrow_l").setRotation(-PI/10.0);
    this.getClip("eyebrow_r").setRotation(PI/10.0);
  }

  void surprised() {
    this.getClip("lip").num = 4;
    this.getClip("lip").setScale(2.0, 2.0);
    this.getClip("eye_l").num = 3;
    this.getClip("eye_r").num = 3;
    this.getClip("eye_l").setScale(2.0, 2.0);
    this.getClip("eye_r").setScale(2.0, 2.0);
    this.getClip("eyebrow_l").setRotation(PI/8.0);
    this.getClip("eyebrow_r").setRotation(-PI/8.0);
  }
}

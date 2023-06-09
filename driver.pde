import java.lang.Math;

Terrain terr;
player pl;
protected PImage endscreen;
protected int lost = 0;

void check(){
 if (terr.gameState == false){
    terr.startScreen();
  }
  else{
    if (terr.mode1.isClicked()){
      terr.carArray[0] = loadImage("redCar.png");
      terr.carArray[0].resize(80, 50);
      terr.carArray[1] = loadImage("greenCar.png");
      terr.carArray[2] = loadImage("blueCar.png");
      terr.carArray[3] = loadImage("police.png");
      terr.carArray[1].resize(80, 80);
      terr.carArray[2].resize(80, 80);
      terr.carArray[3].resize(80, 50);
    }
    if (terr.mode2.isClicked()){
      terr.carArray[0] = loadImage("zombie0.png");
      terr.carArray[1] = loadImage("zombie1.png");
      terr.carArray[2] = loadImage("zombie2.png");
      terr.carArray[3] = loadImage("car4.png");
   //   carArray[1].resize(80, 40);
    //  carArray[3].resize(80, 60);
    }
    }
}

void setup(){
  terr = new Terrain();
  pl = new player();
  size(800, 600);
  check();
    terr.end = loadImage("congrats.png");
    terr.end.resize(800, 100);
    terr.back = loadImage("grass.png");
    terr.back.resize(800, 620);
    terr.mid = loadImage("grass.png");
    terr.mid.resize(800, 608);
    terr.fore = loadImage("grass.png");
    terr.fore.resize(800, 620);

  terr.carArray[0] = loadImage("redCar.png");
  terr.carArray[0].resize(80, 50);
  terr.carArray[1] = loadImage("greenCar.png");
  terr.carArray[2] = loadImage("blueCar.png");
  terr.carArray[3] = loadImage("police.png");
  terr.carArray[1].resize(80, 80);
  terr.carArray[2].resize(80, 80);
  terr.carArray[3].resize(80, 50);
  terr.back = loadImage("magic.png");
  terr.back.resize(800, 610);
  terr.mid = loadImage("magic.png");
  terr.mid.resize(800, 608);
  terr.fore = loadImage("magic.png");
  terr.fore.resize(800, 610);
  size(800, 600); 
  pl.player = loadImage("pika.png");
  endscreen = loadImage("gameover.png");
  endscreen.resize(800, 600);
}

void draw(){
  terr.startScreen();
  terr.mode1.update();
  terr.mode1.render();
  terr.mode2.update();
  terr.mode2.render();
  textAlign(CENTER);
  textSize(20);
  text("Pick mode and avatar", 400, 20);
  if (terr.mode1.isClicked()  || terr.mode2.isClicked()){
    terr.gameState = true;
    setup();
  }
  System.out.println(terr.gameState);
  if (terr.gameState == true){
      
      image(terr.back, 0, terr.by); image(terr.back, 0, terr.by2);
      image(terr.mid, 0, terr.my); image(terr.back,0, terr.my2);
      image(terr.fore,0, terr.fy); image(terr.fore, 0, terr.fy2);
      if (terr.genBigRoad){
        image(terr.bigRoad, 0, terr.bRoady);
        terr.genCarsBig();
        if (terr.bRoady >800) {
          terr.genBigRoad = false;
          terr.bRoady = -100;
        }
      }
    }
  //image(terr.back, 0, terr.by); image(terr.back, 0, terr.by2);
  //image(terr.mid, 0, terr.my); image(terr.back,0, terr.my2);
  //image(terr.fore,0, terr.fy); image(terr.fore, 0, terr.fy2);
  if (terr.genBigRoad){
    image(terr.bigRoad, 0, terr.bRoady);
    terr.genCarsBig();
    if (terr.bRoady >800) {
      terr.genBigRoad = false;
      terr.bRoady = -100;
    }
  }
  if (terr.genRoad){
    image(terr.road, 0, terr.roady);
    terr.genCars();
    if (terr.roady >600) {
      terr.genRoad = false;
      terr.roady = -300;
    }
  }
  if (terr.by <-600) {terr.by = 600;} if (terr.by2 <-600) {terr.by2 = 600;}
  if (terr.my <-600) {terr.by = 600;} if (terr.by2 <-600) {terr.by2 = 600;}
  if (terr.fy <-600) {terr.fy = 600;} if (terr.fy2 <-600) {terr.fy2 = 600;}
  if (terr.by > 600) {terr.by = -600;} if (terr.by2 > 600) {terr.by2 = -600;}
  if (terr.my >600) {terr.by = -600;} if (terr.by2 >600) {terr.by2 = -600;}
  if (terr.fy >600) {terr.fy = -600;} if (terr.fy2 >600) {terr.fy2 = -600;}
  if (pl.disy <-600) {pl.disy = 600;} if (pl.disby <-600) {pl.disby = 600;} 
  if (pl.disy > 600) {pl.disy = -600;} if (pl.disby <-600) {pl.disby = 600;}  
  terr.generateRoads();
  terr.generateBigRoad();
 image(pl.player, pl.x, pl.y);
 pl.player.resize(0, 50);
 pl.move();
 terr.move();
 if (collision()==true){
   lost++;
   pl.player = loadImage("oof.png");
 }
 while(lost > 0){
   image(endscreen, 60, 0);
 }
}

boolean collision(){
    //System.out.println(terr.vbp);
    //System.out.println(terr.bRoady+75);
    //System.out.println(pl.x);
    //System.out.println(pl.y);
    //System.out.println(Distance(terr.vbp, terr.bRoady-55, pl.x, pl.y));
    
  if ((Distance(terr.vr, terr.roady, pl.x, pl.y) < 20)|| 
  (Distance(terr.vg, terr.roady+20, pl.x, pl.y) < 20)|| 
  (Distance(terr.vp, terr.roady-10, pl.x, pl.y) < 20)|| 
  (Distance(terr.vb, terr.roady+30, pl.x, pl.y) < 20)|| 
  (Distance(terr.vbr, terr.bRoady, pl.x, pl.y) < 20)|| 
  (Distance(terr.vbg, terr.bRoady+100, pl.x, pl.y) < 20)|| 
  (Distance(terr.vbp, terr.bRoady+75, pl.x, pl.y) < 18)|| 
  (Distance(terr.vbb, terr.bRoady+40, pl.x, pl.y) < 18)){
     return true; 
        }
  else{
    return false;
  }
}

public double Distance(double x1, double y1, double x2, double y2) {       
  return Math.sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1));
}

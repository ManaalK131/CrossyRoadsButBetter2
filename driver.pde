import java.lang.Math;


Buttons mode1; 
Buttons mode2;
Buttons player1;
Buttons player2;
Buttons player3;
Buttons player4;
boolean gameState = false;
PImage start; 

Terrain terr;
player pl;
protected PImage endscreen;
protected int lost = 0;
boolean showEnd;

void startScreen(){
  start = loadImage("start.png");
  start.resize(800, 600);
  background(start);
  textAlign(CENTER);
  textSize(20);
  text("Pick mode and avatar", 400, 20);
  //System.out.println(gameState);
}

void setup(){
  size(800, 600);
  mode1 = new Buttons(50, 100, 100, 50, "Normal", 0, 200, 200);
  mode2 = new Buttons(40, 300, 130, 60, "Walking Dead", 171, 16, 5);
  player1 = new Buttons(665, 100, 100, 50, "Pikachu", 201, 214, 17);
  player2 = new Buttons(650, 200, 130, 60, "Psyduck", 11, 161, 151);
  player3 = new Buttons(650, 300, 130, 60, "Eevee", 143, 48, 10);
  player4 = new Buttons(650, 400, 130, 60, "Snorlax", 1, 112, 12);
    terr = new Terrain();
    pl = new player();

    terr.back = loadImage("magic.png");
    terr.back.resize(800, 610);
    terr.mid = loadImage("magic.png");
    terr.mid.resize(800, 608);
    terr.fore = loadImage("magic.png");
    terr.fore.resize(800, 610);

    endscreen = loadImage("gameover.png");
    endscreen.resize(800, 600);
}

void draw(){
  if (gameState == false){
    startScreen();
    mode1.update();
    mode1.render();
    mode2.update();
    mode2.render();
    player1.update();
    player1.render();
    player2.update();
    player2.render();
    player3.update();
    player3.render();
    player4.update();
    player4.render();
           if (player1.isClicked()){
      pl.player = loadImage("pika.png");
      System.out.println("pika.png");
    }
    if (player2.isClicked()){
      pl.player = loadImage("psyduck.png");
      System.out.println("psyduck.png");
    }
    if (player3.isClicked()){
      pl.player = loadImage("eevee.png");
      System.out.println("eevee.png");
    }
    if (player4.isClicked()){
      pl.player = loadImage("snorlax.png");
      System.out.println("snorlax.png");
    }
    if (mode1.isClicked()){
      terr.carArray[0] = loadImage("redCar.png");
      terr.carArray[0].resize(80, 50);
      terr.carArray[1] = loadImage("greenCar.png");
      terr.carArray[2] = loadImage("blueCar.png");
      terr.carArray[3] = loadImage("police.png");
      terr.carArray[1].resize(80, 80);
      terr.carArray[2].resize(80, 80);
      terr.carArray[3].resize(80, 50);
      System.out.println("mode1");
    }
    if (mode2.isClicked()){
      terr.carArray[0] = loadImage("zombie0.png");
      terr.carArray[1] = loadImage("zombie1.png");
      terr.carArray[2] = loadImage("zombie2.png");
      terr.carArray[3] = loadImage("car4.png");
      System.out.println("mode2");
    }
    if ((mode1.isClicked()  || mode2.isClicked()) 
    && (player1.isClicked() || player2.isClicked() 
    || player3.isClicked() || player4.isClicked())
    ){
      gameState = true;
    }
    }
    //System.out.println(gameState);
    if (gameState == true){
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
       endscreen = loadImage("gameover.png");
       endscreen.resize(800, 600);
       showEnd = true;
     }
     while(lost > 0){
       image(endscreen, 60, 0);
     }
    }
  
}

boolean collision(){
    //System.out.println(terr.vbp);
    //System.out.println(terr.bRoady+75);
    //System.out.println(pl.x);
    //System.out.println(pl.y);
    //System.out.println(Distance(terr.vbp, terr.bRoady-55, pl.x, pl.y));
    
  if ((Distance(terr.vr, terr.roady, pl.x, pl.y) < 15)|| 
  (Distance(terr.vg, terr.roady+20, pl.x, pl.y) < 15)|| 
  (Distance(terr.vp, terr.roady-10, pl.x, pl.y) < 15)|| 
  (Distance(terr.vb, terr.roady+30, pl.x, pl.y) < 15)|| 
  (Distance(terr.vbr, terr.bRoady, pl.x, pl.y) < 15)|| 
  (Distance(terr.vbg, terr.bRoady+100, pl.x, pl.y) < 15)|| 
  (Distance(terr.vbp, terr.bRoady+75, pl.x, pl.y) < 15)|| 
  (Distance(terr.vbb, terr.bRoady+40, pl.x, pl.y) < 15)){
     return true; 
        }
  else{
    return false;
  }
}

public double Distance(double x1, double y1, double x2, double y2) {       
  return Math.sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1));
}

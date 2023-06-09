public class newGround{
protected PImage player;
protected int x = 400;
protected int y = 300;



void move(){
 if(keyPressed){
   if(key == CODED){
     if(keyCode==UP){
       y -= 1;
       }
       else if(keyCode==DOWN){
         y += 1;
       }
}
 }
}

}

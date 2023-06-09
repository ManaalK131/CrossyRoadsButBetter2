public class Buttons{
  boolean started = false; 
  PVector pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  color col;
  String text;
  Boolean clicked = false;
  Boolean pressed = false;
    
  Buttons(int x, int y, int w, int h, String t, int r, int g, int b){
    pos.x = x;
    pos.y = y;
    Width = w;
    Height = h;
    text = t;
    col = color(r, g, b);
    
  }
   
  void update(){
    if (mousePressed == true && mouseButton == LEFT && pressed == false)
    {
      pressed = true;
      if (mouseX>=pos.x && mouseX <=pos.x + Width && mouseY >= pos.y && mouseY <=pos.y + Height){
        clicked = true;
        
      }
      
      
    }
    else {
      clicked = false ;
      pressed = false;
    }
    
    
    
  }
  
  
  void render(){
    fill(col);
    rect(pos.x, pos.y, Width, Height);
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, pos.x +(Width/2), pos.y + Height/2);
    
  }
 //debugging  
  boolean isClicked()
  {return clicked;}
  
  
  
}

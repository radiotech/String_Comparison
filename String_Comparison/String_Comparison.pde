boolean selected = true;
String a = "";
String b = "";
boolean c = true;

void setup(){
  size(600,300);
}

void mousePressed(){
  if(abs(mouseX-width/4)<width/6){
    if(abs(mouseY-height/4)<height/6){
      selected = true;
    } else if(abs(mouseY-3*height/4)<height/6){
      selected = false;
    }
  }
}

void keyPressed(){
  String temp;
  if(selected){
    temp = a;
  } else {
    temp = b;
  }
  
  if(keyCode == TAB){
    if(selected){
      selected = false;
      temp = b;
    } else {
      selected = true;
      temp = a;
    }
  } else if (keyCode == BACKSPACE) {
    if(temp.length() > 0){
      temp = temp.substring(0, temp.length() - 1);
    }
  } else {
    temp += key;
  }
  
  if(selected){
    a = temp;
  } else {
    b = temp;
  }
}

void draw(){
  background(255,255,102);
  
  fill(100,255,100);
  strokeWeight(2);
  rectMode(CENTER);
  
  if(selected){
    stroke(255,100,0);
    rect(width/4,height/4,width/3,height/3,30);
    noStroke();
    rect(width/4,3*height/4,width/3,height/3,30);
  } else {
    noStroke();
    rect(width/4,height/4,width/3,height/3,30);
    stroke(255,100,0);
    rect(width/4,3*height/4,width/3,height/3,30);
    noStroke();
  }
  
  rect(3*width/4,height/4,width/3,height/3,30);
  
  rect(3*width/4,3*height/4,width/3,height/3,30);
  
  fill(0);
  textAlign(CENTER,CENTER);
  
  
  for(int i = 50; i > 1; i--){
    textSize(i);
    if(textWidth(a) < width/float(3)){
      i = 0;
    }
  }
  text(a,width/4,height/4);
  
  for(int i = 50; i > 1; i--){
    textSize(i);
    if(textWidth(b) < width/float(3)){
      i = 0;
    }
  }
  text(b,width/float(4),3*height/float(4));
  
  textSize(25);
  
  if(a != "" && b != ""){
    noStroke();
    if(a.equals(b)){
      text("Equal",3*width/4,3*height/4);
      if(c == false){
        fill(200,0,0);
        rect(3*width/4,height/4,width/3,height/3,30);
        fill(0);
      }
    } else {
      text("Not Equal",3*width/4,3*height/4);
      if(c){
        fill(255,127,0);
        rect(3*width/4,height/4,width/3,height/3,30);
        fill(0);
      }
    }
    
    if(c){
      text("Equal",3*width/4,height/4);
    } else {
      text("Not Equal",3*width/4,height/4);
    }
  }
  
  
}



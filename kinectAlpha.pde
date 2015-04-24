
import SimpleOpenNI.*;
SimpleOpenNI kinect;
 float [][] rgb=new float [640][550];
 color map;
 float scope =0;
 float elx=50;
 float elx2=430;
 float elx3=240;
 float elcolor=255;
 float brushsize=20;
 int flag=0;
 int picflag=0;
 int waspicflag=0;
 PImage img;

void setup() {
  size(630, 600); 
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
}



void draw() {  
  

  if(picflag==0){
      background(255);
  kinect.update();
  
  image(kinect.depthImage(), 0, 0); 
    for(int i=0;i<600;i++){
     for(int j=0;j<480;j++){
       rgb[i][j]=red(get(i,j));
       if(rgb[i][j]<scope){
         rgb[i][j]=0;
     }
     map=color(rgb[i][j]);
     set(i,j,map);
    }
}

  }
  else{
  }
  noStroke();
  fill(255);
  rect(0,480,630,120);
  stroke(0);
  strokeWeight(5);
line(50,515,200,515);
line(430,515,580,515);
line(240,515,390,515);
if(flag==1){
  elx=mouseX;
}
if(flag==2){
  elx2=mouseX;
}

if(flag==4){
  elx3=mouseX;
}
if(elx<50){
  elx=50;
}
if(elx>200){
  elx=200;
}
if(elx2<430){
  elx2=430;
}
if(elx2>580){
  elx2=580;
}
if(elx3<240){
  elx3=240;
}
if(elx3>390){
  elx3=390;
}
fill(255);
ellipse(elx,515,20,20);
fill(elcolor);
ellipse(elx2,515,20,20);
fill(255);
ellipse(elx3,515,brushsize,brushsize);

fill(255);
rect(410,550,85,30,7);
rect(410+105,550,85,30,7);
stroke(0);
fill(0);
text("save",545,568);
if(picflag==0){
  strokeWeight(1);
  stroke(52,234,81);
  fill(52,234,81);
  rect(445,555,5,20);
  rect(455,555,5,20);
}
else if(picflag==1){
  strokeWeight(1);
  stroke(52,234,81);
  fill(52,234,81);
  triangle(445,555,445,575,460,565);
  if(flag==3){
    fill(elcolor);
    noStroke();
    ellipse(mouseX,mouseY,brushsize,brushsize);
    
}
}

println(flag,picflag);

scope=map(elx,50,200,0,255);
elcolor=map(elx2,430,580,255,0);
brushsize=map(elx3,240,390,20,40);
  
}

void mousePressed(){
  if(dist(mouseX,mouseY,elx,515)<10){
    flag=1;
  }
  if(dist(mouseX,mouseY,elx2,515)<10){
    flag=2;
}
 if(dist(mouseX,mouseY,elx3,515)<10){
    flag=4;
}
if(mouseX>410 && mouseX<495 && mouseY>555 && mouseY<585 && waspicflag==0){
  picflag=1;//止まる
}
if(mouseX>410 && mouseX<495 && mouseY>555 && mouseY<585 && waspicflag==1){
  picflag=0;//動く
}
if(mouseX>515 && mouseX<600 && mouseY>555 && mouseY<585){
  img= get(0,0,630,480);
  img.save("alpha.png");
}
if(mouseY<480 && picflag==1){
  flag=3;
}
waspicflag=picflag;
}

void mouseReleased(){
  flag=0;
}


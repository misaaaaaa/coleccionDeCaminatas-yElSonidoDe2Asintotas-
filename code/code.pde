Table table1;
Table table2;
Table table3;
Table table4;

float x1, y1, xmap1, ymap1;
float x2, y2, xmap2, ymap2;
float x3, y3, xmap3, ymap3;
float x4, y4, xmap4, ymap4;

float initx1 = 0;
float inity1 = 0;
float initx2 = 0;
float inity2 = 0;

float prevx1, prevy1, prevx2, prevy2, prevx3, prevy3, prevx4, prevy4;

float rangoRandom = 2.5;
int ancho = 10;

int count0 = 70;
int count1 = 5;
int count2 = -1;
int count3 = -1;

int count2dir = 1;
int count3dir = 1;

int minutos, segundos, frames;

float delta1 = 0;
float delta2 = 0;
float delta3 = 0;
float delta4 = 0;

int margin = 0;

void setup() {


  size(1280, 720);
  margin = width/40;
  //colorMode(RGB);
  background(0, 100);

  //colorMode(HSB, 380, 100, 100, 100);

  table1 = loadTable("rec1.csv", "header");
  table2 = loadTable("rec2.csv", "header");
  table3 = loadTable("rec3.csv", "header");
  table4 = loadTable("rec4.csv", "header");

  //println(table1.getRowCount());

  frameRate(24);

  prevx1 = map(table1.getFloat(70, 0), 0, 100, 0 + margin + delta1, width - margin + delta1);
  prevy1 = map(table1.getFloat(70, 1), 0, 100, height - margin  + delta1, 0 + margin  + delta1);

  prevx2 = map(table2.getFloat(5, 0), 0, 100, 0 + margin + delta1, width - margin + delta1);
  prevy2 = map(table2.getFloat(5, 1), 0, 100, height - margin  + delta1, 0 + margin  + delta1);

  initx1 = prevx1;
  inity1 = prevy1;

  initx2 = prevx2;
  inity2 = prevy2;

  println(prevy1);
}

void draw() {

  //noStroke();
  //fill(127);
  //rect(width/4, height*0.9-100, width/4+100, height*0.9+100);


  
  //segundos = millis()/1000;
  //minutos = (segundos/60)%60;
  //frames = frameCount%24;

  fill(200, 100);
  textSize(15);
  text("QN", initx1 + 25, inity1-10);

  text("PF", initx2 + 10, inity2-30);

  //text("00:", width/4, height*0.9);
  //text(minutos, width/4+20, height*0.9);
  //text(segundos, width/4+40, height*0.9);
  //text(frames, width/4+60, height*0.9);

  //
  println(second());


  //FONDO
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);


  delta1 = random (rangoRandom*-1, rangoRandom);
  delta2 = random (rangoRandom*-1, rangoRandom);
  delta3 = random (rangoRandom*-1, rangoRandom);
  delta4 = random (rangoRandom*-1, rangoRandom);

  count0++;
  count1++;
  //count2++;
  count2 = count2 +1*count2dir;
  //count3++;
  count3 = count3 +1*count3dir;



  x1 = table1.getFloat(count0, 0);
  y1 = table1.getFloat(count0, 1);

  x2 = table2.getFloat(count1, 0);
  y2 = table2.getFloat(count1, 1);

  x3 = table3.getFloat(count2, 0);
  y3 = table3.getFloat(count2, 1);

  x4 = table4.getFloat(count3, 0);
  y4 = table4.getFloat(count3, 1);

  xmap1 = map(x1, 0, 100, 0 + margin + delta1, width - margin + delta1);
  ymap1 = map(y1, 0, 100, height - margin  + delta1, 0 + margin  + delta1);

  xmap2 = map(x2, 0, 100, 0 + margin  + delta2, width - margin  + delta2);
  ymap2 = map(y2, 0, 100, height - margin  + delta2, 0 + margin  + delta2);

  xmap3 = map(x3, 0, 100, 0 + margin + delta3, width - margin + delta3);
  ymap3 = map(y3, 0, 100, height - margin + delta3, 0 + margin + delta3);

  xmap4 = map(x4, 0, 100, 0 + margin + delta4, width - margin + delta4);
  ymap4 = map(y4, 0, 100, height - margin + delta4, 0 + margin + delta4);


  fill(255);
  //ellipse(xmap1, ymap1, ancho, ancho);
  //ellipse(xmap2, ymap2, ancho, ancho);
  ellipse(xmap3, ymap3, ancho, ancho);
  ellipse(xmap4, ymap4, ancho, ancho);

  stroke(255);
  strokeWeight(5);
  fill(255);
  line(prevx1, prevy1, xmap1, ymap1);
  line(prevx2, prevy2, xmap2, ymap2);


  //print(x1);
  //print(" ");
  //println(y1);





  if (count0 >= (table1.getRowCount()-1)*0.94) {
    count0 = 70;
  }
  if (count1 >= (table2.getRowCount()-1)*0.78) {
    count1 = 5;
  }
  if (count2 >= (table3.getRowCount()-1)*0.54) {
    count2dir = -1;
  }
  if (count2 <= 1) {
    count2dir = 1;
  }

  if (count3 >= (table4.getRowCount()-1)*0.54) {
    count3dir = -1;
  }
  if (count3 <= 1) {
    count3dir = 1;
  }

  prevx1 = xmap1;
  prevy1 = ymap1;

  prevx2 = xmap2;
  prevy2 = ymap2;
}

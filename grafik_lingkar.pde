String sfile[];
IntDict conco;
String[] freq;
float[] sum;
int sumData, total;

void setup() {
  size(600, 400);background(0);
  colorMode(HSB,255);
  sfile = loadStrings("dataNilai.txt");
  sfile = split(sfile[0],",");
  conco = new IntDict();
  noLoop();
  noStroke(); 
}

float deg=0;
float x1,y1,halfAngle;
float lastAngle=0;
float sudutAwal=0;
float derajat = 0;

void draw() {
  background(0);
  lastAngle=0;
  for(int i=0;i<sfile.length;i++){
    conco.increment(sfile[i]);conco.sortKeys();
  }
  freq=conco.keyArray();
  sum=float(conco.valueArray());

  for(int i=0;i<sum.length;i++){
    total += sum[i];
  }
  
  for(int i=0;i<sum.length;i++){
    fill(30*i,255,255);
    deg = sum[i]/ total*360;
    //lastAngle=sudutAwal+deg;
    
    arc(200, 200, 350, 350, lastAngle, lastAngle+radians(deg));
    //fill(0);
    //textSize(10);
    //textAlign(CENTER,CENTER);
    
    //text(freq[i] + " '" + nf(sum[i],0,0) + "'",         
    //     200 + 150 * cos(radians(sudutAwal+deg/2)),
    //     200 + 150 * sin(radians(sudutAwal+deg/2)));
    //sudutAwal=lastAngle;

        halfAngle = radians(lastAngle/10+deg/2); 
        x1=200 + 125* cos(halfAngle+lastAngle);
        y1=200 + 125* sin(halfAngle+lastAngle);
        fill(0);
        textAlign(CENTER,CENTER);
        textSize(10);
        text(freq[i] + " '" + nf(sum[i],0,0) + "'",x1,y1); 
        lastAngle += radians(deg);
            
    pushMatrix();
      textSize(15);
      translate(0,height/6);
      fill(30*i,255,255);
      rect(420,20+30*i,20,20);
      fill(255);
      textAlign(LEFT);
      text("total nilai "+ freq[i] + " = "+ nf(sum[i],0,0), 450, 35 + 30*i);
    popMatrix();   
  }
}

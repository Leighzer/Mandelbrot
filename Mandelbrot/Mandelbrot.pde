float zoom = 1;
int numberOfIterations = 10000;




void setup(){
  size(1800, 1000);
}

void draw(){
  for(int i = 0; i < width; i++){
     for(int j = 0; j < height; j++){
       
       float realValue = 0;
       float imaginaryValue = 0;
       
        realValue = realValue + ((float)i/(float)width)*4*zoom - 2;
        imaginaryValue = imaginaryValue + ((float)j/(float)height)*4*zoom - 2;
        //zoom = zoom - 0.0001;
       
        if(doesConverge(realValue, imaginaryValue)){
          drawWhitePoint(i,j);
        }
        else{
           drawBlackPoint(i,j);
        }
        
        drawRedPoint(300,200);
        
     }
  }
}

boolean doesConverge(float cReal, float cImaginary){
  
  float zReal = 0;
  float zImaginary = 0;
  
  float newZReal;
  float newZImaginary;
  
  for(int i = 0; i < numberOfIterations; i++){
      newZReal = ((zReal*zReal) - (zImaginary*zImaginary)) + cReal;
      newZImaginary = (2*zReal*zImaginary) + cImaginary;
      
      zReal = newZReal;
      zImaginary = newZImaginary;
  }
  
  if(abs((float)(zReal + zImaginary)) < 500 || abs((float)(zReal + zImaginary))< 0){
    return true;
  }
  else{
    return false;
  }
  

}

void drawWhitePoint(int x, int y){
  stroke(255);
  point(x,y);
}

void drawBlackPoint(int x, int y){
  stroke(0);
  point(x,y);
}

void drawRedPoint(int x, int y){
  stroke(255,0,0);
  point(x,y);
}
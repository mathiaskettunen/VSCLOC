import processing.serial.*;
Serial myPort;
String data="";

void setup()
{
  size(1400,800);
  surface.setTitle("Velocity");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  noStroke();
  noFill();
 
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil(10);
}
 
void draw()
{
  background(255);
  fill(100);
  textSize(800);
  text(data,1,750);
  textSize(100);
  text(data,1,90);

}
 
void serialEvent(Serial myPort)
{
  data = myPort.readStringUntil(10);
}

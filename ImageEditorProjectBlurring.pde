ImageEditor natureIE;
ImageEditor destinationIE;
void setup()
{
  size(720,960);
  natureIE = new ImageEditor("junglepic.jpg");
  destinationIE = new ImageEditor(natureIE.width(), natureIE.height());
  noLoop();
  //https://www.nparks.gov.sg/gardens-parks-and-nature/parks-and-nature-reserves/windsor-nature-park
}

void draw()
{
  natureIE.startEditing();
  destinationIE.startEditing();
  colorMode(RGB);
  for(int x = 1; x < natureIE.width()-1; x ++)
  {
    for(int y = 1; y < natureIE.height()-1; y++)
    {
      //getting nine red pixels blurred
      int oneR = natureIE.getRedAt(x,y);
      int twoR = natureIE.getRedAt(x-1,y);
      int threeR = natureIE.getRedAt(x+1,y);
      int fourR = natureIE.getRedAt(x,y+1);
      int fiveR = natureIE.getRedAt(x,y-1);
      int sixR = natureIE.getRedAt(x+1,y-1);
      int sevenR = natureIE.getRedAt(x-1,y-1);
      int eightR = natureIE.getRedAt(x-1,y+1);
      int nineR = natureIE.getRedAt(x+1, y+1);
      
      int rr = ((oneR + twoR + threeR + fourR + fiveR + sixR + sevenR + eightR + nineR)/9);
      
      //getting 9 green pixels blurred
      int oneG = natureIE.getGreenAt(x,y);
      int twoG = natureIE.getGreenAt(x-1,y);
      int threeG = natureIE.getGreenAt(x+1,y);
      int fourG = natureIE.getGreenAt(x,y+1);
      int fiveG = natureIE.getRedAt(x,y-1);
      int sixG = natureIE.getGreenAt(x+1,y-1);
      int sevenG = natureIE.getGreenAt(x-1,y-1);
      int eightG = natureIE.getGreenAt(x-1,y+1);
      int nineG = natureIE.getGreenAt(x+1, y+1);
      
      int gg = ((oneG + twoG + threeG + fourG + fiveG + sixG + sevenG + eightG + nineG)/9);
      
      //getting 9 blue pixels blurred
      int oneB = natureIE.getBlueAt(x,y);
      int twoB = natureIE.getBlueAt(x-1,y);
      int threeB = natureIE.getBlueAt(x+1,y);
      int fourB = natureIE.getBlueAt(x,y+1);
      int fiveB = natureIE.getBlueAt(x,y-1);
      int sixB = natureIE.getBlueAt(x+1,y-1);
      int sevenB = natureIE.getBlueAt(x-1,y-1);
      int eightB = natureIE.getBlueAt(x-1,y+1);
      int nineB = natureIE.getBlueAt(x+1, y+1);
      
      int bb = ((oneB + twoB + threeB + fourB + fiveB + sixB + sevenB + eightB + nineB)/9);
     
      destinationIE.setRedAt(rr,x,y);
      destinationIE.setGreenAt(gg,x,y);
      destinationIE.setBlueAt(bb,x,y);
    }
  }
  natureIE.stopEditing();
  destinationIE.stopEditing();
  natureIE.drawAt(0,0);
  destinationIE.drawAt(0,480);
}

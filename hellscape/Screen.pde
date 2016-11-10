class Screen{
  final static int start = 0;
  final static int gameover = 1;
  int current = 0;
  
  Screen(int current_){
    current = current_;
  }
  
  void display(){
    if (current == start){
      textAlign(CENTER,CENTER);
      //textFont(titleFont);
      text("NAME OF THE GAME",width/2,height/4);
      rect(width/5,2*height/5,3*width/5,height/5);
    }
    if (current == gameover){
      
    }
  }
  
  
}
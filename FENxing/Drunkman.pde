class Drunkard {
  PVector pos;
  PVector vel;
  boolean stuck;
  int radius;

  //移动的醉鬼
  Drunkard() {
    pos = randomDrunkard();  //随机初始位置
    stuck = false;  //初始状态
    radius = 6;  //粒子半径
  }

  //睡觉的醉鬼
  Drunkard(int x, int y) {
    pos = new PVector(x, y);
    stuck = true;
    radius = 6;
  }

    //四周随机出现的醉鬼
    PVector randomDrunkard() {
    float i = random(4);  //4种可能性
    PVector p = new PVector();
    float x = random(width);
    float y = random(height);
    if (i <= 1) {  //顶部
      p = new PVector(x, 0);
    } else if (i <= 2) {  //底部
      p = new PVector(x, height);
    } else if (i <= 3) {  //右边缘 
      p = new PVector(0, y);
    } else if (i <= 4) {  //左边缘 
      p = new PVector(width, y);
    }
    return p;
  }
  //醉鬼的移动
  void walk() {
    vel = PVector.random2D();  //随机移动速度
    pos.add(vel);
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }
  //以圆代表醉鬼
  void show() {
    noStroke();
    if (stuck) {
      fill(0, 200, 0);
    } else {
      fill(300, 100, 100);
    }
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
  }
  //是否睡觉
  boolean checkStuck(Drunkard dr) {
    float d = dist(pos.x, pos.y, dr.pos.x, dr.pos.y);
    if (d < sqrt(radius * dr.radius * 2 * 2)) { 
      if (random(1) < 0.1) {
        return true;
      }
    }
    return false;
  }
}
--------------------- 
作者：Hewes 
来源：CSDN 
原文：https://blog.csdn.net/Hewes/article/details/77541153 
版权声明：本文为博主原创文章，转载请附上博文链接！

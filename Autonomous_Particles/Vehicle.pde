//steering behavior - Seek and Arrive
class Vehicle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, -2);
    location = new PVector(x, y);
    r = 6;
    maxspeed = 4;
    maxforce = 0.1;
  }

  //method to update the location
  void update() {
    //update velocity
    velocity.add(acceleration);
    //limit the speed
    velocity.limit(maxspeed);
    //update the location 
    location.add(velocity);
    //reset acceleration to 0 each cycle
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    //below is a much simple way
    //also could add mass here if we want it more real a = F/m
    acceleration.add(force);
  }

  //method to calculate a steering force towards a target
  //STEER = DESIRED - VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);

    //normalize desired and scale to maxspeed
    desired.normalize();
    desired.mult(maxspeed);
    //steering = desired - velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);

    applyForce(steer);
  }

  void display() {
    //draw a triangle towards a the derection(mouse)
    float theta = velocity.heading2D() + PI/2;
  }
}

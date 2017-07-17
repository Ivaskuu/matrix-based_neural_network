void setup()
{
  println("Hello world");
  
  Population pop = new Population(100, 0.001, 3);
  pop.train();
}
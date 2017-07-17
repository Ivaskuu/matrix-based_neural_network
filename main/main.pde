void setup()
{
  println("Hello world");
  
  Population pop = new Population(10000, 0.001, 3);
  pop.train();
}
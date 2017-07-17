void setup()
{
  println("Hello world");
  
  NeuralNetwork nn = new NeuralNetwork(new int[] {3, 4, 3});
  nn.printNetworkTopology();
  nn.printWeights();
}
void setup()
{
  println("Hello world");
  
  NeuralNetwork nn = new NeuralNetwork(new int[] {3, 3, 2});
  
  nn.printNetworkTopology();
  nn.printWeights();
  
  nn.feedForward(new double[] {1, 0.28, 0.57});
}
void setup()
{
  println("Hello world");
  
  NeuralNetwork nn = new NeuralNetwork(new int[] {3, 3, 2});
  
  nn.printNetworkTopology();
  nn.printWeights();
  
  double[] results = nn.feedForward(new double[] {1, 0.28, 0.57});
  for(int i = 0; i < results.length; i++)
  {
    println(results[i]);
  }
}
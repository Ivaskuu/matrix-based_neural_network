public class NeuralNetwork
{
  private int[] layers; // Neural network topology
  private double[][] neurons; // [layer_num (0: input layer, neurons.length - 1: output layer)][neuron_pos]
  private double[][][] weights; // [layer_num][neuron][previous_layer_neuron_weight]
  
  NeuralNetwork(int[] topology) // [3, 2, 1] : 3 input neurons, 2 hidden neurons, 1 output neuron
  {
    layers = topology;
    createNeurons();
    createWeights();
  }
  
  private void createNeurons()
  {
    neurons = new double[layers.length][];
    for(int i = 0; i < layers.length; i++)
    {
      neurons[i] = new double[layers[i]];
    }
  }
  
  private void createWeights()
  {
    weights = new double[layers.length][][];
    
    // Iterate each layer with weight connections (so not the input layer)
    for(int i = 1; i < layers.length; i++)
    {
      int neuronsInPrevLayer = layers[i-1];
      weights[i] = new double[layers[i]][];
      
      // Iterate each neuron int the i-th layer
      for(int j = 0; j < layers[i]; j++)
      {
        weights[i][j] = new double[neuronsInPrevLayer];
        
        // Create a random connection between layers[i-1][k] and layers[i-1][j] neurons
        for(int k = 0; k < neuronsInPrevLayer; k++)
        {
          weights[i][j][k] = random(-1, 1);
        }
      }
    }
  }
  
  public void printNetworkTopology()
  {
    // Iterate each layer
    for(int i = 0; i < layers.length; i++)
    {
      println("Layer");
      
      // Iterate each neuron in the i-th layer
      for(int j = 0; j < layers[i]; j++)
      {
        println("Neuron");
      }
    }
  }
  
  public void printWeights()
  {
    // Iterate each layer with weight connections (so not the input layer)
    for(int i = 1; i < layers.length; i++)
    {
      println("\nLayer " + (i+1));
      
      int neuronsInPrevLayer = layers[i-1];
      
      // Iterate each neuron int the i-th layer
      for(int j = 0; j < layers[i]; j++)
      {
        // Iterate connections from previous neurons
        for(int k = 0; k < neuronsInPrevLayer; k++)
        {
          println("Neuron " + k + " -> " + weights[i][j][k] + " -> Neuron " + j);
        }
      }
    }
  }
}
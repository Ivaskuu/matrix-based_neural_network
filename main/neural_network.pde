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
  
  }
  
  public void printNetworkTopology()
  {
    for(int i = 0; i < layers.length; i++)
    {
      println("Layer");
      
      for(int j = 0; j < layers[i]; j++)
      {
        println("Neuron");
      }
    }
  }
}
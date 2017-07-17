public class Population
{
  private NeuralNetwork[] elements;
  private int popNum;
  private int generationNum;
  
  private double cumulativeFitness;
  private double[] elementsFitness;
  
  public Population(int populationNum, double mutationRate, int[] topology)
  {
    generationNum = 1;
    popNum = populationNum;
    elements = new NeuralNetwork[popNum];
    
    for(int i = 0; i < popNum; i++)
    {
      elements[i] = new NeuralNetwork(topology);
    }
  }
  
  public void calculatePopulationFitness()
  {
    
  }
  
  public void reproduce()
  {
    
  }
  
  // From: https://github.com/Ivaskuu/evolution_of_strings/blob/master/population.pde
  void prepareTheMatingPool()
  {
    elementsFitness = new double[popNum];
    cumulativeFitness = 0;
    
    for(int i = 0; i < popNum; i++)
    {
      cumulativeFitness += Math.pow(elements[i].calculateFitness(), 2); // ^4 gives the best elements even more chance of being selected;
      elementsFitness[i] = cumulativeFitness;
    }
  }
  
  // From: https://github.com/Ivaskuu/evolution_of_strings/blob/master/population.pde
  int binarySearch(double value)
  {
    int lPos = 0;
    int rPos = popNum - 1;
    int middle;
    
    if(value < elementsFitness[0]) return 0;
    else if(value <= elementsFitness[popNum-1] && value > elementsFitness[popNum-2]) return popNum - 1;
    
    while(true)
    {
      middle = (lPos + rPos) / 2;
      
      if(value >= elementsFitness[middle - 1] && value <= elementsFitness[middle])
      {
        return middle;
      }
      else if(value < elementsFitness[middle])
      {
        rPos = middle;
      }
      else if(value > elementsFitness[middle])
      {
        lPos = middle;
      }
      else
      {
        println("wtf");
      }
    }
  }
}
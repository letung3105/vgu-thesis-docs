# Introduction

The Covid-19 disease that emerged in 2019 had evolved at a fast pace and affected millions of lives both medically and economically.

According to WHO, there's has been 230 million infections and 4.7 millions deaths worldwide, and because of these negative health impacts, governments around the world had implemented various policies to restrict human movement.

These restrictions subsequently caused delayed in shipments and increased the cost of essential goods.

In the efforts to learn more about the disease and help to inform governments on policies making process, researchers had proposed various modeling techniques that can help with forecasting the evolution of the disease and estimating the different effects of government interventions in slowing down the spread of the virus.

Nonetheless, not many studies had been conducted with data for Vietnam.
We identified a gap in the knowledge about the dynamics of Covid-19 in Vietnam as well as the lack of study on the effects of government interventions on containing disease outbreaks.

In addition, the recent failure in suppressing an outbreak in Vietnam after a long period of successfully keeping a low number of infections had proven that there was more to learn about Covid-19, and a model that was specifically tailored for the data availability in Vietnam could be an important tool for such task.

1. Informing policies makers about the effects of their decision,
2. informing health care facilities about a possible surge in the number of cases to ensure the supply of personnel and equipment,
3. informing business owners about possible policies to plan their supply and demand needs.

Our first goal is to have a model that works with the low data availability in Vietnam.
Additionally, we want our model to be explainable so that it can be used by experts.
Explainability is one important factor credibility to epidemiologists and instills confidence in the end-users of the model The explainability of the model is one desirable characteristic that ensures the model’s credibility to epidemiologists and instills confidence in the end-users of the model.
Finally, we assessed the model forecast performance after incorporating mobility data and social network connections data as covariates in the model since the method has been proven to be effective by state-of-the-art model for Covid-19.

# Literature review

## Mathematical models

### Compartmental models

A compartmental model divides the population that is being modeled into compartments,
i.e., a subpopulation.
Individuals can be moved from one compartment to another under certain assumptions about the nature and time rate of transfer.
As its name, the SEIR model partitions the population into three subpopulations: susceptible, exposed, infective, and removed.

The movement between one compartment to another is captured by a system of ODEs,
having time t and the transfer rates between the compartments are independent variables.

### Agent-based models

Instead of assuming the number of individuals in each compartment to be differentiable, agent-based model simulates individualistic behaviors with multiple "agents", each represents a person in the population, and used different networks to represent how the virus might spread in different environments.

## Data-driven models

The ARIMA model is one of the most used time series models because the model takes changing trends, periodic changes, and random noises in the time series into account. Moreover, the model is suitable for many types of data and can capture the temporal dependency structure of a time series.
With an abundance of data, it has been shown that data-driven time series forecasting
techniques using deep learning can have high predictive performance.

The model can utilize a wide range of heterogeneous features and learn complex interactions between those features, and it demonstrated that an ANN could be used to encode the wide variety of external factors and improve the forecasting ability of ANN.

Commonly used RN architectures had also been used for predicting Covid-19 cases, these include:
+ Long Short Term Memory (LSTM)
+ Bidirectional Long Short Term Memory (Bi-LSTM)
+ Gated Recurrent Unit (GRU)

## Novel compartmental models

Used complex networks of Point-to-Point visits/hour data as weighting factors for the underlying stochastic SEIR model

Utilizing advanced methods for approximating gradients and techniques for integrating ANNs with mechanistic models, we can create models that can utilize existing knowledge captured by the system of ODEs and have the flexibility of data-driven models.

# Limitations

**Issues with ground truth data**
Like all data-driven methods, the quality of our model depended on the quality of the collected data. It had been noted that the method for collecting Covid-19 data varied across different locations, and the collected data might suffer detection and measurement biases. Thus the performance of the model could change drastically based on the location.

**Inability to capture rapid trend changes**
As shown in the result, our model failed to capture the disease dynamics when the number of cases became very flat or very sharp. In some cases, such trends occurred due to modifications to the number of cases in the report, in other cases, they might be caused by other covariates that we did not consider.  Bad local minima While we implemented different techniques for lowering the chance of getting into bad local minima, the problem still existed. One method that we tried that was not mentioned in previous sections was to use a different loss function, but the obtained results were unsatisfactory.

**Compartmental model bias**
Like all compartmental models, our model made many assumptions such that real-world scenarios can be approximated with feasible computational power. Hence, many aspects of the disease were simplified, one of which was the disease transmission process. Moreover, because we wanted to limit the complexity in the model training process, we did not consider additional compartments that better reflected our current knowledge about Covid-19 such as asymptomatic infections, reinfections, vaccinations, and quarantine control measures.

**Covariates bias**
Our two versions of the model were informed using the datasets from Facebook which may introduce biases. We chose these datasets because of the large number of Facebook users in Vietnam, however, these datasets might not be representative of the whole population and introduced certain biases into the model predictions.

**The changing dynamics of Covid-19**
The dynamics of the disease constantly changes due to a multitude of factors, and our knowledge of these dynamics will improve over time.  Thus the results produced by our model are not final, and changes to the model that incorporate new findings are needed to improve its robustness.

**Neural network interpretability**
Even though the model produced domain-specific encoding that can be understood by experts, the ANN was still a black-box algorithm that was not interpretable. This property may be undesirable if we want to apply the model in situations where full transparency is required.

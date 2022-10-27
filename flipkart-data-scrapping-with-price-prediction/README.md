#### Business Understanding

- What is the problem that we are trying to solve?

    We are trying to solve a Classification Problem. Based on the Data Scrapped from a popular e-Commerce Site, we are trying to create a model to ascertain a price category of a newly introduced TV based on the features it provides.

- What data do we need to answer the above problem?

    The data required is the present listed TVs with their features/specification and pricing. We have Categorized TV based on the pricing say • <20,000; • 20,000 to 40,000; • 40,000 to 60,000; >60,0000.

- What are the different sources of data?

    There are may source available for this as most of eCommerce site will contain these info. for time being data has been scrapped from an eCommerce site "flipkart.com".

- What kind of analytics task are we performing?

    We are doing a Predictive Analytics (Multi label classification) to predict the price band of TV given its features/specification.
    
#### Data Acquisition

- Code for scraping data from website
    For data scrapping, we are using flipkart & collecting all the information related to specification of Television search.

    As flipkart provide the search result page wise we are iterating through different pages from 1 to 45 & collecting all the info in appropriate format.

    We have also inserted the random sleep time in the code so that flipkart don't get suspicious about data scrapping & block out IP address.

    While scrapping, we noticed that some the data is not related to television at all like dish tv, tv cable wire etc. so we put a filter in price so that only right data is inserted.

    As flipkart provides search result along with some discription in the seach page itself (see below Image), we can scrap those data & store it.
    
- Display the column headings, statistical information, description and statistical summary of the data.

- Write observations from the above.

#### Data Preparation

- Display how many unique values are present in each attribute

- Check for the presence of duplicate data, identify the attributes with duplicate data, report the attributes. Mention the method adopted to remove duplicate data if present. Report the results again.

- Show whether there are any missing values in each attribute. Clean the missing data using any imputation technique

- Check if all the attributes are following the same format and are consistent. Correct the data if there are inconsistencies

- Identify the target variables.
    As mentioned earlier, we will only classify the product in various segment of price ('low', 'medium', 'high', 'premium') so we have to transform the price column in appropriate classes & create the target column.
    
- Separate the data front the target such that the dataset is in the form of (X,y) or (Features, Label).
    
- Discretize the target variable or perform one-hot encoding on the target.

####  Data Exploration using various plots

- Scatter plot of each attribute with the target.
- Pair plot of each attribute to identify the linear relationships among the attributes
- Regression plots to identify the linear relationship between each attribute with the target variable

#### Data Wrangling

- Display correlation heatmap of each attribute against the target and report which features are significant.

- Univariate Filters to Identify top 5 significant features by evaluating each feature independently with respect to the target variable by exploring
    Mutual Information (Information Gain)
    Gini index
    Gain Ratio
    Chi-Squared test
    Fisher Score (From the above 5 you are required to use only any three)
    
- Train a DecisionTreeClassifier on the entire data and use the classifier to extract the top 5 significant features. Plot graph of significant features for better visualization

- Using "mlxtend" library perform SequentialFeatureSelector to identify top 5 features.

- Conclude the top 3 significant features with necessary justifications
    
    
    

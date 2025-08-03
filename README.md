# Wine Quality Classification

This R project uses the Random Forest algorithm to classify red wine samples into "bad", "normal", and "good" taste categories based on physicochemical properties.

## Dataset
Source: Kaggle

## Steps
- Data preprocessing
- Feature engineering (taste labels)
- Train/test split (80% training and 20% test)
- Random Forest modeling
- Evaluation with confusion matrix

## Libraries
- `randomForest`
- `caret`
  
## Conclusion from the Evaluation
-Although the model shows high overall accuracy, it's clearly biased toward the "normal" class because of class imbalance in the dataset.
-It doesn't detect any "bad" wines and only performs moderately on "good" ones. 
-To improve the model's reliability across all classes, applying class balancing techniques is definitely needed.

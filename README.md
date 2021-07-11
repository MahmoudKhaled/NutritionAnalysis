## Building and running the project (requirements)
* Swift 5.0
* Xcode 12.4+
* iOS 13.0+

## Setup Configs
- There are two case -> First one:- checkout  "master" branch to run last version, this bracnh will run scenario about (anaylize line to get nutrition then display screen of summary which contain two buttons (total nutrition and dialy nutrition) when TotalButton tapped will show screen contains total nutrition which returned from "totalNutrients" of  service API as FF2 requird.
        Anothher button is DailyNutrition tapped will show Calories,Fat,Cholesterol,Sodium,Carbohydrate (Fiber, Sugar),Protein,Vitamin,Calcium,Iron and Potassium tags which contained from "totalDaily" key from service API as FF3 required).
        I tried to achieve all user story, if it's wrong scenario so i missunder stand API Service so please run second case. (FF1, FF2, FF3, FF4)
    
    Seconde one:- checkout "Feature/Ingredient_main" branch to run version this branch wil run about (anaylize line to get nutrition then navigate to DailyNutrition screen which show Calories,Fat,Cholesterol,Sodium,Carbohydrate (Fiber, Sugar),Protein,Vitamin,Calcium,Iron and Potassium tags which contained from "totalDaily" key from service API as FF3 required). FF1,FF3 and FF4
    
- Open the terminal.
- Navigate to the project root directory.
- run this commend to install all pods "pod install".
- Open the project by double clicking the `NutritionAnalysis.xcworkspace` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app


## Architecture
- This application uses the Model-View-ViewModel (refered to as MVVM) architecture with RXSwift
    the main purpose of the MVVM is to move the data state from the View to the ViewModel.
 
 - This application use network layer whic build on 'Alamofire' which call service APIs so you can call APIs  and parse response in an easy way .

## Scenes:
* Group of app scenes: 
- 1 - Ingredient ->  to input The text to be analyzed
- 2- SummaryNutrients -> to display summary of all total energy, calories, and Total weight
- 3 - Nutrients  -> to show (total or daily) nutrition, this view will display as tableView of IngredientsTableViewCell whic contain name, quantity and unit of Nutrition from TotalNutritionModel 



## About:
-  Enter all ingredient I want to analyze in a free text.
- See summary breakdown for entered ingredient in a list.
- Total button at the bottom of summary the screen to show total nutrition.
-  Able to see total nutrition facts in daily basis for entered ingredients
    (Calories,Fat,Cholesterol,Sodium,Carbohydrate (Fiber, Sugar),Protein,Vitamin,Calcium,Iron and Potassium tags).
- Application in portrait and landscape to rotate application screen between portrait and landscape normally and without any issues.


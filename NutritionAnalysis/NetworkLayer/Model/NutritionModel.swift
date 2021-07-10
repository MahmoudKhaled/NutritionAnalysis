//  FoodData.swift
import Foundation


// MARK: - NutritionResponse
struct NutritionResponse: Codable {
    let uri: String?
    let yield, calories, totalWeight: Double?
    let dietLabels, healthLabels, cautions: [String]?
    let totalNutrients, totalDaily: [String: TotalNutritionDataResponse]?
    let totalNutrientsKCal: TotalNutrientsKCal?
}

// MARK: - TotalNutrientsKCal
struct TotalNutrientsKCal: Codable {
    let enercKcal, procntKcal, fatKcal, chocdfKcal: TotalNutritionDataResponse?
    enum CodingKeys: String, CodingKey {
        case enercKcal = "ENERC_KCAL"
        case procntKcal = "PROCNT_KCAL"
        case fatKcal = "FAT_KCAL"
        case chocdfKcal = "CHOCDF_KCAL"
    }
}


struct NutritionModel {
    
    let calories: String
    let totalWeight: String
    var totalNutrientsKCal: [TotalNutritionModel] = []
    var totalNutrientsDaily: [TotalNutritionModel] = []
    var totalNutrients: [TotalNutritionModel] = []
    var summaryOFtotalNutrientsDaily: [TotalNutritionModel] = []
    
    init(_ response: NutritionResponse) {
        
        calories = "\(response.calories ?? 0)"
        totalWeight = "\(response.totalWeight ?? 0)"
        
        totalNutrients = response.totalNutrients?.map({TotalNutritionModel($0.value)}) ?? []
        
        totalNutrientsDaily = response.totalDaily?.map({TotalNutritionModel($0.value)}) ?? []
        
        if let totalKCal = response.totalNutrientsKCal {
            totalNutrientsKCal.append(TotalNutritionModel(totalKCal.enercKcal))
            totalNutrientsKCal.append(TotalNutritionModel(totalKCal.fatKcal))
            totalNutrientsKCal.append(TotalNutritionModel(totalKCal.procntKcal))
            totalNutrientsKCal.append(TotalNutritionModel(totalKCal.fatKcal))
        }
        
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(TotalNutritionDataResponse(label: Messages.calories.message, quantity: response.calories, unit: Unit.kcal.rawValue)))
        
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["FAT"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["CHOLE"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["NA"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["CA"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["FIBTG"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["CHOCDF"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["PROCNT"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["K"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["FE"]))
        summaryOFtotalNutrientsDaily.append(TotalNutritionModel(response.totalDaily?["VITD"]))
    }
}

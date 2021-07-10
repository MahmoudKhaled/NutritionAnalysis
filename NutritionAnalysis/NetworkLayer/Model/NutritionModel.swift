//  FoodData.swift
import Foundation


// MARK: - NutritionResponse
struct NutritionResponse: Codable {
    let uri: String?
    let yield, calories, totalWeight: Double?
    let dietLabels, healthLabels, cautions: [String]?
    let totalNutrients, totalDaily: [String: TotalData]?
    let totalNutrientsKCal: TotalNutrientsKCal?
}

// MARK: - TotalData
struct TotalData: Codable {
    let label: String?
    let quantity: Double?
    let unit: String?
}

enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

// MARK: - TotalNutrientsKCal
struct TotalNutrientsKCal: Codable {
    let enercKcal, procntKcal, fatKcal, chocdfKcal: TotalData?
    enum CodingKeys: String, CodingKey {
        case enercKcal = "ENERC_KCAL"
        case procntKcal = "PROCNT_KCAL"
        case fatKcal = "FAT_KCAL"
        case chocdfKcal = "CHOCDF_KCAL"
    }
}

//  TotalNutritionData.swift

import Foundation

// MARK: - TotalData
struct TotalNutritionDataResponse: Codable {
    let label: String?
    let quantity: Double?
    let unit: String?
}

// MARK: - TotalData
struct TotalNutritionModel: Codable {
    let label: String
    let quantity: Double
    let unit: String
    
    init(_ response: TotalNutritionDataResponse?) {
        label = response?.label ?? ""
        quantity = response?.quantity ?? 0
        unit = response?.unit ?? ""
    }
}

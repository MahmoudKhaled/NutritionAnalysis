//  IngredientRepo.swift

import Foundation

protocol IngredientRepoProtocol {
    var delegate: IngredientRepoDelegate? { get set }
    func getAnalysisData(parameter: BodyParameters)
}

protocol IngredientRepoDelegate: ErrorRepoProtocol {
    func didGetData(response: NutritionModel)
}

final class IngredientRepo: BaseRepo, IngredientRepoProtocol {
    
    weak var delegate: IngredientRepoDelegate?
    
    // perform api to get details of data
    func getAnalysisData(parameter: BodyParameters) {
        let request = NutritionAnalysisAPI.nutritionData(parameter)
        do {
            try networkHandeler.request(request, debug: true).decoded(toType: NutritionResponse.self).observe { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let nutrition = NutritionModel(response)
                    self.delegate?.didGetData(response: nutrition)
                case .failure(let error):
                    self.delegate?.didFetchError(error)
                }
            }
        } catch {
            delegate?.didFetchError(error)
        }
    }
    
}

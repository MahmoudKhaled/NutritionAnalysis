//  AppCasesApi.swift

import Foundation
import Alamofire

enum NutritionAnalysisAPI: URLRequestConvertible {
    
    case nutritionData(BodyParameters)

    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .nutritionData(let parameter): return parameter.body
        }
    }
    
    var urlPath: String {
        switch self {
        case .nutritionData: return "nutrition-data"
        }
    }
    

    var encoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.queryString
        }
    }
}

//  Constants.swift

import Foundation

enum URLPath: String {
    case develop = ""
    case statge = "https://api.edamam.com"
}

struct Constants {

    //MARK:- Base URL
    static let url = URLPath.statge.rawValue
    static let baseUrl = "\(url)/api/"
    
    //MARK:- static App keys
    static let appId = "c0e08ebc"
    static let appKey = "39b3df1ddf8a477b9909c2b3beed2677"
    static let nutritionType = "cooking"
 
}

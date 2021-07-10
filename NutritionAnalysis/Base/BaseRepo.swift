//BaseRepo.swift

import UIKit

//MARK:- ErrorProtocol
/**
 implented by BaseViewModel
 to show  catching error data from server
 */
public protocol ErrorRepoProtocol : class {
    func didFetchError(_ error : Error?)
}

public class BaseRepo {
    let networkHandeler = NetworkHandler()
}

// BaseViewModel.swift

import RxSwift
import RxRelay

//MARK:- BaseViewModelProcotol
public protocol BaseViewModelProtocol {
    var showAlertMessage: PublishSubject<String> { get set }
    var indicatorState: PublishSubject<IndicatorState> { get set }
}

public class BaseViewModel: BaseViewModelProtocol {
    public var  showAlertMessage: PublishSubject<String> = PublishSubject()
    public var indicatorState: PublishSubject<IndicatorState> = PublishSubject()
}

//MARK:- implement ErrorRepoProtocol
extension BaseViewModel: ErrorRepoProtocol {
    public func didFetchError(_ error: Error?) {
        indicatorState.onNext(.loaded)
        if let error = error {
            showAlertMessage.onNext(error.localizedDescription)
        }
    }
}

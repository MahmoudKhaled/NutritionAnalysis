// BaseViewModel.swift

import RxSwift
import RxRelay

protocol ErrorRepoProtocol : class {
    func didFetchError(_ error : Error?)
}

protocol BaseViewModelProtocol {
    var showAlertMessage: PublishSubject<String> { get set }
    var indicatorState: PublishSubject<IndicatorState> { get set }
}

public class BaseViewModel: BaseViewModelProtocol {
    var  showAlertMessage: PublishSubject<String> = PublishSubject()
    var indicatorState: PublishSubject<IndicatorState> = PublishSubject()
}

extension BaseViewModel: ErrorRepoProtocol {
    func didFetchError(_ error: Error?) {
        indicatorState.onNext(.loaded)
        if let error = error {
            showAlertMessage.onNext(error.localizedDescription)
        }
    }
}

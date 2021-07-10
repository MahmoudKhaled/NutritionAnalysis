//BaseViewController.swift

import UIKit
import RxSwift

public class BaseViewController: UIViewController {
        
    //MARK:- variables
    var baseViewModel: BaseViewModelProtocol!
    let disposeBage = DisposeBag()
    
    //MARK:- Functionality
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButtonTitle()
        seuptBaseViewModelSubscribe()
    }
    

    // Remove back button title
    private func setupBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}


//MARK:- Extension for setup viewModelSubscriber
extension BaseViewController {
    
    private func seuptBaseViewModelSubscribe() {
        baseViewModel.indicatorState.withUnretained(self).subscribe { owner, state in
            owner.setupIndicator(state: state)
        }.disposed(by: disposeBage)

        baseViewModel.showAlertMessage.withUnretained(self).subscribe { owner, message in
            owner.showAlert(with: message)
        }.disposed(by: disposeBage)
    }
    
    //show and hide HUDProgress
    private func setupIndicator(state: IndicatorState) {
        switch state {
            
        case .loading(let userInterAction, let hideView ):
            
            if hideView {
                let _ = view.subviews.map({$0.isHidden = true})
            }
            view.showActivityIndicator(isUserInteractionEnabled: userInterAction)
            
        case .loaded:
            let _ = view.subviews.map({$0.isHidden = false})
            view.hideActivityIndicator()
        case .none:
            break
        }
    }
}

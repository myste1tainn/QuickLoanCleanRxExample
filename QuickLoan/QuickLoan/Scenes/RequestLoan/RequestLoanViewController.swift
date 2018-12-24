//
//  ViewController.swift
//  QuickLoan
//
//  Created by Arnon Keereena on 23/12/2561 BE.
//  Copyright © 2561 myste1tainn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RequestLoanNetworkPlatform

class RequestLoanViewController: UIViewController {
  
  // MARK: - Rx
  
  let disposeBag = DisposeBag()
  var viewModel: ViewModel!
  
  // MARK: - Outlets
  
  @IBOutlet weak var submitButton: UIButton?
  
  // MARK: - Life
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    rxBinding()
  }
  
  private func ensureViewModel() {
    assert(viewModel != nil, "Should be instantiated")
  }
  
  private func rxBinding() {
    ensureViewModel()
    guard let trigger = submitButton?.rx.tap else { return }
    let output = viewModel.transform(input: .init(submitTrigger: trigger.asDriver()))
    output.success.debug().drive().disposed(by: disposeBag)
  }
  
}


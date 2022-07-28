//
//  ViewController.swift
//  MiniApp63-RxSwift05
//
//  Created by 前田航汰 on 2022/07/28.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var inputTextField1: UITextField!
    @IBOutlet private weak var inputTextField2: UITextField!
    @IBOutlet private weak var inputTextField3: UITextField!
    @IBOutlet private weak var outputLabel1: UILabel!
    @IBOutlet private weak var outputLabel2: UILabel!
    @IBOutlet private weak var outputLabel3: UILabel!
    @IBOutlet private weak var outputLabel4: UILabel!
    @IBOutlet private weak var outputLabel5: UILabel!

    @IBOutlet private weak var outputLabel6: UILabel!
    @IBOutlet private weak var outputLabel7: UILabel!
    @IBOutlet private weak var outputLabel8: UILabel!
    @IBOutlet private weak var outputLabel9: UILabel!
    @IBOutlet private weak var outputLabel10: UILabel!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding1to5()
        setupBinding6to10()
    }

    // ①〜⑤のセットアップ
    private func setupBinding1to5() {
        let ViewModel = ViewModel(textField1: inputTextField1.rx.text.orEmpty.asDriver(),
                                  textField2: inputTextField2.rx.text.orEmpty.asDriver(),
                                  textField3: inputTextField3.rx.text.orEmpty.asDriver())

        ViewModel.result1
            .drive { result in
                self.outputLabel1.text = result
            }
            .disposed(by: disposeBag)

        ViewModel.result2
            .drive { result in
                self.outputLabel2.text = result
            }
            .disposed(by: disposeBag)

        ViewModel.result3
            .drive { result in
                self.outputLabel3.text = result
            }
            .disposed(by: disposeBag)

        ViewModel.result4
            .drive { result in
                self.outputLabel4.text = result
            }
            .disposed(by: disposeBag)

        ViewModel.result5
            .drive { result in
                self.outputLabel5.text = result
            }
            .disposed(by: disposeBag)
    }

    // ⑥〜⑩のセットアップ
    private func setupBinding6to10() {
        let ViewModel = ViewModel(textField1: inputTextField1.rx.text.orEmpty.asDriver(),
                                  textField2: inputTextField2.rx.text.orEmpty.asDriver(),
                                  textField3: inputTextField3.rx.text.orEmpty.asDriver())
        ViewModel.result6
            .drive { result in
                self.outputLabel6.text = result
            }
            .disposed(by: disposeBag)

        ViewModel.result7
            .drive { result in
                self.outputLabel7.text = result
            }
            .disposed(by: disposeBag)

        ViewModel.result8
            .drive { result in
                self.outputLabel8.text = result
            }
            .disposed(by: disposeBag)

        ViewModel.result9
            .drive { result in
                self.outputLabel9.text = result
            }
            .disposed(by: disposeBag)
    }


}


//
//  ViewModel.swift
//  MiniApp63-RxSwift05
//
//  Created by 前田航汰 on 2022/07/28.
//

import UIKit
import RxSwift
import RxCocoa

class ViewModel {
    var result1: Driver<String>  // Driveはイベントを発生させるやつ
    var result2: Driver<String>  // Driveはイベントを発生させるやつ
    var result3: Driver<String>  // Driveはイベントを発生させるやつ
    var result4: Driver<String>  // Driveはイベントを発生させるやつ
    var result5: Driver<String>  // Driveはイベントを発生させるやつ

    var result6: Driver<String>  // Driveはイベントを発生させるやつ
    var result7: Driver<String>  // Driveはイベントを発生させるやつ
    var result8: Driver<String>  // Driveはイベントを発生させるやつ
    var result9: Driver<String>  // Driveはイベントを発生させるやつ
    //var result10: Driver<String>  // Driveはイベントを発生させるやつ

    init(textField1: Driver<String>,
         textField2: Driver<String>,
         textField3: Driver<String>) {

        let addQuestion = AddQuestion()

        // MARK: ①〜⑤はココから
        result1 = textField1
            .filter { $0.count >= 2 }
            .asDriver(onErrorJustReturn: "")

        result2 = textField1
            .filter { $0.count >= 1 }
            .map { text in
                addQuestion.addQuestion(text: text)
            }
            .asDriver(onErrorJustReturn: "")

        result3 = textField1
            .debounce(.seconds(2))
            .asDriver(onErrorJustReturn: "")

        result4 = textField1
            .map{ text in
                text.lowercased()
            }
            .asDriver(onErrorJustReturn: "")

        result5 = textField1
            .skip(10)
            .asDriver(onErrorJustReturn: "")


        // MARK: ⑥〜⑩はココから
        result6 = Driver.combineLatest(textField2, textField3){ return $0 + $1 }
            .asDriver(onErrorJustReturn: "")
        //クロージャー的に下も同様の意味
//        result6 = Driver.combineLatest(textField2, textField3){ text1, text2 in
//            return text1 + text2
//        }


        result7 = Driver.combineLatest(textField2, textField3){ text1, text2 in
            if 5 <= text1.count && 5 <= text2.count {
                return text1 + text1
            } else if 0 < text1.count && 0 < text2.count {
                return "文字数足らない"
            } else {
                return ""
            }
        }
        .asDriver(onErrorJustReturn: "")

        result8 = Driver.combineLatest(textField2, textField3){ text1, text2 in
            if text1.count == text2.count {
                return text1 + text1
            } else if 0 < text1.count && 0 < text2.count {
                return "一致してません"
            } else {
                return ""
            }
        }
        .asDriver(onErrorJustReturn: "")

        // zipの解説これわかりやすい→https://reactivex.io/documentation/operators/zip.html
        result9 = Driver.zip(textField2, textField3){ text1, text2 in
            return text1 + text2
        }
        .asDriver(onErrorJustReturn: "")

    }
}

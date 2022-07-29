//
//  MixText.swift
//  MiniApp63-RxSwift05
//
//  Created by 前田航汰 on 2022/07/29.
//

import Foundation

class MixText {

    func mixText(text1: String, text2: String) -> String {
        if 5 <= text1.count && 5 <= text2.count {
            return text1 + text1
        } else if 0 < text1.count && 0 < text2.count {
            return "文字数足らない"
        } else {
            return ""
        }
    }

}

//
//  machText.swift
//  MiniApp63-RxSwift05
//
//  Created by 前田航汰 on 2022/07/29.
//

import Foundation

class MatchText {

    func matchText(text1: String, text2: String) -> String {
        if text1.count == text2.count {
            return text1 + text1
        } else if 0 < text1.count && 0 < text2.count {
            return "一致してません"
        } else {
            return ""
        }
    }

}

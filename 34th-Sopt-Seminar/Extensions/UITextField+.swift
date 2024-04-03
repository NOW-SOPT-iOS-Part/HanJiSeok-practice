//
//  UITextField+.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/3/24.
//

import Foundation
import UIKit

extension UITextField {
    func leftPadding() {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: self.frame.height))
        self.leftView = leftPaddingView
        self.leftViewMode = ViewMode.always
    }
}

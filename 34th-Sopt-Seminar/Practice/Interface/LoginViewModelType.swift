//
//  ViewModelType.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 5/25/24.
//

import Foundation

protocol LoginViewModelType {
    var isValid: ObservablePattern<Bool> { get }
    var errMessage: ObservablePattern<String> { get }

    func checkValid(id: String?, password: String?)
}

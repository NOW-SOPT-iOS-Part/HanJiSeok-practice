//
//  ViewModelType.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 5/25/24.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

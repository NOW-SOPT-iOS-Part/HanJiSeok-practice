//
//  LoginViewModelRx.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 5/25/24.
//

import Foundation

import RxSwift
import RxRelay

final class LoginViewModelRx: ViewModelType {

    private var id: String?
    private var password: String?
    private let disposeBag = DisposeBag()

    struct Input {
        let idTextFieldChangeEvent: Observable<String?>
        let passwordTextFieldChangeEvent: Observable<String?>
        let loginButtonDidTapEvent: Observable<Void>
    }

    struct Output {
        var isValid = PublishRelay<Void>()
        var errMessage = PublishRelay<String>()
    }

    func transform(input: Input) -> Output {
        let output = Output()

        input.idTextFieldChangeEvent.subscribe { [weak self] id in
            self?.id = id
        }.disposed(by: disposeBag)

        input.passwordTextFieldChangeEvent.subscribe { [weak self] password in
            self?.password = password
        }.disposed(by: disposeBag)

        input.loginButtonDidTapEvent.subscribe { [weak self] _ in
            guard let self = self else { return }
            guard let id = self.id else {
                output.errMessage.accept("아이디 비어있음")
                return
            }
            guard let password = self.password else {
                output.errMessage.accept("비밀번호 비어있음")
                return
            }

            let idIsValid = id.range(
                of: "[A-Za-z0-9]{5,13}",
                options: .regularExpression
            )
            let passwordIsValid = password.range(
                of: "[A-Za-z0-9!_@$%^&+=]{8,20}",
                options: .regularExpression
            )

            (idIsValid != nil) && (passwordIsValid != nil) ?
            output.isValid.accept(Void()) :
            output.errMessage.accept("계정이 유효하지 않아요.")
        }.disposed(by: disposeBag)

        return output
    }
}

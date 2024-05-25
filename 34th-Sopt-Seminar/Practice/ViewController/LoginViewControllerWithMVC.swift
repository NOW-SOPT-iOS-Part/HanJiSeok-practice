//
//  LoginViewControllerWithMVC.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/20/24.
//

import UIKit

class LoginViewControllerWithMVC: UIViewController {

    let rootView = LoginView()

    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setTarget()
    }

    private func setTarget() {
        rootView.loginButton.addTarget(self,
                                       action: #selector(loginButtonTapped),
                                       for: .touchUpInside)
    }

    @objc private func loginButtonTapped() {
        dump(#function)
        guard let id = rootView.idTextField.text,
              let password = rootView.passwordTextField.text
        else { return }

        let loginRequestModel = LoginRequestModel(authenticationId: id, password: password)

        UserService.shared.login(request: loginRequestModel) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.pushToWelcomeVC()
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }

}

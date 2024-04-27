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
    }

    private func setTarget() {
        rootView.loginButton.addTarget(self,
                                       action: #selector(loginButtonTapped),
                                       for: .touchUpInside)
    }

    @objc private func loginButtonTapped() {
        pushToWelcomeVC()
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }

}

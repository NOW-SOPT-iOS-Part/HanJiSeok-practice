//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 3/30/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor(red: 221 / 255,
                                            green: 222 / 255,
                                            blue: 227 / 255,
                                            alpha: 1)
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(red: 221 / 255,
                                            green: 222 / 255,
                                            blue: 227 / 255,
                                            alpha: 1)
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255 / 255,
                                         green: 111 / 255,
                                         blue: 15 / 255,
                                         alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addAction(UIAction { _ in
            self.loginButtonTapped()
        }, for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        super.viewDidLoad()
        setLayout()
        setAutoLayout()
    }

    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach { item in
            self.view.addSubview(item)
        }
    }

    private func setAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 114).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 236).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

        idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 71).isActive = true
        idTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        idTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        idTextField.heightAnchor.constraint(equalToConstant: 52).isActive = true

        passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 52).isActive = true

        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 71).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
}

extension LoginViewController {
    private func loginButtonTapped() {
        presentToWelcomeVC()
        pushToWelcomeVC()
    }

    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.setLabelText(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 3/30/24.
//

import UIKit

import SnapKit

class LoginViewController: UIViewController {

    var isSwitchClicked: Bool = false

    private let titleLabel: UILabel = {
<<<<<<< Updated upstream
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
<<<<<<< HEAD
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요"
=======
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
>>>>>>> Stashed changes
=======
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
>>>>>>> 191bdfc28f3a9e02bb485c55d97277ae20998caf
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.leftPadding()
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221 / 255,
                                            green: 222 / 255,
                                            blue: 227 / 255,
                                            alpha: 1)
        textField.layer.cornerRadius = 3
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.leftPadding()
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221 / 255,
                                            green: 222 / 255,
                                            blue: 227 / 255,
                                            alpha: 1)
        textField.layer.cornerRadius = 3
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255 / 255,
                                         green: 111 / 255,
                                         blue: 15 / 255,
                                         alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
<<<<<<< HEAD
<<<<<<< Updated upstream
        button.addAction(UIAction { _ in
            self.loginButtonTapped()
        }, for: .touchUpInside)
=======
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addAction(
            UIAction {  _ in
                self.loginButtonTapped()
            }, for: .touchUpInside)
        button.layer.cornerRadius = 6
>>>>>>> Stashed changes
=======
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addAction(UIAction { _ in
            self.loginButtonTapped()
        }, for: .touchUpInside)
        button.layer.cornerRadius = 6
>>>>>>> 191bdfc28f3a9e02bb485c55d97277ae20998caf
        return button
    }()

    private lazy var modalSwitch: UISwitch = {
        let modalSwitch = UISwitch()
        modalSwitch.isOn = isSwitchClicked
        modalSwitch.addAction(UIAction { _ in
            self.switchTapped()
        }, for: .touchUpInside)
        return modalSwitch
    }()

    private let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "모달로 화면 보여주기"
        label.font = UIFont(name: "Pretendard-Regular", size: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        setAutoLayout()
    }

    private func setLayout() {
<<<<<<< HEAD
<<<<<<< Updated upstream
        [titleLabel, idTextField, passwordTextField, loginButton].forEach { item in
=======
        [titleLabel, idTextField, passwordTextField, loginButton, modalSwitch, switchLabel].forEach { [weak self] item in
            guard let self else { return }
            item.translatesAutoresizingMaskIntoConstraints = false
>>>>>>> Stashed changes
=======
        [titleLabel, idTextField, passwordTextField, loginButton, modalSwitch, switchLabel].forEach { item in
>>>>>>> 191bdfc28f3a9e02bb485c55d97277ae20998caf
            self.view.addSubview(item)
        }
    }

    private func setAutoLayout() {
<<<<<<< Updated upstream
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
<<<<<<< HEAD
=======
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(114)
            $0.width.equalTo(236)
            $0.height.equalTo(44)
        }
=======
        modalSwitch.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
>>>>>>> 191bdfc28f3a9e02bb485c55d97277ae20998caf

        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
>>>>>>> Stashed changes

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(71)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(58)
        }

        modalSwitch.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }

        switchLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(32)
            $0.leading.equalTo(modalSwitch.snp.trailing).offset(12)
        }
    }

    func setAutoLayoutWithStandard() {
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
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
=======
>>>>>>> 191bdfc28f3a9e02bb485c55d97277ae20998caf

        modalSwitch.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 28).isActive = true
        modalSwitch.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        modalSwitch.heightAnchor.constraint(equalToConstant: 20).isActive = true
<<<<<<< HEAD
        
        switchLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 32).isActive = true
        switchLabel.leadingAnchor.constraint(equalTo: modalSwitch.trailingAnchor, constant: 12).isActive = true
>>>>>>> Stashed changes
=======

        switchLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 32).isActive = true
        switchLabel.leadingAnchor.constraint(equalTo: modalSwitch.trailingAnchor, constant: 12).isActive = true
        modalSwitch.heightAnchor.constraint(equalToConstant: 20).isActive = true
>>>>>>> 191bdfc28f3a9e02bb485c55d97277ae20998caf
    }
}

extension LoginViewController {

    func switchTapped() {
        isSwitchClicked.toggle()
    }

    private func loginButtonTapped() {
        if isSwitchClicked {
            presentToWelcomeVC()
        } else {
            pushToWelcomeVC()
        }
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

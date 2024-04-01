//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 3/30/24.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let welcomeImage: UIImageView = {
        let image = UIImage(named: "51")
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = image
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()

    private lazy var backToLoginButton: UIButton = {
        let button =  UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 255 / 255, 
                                         green: 111 / 255,
                                         blue: 15 / 255,
                                         alpha: 1)
        button.addAction(UIAction { _ in
            self.backToLoginButtonTapped()
        }, for: .touchUpInside)
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button =  UIButton(frame: CGRect(x: 20, y: 495, width: 335, height: 58))
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172 / 255,
                                     green: 176 / 255,
                                     blue: 185 / 255,
                                     alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 221 / 255,
                                         green: 222 / 255,
                                         blue: 227 / 255,
                                         alpha: 1)
        button.addAction(UIAction { _ in
            print("LoginButtonTapped")
        }, for: .touchUpInside)
        return button
    }()

    private var id: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setLayout()
        setAutoLayout()
        bindID()
    }

    private func setLayout() {
        [welcomeImage, titleLabel, backToLoginButton, loginButton].forEach {
            self.view.addSubview($0)
        }
    }

    private func setAutoLayout() {
        welcomeImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        backToLoginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        welcomeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        welcomeImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        welcomeImage.heightAnchor.constraint(equalToConstant: 150).isActive = true

        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: welcomeImage.bottomAnchor, constant: 58).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 95).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true

        backToLoginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 71).isActive = true
        backToLoginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        backToLoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        backToLoginButton.heightAnchor.constraint(equalToConstant: 58).isActive = true

        loginButton.topAnchor.constraint(equalTo: backToLoginButton.bottomAnchor, constant: 14).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
}

extension WelcomeViewController {
    private func backToLoginButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

    private func bindID() {
        if let id = id {
            self.titleLabel.text = "\(id)님 \n반가워요!"
        } else {
            self.titleLabel.text = "Guest님 \n반가워요!"
        }
    }

    func setLabelText(id: String?) {
        self.id = id
    }
}

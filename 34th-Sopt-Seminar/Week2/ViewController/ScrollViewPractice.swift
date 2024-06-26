//
//  ScrollViewPractice.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/16/24.
//

import UIKit

class ScrollViewPractice: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }

    func setLayout() {
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }

        redView.snp.makeConstraints {
            $0.top.leading.equalTo(contentView)
            $0.width.equalTo(self.view.frame.width / 2)
            $0.height.equalTo(337)
        }

        orangeView.snp.makeConstraints {
            $0.top.trailing.equalTo(contentView)
            $0.width.equalTo(self.view.frame.width / 2)
            $0.height.equalTo(337)
        }

        yellowView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.width.equalTo(self.view.frame.width / 2)
            $0.leading.equalTo(contentView)
            $0.height.equalTo(337)
        }

        greenView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.trailing.equalTo(contentView)
            $0.width.equalTo(self.view.frame.width / 2)
            $0.height.equalTo(337)
        }

        blueView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalTo(contentView)
            $0.width.equalTo(self.view.frame.width / 2)
            $0.height.equalTo(337)
            $0.bottom.equalTo(contentView)
        }

        purpleView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.trailing.equalTo(contentView)
            $0.width.equalTo(self.view.frame.width / 2)
            $0.height.equalTo(337)
            $0.bottom.equalTo(contentView)
        }
    }

}

#Preview {
    ScrollViewPractice()
}

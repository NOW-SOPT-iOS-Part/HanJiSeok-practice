//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/20/24.
//

import UIKit

import SnapKit

class ChatViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)

    private let previews = ChatPreview.mockData()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
    }

    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview()
        }
    }

    private func register() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            ChatTableViewCell.self,
            forCellReuseIdentifier: ChatTableViewCell.identifier
        )
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.identifier,
            for: indexPath
        ) as? ChatTableViewCell else { return UITableViewCell()}
        cell.dataBind(previews[indexPath.row])
        return cell
    }
}

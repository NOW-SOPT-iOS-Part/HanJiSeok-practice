//
//  ChatTableViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/20/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    static let identifier = "ChatTableViewCell"

    let profileImageView = UIImageView()

    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()

    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textColor = UIColor(red: 156 / 255,
                                  green: 156 / 255,
                                  blue: 156 / 255,
                                  alpha: 1)
        return label
    }()

    let latestChatLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        return label
    }()

    let previewImageView = UIImageView()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setLayout()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLayout() {
        [
            profileImageView,
            nicknameLabel,
            locationLabel,
            latestChatLabel,
            previewImageView
        ].forEach {
            self.addSubview($0)
        }
    }

    func setAutoLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(16)
            $0.size.equalTo(40)
        }

        nicknameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(16)
        }

        locationLabel.snp.makeConstraints {
            $0.leading.equalTo(nicknameLabel.snp.trailing).offset(4)
            $0.top.equalTo(nicknameLabel).offset(2)
        }

        latestChatLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing)
                .offset(16)
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(4)
        }

        previewImageView.snp.makeConstraints {
            $0.trailing.top.equalToSuperview().inset(16)
            $0.size.equalTo(40)
        }
    }

    func dataBind(_ preview: ChatPreview) {
        profileImageView.image = preview.profileImage
        nicknameLabel.text = preview.nickname
        locationLabel.text = preview.location
        latestChatLabel.text = preview.latestMessage
        previewImageView.image = preview.previewImage
    }

}

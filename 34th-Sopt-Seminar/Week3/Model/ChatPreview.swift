//
//  ChatPreview.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/20/24.
//

import Foundation
import UIKit

struct ChatPreview {
    let profileImage: UIImage
    let nickname: String
    let location: String
    let latestMessage: String
    let previewImage: UIImage
}

extension ChatPreview {
    static func mockData() -> [ChatPreview] {
        [
            ChatPreview(profileImage: .person1, nickname: "호날두", location: "포르투갈", latestMessage: "안삽니다.", previewImage: .preview1),
            ChatPreview(profileImage: .person2, nickname: "모드리치", location: "크로아티아", latestMessage: "안삽니다.", previewImage: .preview2),
            ChatPreview(profileImage: .person3, nickname: "손흥민", location: "대한민국", latestMessage: "안삽니다.", previewImage: .preview3),
            ChatPreview(profileImage: .person4, nickname: "덕배", location: "벨기에", latestMessage: "안삽니다.", previewImage: .preview4),
            ChatPreview(profileImage: .person5, nickname: "임모빌레", location: "이태리", latestMessage: "안삽니다.", previewImage: .preview5),
            ChatPreview(profileImage: .person6, nickname: "사비", location: "스페인", latestMessage: "안삽니다.", previewImage: .preview6),
            ChatPreview(profileImage: .person1, nickname: "라키티치", location: "크로아티아", latestMessage: "안삽니다.", previewImage: .preview7),
            ChatPreview(profileImage: .person2, nickname: "이스코", location: "스페인", latestMessage: "안삽니다.", previewImage: .preview8),
            ChatPreview(profileImage: .person3, nickname: "피를로", location: "이탈리아", latestMessage: "안삽니다.", previewImage: .preview9),
            ChatPreview(profileImage: .person4, nickname: "기성용", location: "대한민국", latestMessage: "안삽니다.", previewImage: .preview10)
        ]
    }
}

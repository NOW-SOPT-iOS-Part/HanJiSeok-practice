//
//  APITarget+User.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/27/24.
//

import Foundation

import Moya

extension APITarget {
    enum User {
        case getUserInfo(memberId: String)
        case signUp(request: SignUpRequestModel)
    }
}


extension APITarget.User: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .signUp:
            return "/member/join"
        case .getUserInfo(memberId: let memberId):
            return "/member/info"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        case .getUserInfo:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .signUp(let request):
            return .requestJSONEncodable(request)
        case .getUserInfo:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        switch self {
        case.signUp:
            return ["Content-Type": "application/json"]
        case .getUserInfo(let memberId):
            return ["Content-Type": "application/json",
                    "memberId" : memberId]
        }

    }
}



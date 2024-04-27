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
        case login(request: LoginRequestModel)
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
        case .getUserInfo:
            return "/member/info"
        case .login:
            return "/member/login"
        }
    }

    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        case .getUserInfo:
            return .get
        case .login:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case .signUp(let request):
            return .requestJSONEncodable(request)
        case .getUserInfo:
            return .requestPlain
        case .login(let request):
            return .requestJSONEncodable(request)
        }
    }

    var headers: [String : String]? {
        switch self {
        case .signUp:
            return ["Content-Type": "application/json"]
        case .getUserInfo(let memberId):
            return ["Content-Type": "application/json",
                    "memberId" : memberId]
        case .login:
            return ["Content-Type": "application/json"]
        }

    }
}



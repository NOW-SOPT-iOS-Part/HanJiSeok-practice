//
//  UserService.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/27/24.
//

import Foundation

import Moya

final class UserService {
    static let shared = UserService()
    private var userProvider = MoyaProvider<APITarget.User>(plugins: [MoyaLoggingPlugin()])
    private init() {}
}

extension UserService {

    /// func login: 로그인 기능 입니다
    /// - Parameter request : LoginRequestModel
    func login(
        request: LoginRequestModel,
        completion: @escaping (NetworkResult<Any>) -> ()) 
    {
        userProvider.request(.login(request: request)) { [weak self] result in
            guard let self = self else { 
                completion(.networkFail)
                return
            }
            switch result {
            case .success(let response):
                let statuscode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statuscode,
                                                     data,
                                                     LoginResponseModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }

    func getUserInfo(memberId: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.getUserInfo(memberId: memberId)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statusCode,
                                                     data,
                                                     UserInfoResponseModel.self)
                completion(networkResult)

            case .failure:
                completion(.networkFail)
            }
        }
    }

    func signUp(request: SignUpRequestModel, completion: @escaping (NetworkResult<Any>) -> Void) {
        userProvider.request(.signUp(request: request)) { result in
            switch result {
            case .success(let response):
                print("🫶 memberID는 \(String(describing: response.response?.allHeaderFields["Location"]))")

                let statusCode = response.statusCode
                let data = response.data

                let networkResult = self.judgeStatus(by: statusCode, 
                                                     data, 
                                                     SignUpResponseModel.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }

    public func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {

        switch statusCode {
        case 200..<205:
            return isValidData(data: data, T.self)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func isValidData<T: Codable>(data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr }

        return .success(decodedData as Any)
    }
}


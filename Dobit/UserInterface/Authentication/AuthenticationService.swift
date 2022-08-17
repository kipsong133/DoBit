//
//  AuthenticationService.swift
//  Dobit
//
//  Created by 박현우 on 2022/07/15.
//

import Foundation
import Alamofire

class AuthenticationService {
    // MARK: 회원가입 처리
    static func register(email: String, pw: String, pwConfirm: String, nickname: String, completion: @escaping (RegisterResultData) -> Void) {
        let url = URL(string: "https://sideproject.shop/users/signup")!
        
        let params = [
            "email": email,
            "password": pw,
            "confirmPassword": pwConfirm,
            "nickname": nickname
        ]
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseDecodable(of: RegisterResultData.self) { response in
                switch response.result {
                case .success:
                    guard let data = response.value else { return }
                    completion(data)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    // MARK: 로그인 처리
    static func login(email: String, pw: String, completion: @escaping (LoginResultData) -> Void) {
        let url = URL(string: "https://sideproject.shop/users/login")!
        
        let params = [
            "email": email,
            "password": pw
        ]
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseDecodable(of: LoginResultData.self) { response in
                switch response.result {
                case .success:
                    guard let data = response.value else { return }
                    completion(data)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    // MARK: 이메일 인증번호 발송 처리
    static func passwordResetAuth(email: String, completion: @escaping (PasswordResetAuthResultData) -> Void) {
        let url = URL(string: "https://sideproject.shop/mail/auth")!
        
        let params = [
            "email": email
        ]
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseDecodable(of: PasswordResetAuthResultData.self) { response in
                switch response.result {
                case .success:
                    guard let data = response.value else { return }
                    completion(data)
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    // MARK: 비밀번호 재설정 처리
    static func passwordReset(email: String, pw: String, pwConfirm: String, completion: @escaping (PasswordResetResultData) -> Void) {
        let url = URL(string: "https://sideproject.shop/password")!
        
        let params = [
            "email": email,
            "password": pw,
            "confirmPassword": pwConfirm
        ]
        
        AF.request(url, method: .patch, parameters: params, encoding: JSONEncoding.default)
            .responseDecodable(of: PasswordResetResultData.self) { response in
                switch response.result {
                case .success:
                    guard let data = response.value else { return }
                    completion(data)
                case let .failure(error):
                    print(error)
                }
            }
    }
}

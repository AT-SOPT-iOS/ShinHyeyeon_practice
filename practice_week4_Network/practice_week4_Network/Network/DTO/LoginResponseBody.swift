//
//  LoginResponseBody.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/10/25.
//

struct LoginResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: LoginResponseBody
}

struct LoginResponseBody: Codable {
    let userId: Int
}

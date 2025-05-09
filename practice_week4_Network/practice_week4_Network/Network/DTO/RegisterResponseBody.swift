//
//  RegisterResponseBody.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/9/25.
//

struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseBody
}

struct RegisterResponseBody: Codable {
    let userId: Int
    let nickname: String
}

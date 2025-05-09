//
//  RegisterRequestBody.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/9/25.
//

struct RegisterRequestBody: Codable {
    let loginId: String
    let password: String
    let nickname: String
}

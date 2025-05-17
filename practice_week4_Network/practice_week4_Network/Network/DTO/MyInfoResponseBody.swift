//
//  MyInfoResponseBody.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/13/25.
//

struct MyInfoResponseBody: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NicknameData
}

struct NicknameData: Codable {
    let nickname: String
}

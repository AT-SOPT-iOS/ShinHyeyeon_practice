//
//  NickNameListResponseWrapper.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/9/25.
//

struct NickNameListResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NickNameListResponseModel
}

struct NickNameListResponseModel: Codable {
    let nicknameList: [String]
}

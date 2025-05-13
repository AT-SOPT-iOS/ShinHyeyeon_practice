//
//  ModifyService.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/13/25.
//

import Foundation

class ModifyService {
    
    static let shared = ModifyService()
    private init() {}
    
    func makeRequest(nickname: String, keyword: String?, userId: Int64) -> URLRequest? {
        var urlString = "http://api.atsopt-seminar4.site/api/v1/users"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "?keyword=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(userId), forHTTPHeaderField: "userId")
        
        let body = ModifyRequestBody(nickname: nickname)
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            print("body 인코딩 실패:", error)
            return nil
        }
        
        return request
    }
    
    func modifyNickname(nickname: String, keyword: String?, userId: Int64) async throws {
        guard let request = makeRequest(nickname: nickname, keyword: keyword, userId: userId) else {
            throw NetworkError.requestEncodingError
        }
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        print("닉네임 수정 성공")
    }
}

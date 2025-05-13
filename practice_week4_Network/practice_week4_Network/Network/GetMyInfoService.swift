//
//  GetMyInfoService.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/13/25.
//

import Foundation

class GetMyInfoService {
    static let shared = GetMyInfoService()
    private init() {}
    
    func makeRequest(keyword: String?, userId: Int64) -> URLRequest? {
        var urlString = "http://api.atsopt-seminar4.site/api/v1/users/me"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "?keyword=\(encoded)"
        }
        
        guard let url = URL(string: urlString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(userId), forHTTPHeaderField: "userId")
        return request
    }
    
    func fetchNickNameList(keyword: String?, userId: Int64) async throws -> String? {
        guard let request = makeRequest(keyword: keyword, userId: userId) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode(MyInfoResponseBody.self, from: data)
            
            print("서버 응답 원본:\n", String(data: data, encoding: .utf8) ?? "디코딩 불가")
            
            return decoded.data.nickname
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
}

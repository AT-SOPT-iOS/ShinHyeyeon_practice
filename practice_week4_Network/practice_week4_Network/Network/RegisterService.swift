//
//  RegisterService.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/9/25.
//

import Foundation

class RegisterService {
    
    // 싱글톤 객체 생성
    static let shared = RegisterService()
    private init() {}
    
    // URL Session에 넣어줄 URL Request를 만드는 부분
    // request 형식의 데이터 모델로 인코딩을 해주는 과정
    func makeRequestBody(loginId: String,
                         password: String,
                         nickName: String) -> Data? {
        do {
            let data = RegisterRequestBody(loginId: loginId,
                                           password: password,
                                           nickname: nickName)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    // URL Session에 넣어줄 URL Request를 만드는 부분
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "https://api.atsopt-seminar4.site/api/v1/auth/signup")! // String 형식의 URL을 URL객체로 변환
        var request = URLRequest(url: url) // 해당 URL로 URL Request 객체 생성
        request.httpMethod = "POST" // 사용할 HTTP Method는 POST
        // dictionary를 사용해 헤더 선언, key와 value값을 통해 Request와 헤더를 설정
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        // 이후 받아온 Body를 할당
        if let body = body {
            request.httpBody = body
        }
        return request
    }
    
    // 만들어진 Request를 이용해서 실제로 서버와 통신을 진행하는 부분
    func PostRegisterData(loginId: String,
                          password: String,
                          nickName: String) async throws -> RegisterResponseBody {
        
        // makeRequestBody 메소드로 바디 생성, 실패할 경우 NetworkError에서 오류를 던짐
        guard let body = makeRequestBody(loginId: loginId,
                                         password: password,
                                         nickName: nickName) else {
            throw NetworkError.requestEncodingError
        }
        
        let request = makeRequest(body: body)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(RegisterResponseWrapper.self, from: data)
            return decoded.data
        } catch {
            print("디코딩 실패:", error)
            throw NetworkError.responseDecodingError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}

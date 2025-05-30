//
//  ChatExampleView.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/21/25.
//

import SwiftUI

struct ChatExampleView: View {
    let users = ["가현", "혜연", "치욱", "나연", "석기"]
    let messages = [
        "안녕하세요!",
        "영화 보러 가자요 ",
        "사진 잘 봤어요!",
        "내일 점심 어때요?",
        "내 말 들리나요"
    ]

    var body: some View {
        VStack(alignment: .leading) {
            // 프로필 좌우 스크롤
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(users, id: \.self) { users in
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.pink)
                                .opacity(0.6)

                            Circle()
                                .fill(Color.green)
                                .frame(width: 15, height: 15)
                                .offset(x: 2, y: 2)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .padding(10)
            
            // 채팅 리스트
            List {
                ForEach(0..<users.count, id: \.self) { index in
                    HStack(spacing: 12) {
                        ZStack(alignment: .bottomTrailing) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)

                            Circle()
                                .fill(Color.green)
                                .frame(width: 12, height: 12)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(users[index])
                                .font(.headline)

                            Text(messages[index])
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        Spacer()
                        Text("오전 9:41")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    ChatExampleView()
}

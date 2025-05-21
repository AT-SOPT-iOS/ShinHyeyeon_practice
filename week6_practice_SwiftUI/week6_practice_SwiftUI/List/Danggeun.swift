//
//  ChatListView.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/21/25.
//

import SwiftUI

struct Danggeun: View {
    var body: some View {
        VStack {
            List(chatDummy) { chat in
                rowView(chat: chat)
            }
            .listStyle(PlainListStyle())

        }
    }
}

struct rowView: View {
    let chat: ChatModel

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(chat.profileImageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(chat.name)
                            .font(.caption)
                            .bold()
                        Text(chat.location)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Text(chat.message)
                        .font(.caption)
                        .foregroundColor(.black)
                }
                
                Spacer()
                Image(chat.thumbnailImageName)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    Danggeun()
}

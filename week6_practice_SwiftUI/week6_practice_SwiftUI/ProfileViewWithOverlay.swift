//
//  ProfileViewWithOverlay.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/21/25.
//

import SwiftUI

struct ProfileViewWithOverlay: View {
    var body: some View {
        VStack {
            Image("jaehyun")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(ProfileDetail(), alignment: .bottom)
        }
        .ignoresSafeArea()
    }
}

struct ProfileDetail: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
            VStack(alignment: .center) {
                Text("Real 허거덩거덩스")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text("이것참엄청난미모임 ;;")
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    ProfileViewWithOverlay()
}

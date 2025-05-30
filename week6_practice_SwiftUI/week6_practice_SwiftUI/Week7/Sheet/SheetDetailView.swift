//
//  SheetDetailView.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct SheetDetailView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("시트 뷰")
                    .font(.title)
                Button("닫기") {
                    isPresented.toggle()
                }
                .padding()
                .background(Color.orange)
                .foregroundStyle(Color.white)
                .clipShape(Capsule())
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    SheetDetailView(isPresented: .constant(true))
}

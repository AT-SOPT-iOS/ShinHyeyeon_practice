//
//  SheetExampleView.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct SheetExampleView: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("메인 화면")
                .font(.largeTitle)
            
            Button("시트 열기"){
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                SheetDetailView(isPresented: $isPresented)
            }
        }
    }
}

#Preview {
    SheetExampleView()
}


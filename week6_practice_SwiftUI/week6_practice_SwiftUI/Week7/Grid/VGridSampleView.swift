//
//  VGridSampleView.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct VGridSampleView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<10) { index in
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 140, height: 100)
                            .foregroundStyle(.orange)
                        Text("아이템 \(index)")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
                }
            }
        }
        .padding(20)
    }
}


#Preview {
    VGridSampleView()
}

//
//  HGridSampleView.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/30/25.
//

import SwiftUI

struct HGridSampleView: View {
    let rows = [GridItem(.fixed(80)), GridItem(.fixed(80))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0..<10) { index in
                    Text("\(index)")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
        }
        .padding(.leading, 10)
    }
}

#Preview {
    HGridSampleView()
}

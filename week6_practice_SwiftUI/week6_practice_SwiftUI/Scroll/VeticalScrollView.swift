//
//  ScrollView.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/21/25.
//

import SwiftUI

struct VeticalScrollView: View {
    var body: some View {
        ScrollView()    {
            VStack {
                ForEach(1..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct HorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10) {
                    Text("숫자 \($0)")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .background(Color.yellow)
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
//    VeticalScrollView()
    HorizontalScrollView()
}

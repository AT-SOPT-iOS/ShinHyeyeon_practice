//
//  PropertyWrapper.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/21/25.
//

import SwiftUI

struct PropertyWrapper: View {
    
    @State var name = "혜연"
    
    var body: some View {
        VStack {
            Text(name)
            Button {
                self.name = "신해피"
            } label: {
                Text("이름바꾸기")
            }
        }
    }
}


#Preview {
    PropertyWrapper()
}

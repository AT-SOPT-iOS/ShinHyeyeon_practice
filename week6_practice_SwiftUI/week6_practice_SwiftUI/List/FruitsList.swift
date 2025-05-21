//
//  FruitsList.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/21/25.
//

import SwiftUI

struct FruitsList: View {
    
    private let fruits = ["Apple", "Banana", "Orange", "Pineapple", "Strawberry"]
    
    var body: some View {
        List(fruits, id: \.self) { fruit in
            Text(fruit)
        }
    }
}

#Preview {
    FruitsList()
}

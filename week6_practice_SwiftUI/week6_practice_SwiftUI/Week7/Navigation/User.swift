//
//  User.swift
//  week6_practice_SwiftUI
//
//  Created by 신혜연 on 5/30/25.
//

import Foundation

struct User: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let age: Int
}

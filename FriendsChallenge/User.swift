//
//  User.swift
//  FriendsChallenge
//
//  Created by Peter Molnar on 16/02/2022.
//

import Foundation

struct User: Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

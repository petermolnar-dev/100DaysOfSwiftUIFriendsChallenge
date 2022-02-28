//
//  Friend.swift
//  FriendsChallenge
//
//  Created by Peter Molnar on 16/02/2022.
//

import Foundation

struct Friend: Identifiable, Decodable {
    let id: String
    let name: String
}

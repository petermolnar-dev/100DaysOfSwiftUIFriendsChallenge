//
//  UserDetailedView.swift
//  FriendsChallenge
//
//  Created by Peter Molnar on 12/03/2022.
//

import SwiftUI

struct UserDetailedView: View {
    var currentUser: User
    
    var body: some View {
        HStack {
        
        Text("Name: \(currentUser.name)")
            .font(.headline)
            .padding()
        }
        Text("Age: \(currentUser.age)")
        Text("About: \(currentUser.about)")
        Text("Registered: \(currentUser.registered.formatted())")
        
        List {
            ForEach(currentUser.friends, id: \.self.id) { friend in
                Text(friend.name)
                    .font(.caption)
            }
        }
    }
}

struct UserDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailedView(currentUser: User(id: UUID().uuidString,
                                           isActive: true,
                                           name: "Name",
                                           age: 31,
                                           company: "Company",
                                           email: "Email@Email.com",
                                           address: "This is the address",
                                           about: "This is the about session you can say something more about the current user",
                                           registered: Date() - 10,
                                           tags: ["First friend", "Good buddy"],
                                           friends: []))
    }
}

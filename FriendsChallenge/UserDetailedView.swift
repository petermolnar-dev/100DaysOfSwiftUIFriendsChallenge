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
        VStack {
            
            Text("Name: \(currentUser.name)")
                .font(.title)
                .padding()
            HStack {
                Text("Age: \(currentUser.age)")
                    .font(.headline)
                    .padding()
                Text("Registered: \(currentUser.registered.formatted())")
                    .font(.caption)
                    .padding()
            }
            
            Text("About: \(currentUser.about)")
                .font(.body)
                .padding()
            
            Text("Friends:")
                .font(.headline)
            
            List {
                ForEach(currentUser.friends, id: \.self.id) { friend in
                    Text(friend.name)
                        .font(.headline)
                }
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
                                           friends: [Friend(id: UUID().uuidString, name: "Peter Molnar"), Friend(id: UUID().uuidString, name: "Fsdahifohdsai fadfda")]))
    }
}

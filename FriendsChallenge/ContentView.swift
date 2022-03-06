//
//  ContentView.swift
//  FriendsChallenge
//
//  Created by Peter Molnar on 14/02/2022.
//

import SwiftUI

struct UsersView: View {
    @ObservedObject var usersStore: UsersStore
    
    var body: some View {
        List {
            ForEach(usersStore.users, id: \.self.id) { user in
                VStack {
                   
                        Text(user.name)
                            .font(.headline)
                            .padding()
                 
                    HStack {
                        Text("Friends Count: \(user.friends.count)")
                            .font(.caption)
                        Text("Age: \(user.age)")
                            .font(.caption)
                    }
                    
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

struct ContentView: View {
    @State private var isLoading = true
    @StateObject var usersStore = UsersStore()
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView("Downloading...")
                
            } else {
                UsersView(usersStore: usersStore)
            }
        }
        .task {
            await usersStore.loadData()
            self.isLoading = false
        }
        
        
    }
    
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

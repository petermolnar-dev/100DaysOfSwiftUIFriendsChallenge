//
//  ContentView.swift
//  FriendsChallenge
//
//  Created by Peter Molnar on 14/02/2022.
//

import SwiftUI

struct UsersView: View {
    let users: [User]
    
    var body: some View {
        List {
            ForEach(users, id: \.self.id) { user in
                HStack {
                    VStack {
                        Text(user.name)
                            .font(.headline)
                            .padding()
                        Text("Friends Count: \(user.friends.count)")
                            .font(.caption)
                    }
                    Text("\(user.age)")
                        .font(.caption)
                }
                
            }
        }
    }
}

struct ContentView: View {
    @State private var isLoading = true
    @State var usersData: [User] = []
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView("Downloading...")
                   
            } else {
               UsersView(users: usersData)
            }
        }
        .task {
            await loadData()
        }
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }
        isLoading = true
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let userData = try decoder.decode([User].self, from: data)
            print("USerData: \(userData)")
            usersData = userData
        } catch {
            print("Error during the data download: \(error)")
        }
        withAnimation {
            isLoading = false
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  UsersStore.swift
//  FriendsChallenge
//
//  Created by Peter Molnar on 06/03/2022.
//

import Foundation

class UsersStore: ObservableObject {
    
    @Published var users: [User] = []
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let userData = try decoder.decode([User].self, from: data)
            DispatchQueue.main.async {
                self.users = userData
            }
        } catch {
            print("Error during the data download: \(error)")
        }
    }
}

//
//  ApiService.swift
//  BudgetTrackerApi
//
//  Created by admin on 01/02/25.
//

import Foundation

struct Post: Codable, Identifiable{
    let id: Int
    let title : String
    let body : String
}
class APIService: ObservableObject{
    @Published var posts : [Post] = []
    
    func fetchPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTask(with: url) {data, response, error in if let error = error{
            print("Error Fetching Posts :\(error.localizedDescription)")
            return
        }
            guard let data = data else{return}
            DispatchQueue.main.async {
                do{
                    self.posts = try JSONDecoder().decode([Post].self,from:data)
                } catch{
                    print("Error Decoding Posts: \(error.localizedDescription)")
                }
            }
        }.resume()
        
    }
}

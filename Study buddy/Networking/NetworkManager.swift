//
//  NetworkManager.swift
//  Study buddy
//
//  Created by yue on 11/30/23.
//



import Foundation
import Alamofire

class NetworkManager{
    let libID: [String: Int] = [
        "Uris Library": 1,
        "Olin Library": 2,
        "Mann Library": 3,
        "Law Library": 4,
        "Engineering Library": 5,
        "Math Library": 6,
        "Wood Library": 7,
        "Clarke Africana Library": 8,
        "Clark Physical Sciences Library": 9,
        "Management Library": 10
    ]
//    enum NetworkError: Error {
//        case invalidURL
//        case invalidResponse
//        case noData
//        case serverError(String) // Server error with message
//        case decodingError
//        case customError(String) // Custom error with message
//    }
//    
//    func fetchPosts(completion: @escaping (Result<[Post], NetworkError>) -> Void) {
//        let urlString = "http://35.236.194.218/api/posts/"
//        guard let url = URL(string: urlString) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(.customError(error.localizedDescription)))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//
//            do {
//                let posts = try JSONDecoder().decode([Post].self, from: data)
//                completion(.success(posts))
//            } catch {
//                completion(.failure(.decodingError))
//            }
//        }
//
//        task.resume()
//    }

    private let decoder = JSONDecoder()
   
    static let shared = NetworkManager()
    
    private init() { }
    
   
    
    
    // MARK: - Requests
    func fetchRoster(completion: @escaping([Post]) -> Void){
        let endpoint = "http://35.236.194.218/api/posts/"
        decoder.dateDecodingStrategy = .iso8601
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of:[Post].self, decoder: decoder ){ response in
                switch response.result{
                case.success(let posts):
                    completion(posts)
                case.failure(let error):
                    print("error in NetworkManager.fetchRoster: \(error.localizedDescription)")
                    completion([])
                }
                
            }
        
    }
    
    func addToRoster(for libraryName: String, post: Post, completion: @escaping(Post) -> Void) {
            guard let lid = libID[libraryName] else {
                print("Library ID not found")
                return
            }
            let endpoint = "http://35.236.194.218/api/posts/\(lid)/"
        decoder.dateDecodingStrategy = .iso8601
        let parameters: Parameters = [
            
            "message" : post.message,
            
            
        
        ]
        AF.request(endpoint, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder ){response in
                switch response.result{
                case .success(let post):
                    print("Successfully added a post")
                    completion(post)
                case.failure(let error):
                    print("Error in the NetworkManager.addToRoster \(error.localizedDescription)")
                    
                }
            }
    }
    
    
}

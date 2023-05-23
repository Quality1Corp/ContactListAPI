//
//  NetworkManager.swift
//  ContactListAPI
//
//  Created by MikhaiL on 22.05.2023.
//

import Foundation
import Alamofire

enum Link {
    case randomUserAPI
    
    var url: URL {
        switch self {
            case .randomUserAPI:
                return URL(string: "https://randomuser.me/api/")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    private let urlParams = [
        "results":"\(25)"
    ]
    
    func fetchUsers(_ completion: @escaping(Result<[User], AFError>) -> Void) {
        AF.request(Link.randomUserAPI.url, parameters: urlParams)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                    case .success(let value):
                        let users = User.getRandomUsers(from: value)
                        completion(.success(users))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
    }
    
    func fetchData(from url: String, completion: @escaping(Result<Data, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                }
            }
    }
}

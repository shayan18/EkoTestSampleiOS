//
//  GithubService.swift
//  EkoTestApp
//
//  Created by Shayan Ali on 15/12/2018.
//  Copyright © 2018 Shayan Ali. All rights reserved.
//

import Foundation
import Moya

enum GithubService {
    
    case showUsers(since: Int)
}

extension GithubService: TargetType {
    
    var baseURL: URL { return URL(string: Constants.baseUrl)! }
    
    var path: String {
        switch self {
        case .showUsers:
            return "users"
   
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .showUsers:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .showUsers(let since):
            return .requestParameters(parameters: ["since": since], encoding: URLEncoding.default)
       
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var sampleData: Data {
        return Data()
    }
}

//
//  GithubUsersViewModel.swift
//  EkoTestApp
//
//  Created by Shayan Ali on 15/12/2018.
//  Copyright © 2018 Shayan Ali. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

protocol GithubUsersDelegate : class {
    func usersFetched(hasUsers:Bool)
    func usersFetchFailed(message:String)
}

class GithubUsersViewModel: NSObject {
    
    //githubUser Delegate
    weak var delegate:GithubUsersDelegate?
    //github service provider
    let githubUsersProvider = MoyaProvider<GithubService>()
    
    var usersList:[GitHubUser] = []
    var isLoadingData = false
    var currentPage = 1
    
    typealias SuccessBlock = (Response) -> Void
    typealias FailureBlock = (Error) -> Void
    
    
    //Calls success or failure block based on response
    lazy var resultCompletion:Completion = { [unowned self] result in
        switch result {
        case let .success(response):
            self.successCompletion(response)
        case let .failure(error):
            self.failureCompletion(error)
        }
        self.isLoadingData = false
    }
    
    lazy var successCompletion: SuccessBlock = { [unowned self] (response) in
        let data = response.data
        let githubUsers = JSON(data: data).arrayValue
        for user in githubUsers {
            self.usersList.append(GitHubUser(json: user))
        }
        guard let lastId = self.usersList.last?.id else {return self.isLoadingData = true}
        
        self.currentPage = lastId
        self.usersList.isEmpty ? self.delegate?.usersFetched(hasUsers: false) : self.delegate?.usersFetched(hasUsers: true)
    }
    
    //Notifies the delegate on request failure
    lazy var failureCompletion:FailureBlock = { [unowned self] error in
        print(error.localizedDescription)
        self.delegate?.usersFetchFailed(message: error.localizedDescription)
    }
    
    func showGithubUsers(){
        if isLoadingData{ return }
        self.isLoadingData = true
        githubUsersProvider.request(.showUsers(since: currentPage)) { (result) in
              self.resultCompletion(result)
        }
       
    }
    
}


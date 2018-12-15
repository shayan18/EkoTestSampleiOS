//
//  ViewController.swift
//  EkoTestApp
//
//  Created by Shayan Ali on 15/12/2018.
//  Copyright © 2018 Shayan Ali. All rights reserved.
//

import UIKit

class GithubUsersViewController: UIViewController {
    
    // MARK: Private Outlets
    @IBOutlet weak private var retryButton: UIButton!
    @IBOutlet weak private var spinner: UIActivityIndicatorView!
    @IBOutlet weak private var noDataLabel: UILabel!
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
  
    // MARK: Properties
    let githubUsersViewModel = GithubUsersViewModel()
    var selectedIndex = Int()
    var stateDict = [String:Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //conforming protocol
        githubUsersViewModel.delegate = self
        
        //fetching githubusers
        getGithubUsers()
    }
    
  private  func getGithubUsers()  {
    spinner.startAnimating()
    githubUsersViewModel.showGithubUsers()

    }
}

// MARK: Buttons actions
extension GithubUsersViewController: GithubUsersCellDelegate {
    
    func didTapButtonInCell(cell: GithubUsersTableViewCell) {
       
        cell.favButton.isSelected = !cell.favButton.isSelected
    }
    @IBAction func retryButtonPressed(_ sender: Any) {
        getGithubUsers()
    }
}

// MARK: Tableview Delegate methods
extension GithubUsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return githubUsersViewModel.usersList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.githubUser, for: indexPath) as! GithubUsersTableViewCell
        cell.githubUser = githubUsersViewModel.usersList[indexPath.row]
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == githubUsersViewModel.usersList.count-1{
            
            githubUsersViewModel.currentPage += 1
            githubUsersViewModel.showGithubUsers()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       selectedIndex = indexPath.row
      let userGithubPageVC = GitHubUserPageViewController.instantiate()
        guard let githubURL = githubUsersViewModel.usersList[indexPath.row].htmlUrl else {return}
        userGithubPageVC.pageUrl = githubURL
        self.navigationController?.pushViewController(userGithubPageVC, animated: true)
    
    }
}
// MARK: delegate methods
extension GithubUsersViewController: GithubUsersDelegate {
    func usersFetched(hasUsers: Bool) {
        
        spinner.stopAnimating()
        tableView.reloadData()
        noDataLabel.isHidden = true
        retryButton.isHidden = true

        if !hasUsers{
            self.showAlert(title: "Oops", message: "No Users to show")
        }
    }
    
    func usersFetchFailed(message: String) {
        spinner.stopAnimating()
        self.showAlert(title: "Oops", message: message)
        noDataLabel.isHidden = false
        retryButton.isHidden = false

    }
}

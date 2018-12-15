//
//  ViewController.swift
//  EkoTestApp
//
//  Created by Shayan Ali on 15/12/2018.
//  Copyright © 2018 Shayan Ali. All rights reserved.
//

import UIKit

class GithubUsersViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
extension GithubUsersViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
     //   if let userGithubPageVc = segue.destination as? 
        
    }
}

extension GithubUsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.githubUser, for: indexPath) as! GithubUsersTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


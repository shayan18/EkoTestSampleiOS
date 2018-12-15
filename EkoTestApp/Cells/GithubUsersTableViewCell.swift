//
//  GithubUsersTableViewCell.swift
//  EkoTestApp
//
//  Created by Shayan Ali on 15/12/2018.
//  Copyright © 2018 Shayan Ali. All rights reserved.
//

import UIKit
import SDWebImage

protocol GithubUsersCellDelegate: class {
   func didTapButtonInCell( cell: GithubUsersTableViewCell)
}
class GithubUsersTableViewCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak private var userProfileImageView: UIImageView!
    @IBOutlet weak private var userNameLabel: UILabel!
    @IBOutlet weak private var linkLabel: UILabel!
    @IBOutlet weak private var typeLabel: UILabel!
    @IBOutlet weak private var adminStatusLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    // MARK: Properties
    weak var delegate: GithubUsersCellDelegate?
    var githubUser: GitHubUser! {
        didSet {
            userProfileImageView.sd_setImage(with: URL(string: githubUser.avatarUrl ?? "") )
            userNameLabel.text = "Name: \(githubUser.login ?? "NA")"
            linkLabel.text = githubUser.url ?? "NA"
            typeLabel.text = "Type: \(githubUser.type ?? "NA")"
            adminStatusLabel.text = "Admin: \(githubUser.siteAdmin == false ? "NO" : "YES")"
        }
    }
    
    @IBAction func favButtonTapped(_ sender: UIButton) {
        delegate?.didTapButtonInCell(cell: self)
    }
}

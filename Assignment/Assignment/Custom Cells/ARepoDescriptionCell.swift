//
//  ARepoDescriptionCell.swift
//  Assignment
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import UIKit

class ARepoDescriptionCell: UITableViewCell {

    @IBOutlet weak var lblRepoName: UILabel!
    @IBOutlet weak var lblRepoID: UILabel!
    @IBOutlet weak var lblRepoDescription: UILabel!
    
    var repoDetailModel: RepoDetailModel? {
        didSet{
            guard let repoDetailModel = repoDetailModel else {
                return
            }
            lblRepoName.text = repoDetailModel.fullName
            lblRepoID.text = String(format: "%d", repoDetailModel.repoID)
            lblRepoDescription.text = repoDetailModel.description
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

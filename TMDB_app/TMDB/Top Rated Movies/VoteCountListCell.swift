//
//  VoteCountListCell.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit

class VoteCountListCell: UITableViewCell {

    @IBOutlet weak var vImage: UIImageView!
    @IBOutlet weak var vLblName: UILabel!
    @IBOutlet weak var vLblVote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

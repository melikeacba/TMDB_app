//
//  RevenueListCell.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit

class RevenueListCell: UITableViewCell {

    @IBOutlet weak var rImage: UIImageView!
    @IBOutlet weak var rLblName: UILabel!
    @IBOutlet weak var rLblVote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

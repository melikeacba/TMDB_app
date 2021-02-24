//
//  PopularListCell.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit

class PopularListCell: UITableViewCell {
    
    @IBOutlet weak var lblImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblVote: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

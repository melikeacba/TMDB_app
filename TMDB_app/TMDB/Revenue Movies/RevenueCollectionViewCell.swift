//
//  RevenueCollectionViewCell.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit

class RevenueCollectionViewCell: UICollectionViewCell {
    
    var arr: [Result]? = []

    
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
}
    public func configure(with model: Result) {
        
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500/" + model.posterPath)!
        let data = try! Data ( contentsOf: url )
        self.posterImage.image = UIImage(data: data)
        
       
        
    }
}



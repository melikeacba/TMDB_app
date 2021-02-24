//
//  VoteCountTableViewCell.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit
import Alamofire


class VoteCountTableViewCell: UITableViewCell {
    
    func configure(with models: [Result]) {
        self.arr = models
        collectionView.reloadData()
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arr: [Result]? = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        let params = ["api_key": "b697e28818227e610ea62e22b6cc5909", "language":"en-US", "sort_by":"vote_count.desc", "include_adult":"false", "include_video":"false", "page":"1"]
        
        let url = "https://api.themoviedb.org/3/discover/movie"
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            
            //standard response for successful HTTP request control.
            if (res.response?.statusCode == 200 ) {
                let movie = try? JSONDecoder().decode(Movies.self, from: res.data!)
                self.arr = movie?.results
                self.collectionView.reloadData()
                print("Top Rated Movies are ready.")
                
            }
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension VoteCountTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    //bir satirda kaç tane olsun
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 20
        return arr!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VoteCountCollectionViewCell
        cell.configure(with: arr![indexPath.row])
    
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 148, height: 236)
    }
    
}





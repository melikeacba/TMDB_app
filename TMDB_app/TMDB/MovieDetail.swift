//
//  MovieDetail.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit
import Alamofire

class MovieDetail: UIViewController {
    
    var item : Result?
    
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblDetail: UITextView!
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var ReleaseDate: UILabel!
    
    @IBOutlet weak var lblVote: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblVote.text = String(item!.voteAverage)
        lblMovieName.text = String(item!.title)
        lblDetail.text = item?.overview
        ReleaseDate.text = item?.releaseDate
        
        let urlx = URL(string: "https://image.tmdb.org/t/p/w500/" + item!.backdropPath)
        let data = try! Data ( contentsOf: urlx! )
        MovieImage?.image = UIImage(data: data)
        
        
        let params = ["api_key": "b697e28818227e610ea62e22b6cc5909"]
        
        let url = "https://api.themoviedb.org/3/discover/movie"
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            
            //standard response for successful HTTP request control.
            if (res.response?.statusCode == 200 ) {
                let movie = try? JSONDecoder().decode(Movies.self, from: res.data!)
                print("Detail of \(String(self.item!.title))")
                
            }
            
                
    

        // Do any additional setup after loading the view.
    }
    

    

}
}

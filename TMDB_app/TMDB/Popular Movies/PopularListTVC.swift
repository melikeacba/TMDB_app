//
//  PopularListTVC.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit
import Alamofire

class PopularListTVC: UITableViewController {

    var arr: [Result]? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let params = ["api_key": "b697e28818227e610ea62e22b6cc5909", "language":"en-US", "sort_by":"popularity.desc", "include_adult":"false", "include_video":"false", "page":"1"]
        
        let url = "https://api.themoviedb.org/3/discover/movie"
        
        AF.request(url, method: .get, parameters: params).responseJSON { (res) in
            
            //standard response for successful HTTP request control.
            if (res.response?.statusCode == 200 ) {
                let movie = try? JSONDecoder().decode(Movies.self, from: res.data!)
                self.arr = movie?.results
                self.tableView.reloadData()
                print("Popular Movies Listed.")
                

    }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PopularListCell

        let item = arr![indexPath.row]
        cell.lblName?.text = String(item.title)
        cell.lblVote?.text = String(item.voteAverage)
        
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500/" + item.posterPath)!
        let data = try! Data ( contentsOf: url )
        cell.lblImage?.image = UIImage(data: data)
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = arr![indexPath.row]
        performSegue(withIdentifier: "detail", sender: item)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if ( segue.identifier == "detail" ) {
            let vc = segue.destination as! MovieDetail
            vc.item = sender as? Result
        }
}
}

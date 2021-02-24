//
//  AllListViewController.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit
import Alamofire


class AllListViewController: UIViewController {
    
    var arr: [Result]? = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AllListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //kac satir olsun
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RevenueTableViewCell", for: indexPath) as? RevenueTableViewCell
            cell!.configure(with: arr!)
            return cell!
            
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VoteCountTableViewCell", for: indexPath) as? VoteCountTableViewCell
            cell!.configure(with: arr!) 
            return cell!
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularTableViewCell", for: indexPath) as? PopularTableViewCell else {fatalError("Unable to create explore table view cell")}
        
        cell.configure(with: arr!)
        return cell
        
        
        
    }
    //satir yuksekligi
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
        
        
    }
    
    
}

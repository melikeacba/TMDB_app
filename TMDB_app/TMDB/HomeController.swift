//
//  HomeController.swift
//  TMDB
//
//  Created by Melike Açba on 23.02.2021.
//

import UIKit
import Lottie

class HomeController: UIViewController {
    
    let animation = Animation.named("movie")
    let animationView = AnimationView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.frame = CGRect(x: 130, y: 600, width: 150, height: 150)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "dashboard", sender: nil)
        }
        
    }


}

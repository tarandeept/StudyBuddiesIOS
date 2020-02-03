//
//  HomeViewController.swift
//  StudyBuddiesIOS
//
//  Created by Ugyen Dorji on 2/1/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
   
    let homeViewController = UIHostingController(rootView: HomeView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(homeViewController)
        homeViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeViewController.view)
        homeViewController.didMove(toParent: self)
        
        
        NSLayoutConstraint.activate([
            homeViewController.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
            homeViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0),
            homeViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeViewController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view homeViewController using segue.destination.
        // Pass the selected object to the new view homeViewController.
    }
    */

}

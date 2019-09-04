//
//  JokesViewController.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 9/3/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {
    
    @IBOutlet weak var jokesTableView: UITableView!
    
    var jokeInfo = [setupInfo](){
        didSet {
            jokesTableView.reloadData()
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

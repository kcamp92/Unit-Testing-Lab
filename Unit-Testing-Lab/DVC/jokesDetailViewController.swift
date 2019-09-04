//
//  jokesDetailViewController.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 9/4/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class jokesDetailViewController: UIViewController {
    var allJokeInfo: JokeData!
    
    @IBOutlet weak var punchlineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpLabel() {
        punchlineLabel.text = allJokeInfo.punchline
        
    }
}


//
//  starWarsDetailViewController.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 9/5/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class starWarsDetailViewController: UIViewController {
    var allStarWarsInfo: titleInfo!
    
    @IBOutlet weak var openingCrawlTextView: UITextView!
    
    func setUpLabel() {
        openingCrawlTextView.text = allStarWarsInfo.openingCrawl
        
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setUpLabel()
        }
        
    }


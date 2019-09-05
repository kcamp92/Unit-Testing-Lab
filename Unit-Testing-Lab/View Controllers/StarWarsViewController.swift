//
//  ViewController.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 8/30/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var starWarsTableView: UITableView!
    
    var starWarsInfo = [titleInfo](){
        didSet {
            starWarsTableView.reloadData()
        }
        
    }
    
    func loadStarWarsData() {
        guard let pathToData = Bundle.main.path(forResource: "StarWarsAPI", ofType: "json") else {
            fatalError ("StarWarsAPI.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let starWarsFromJSON = try
                starWarsInfo = StarWarsData.getStarWarsData(data: data)
            
        } catch {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = starWarsTableView.dequeueReusableCell(withIdentifier: "warCell", for: indexPath)
        let movieInfo = starWarsInfo[indexPath.row]
        cell.textLabel?.text = movieInfo.title
        return cell
    }  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStarWarsData()
        starWarsTableView.dataSource = self
        starWarsTableView.delegate = self
    }
    
    
}

extension StarWarsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "starWarsDetailViewController") as? starWarsDetailViewController {
            storyBoard.allStarWarsInfo = starWarsInfo[indexPath.row]
            navigationController?.pushViewController(storyBoard, animated: true)
            
        }
    }
    
    
    
}

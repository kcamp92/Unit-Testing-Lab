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
    
    var jokeInfo = [JokeData](){
        didSet {
            jokesTableView.reloadData()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJokeData()
        jokesTableView.dataSource = self
        jokesTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    func loadJokeData() {
        guard let pathToData = Bundle.main.path(forResource: "JokeAPI", ofType: "json") else {
            fatalError ("JokeAPI.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let jokesFromJSON = try
                jokeInfo = JokeData.getJokeData(data: data)
            
        } catch {
            print(error)
        }
    }
    
    
}

extension JokesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokeInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = jokesTableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let setupInfo = jokeInfo[indexPath.row]
        cell.textLabel?.text = setupInfo.setup
        return cell
    }
    
    
}

extension JokesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "jokesDetailViewController") as? jokesDetailViewController {
            storyBoard.allJokeInfo = jokeInfo[indexPath.row]
            
            navigationController?.pushViewController(storyBoard, animated: true)
            
        }
    }
    
    
    
}




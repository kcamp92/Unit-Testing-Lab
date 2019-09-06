//
//  TriviaViewController.swift
//  Unit-Testing-Lab
//
//  Created by Krystal Campbell on 9/5/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {
    
    var triviaInfo = [resultsInfo](){
        didSet {
            TriviaTableView.reloadData()
        }
    }
    
    @IBOutlet weak var TriviaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTriviaData()
        TriviaTableView.dataSource = self
        TriviaTableView.delegate = self
    }
    
    func loadTriviaData() {
        guard let pathToData = Bundle.main.path(forResource: "TriviaAPI", ofType: "json") else {
            fatalError ("TriviaAPI.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let triviaFromJSON = try
                triviaInfo = TriviaData.getTriviaData(data: data)
            
        } catch {
            print(error)
        }
    }
}
extension TriviaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return triviaInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TriviaTableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        let setupInfo = triviaInfo[indexPath.row]
        cell.textLabel?.text = setupInfo.question.removingPercentEncoding
        return cell
    }

    
}
extension TriviaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "triviaDetailViewController") as? triviaDetailViewController{
            storyBoard.allTriviaInfo = triviaInfo[indexPath.row]
            navigationController?.pushViewController(storyBoard, animated: true)
        }
    }

}


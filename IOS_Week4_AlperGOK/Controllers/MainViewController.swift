//
//  ViewController.swift
//  IOS_Week4_AlperGOK
//
//  Created by Alper Gok on 12.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var characterManager = CharacterManager()
    
    override func viewDidLoad() {
        navigationController?.navigationBar.backgroundColor = .gray
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        characterManager.parseJSON {
            self.tableView.reloadData()
        }
    }
}

// MARK: -  UIStoryboard-Type Property
extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: .main)
    }
}

// MARK: -  UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard.main
        let viewController = storyboard.instantiateViewController(identifier: "characterViewController")
        navigationController?.pushViewController(viewController, animated: true)
        let destinationVC = viewController as? CharacterViewController
        destinationVC?.character = characterManager.character[tableView.indexPathForSelectedRow!.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: -  UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterManager.character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reusableCell")
        cell.textLabel?.text = characterManager.character[indexPath.row].localized_name.capitalized
        return cell
        
    }
}




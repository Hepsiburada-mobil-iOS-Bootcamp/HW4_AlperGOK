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
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //After we decode JSON , We use escaping closure to handle reloadData so we can see UI changes in our tableView
        characterManager.parseJSON {
            self.tableView.reloadData()
        }
    }
}











//
//  TableViewExtensions.swift
//  IOS_Week4_AlperGOK
//
//  Created by Alper Gok on 15.10.2021.
//

import UIKit

// MARK: -  UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    //How many rows are there in the table view 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterManager.character.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Custom Cell using and it's defining
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell") as! CustomCharacterCell
        
        //UI Changes: Most Left character capitalized Names
        cell.characterNameLabel.text = characterManager.character[indexPath.row].localized_name.capitalized
        
        //UI Improvement Icons Added
        cell.characterIconView.downloaded(from: "https://api.opendota.com"+characterManager.character[indexPath.row].icon)
        
        return cell
        
    }
}


// MARK: -  UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    //Main Idea here is: when we select a row; map through that row's detail page.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //UINavigationController for screen changes , segues are complex and hard to read when there are many controllers(too many arrows around there)
        let storyboard = UIStoryboard.main
        let viewController = storyboard.instantiateViewController(identifier: "characterViewController")
        navigationController?.pushViewController(viewController, animated: true)
        
        //we optional down-cast our view controller, UIViewController to a specific controller
        let destinationVC = viewController as? CharacterViewController
        
        //each different row for a different hero(Ordered)
        destinationVC?.character = characterManager.character[tableView.indexPathForSelectedRow!.row]
        
        //Deselect that row for UI Improvement
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



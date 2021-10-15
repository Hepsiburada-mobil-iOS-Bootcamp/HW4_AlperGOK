//
//  CharacterViewController.swift
//  IOS_Week4_AlperGOK
//
//  Created by Alper Gok on 12.10.2021.
//

import UIKit

class CharacterViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    var character: CharacterData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = ListFormatter()
        let urlString = "https://api.opendota.com"+(character?.img)!
        let url = URL(string: urlString)
        nameLabel.text = character?.localized_name
        let capitalizedAttributeName = character?.primary_attr.capitalized
        
        //Text Color Variations for each Type Agi = Green, Int = Blue, Str = Orange
        if character?.primary_attr == "agi" {
            attributeLabel.text = capitalizedAttributeName
            attributeLabel.textColor = .green
        } else if character?.primary_attr == "int" {
            attributeLabel.text = capitalizedAttributeName
            attributeLabel.textColor = .blue
        } else {
            attributeLabel.text = capitalizedAttributeName
            attributeLabel.textColor = .orange
        }
        

        attackLabel.text = character?.attack_type
        
        //ListFormatter : String Interpolation(Array of string -> String)
        roleLabel.text = "\(formatter.string(from: character!.roles) ?? "nil")"
        
        //Image Loading with ImageLoader extension
        imageView.downloaded(from: url!)
        
        //Rounded Image
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
           
    }
}

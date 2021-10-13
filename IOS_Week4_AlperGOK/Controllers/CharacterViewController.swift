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
        attributeLabel.text = character?.primary_attr.capitalized
        attackLabel.text = character?.attack_type
        roleLabel.text = "\(formatter.string(from: character!.roles) ?? "nil")"
        imageView.downloaded(from: url!)
    }
}

//
//  CustomCharacterCell.swift
//  IOS_Week4_AlperGOK
//
//  Created by Alper Gok on 14.10.2021.
//

import UIKit

class CustomCharacterCell: UITableViewCell {

    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterIconView: UIImageView!
    @IBOutlet weak var characterCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

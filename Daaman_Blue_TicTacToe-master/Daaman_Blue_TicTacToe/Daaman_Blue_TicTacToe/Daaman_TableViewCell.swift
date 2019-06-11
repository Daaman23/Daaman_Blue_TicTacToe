//
//  Daaman_TableViewCell.swift
//  Daaman_Blue_TicTacToe
//
//  Created by Daaman Kaushal on 2019-05-28.
//  Copyright © 2019 Daaman Kaushal. All rights reserved.
//

import UIKit

class Daaman_TableViewCell: UITableViewCell {

    @IBOutlet weak var win_loss_image: UIImageView!
    @IBOutlet weak var who_won: UILabel!
    @IBOutlet weak var date_played: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

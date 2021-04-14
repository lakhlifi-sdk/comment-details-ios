//
//  CellTableViewCell.swift
//  testApi
//
//  Created by Lakhlifi Essaddiq on 4/14/21.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var neme: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

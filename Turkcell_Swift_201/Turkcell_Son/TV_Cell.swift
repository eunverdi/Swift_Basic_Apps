//
//  TV_Cell.swift
//  Turkcell_Son
//
//  Created by Ensar Batuhan Ünverdi on 23.03.2022.
//

import UIKit

class TV_Cell: UITableViewCell {
   
    
    @IBOutlet weak var baslikLabel: UILabel!
    @IBOutlet weak var aciklamaLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ForFocusCTVC.swift
//  Level
//
//  Created by Navin Jaitapkar on 26/06/24.
//

import UIKit

class ForFocusCTVC: UITableViewCell {
    
    @IBOutlet weak var viewundercell: UIView!
    
    @IBOutlet weak var focusimageVw: UIImageView!
    
    @IBOutlet weak var focustitle: UILabel!
    
    @IBOutlet weak var duration: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


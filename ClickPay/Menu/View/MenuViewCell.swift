//
//  MenuViewCell.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 13/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroudView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(index: Int){
        if index == 0 {
            backgroudView.backgroundColor = .primary()
            titleLabel.textColor = .white
        }
        iconImage.image = UIImage(named: Constants.menuInfo[index]["image"] ?? "Security")
        if let title = Constants.menuInfo[index]["title"] {
            titleLabel.text = title.localized
        }
        
    }
    
}

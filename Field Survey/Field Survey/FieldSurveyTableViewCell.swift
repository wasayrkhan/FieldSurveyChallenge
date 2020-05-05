//
//  FieldSurveyTableViewCell.swift
//  Field Survey
//
//  Created by Wasay Khan on 4/29/20.
//  Copyright © 2020 Wasay Khan. All rights reserved.
//

import UIKit

class FieldSurveyTableViewCell: UITableViewCell {
    @IBOutlet weak var classificationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

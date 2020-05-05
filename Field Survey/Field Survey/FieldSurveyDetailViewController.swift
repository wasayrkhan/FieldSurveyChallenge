//
//  FieldSurveyDetailViewController.swift
//  Field Survey
//
//  Created by Wasay Khan on 4/29/20.
//  Copyright © 2020 Wasay Khan. All rights reserved.
//

import UIKit

class FieldSurveyDetailViewController: UIViewController {
    @IBOutlet weak var classificationIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let dateFormatter = DateFormatter()

    var observation: Observation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        self.title = "Observation"
        
        if let observation = observation {
            titleLabel.text = observation.title
            dateLabel.text = dateFormatter.string(from: observation.date)
            descriptionLabel.text = observation.description
            classificationIconImageView.image = UIImage(named: observation.classification.rawValue)
        }
    }
}

//
//  FieldSurveyViewController.swift
//  Field Survey
//
//  Created by Wasay Khan on 4/29/20.
//  Copyright © 2020 Wasay Khan. All rights reserved.
//

import UIKit

class FieldSurveyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dateFormatter = DateFormatter()

    @IBOutlet weak var observationsTableView: UITableView!
    
    let jsonFileName = "field_observations"
    var observations: Observations?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        self.title = "Field Survey"
        
        observations = FieldSurveyLoader.load(jsonFileName: jsonFileName)
        
        if observations == nil {
            presentMessage(message: "Unable to load and parse \(jsonFileName).json")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observations?.observations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = observationsTableView.dequeueReusableCell(withIdentifier: "observationCell", for: indexPath)
        
        if let cell = cell as? FieldSurveyTableViewCell,
            let observation = observations?.observations[indexPath.row] {
            cell.titleLabel.text = observation.title
            cell.dateLabel.text = dateFormatter.string(from: observation.date)
            cell.classificationIconImageView.image = UIImage(named: observation.classification.rawValue)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FieldSurveyDetailViewController,
            let selectedIndexPath = observationsTableView.indexPathForSelectedRow {
            
            destination.observation = observations?.observations[selectedIndexPath.row]
        }
    }
    
    func presentMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

//
//  IngredientsTableViewCel.swift
//  NutritionAnalysis
//
//  Created by Mahmoud Khaled on 7/10/21.
//

import UIKit

class IngredientsTableViewCel: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    var nutrition: TotalNutritionModel? {
        didSet {
            guard let nutrition = nutrition else { return }
            nameLabel.text = nutrition.label
            quantityLabel.text = nutrition.quantity
            unitLabel.text = nutrition.unit
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}

//
//  IngredientsTableViewCell.swift
//  NutritionAnalysis
//
//  Created by Mahmoud Khaled on 7/10/21.
//

import UIKit

final class IngredientsTableViewCel: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var quantityLabel: UILabel!
    @IBOutlet private weak var unitLbel: UILabel!
    
    var nutrition: TotalNutritionModel? {
        didSet {
            guard let nutrition = nutrition else { return }
            nameLabel.text = nutrition.label
            quantityLabel.text = nutrition.quantity
            unitLbel.text = nutrition.unit
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

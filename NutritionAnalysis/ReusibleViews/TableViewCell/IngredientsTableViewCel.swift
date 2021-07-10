//  IngredientsTableViewCel.swift

import UIKit

final class IngredientsTableViewCel: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var quantityLabel: UILabel!
    @IBOutlet private weak var unitLabel: UILabel!
    
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
    }
}

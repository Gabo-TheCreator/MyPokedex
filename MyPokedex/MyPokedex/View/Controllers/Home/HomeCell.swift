//
//  HomeCell.swift
//  MyPokedex
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 2020/04/25.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var typesStackView: UIStackView!
    @IBOutlet weak var typesStackWidthConstraint: NSLayoutConstraint! //double-type: 90, single-type: 40
    
    @IBOutlet weak var mainTypeView: UIView!
    @IBOutlet weak var mainTypeImageView: UIImageView!
    
    @IBOutlet weak var secondaryTypeView: UIView!
    @IBOutlet weak var secondaryTypeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
        name.text = ""
        id.text = ""
        mainTypeImageView.image = nil
        secondaryTypeImageView.image = nil
        typesStackWidthConstraint.constant = 90
        secondaryTypeView.isHidden = false
    }

}

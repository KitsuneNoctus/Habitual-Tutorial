//
//  HabitImageCollectionViewCell.swift
//  Habitual
//
//  Created by Henry Calderon on 2/24/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class HabitImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var habitImage: UIImageView!
    static let identifier = "HabitImageCell"
    
    static var nib: UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    func setImage(image: UIImage){
        self.habitImage.image = image
    }
}

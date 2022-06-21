//
//  ActorViewCell.swift
//  BreakingBad
//
//  Created by Борис Павлов on 21.06.2022.
//

import UIKit

class ActorViewCell: UICollectionViewCell {
    
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var actorName: UILabel!
    
    func configure(with index: ActorModel?) {
        actorName.text = index?.name
        DispatchQueue.global().async {
            guard let stringUrl = index?.img else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.actorImage.image = UIImage(data: imageData)
            }
        }
    }
}

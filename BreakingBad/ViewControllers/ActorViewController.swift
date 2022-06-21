//
//  ActorViewController.swift
//  BreakingBad
//
//  Created by Борис Павлов on 21.06.2022.
//

import UIKit

class ActorViewController: UIViewController {
    @IBOutlet weak var portrayedLabel: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    
    var actor: ActorModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    private func fetchData() {
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.actor.img) else { return }
            DispatchQueue.main.async {
                self.navigationItem.title = self.actor.name
                self.actorImage.image = UIImage(data: imageData)
                self.portrayedLabel.text = "Actor: \(self.actor.portrayed)"
                self.nicknameLabel.text = "Role: \(self.actor.name)"
                for element in self.actor.occupation {
                    self.occupationLabel.text! += "\n\(element)"
                }
            }
        }
    }
}


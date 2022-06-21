//
//  EpisodeViewController.swift
//  BreakingBad
//
//  Created by Борис Павлов on 21.06.2022.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var charactersLabel: UILabel!
    
    var episode: EpisodesModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
    }
    
    private func fetchData() {
        DispatchQueue.main.async {
            self.navigationItem.title = "Ep.\(self.episode.episode) Season \(self.episode.season)"
            self.seasonLabel.text = self.episode.title
            for element in self.episode.characters {
                self.charactersLabel.text! += "\n\(element)"
            }
        }
    }
    
}

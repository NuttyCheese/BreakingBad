//
//  ActorListViewController.swift
//  BreakingBad
//
//  Created by Борис Павлов on 21.06.2022.
//

import UIKit

class ActorListViewController: UICollectionViewController {
    private var actors: [ActorModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "actorCell", for: indexPath) as! ActorViewCell
        let index = actors[indexPath.item]
        
        cell.configure(with: index)
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = collectionView.indexPathsForSelectedItems else { return }
        let actor = actors[index.first?.item ?? 0]
        let vc = segue.destination as! ActorViewController
        vc.actor = actor
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchDataActor(with: Link.actorURL.rawValue) { actorModel in
            self.actors = actorModel
            self.collectionView.reloadData()
        }
    }
}

//
//  EpisodeListViewController.swift
//  BreakingBad
//
//  Created by Борис Павлов on 21.06.2022.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    private var episodes: [EpisodesModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        tableView.rowHeight = 100
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as! EpisodeViewCell
        let index = episodes[indexPath.row]
        
        cell.titleAndNumberLabel.text = "Ep.\(index.episode)  Season: \(index.season) \n\(index.title)"
        cell.airDateLabel.text = "Air date: \(index.air_date)"

        return cell
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else { return }
        let vc = segue.destination as! EpisodeViewController
        vc.episode = episodes[index.row]
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchDataEpisode(with: Link.seriesURL.rawValue) { episodeModel in
            self.episodes = episodeModel
            self.tableView.reloadData()
        }
    }
}

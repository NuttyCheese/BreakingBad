//
//  NetworkManager.swift
//  BreakingBad
//
//  Created by Борис Павлов on 21.06.2022.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchDataActor(with url: String, completion: @escaping([ActorModel]) -> ()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error ?? "error")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let product = try decoder.decode([ActorModel].self, from: data)
                DispatchQueue.main.async {
                    completion(product)
                    print(product.first?.name ?? "")
                }
            } catch {
                print(error)
            }

        }.resume()
    }
    
    func fetchDataEpisode(with url: String, completion: @escaping([EpisodesModel]) -> ()) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error ?? "error")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let product = try decoder.decode([EpisodesModel].self, from: data)
                DispatchQueue.main.async {
                    completion(product)
                }
            } catch {
                print(error)
            }

        }.resume()
    }
    
    func fetchImage(from url: String?, completion: @escaping(Data) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
    
    private init() {}
}

class ImageManager {
    static var shared = ImageManager()
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
    
    private init() {}
}

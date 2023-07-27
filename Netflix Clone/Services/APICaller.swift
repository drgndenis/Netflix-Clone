//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Denis DRAGAN on 19.07.2023.
//

import Foundation

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()

    func getData(with query: String? = "", url: URL?, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = url else {return}

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}

            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}

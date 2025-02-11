
//
//  PokemonAPIService.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import Foundation

class PokemonAPIService {
    private let baseURL = "https://api.pokemontcg.io/v2/cards"
    
    // Load API Key from Build Settings
    private let apiKey: String = {
        return Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    }()
    
    private let maxPages = 3 // Limit pagination to 3 pages max

    // Fetch Pokémon cards (Optional: Query for filtering)
    func fetchCards(query: String? = nil, completion: @escaping (Result<[PokemonCard], Error>) -> Void) {
        var urlString = "\(baseURL)?pageSize=250&page=1"
        
        // Append query if filtering by name or set
        if let query = query, !query.isEmpty {
            let formattedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
            urlString += "&q=name:\(formattedQuery)"
        }
        
        guard let url = URL(string: urlString) else {
            print("❌ Invalid API URL")
            completion(.failure(APIError.invalidURL))
            return
        }
        
        print("📡 Fetching data from: \(url.absoluteString)")

        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ API Request Failed: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("📡 API Response Code: \(httpResponse.statusCode)")
                if httpResponse.statusCode != 200 {
                    completion(.failure(APIError.noData))
                    return
                }
            }

            guard let data = data else {
                print("❌ No Data Received")
                completion(.failure(APIError.noData))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(PokemonCardResponse.self, from: data)
                print("✅ Successfully Fetched \(decodedResponse.data.count) Cards")

                DispatchQueue.main.async {
                    completion(.success(decodedResponse.data))
                }
            } catch {
                print("❌ JSON Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
}

// MARK: - API Error Handling
enum APIError: Error {
    case invalidURL
    case noData
}

// MARK: - Data Models for Decoding API Response
struct PokemonCardResponse: Codable {
    let data: [PokemonCard]
}

struct PokemonCard: Identifiable, Codable {
    let id: String
    let name: String
    let set: CardSet
    let images: CardImages?

    struct CardImages: Codable {
        let small: String?
        let large: String?
    }

    struct CardSet: Codable {
        let name: String
    }
}

//
//  NetworkService.swift
//  MVVMDemo
//
//  Created by Ruslan Musagitov on 15/05/2019.
//  Copyright © 2019 Ruslan Musagitov. All rights reserved.
//

import UIKit

struct Endpoints {
    static let testRegistration = "http://star.fireworksloyalty.com/api/user/test-registration"
}

struct TestRegistrationResponse: Decodable {
    let status: Bool
    let message: String?
    let data: PersonData?
}

struct PersonData: Codable {
    let email: String
    let firstName: String
    let id: Int
    let lastName: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case firstName = "frst_name"
        case id
        case lastName = "last_name"
        case token
    }
}

class NetworkService {
    
    private class func buildUrl(with baseUrl: String, params: [String: AnyObject]) -> URL? {
        guard let baseURL = URL(string: Endpoints.testRegistration) else {
            return nil
        }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        let queryItems = params.map {
            return URLQueryItem(name: "\($0)", value: "\($1)")
        }
        urlComponents?.queryItems = queryItems
        return urlComponents?.url
    }
    
    class func testRegistration(with personDetails: PersonDetails, completion:@escaping (TestRegistrationResponse?, Error?) -> Void) {
        guard let params = personDetails.dictionary, let url = NetworkService.buildUrl(with: Endpoints.testRegistration, params: params) else {
            return completion(nil, nil)
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        request.httpMethod = "POST"
        request.addValue("ouWsAPOAWuBgABfneFBGZscPL7palTnAVYRo83sLoN4GEgLXNgew63G8P2Ej", forHTTPHeaderField: "token")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                completion(nil, err)
            } else {
                do {
                    guard let data = data else { return completion(nil, nil) }
                    let dict = try JSONSerialization.jsonObject(with: data, options: [])
                    print(dict)
                    let results = try JSONDecoder().decode(TestRegistrationResponse.self, from: data)
                    completion(results, error)
                } catch {
                    let string = String(data: data!, encoding: .utf8)
                    let error = NSError(domain:"", code: (response as! HTTPURLResponse).statusCode, userInfo:[NSLocalizedDescriptionKey: string!]) as Error
                    completion(nil, error)
                }
            }
        }.resume()
        
    }
}

extension Encodable {
    var dictionary: [String: AnyObject]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: AnyObject] }
    }
}

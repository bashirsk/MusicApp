//
//  APIService.swift
//  MusicApp
//
//  Created by Bashir Sentongo on 02/06/2019.
//  Copyright © 2019 Bashir Sentongo. All rights reserved.
//

import Foundation

class APIService {
    
    var developerToken = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjI1Mkg4NzZEMloifQ.eyJpYXQiOjE1NTk0NzA2OTIsImV4cCI6MTU3NTAyMjY5MiwiaXNzIjoiNVg5TkI5VFk3RCJ9.isHFMOh0BC5qJfraxS2LAa_O9xXG5fZLvv4yZy0KruPRvRSeuFSYchZvBb9ukvGFc7lwISL1b2y1FObiVqwT-A"
    
    /**
     - A generic network request that be used to perform many other network calls
     */
    func fetchGenericData<T: Decodable>(urlString pUrlString: String, completion pCompletion: @escaping (T?, Error?) -> Void) {
        guard let url = URL(string: pUrlString) else { return }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(developerToken)", forHTTPHeaderField: "Authorization")
        let dataDask = URLSession.shared.dataTask(with: request) { (pData, pResponse, pError) in
            if let error = pError {
                pCompletion(nil, error)
            }
            guard let data = pData else { return }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                pCompletion(result, nil)
            } catch let decodeError {
                pCompletion(nil, decodeError)
            }
        }
        dataDask.resume()
    }
}

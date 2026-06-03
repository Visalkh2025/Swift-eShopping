//
//  NetworkManager.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 22/5/26.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager() //static let shared = មានន័យថា Object មួយគត់ ដែលប្រើបានគ្រប់ទីកន្លែង
    private init() {} // ហាមអ្នកដទៃ បង្កើត Object ថ្មី
    private let baseURL = "https://fakestoreapi.com"
    
    // flexible
    func fetch<T: Decodable> (_ endpoint: String) async throws -> T {
        guard let Url = URL(string: baseURL + endpoint) else {
            throw NetworkError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: Url)
        if let http = response as? HTTPURLResponse,
           !(200...299).contains(http.statusCode){
            throw NetworkError.serverError(http.statusCode)
            // response មានប្រភេទ URLResponse (ទូទៅ)
            // HTTPURLResponse (លំអិត - មាន statusCode)
            // as? = ព្យាយាមបំប្លែង បើបរាជ័យ → nil (មិន Crash)
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(error)
            throw NetworkError.decodingError
        }
    }
}


//URLSession.sharedb         iOS Built-in HTTP Client
//await                      រង់ចាំ Server ឆ្លើយ (ប្រើពេល Background)data
//JSON                       ដែល Server ប្រគល់មក
//response                   HTTP Info (Status Code, Headers...)

// Status Code :
//200-299 ជោគជ័យ
//400 Request ខុស
//404 រកមិនឃើញ
//500 Server Error

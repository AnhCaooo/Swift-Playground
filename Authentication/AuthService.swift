//
//  AuthService.swift
//  SwiftPlayground
//
//  Created by Anh Cao on 15.2.2025.
//

import Foundation

actor AuthService {
    private var tokenTask: Task<String, Error>?
    
    private var tokenExpiryDate: Date?
    
    func getBearerToken() async throws -> String {
        if tokenTask == nil || isTokenExpired() {
            print("Token is expired or inexistent. Fetching a new token...")
            tokenTask = Task { try await fetchValidAuthToken() }
            tokenExpiryDate = Date().addingTimeInterval(60)
        } else {
            print("Using cached token")
        }
        return try await tokenTask!.value
    }
    
    private func fetchValidAuthToken() async throws -> String {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "new_auth_token_\(UUID().uuidString)"
    }
    
    private func isTokenExpired() -> Bool {
        guard let expiryDate = tokenExpiryDate else { return true }
        return expiryDate < Date()
    }
}

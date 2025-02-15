//
//  AuthViewModel.swift
//  SwiftPlayground
//
//  Created by Anh Cao on 15.2.2025.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    private let authService: AuthService
    
    @Published var token: String = ""
    @Published var errorMessage: String = ""
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    @MainActor
    func fetchTokenConcurrently() {
        for _ in 1...3 {
            Task {
                do {
                    let newToken = try await authService.getBearerToken()
                    self.token = newToken
                } catch {
                    self.errorMessage = "Failed to fetch token: \(error.localizedDescription)"
                }
            }
        }
        

        
    }
}

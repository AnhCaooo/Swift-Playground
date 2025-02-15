//
//  SwiftUIView.swift
//  SwiftPlayground
//
//  Created by Anh Cao on 15.2.2025.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var viewModel = AuthViewModel(authService: AuthService())
    
    var body: some View {
        VStack {
            Text("Welcome to Auth playground")
        }
        .onAppear() {
            viewModel.fetchTokenConcurrently()
        }
        
    }
}

#Preview {
    AuthView()
}

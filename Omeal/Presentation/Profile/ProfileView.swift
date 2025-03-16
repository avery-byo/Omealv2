//
//  ProfileView.swift
//  Omeal
//
//  Created by Allicia Viona Sagi on 16/03/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack {
                    Image("viona")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .padding(.top, 20)
                        .frame(height: 250)
                    
                    Text("Viona")
                        .font(.title2)
                        .bold()
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 20)
                .background(Color(UIColor.systemGray6))
                
                Form {
                    Section(header: Text("Preferences")) {
                        HStack {
                            Text("Favorite Food")
                            Spacer()
                            Text("Nasi Padang")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Food Preference")
                            Spacer()
                            Text("Halal")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("Food Allergies")
                            Spacer()
                            Text("Shrimp")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}

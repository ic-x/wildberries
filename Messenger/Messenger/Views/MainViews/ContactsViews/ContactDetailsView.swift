//
//  ContactDetailsView.swift
//  Messenger
//
//  Created by Clark Adams on 6/18/24.
//

import SwiftUI
import UISystem

struct ContactDetailsView: View {
    @StateObject private var viewModel: ContactDetailsViewModel
    
    init(navigationPath: Binding<NavigationPath>, contact: Binding<Contact>) {
        _viewModel = StateObject(wrappedValue: ContactDetailsViewModel(navigationPath: navigationPath, contact: contact))
    }
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            VStack {
                CustomAsyncImage(url: viewModel.contact.avatarURL) { phase in
                    switch phase {
                    case .loading:
                        CustomProgressView()
                            .frame(width: 200, height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 67))
                    case .failed:
                        Text(viewModel.initials)
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .frame(width: 100, height: 100)
                            .background(.purple)
                            .clipShape(Circle())
                    }
                }
                .padding()
                .padding(.top)
                
                Text("\(viewModel.contact.firstName) \(viewModel.contact.lastName ?? "")")
                    .font(.Typography.Heading.h2)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.text)
                
                Text(viewModel.contact.phoneNumber)
                    .font(.Typography.Other.phone)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.phoneNumber)
                    .padding(.bottom, 30)
                
                HStack {
                    ForEach(viewModel.contact.socialLinks) { link in
                        Link(destination: URL(string: link.url)!) {
                            Image(link.icon)
                                .resizable()
                                .scaledToFit()
                                .padding(12)
                                .frame(width: 71.67, height: 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(.purple, lineWidth: 2)
                                )
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button(action: {
                        if !viewModel.navigationPath.isEmpty {
                            viewModel.navigationPath.removeLast()
                        }
                    }) {
                        Image("ChevronLeft")
                    }
                    Text("Профиль")
                        .font(.Typography.Subheading.sub1)
                        .lineSpacing(30)
                        .foregroundStyle(.text)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        logMessage("Редактировать")
                    }) {
                        Image("EditIcon")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    let contact = Contact(
        firstName: "Анастасия",
        lastName: "Иванова",
        phoneNumber: "+7 999 111-11-11",
        socialLinks: [
            SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
            SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
            SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
            SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
        ],
        status: "offline",
        lastSeen: "Была вчера",
        avatarURL: URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ba3d6bf0-f660-4ce1-a12b-6e1505215b69/dftdory-89283437-0d88-4f50-b766-1c9b01ec0eba.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2JhM2Q2YmYwLWY2NjAtNGNlMS1hMTJiLTZlMTUwNTIxNWI2OVwvZGZ0ZG9yeS04OTI4MzQzNy0wZDg4LTRmNTAtYjc2Ni0xYzliMDFlYzBlYmEuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3fABL9gni0ttjk-m3B_l4h4IBRb3cMwzFwRnwVBS-XI"),
        hasStories: false,
        gradientColors: []
    )
    
    return ContactDetailsView(
        navigationPath: .constant(NavigationPath()),
        contact: .constant(contact)
    )
}

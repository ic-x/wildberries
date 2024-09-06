//
//  ContactsViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/20/24.
//

import SwiftUI

class ContactsViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var selectedContact: Contact?
    @Published var navigationPath = NavigationPath()
    @Published var contacts: [Contact] = [
        Contact(
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
        ),
        Contact(
            firstName: "Петя",
            lastName: nil,
            phoneNumber: "+7 999 222-22-22",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "online",
            lastSeen: nil,
            avatarURL: URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6d5bda7a-6a7a-492f-9478-b7d742e9f349/defvacc-6a4d6a39-6231-4870-bcb9-ad2da33404fe.png/v1/fill/w_1920,h_1920,q_80,strp/ai_generated_kandinsky_style_portrait_by_autlyx_art_defvacc-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTkyMCIsInBhdGgiOiJcL2ZcLzZkNWJkYTdhLTZhN2EtNDkyZi05NDc4LWI3ZDc0MmU5ZjM0OVwvZGVmdmFjYy02YTRkNmEzOS02MjMxLTQ4NzAtYmNiOS1hZDJkYTMzNDA0ZmUucG5nIiwid2lkdGgiOiI8PTE5MjAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.cEOqmjwLyR06XLjTLNXObQnXo11xmFr-4iGS0OzgeUQ"),
            hasStories: false,
            gradientColors: []
        ),
        Contact(
            firstName: "Маман",
            lastName: nil,
            phoneNumber: "+7 999 333-33-33",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "offline",
            lastSeen: "Была 3 часа назад",
            avatarURL: URL(string: "https://img.goodfon.com/original/3840x2160/d/d1/girl-art-portrait-stable-diffusion-neuronet-ai-art.jpg"),
            hasStories: true,
            gradientColors: [.variant1Color1, .variant1Color2]
        ),
        Contact(
            firstName: "Арбуз",
            lastName: "Дыня",
            phoneNumber: "+7 999 444-44-44",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "online",
            lastSeen: nil,
            avatarURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/04/HAZAN_AI_portrait_2023.jpg"),
            hasStories: false,
            gradientColors: []
        ),
        Contact(
            firstName: "Иван",
            lastName: "Иванов",
            phoneNumber: "+7 999 555-55-55",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "online",
            lastSeen: nil,
            avatarURL: nil,
            hasStories: false,
            gradientColors: []
        ),
        Contact(
            firstName: "Лиса",
            lastName: "Алиса",
            phoneNumber: "+7 999 666-66-66",
            socialLinks: [
                SocialLink(name: "X", url: "https://x.com", icon: "TwitterIcon"),
                SocialLink(name: "Instagram", url: "https://instagram.com", icon: "InstagramIcon"),
                SocialLink(name: "LinkedIn", url: "https://linkedin.com", icon: "LinkedInIcon"),
                SocialLink(name: "Facebook", url: "https://facebook.com", icon: "FacebookIcon")
            ],
            status: "offline",
            lastSeen: "Была 30 минут назад",
            avatarURL: nil,
            hasStories: true,
            gradientColors: [.variant2Color1, .variant2Color2]
        ),
    ]
    
    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter { $0.firstName.contains(searchText) || ($0.lastName?.contains(searchText) ?? false) }
        }
    }
}

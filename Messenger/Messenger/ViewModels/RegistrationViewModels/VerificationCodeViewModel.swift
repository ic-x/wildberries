//
//  VerificationCodeViewModel.swift
//  Messenger
//
//  Created by Clark Adams on 6/13/24.
//

import SwiftUI

class VerificationCodeViewModel: ObservableObject {
    @Published var showingAlert = false
    @Published var isCodeCorrect = false
    @Published var isButtonDisabled = false
    @Published var countdownTimer: Timer?
    @Published var remainingSeconds = 0

    private let correctCode = "1234"
    private let cooldownSeconds = 10

    var verificationData: VerificationData

    init(phoneNumber: String) {
        self.verificationData = VerificationData(phoneNumber: phoneNumber)
    }

    func validateCode(_ code: String) {
        verificationData.addCode(code, isCorrect: code == correctCode)
        
        if verificationData.validateCode(code) {
            isCodeCorrect = true
        } else if code.count == 4 && code != correctCode {
            showingAlert = true
        }
    }

    func resetCode() {
        verificationData.resetCodes()
    }

    func startCooldown() {
        isButtonDisabled = true
        remainingSeconds = cooldownSeconds
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                self.stopCooldown()
            }
        }
    }

    func stopCooldown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        isButtonDisabled = false
        remainingSeconds = 0
    }
}

//
//  VerificationData.swift
//  Messenger
//
//  Created by Clark Adams on 7/18/24.
//

import Foundation

struct VerificationCode {
    let code: String
    let isCorrect: Bool
}

class VerificationData: Sequence {
    var phoneNumber: String
    private var codes: [VerificationCode] = []

    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }

    func addCode(_ code: String, isCorrect: Bool) {
        let verificationCode = VerificationCode(code: code, isCorrect: isCorrect)
        codes.append(verificationCode)
    }

    func makeIterator() -> IndexingIterator<[VerificationCode]> {
        return codes.makeIterator()
    }
    
    func validateCode(_ code: String) -> Bool {
        return codes.contains { $0.code == code && $0.isCorrect }
    }
    
    func lastEnteredCode() -> VerificationCode? {
        return codes.last
    }

    func resetCodes() {
        codes.removeAll()
    }
}

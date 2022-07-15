// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let passwordResetAuthResultData = try? newJSONDecoder().decode(PasswordResetAuthResultData.self, from: jsonData)

import Foundation

// MARK: - PasswordResetAuthResultData
struct PasswordResetAuthResultData: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let authNumber: String
}

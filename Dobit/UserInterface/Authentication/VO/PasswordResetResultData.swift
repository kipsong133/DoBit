// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let passwordResetResultData = try? newJSONDecoder().decode(PasswordResetResultData.self, from: jsonData)

import Foundation

// MARK: - PasswordResetResultData
struct PasswordResetResultData: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let registerResultData = try? newJSONDecoder().decode(RegisterResultData.self, from: jsonData)

import Foundation

// MARK: - RegisterResultData
struct RegisterResultData: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result
}

// MARK: - Result
struct Result: Codable {
    let userIdx: Int
    let jwt: String
}

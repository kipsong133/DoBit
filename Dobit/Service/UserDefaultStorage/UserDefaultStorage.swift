//
//  UserDefaultStorage.swift
//  Dobit
//
//  Created by 김우성 on 2022/07/09.
//

import Foundation

class UserDefaultStorage {
    static let storage = UserDefaults.standard
    
    static func getString(key: UserDefaultKey) -> Bool {
        return false
    }
    
    static func setString(key: UserDefaultKey, value: String) -> Bool {
        return false
    }
    
    static func getBool(key: UserDefaultKey) -> Bool {
        return storage.bool(forKey: key.rawValue)
    }
    
    static func setBool(key: UserDefaultKey, value: Bool) -> Bool {
        storage.set(value, forKey: key.rawValue)
        return true
    }
    
    static func getString(key: UserDefaultKey) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
}
//UserDefaultStorage.getBool(key: UserDefaultKey.accessToken)

//
//  DateHelper.swift
//  HW1_1
//
//  Created by MacBook Pro on 02/08/23.
//

import Foundation
/// Class hepls with Data transformation
final class DateHelper {
    /// Transforms Date to uslful format
    /// - Parameter date: non formated date
    /// - Returns: date in string
    static func getDate(date: Date?) -> String {
        guard let date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY hh:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
}

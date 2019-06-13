//
//  WCDBManager.swift
//  WanderingEarth
//
//  Created by 王叶庆 on 2019/4/23.
//  Copyright © 2019 王叶庆. All rights reserved.
//

import Foundation
import WCDBSwift
import SwiftyBeaver

class WCDBManager {
    var dbName: String = "Wandering3215Earth"
    static let shared: WCDBManager = WCDBManager()
    var db: Database?
    init() {
        #if DEBUG
        Database.globalTrace(ofSQL: { (sql) in
            SwiftyBeaver.info("SQL: \(sql)")
        })
        #endif
    }
    private var tables: [String : AnyClass] = [:]
    func prepare(with namespace: String? = nil) {
        guard namespace != dbName else {
            return
        }
        dbName = namespace ?? "Wandering3215Earth"
        db = Database(withFileURL: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("db/wcdb_\(dbName).db"))
        
    }
    public func createTable<Root>(of type: Root) where Root: TableCodable {
        do {
            try db!.create(table: "\(Root.self)", of: Root.self)
        } catch let error {
            SwiftyBeaver.error(error)
        }
    }
    
    static func save<T>(_ objct: T, _ orUpdate: Bool = false) where T: TableCodable {
        guard let db = WCDBManager.shared.db else {
            SwiftyBeaver.error("db没有实例化")
            return
        }
        do {
            if orUpdate {
                try db.insertOrReplace(objects: objct, intoTable: "\(T.self)")
            } else {
                try db.insert(objects: objct, intoTable: "\(T.self)")
            }
        } catch let error {
            SwiftyBeaver.error(error)
        }
    }
    
    static func delete<T>(_ table: T.Type, where condition: Condition? = nil) {
        do {
            try WCDBManager.shared.db?.delete(fromTable: "\(table)", where: condition)
        } catch let error {
            SwiftyBeaver.error(error)
        }
       
    }
}

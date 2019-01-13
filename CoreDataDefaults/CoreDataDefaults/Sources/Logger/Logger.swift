//
//  Logger.swift
//  CoreDataDefaults
//
//  Created by Ankit Thakur on 1/11/19.
//

import Foundation
import SwiftyBeaver

private let log = Logger.get()

internal struct CDLogger {
    static func debug(apiName: String, data: Data) {
        log.debug("\(apiName):\(String(data: data, encoding: .utf8) ?? "null value")")
    }

    static func debug(apiName: String, object: Any) {
        log.debug("\(apiName):\(object)")
    }

    static func info(apiName: String, data: Data) {
        log.info("\(apiName):\(String(data: data, encoding: .utf8) ?? "null value")")
    }

    static func info(apiName: String, object: Any) {
        log.info("\(apiName):\(object)")
    }

    static func error(apiName: String, data: Data) {
        log.error("\(apiName):\(String(data: data, encoding: .utf8) ?? "null value")")
    }

    static func error(apiName: String, object: Any) {
        log.error("\(apiName):\(object)")
    }

    static func verbose(apiName: String, data: Data) {
        log.verbose("\(apiName):\(String(data: data, encoding: .utf8) ?? "null value")")
    }

    static func verbose(apiName: String, object: Any) {
        log.verbose("\(apiName):\(object)")
    }
}

internal class Logger {
    private static var ready = false
    public static func get() -> SwiftyBeaver.Type {
        let logger = SwiftyBeaver.self
        if !Logger.ready {
            Logger.ready = true
            logger.addDestination(ConsoleDestination())
        }
        return logger
    }
}

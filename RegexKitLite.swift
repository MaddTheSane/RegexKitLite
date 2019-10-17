//
//  RegexKitLite.swift
//  RegexKitLite
//
//  Created by C.W. Betts on 10/16/19.
//  Copyright © 2019 John Engelhart. All rights reserved.
//

import Foundation

extension NSString {
	open func range(ofRegex regex: String, options: RKLRegexOptions = [], in range: NSRange, capture: Int) throws -> NSRange {
		var err: NSError? = nil
		let retRange = __range(ofRegex: regex, options: options, in: range, capture: capture, error: &err)
		if retRange.location == NSNotFound {
			throw err ?? NSError(domain: NSCocoaErrorDomain, code: -1, userInfo: nil)
		}
		return retRange
	}
	
	open func captureCount(options: RKLRegexOptions = []) throws -> Int {
		var err: NSError? = nil
		let toRet = __captureCount(options: options, error: &err)
		if toRet == -1 {
			throw err ?? NSError(domain: NSCocoaErrorDomain, code: -1, userInfo: nil)
		}
		return toRet
	}
	
	open func replacingOccurrences(ofRegex regex: String!, options: RKLRegexOptions = [], in range: NSRange, enumerationOptions: RKLRegexEnumerationOptions = [], using block: @escaping ((Int, UnsafePointer<NSString?>?, UnsafePointer<NSRange>?, UnsafeMutablePointer<ObjCBool>?) -> String?)) throws -> String {
		var err: NSError? = nil
		guard let outVal = __replacingOccurrences(ofRegex: regex, options: options, in: range, error: &err, enumerationOptions: enumerationOptions, using: block) else {
			throw err ?? NSError(domain: NSCocoaErrorDomain, code: -1, userInfo: nil)
		}
		return outVal
	}
}

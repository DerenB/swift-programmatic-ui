//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Deren Bozer on 7/1/24.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete the request. Check Connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server is invalid."
}

//
//  API.swift
//  PokeMap
//
//  Created by Ivan Bruel on 20/07/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import Foundation
import Moya

enum API {
  
  case Pokemons(latitude: Double, longitude: Double)
}

extension API: TargetType {
  
  var baseURL: NSURL {
    return NSURL(string: "https://pokevision.com")!
  }
  
  var path: String {
    switch self {
    case let .Pokemons(latitude, longitude):
      return "/map/data/\(latitude)/\(longitude)"
    }
  }
  
  var method: Moya.Method {
    switch self {
    default:
      return .GET
    }
  }
  
  var parameters: [String: AnyObject]? {
    switch self {
    default:
      return nil
    }
  }
  
  var sampleData: NSData {
    switch self {
    case .Pokemons:
      return JSONReader.readJSONData("Pokemons")
    }
  }
  
  var headers: [String: String]? {
    switch self {
    default:
      return nil
    }
  }
  
  var parameterEncoding: ParameterEncoding {
    switch self {
    default:
      return method == .GET ? .URL : .JSON
    }
  }
  
  var multipartBody: [MultipartFormData]? {
    return nil
  }

  var url: String {
    return "\(baseURL)\(path)"
  }
}
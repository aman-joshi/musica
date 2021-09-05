//
//  StateHandler.swift
//  Musica
//
//  Created by Aman Joshi on 05/09/21.
//

import Foundation

enum State:Equatable {
  case initial
  case loading
  case success
  case error(msg:String)
}

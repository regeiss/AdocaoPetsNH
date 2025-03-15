//
//  Abrigo.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 10/03/25.
//

import Foundation
import SwiftData

@Model
class Abrigo {
  var id: String = UUID().uuidString
  var nome: String = ""
  var ativo: Bool = true
  var creationDate: Date = Date.now

 init(id: String, nome: String, ativo: Bool, creationDate: Date) {
    self.id = id
    self.nome = nome
    self.ativo = ativo
    self.creationDate = creationDate
  }
}

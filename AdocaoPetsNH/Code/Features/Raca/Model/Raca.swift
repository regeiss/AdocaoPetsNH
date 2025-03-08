//
//  Raca.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 03/03/25.
//

import Foundation
import SwiftData

@Model class Raca {
  var id: String = UUID().uuidString
  var nome: String = ""
  @Relationship(deleteRule: .cascade, inverse: \Pet.raca)
  var pet: [Pet]?
  var ativo: Bool = true

  init(id: String, nome: String, ativo: Bool) {
    self.id = id
    self.nome = nome
    self.ativo = ativo
  }
}

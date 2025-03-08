//
//  Pelagem.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 03/03/25.
//
import Foundation
import SwiftData

@Model class Pelagem {
  var id: String = UUID().uuidString
  var nome: String = ""
  var pet: [Pet]?
  var ativo: Bool = true

  init(id: String, nome: String, ativo: Bool) {
    self.id = id
    self.nome = nome
    self.ativo = ativo
  }
}

//
//  Pet.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 11/09/24.
//

import SwiftData
import UIKit

@Model class Pet {
  var id: String = UUID().uuidString
  var nome: String = ""
  var ativo: Bool = true
  var isFavorite: Bool = false
  @Attribute(.externalStorage) var imagem: Data?
  var raca: Raca?
  var porte: Porte?
  var pelagem: Pelagem?
  var cor: Cor?
  var creationDate: Date = Date.now

  init(id: String, nome: String, ativo: Bool, isFavorite: Bool, imagem: Data? = nil, creationDate: Date) {
    self.id = id
    self.nome = nome
    self.ativo = ativo
    self.isFavorite = isFavorite
    self.imagem = imagem
    self.creationDate = creationDate
    self.cor = nil
    self.pelagem = nil
    self.porte = nil
    self.raca = nil
  }
}

extension  Pet {

}

//
//  Pet.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 11/09/24.
//

import SwiftData
import UIKit

@Model class Pet {
  @Attribute(.unique) var id: String
  var nome: String
  var ativo: Bool = true
  var isFavorite: Bool = false
  @Attribute(.externalStorage) var imagem: Data?
  var image: UIImage? {
    if let imagem {
      return UIImage(data: imagem)
    } else {
      return nil
    }
  }
  var creationDate: Date

  init(id: String, nome: String, ativo: Bool, isFavorite: Bool, imagem: Data? = nil, creationDate: Date) {
    self.id = id
    self.nome = nome
    self.ativo = ativo
    self.isFavorite = isFavorite
    self.imagem = imagem
    self.creationDate = creationDate
  }
}

extension  Pet {

}

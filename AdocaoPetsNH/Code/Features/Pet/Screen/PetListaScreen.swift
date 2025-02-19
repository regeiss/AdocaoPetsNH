//
//  PetListScreen.swift
//  ProjetoCusco
//
//  Created by Roberto Edgar Geiss on 11/09/24.
//

import SwiftUI
import SwiftData

struct PetListaScreen: View
{
  @State private var searchText = ""
  @Query var pets: [Pet]
  
  var body: some View
  {
    NavigationView
    {
      List
      {
        ForEach(pets)
        {
          PetRow(pet: $0)
        }
      }
    }
  }
}

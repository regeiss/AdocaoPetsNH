//
//  PetGridItem.swift
//  AdocaoPetsNH
//
//  Created by Roberto Edgar Geiss on 19/02/25.
//

import SwiftUI

struct PetGridItem: View {
  var pet: Pet

  var body: some View {
    ZStack {
      NavigationLink(value: pet.id) {
        PetViewPort(pet: pet)
      }
      .buttonStyle(.plain)

      VStack {
        Header(pet: pet)
        Spacer()
        //        SupplyGauges(pet: pet)
      }
    }
    .contentShape(.containerRelative)
    .containerShape(.rect(cornerRadius: 20))
  }

  struct Header: View {
    var pet: Pet

    var body: some View {
      HStack {
        Image(systemName: "photo")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .clipShape(Circle())
          .padding()
          .frame(width: 100, height: 100)

        Text(pet.nome)
          .font(.callout)
          .padding(8)
          .background()
          .allowsHitTesting(false)

        Spacer()

        Button {
          pet.isFavorite.toggle()
        } label: {
          Label("Favorito", systemImage: "star")
            .symbolVariant(pet.isFavorite ? .fill : .none)
            .contentTransition(.symbolEffect(pet.isFavorite ? .replace.upUp : .replace.downUp))
            .padding(8)
            .background(in: .circle)
        }
        .buttonStyle(.plain)
        .buttonBorderShape(.circle)
        .labelStyle(.iconOnly)
      }
      .foregroundStyle(Color.secondary)
      .backgroundStyle(.regularMaterial)
      .padding(8)
    }
  }
}

#Preview {
  PetGridItem(pet: Pet(id: UUID().uuidString, nome: "Test a dog", ativo: true, isFavorite: true, creationDate: Date()))
}

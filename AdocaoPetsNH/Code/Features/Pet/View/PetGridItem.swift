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
        Text(pet.nome)
          .font(.callout)
          .padding(8)
          .background()
          .allowsHitTesting(false)

        Spacer()

        Button {
          pet.isFavorite.toggle()
        } label: {
          Label("Favorite", systemImage: "star")
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

//  struct SupplyGauges: View {
//    var backyard: Backyard
//
//    var body: some View {
//      HStack {
//        BackyardSupplyGauge(backyard: backyard, supplies: .food)
//          .scaleEffect(0.65)
//          .padding(8)
//          .frame(width: 44, height: 44)
//          .background(in: .circle)
//        Spacer()
//        BackyardSupplyGauge(backyard: backyard, supplies: .water)
//          .scaleEffect(0.65)
//          .padding(8)
//          .frame(width: 44, height: 44)
//          .background(in: .circle)
//      }
//      .padding(8)
//      .backgroundStyle(.regularMaterial)
//      .allowsHitTesting(false)
//    }
//  }
}

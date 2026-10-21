//
//  DepartamentoView.swift
//  Depas navigation modal
//
//  Created by WIN603 on 20/10/26.
//

import SwiftUI

struct DepartamentoView: View {
    @Binding var departamento: Departamento
    @Binding var departamentoReservadoId: UUID?
    @Binding var mensajeAlerta: String
    @Binding var mostrarAlerta: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 12) {
                Image(departamento.imagen)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 6) {
                    Text(departamento.ubicacion)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.black)

                    Text(departamento.precio)
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Button(action: {
                        if departamentoReservadoId == departamento.id {
                            departamentoReservadoId = nil
                        } else {
                            departamentoReservadoId = departamento.id
                        }
                    }) {
                        Text(departamentoReservadoId == departamento.id ? "Reservado" : "Reservar")
                            .font(.caption)
                            .bold()
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(departamentoReservadoId == departamento.id ? Color.green : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }

                Spacer()

                Button(action: {
                    departamento.esFavorito.toggle()
                    if departamento.esFavorito {
                        mensajeAlerta = "Departamento de \(departamento.ubicacion) ha sido establecido como preferido exitosamente"
                        mostrarAlerta = true
                    }
                }) {
                    Image(systemName: departamento.esFavorito ? "heart.fill" : "heart")
                        .font(.title2)
                        .foregroundColor(departamento.esFavorito ? .red : .gray)
                }
            }

            NavigationLink(destination: DetalleDepartamentoView(departamento: departamento)) {
                HStack {
                    Text("Ver detalles y características")
                        .font(.caption)
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .foregroundColor(.blue)
                .padding(.top, 4)
            }
        }
        .modifier(EstiloBorde())
    }
}

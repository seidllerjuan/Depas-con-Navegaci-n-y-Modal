//
//  DetalleDepartamentoView.swift
//  Depas navigation modal
//
//  Created by WIN603 on 20/10/26.
//
import SwiftUI

struct DetalleDepartamentoView: View {
    let departamento: Departamento
    @State private var mostrarModal: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                Image(departamento.imagen)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(15)
                    .clipped()

                HStack {
                    VStack(alignment: .leading) {
                        Text(departamento.ubicacion)
                            .font(.title)
                            .bold()
                        Text(departamento.precio)
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }

                Divider()

                Text("Características y Servicios")
                    .font(.title2)
                    .bold()

                VStack(alignment: .leading, spacing: 12) {
                    ForEach(departamento.caracteristicas, id: \.self) { item in
                        HStack(spacing: 12) {
                            Image(systemName: iconoParaCaracteristica(item))
                                .foregroundColor(.blue)
                                .frame(width: 25)
                            Text(item)
                                .font(.body)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                Button(action: {
                    mostrarModal = true
                }) {
                    HStack {
                        Image(systemName: "square.grid.2x2.fill")
                        Text("Ver Diagrama y Fotos")
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Detalles")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $mostrarModal) {
            ModalFotosView(departamento: departamento)
        }
    }

    func iconoParaCaracteristica(_ caracteristica: String) -> String {
        if caracteristica.contains("Wi-Fi") { return "wifi" }
        if caracteristica.contains("Aire") { return "air.conditioner.horizontal" }
        if caracteristica.contains("Cocina") { return "cooktop" }
        if caracteristica.contains("Refrigerador") { return "refrigerator" }
        if caracteristica.contains("Cama") { return "bed.double" }
        if caracteristica.contains("Elevador") { return "arrow.up.arrow.down" }
        if caracteristica.contains("Estacionamiento") { return "car.fill" }
        return "checkmark.circle"
    }
}

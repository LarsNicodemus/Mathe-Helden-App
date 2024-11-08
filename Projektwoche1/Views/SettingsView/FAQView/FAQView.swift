//
//  FAQView.swift
//  TraumJobs
//
//  Created by Andreas Beer on 29.10.24.
//

import SwiftUI

struct FAQView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Häufig gestellte Fragen (FAQ)")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Text("1. Wie funktioniert die App?")
                .bold()
                .underline()
            Text("\nDiese App ist eine Lern-App für Mathematik, die Kindern der Klassen 1-4 hilft, ihre Mathekenntnisse zu verbessern. Jede Woche gibt es neue Aufgaben, die Punkte bringen. Es gibt auch besondere Bonusaufgaben, die besonders schwierig sind und Extra-Punkte bringen!\n\n")
            
            Text("2. Was sind wöchentliche und normale Aufgaben?")
                .bold()
                .underline()
            Text("\nDie wöchentlichen Aufgaben erscheinen jede Woche neu und geben Extra-Punkte, wenn sie gelöst werden. Die normalen Aufgaben sind Matheaufgaben, die du jederzeit machen kannst. Sie bringen dir ebenfalls Punkte und trainieren deine Fähigkeiten in verschiedenen Schwierigkeitsgraden.\n\n")
            
            Text("3. Kann ich die Schwierigkeit der Aufgaben anpassen?")
                .bold()
                .underline()
            Text("\nJa, bei den Übungsaufgaben kannst du die Schwierigkeit selbst wählen. Du kannst zwischen leicht, mittel und schwer auswählen, um die Aufgaben deinem Können anzupassen.\n\n")
            
            Text("4. Was ist das Leaderboard und wie funktioniert es?")
                .bold()
                .underline()
            Text("\nIm Leaderboard siehst du die besten Punktesammler. Es gibt ein monatliches und ein jährliches Leaderboard, die die Top 5 Spieler anzeigen. Die besten Spieler können am Ende des Monats und am Ende des Jahres tolle Preise gewinnen!\n\n")
            
            Text("5. Welche Preise kann ich gewinnen?")
                .bold()
                .underline()
            Text("\nDie besten 5 Spieler des Monats erhalten kleine Belohnungen wie Hausaufgabengutscheine oder andere hilfreiche Dinge für die Schule. Die besten 5 Spieler des Jahres bekommen größere Preise! Dein Lehrer oder deine Lehrerin kann dir mehr über die Preise erzählen.\n\n")
            
            Text("6. Was sind Bonusaufgaben?")
                .bold()
                .underline()
            Text("\nBonusaufgaben sind besonders knifflige Matheaufgaben, die mehr Punkte bringen als normale Aufgaben. Sie sind die schwierigsten Aufgaben in der App und bieten eine Herausforderung für alle, die sich trauen!\n\n")
            
            Text("7. Was passiert, wenn ich viele Punkte sammle?")
                .bold()
                .underline()
            Text("\nJe mehr Punkte du sammelst, desto schwierigere Aufgaben werden freigeschaltet. So wirst du nach und nach besser und bekommst immer neue Herausforderungen!\n\n")
            
            Text("8. Was mache ich, wenn ich Hilfe bei einer Aufgabe brauche?")
                .bold()
                .underline()
            Text("\nWenn du bei einer Aufgabe nicht weiterkommst, frage am besten einen Erwachsenen oder deinen Lehrer oder deine Lehrerin. Die App bietet dir Aufgaben zum Üben, und manchmal hilft ein Tipp von jemandem, der sich auskennt!\n\n")
            
            Text("9. Kann ich mein Ergebnis verbessern?")
                .bold()
                .underline()
            Text("\nJa! Du kannst die Aufgaben wiederholen und deine Punktzahl verbessern. Die App speichert deine besten Leistungen, sodass du immer sehen kannst, wie gut du bist.\n\n")
        }
        .padding()
    }
}

#Preview {
    FAQView()
}


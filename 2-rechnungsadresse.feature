Feature: Rechnungsadresse

    Die zweite Seite ist die Rechnungsadresse. Hier sollen die Nutzer ihre Rechnungsadresse eingeben können, welche die Pflichtfelder Anrede, Vornamen, Nachnamen, Straße, Hausnummer, Postleitzahl sowie die E-Mail-Adresse umfassen.

    Scenario: Kundin kommt auf die Rechnungsadresse-Seite vom Warenkorb aus
        When die Rechnungsadresse-Seite zum ersten Mal aufgerufen wird
        Then sollen die Eingabefelder leer sein
    
    Scenario: Kundin kommt auf die Rechnungsadresse-Seite von der Lieferadresse-Seite aus
        Given die Kundin hatte bereits zuvor die Rechnungsadresse ausgefüllt
        Then sollen die zuvor eingegebenen Adressdaten weiterhin vorhanden sein
    
    Scenario: Kundin kann ihre Rechnungsadresse eingeben
        When die Kundin die Rechnungsadresse-Seite betritt
        Then soll sie die Möglichkeit haben
        * eine Anrede anzugeben
        * den Vornamen eingeben zu können
        * den Nachnamen eingeben zu können
        * die Straße eingeben zu können
        * die Hausnummer eingeben zu können
        * die Postleitzahl (PLZ) eingeben zu können
        * die Stadt eingeben zu können
        * die E-Mail-Adresse eingeben zu können
    
    Scenario: Kundin soll zur nächsten Seite wechseln können
        Given die Kundin hat alle Felder ausgefüllt
        When sie auf den "weiter"-Button klickt
        Then soll sie auf die Seite "Lieferdaten" gelangen
    
    Scenario: Kundin füllt nicht alle benötigten Felder aus und klickt auf "weiter"
        Given die Kundin hat alle Felder außer der Hausnummer eingegebenen
        When sie auf "weiter" klickt
        Then soll sie informiert werden, dass sie alle Felder ausfüllen muss
    
    Scenario: Kundin gibt invalide Daten ein
        When die Kundin eine andere Rechnungsadresse eingibt
        * Vorname und Nachname Sonderzeichen enthalten außer Bindestriche enthält
        * Straße Sonderzeichen außer Bindestriche und Punkte enthält
        * Hausnummer. Sonderzeichen enthält
        * PLZ alles andere außer Zahlen enthält
        * Stadt keine deutsche Stadt ist
        * das @ bei der E-Mail-Adresse fehlt
        Then soll eine Warnung angezeigt werden und der "weiter"-Button blockiert werden
Pour lancer les tests UI, suivre les étapes suivantes : 
1. Sélectionner la target `TchapX-Production` et éditer son Scheme :

<img width="462" alt="Image" src="https://github.com/user-attachments/assets/5bb0d569-0740-4391-943b-53ef31897580" />

2. Sélectionner le test UITests (qui n'est pas le test par défaut) :

<img width="934" alt="Image" src="https://github.com/user-attachments/assets/bb618431-f07b-4450-818c-84d44f395f7e" />

3. Lancer le `Test Product` depuis le menu `Product` de Xcode :

<img width="425" alt="Image" src="https://github.com/user-attachments/assets/b292bfd4-fe57-4e4a-84f6-be9dd4d79285" />

Attention !

Ces tests UI doivent être lancés sur simulateur sous iOS 18 :
- soit iPhone 16
- soit iPad 10

Ce simulateur doit avoir été renommé `iPhone-18.1` ou `iPad-18.1`, ce nom servant à générer les noms de fichier des captures d'écran. Le test compare la capture actuelle à la précédente (qu'il doit donc retrouver par son nom) pour savoir si un élément UI a changé.

<img width="1056" alt="Image" src="https://github.com/user-attachments/assets/60031203-75b8-4649-85aa-c18ccc267a46" />

Les tests UI sont faits pour être exécutés sur la target TchapX-Production.

Les scénarios sont les classes XCTests définies dans le dossier `UITests/Sources`.

Notes :
Les captures générées sont stockées dans le dossier `UITests/Sources/__Snapshots__/Application`.

Certains paramètres du simulateur comme la langue ou la géolocalisation peuvent être réglés dans le fichier `TchapX/UITests/SupportingFiles/UITests.xctestplan`. (ne semble pas fonctionner)

Documentation :
-  https://developer.apple.com/documentation/xctest


Les tests Preview sont accessibles de la même manière.
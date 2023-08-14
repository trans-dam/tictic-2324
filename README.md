# TicTic 📱
> TicTic : L'harmonie financière dans vos groupes, en toute simplicité !



Libérez-vous des soucis financiers et concentrez-vous sur l'essentiel avec **TicTic**. Gérez vos dépenses de groupe en toute simplicité et profitez de chaque moment ensemble, en toute sérénité. TicTic est une application intelligente de gestion de dépenses de groupe conçue pour simplifier et harmoniser les finances partagées entre les membres d'un groupe, que ce soit en colocation, en voyage, en projet d'équipe ou tout autre type de regroupement. Avec TicTic, les calculs manuels et les confusions liées aux dépenses sont désormais de l'histoire ancienne. Profitez pleinement de vos moments ensemble en toute tranquillité, en laissant TicTic gérer vos finances.



## Fonctionnalités principales :

Voici les user stories améliorées et corrigées en format Markdown :

1. **Découvrir l'application** *(nouvel utilisateur)* :
   - [ ] Je peux choisir de passer par des écrans explicatifs sur le fonctionnement de l'application lors de l'onboarding, mais cela n'est pas obligatoire. J'ai la liberté de le passer si je le souhaite.

2. **Authentification** *(nouvel utilisateur)* :
   - [ ] Je peux créer un compte en utilisant mon adresse e-mail et un mot de passe.
   - [ ] Je peux me connecter à mon compte en utilisant mon adresse e-mail et un mot de passe.

3. **Gestion des groupes** *(personne connectée)* :
   - [ ] Je peux créer plusieurs groupes distincts.
   - [ ] En tant que membre d'un groupe, je peux voir le code d'accès du groupe et le partager avec d'autres personnes.
   - [ ] En tant que membre d'un groupe, je peux inviter d'autres personnes.
   - [ ] Je peux également rejoindre un groupe en utilisant un code numérique ou un QR-code.
   
4. **Gestion des dépenses** *(personne connectée et membre d'un groupe)* :
   - [ ] Je peux saisir facilement les dépenses en indiquant le montant dépensé, la répartition par membre, le nom de la dépense et éventuellement fournir une preuve.
   - [ ] Je peux modifier ou supprimer une dépense si j'en suis l'auteur.
   - [ ] À tout moment, je peux voir les contributions individuelles et les montants à rembourser, assurant une équité parfaite entre tous les membres du groupe.
   - [ ] Je peux consulter l'historique détaillé des transactions et le partager avec les autres membres du groupe.
   - [ ] Je reçois des notifications pour chaque nouvelle dépense saisie dans le groupe, ce qui me permet de rester informé en temps réel des dépenses partagées.



## Public cible

Le public cible de TicTic est constitué de personnes qui valorisent la simplicité, la convivialité et la gestion intelligente de leurs dépenses de groupe. Ils cherchent à optimiser leur expérience de groupe en évitant les tracas liés aux calculs manuels et aux disputes financières, tout en se concentrant sur le plaisir et les moments partagés avec leurs proches.

Voici quelques idées de groupes : jeunes adultes et professionnels en colocation, Voyageurs en groupe, Groupes d'amis et de familles, Équipes de projets et associés, etc.



## Structure du dépot 

~~~text
tictic/
│
├── code/
│   ├── titic/
│   │
│   └── README.md
│
├── maquettes/
│   ├── titic.xd
│   ├── titic.pdf
│   ├── ...
│
├── resources/
│   ├── logo.png
│   ├── icons/
│   │
│   └── fonts/
├── docs/
│   ├── user_manual.md
│   ├── ...
│
└── LICENSE

~~~

- Le dossier `code` contient le code source de l'application.
- Dans le dossier `maquettes` se trouvent les ressources graphiques
- Le dossier `resources` contient toutes les ressources graphiques nécessaires à l'application, telles que les logos, images de fond, icônes, polices de caractères, etc.
- La documentation se trouve dans le dossier `docs`. 
- Le fichier LICENSE à la racine du dépôt indique les termes et conditions de la licence sous laquelle le code source est distribué.

## Installation 



0. **Prérequis** : assurez-vous d'avoir installé Flutter et les dépendances requises sur votre système. Consultez la documentation officielle de Flutter pour les instructions d'installation spécifiques à votre système d'exploitation.
1. **Ouvrir le terminal** : ou une invite de commande dans le répertoire racine de votre projet (le répertoire qui contient le fichier pubspec.yaml).
2. **Télécharger les dépendances** : exécutez la commande `flutter pub get` pour récupérer toutes les dépendances spécifiées dans le fichier pubspec.yaml. Cela installera les packages requis pour l'application.
3. Exécuter l'application : utilisez la commande `flutter run` pour exécuter l'application sur un émulateur Android ou iOS ou sur un appareil physique connecté en mode développeur. Assurez-vous que l'émulateur ou l'appareil est configuré et prêt à être utilisé.

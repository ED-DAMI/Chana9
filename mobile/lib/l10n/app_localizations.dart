import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('fr'),
  ];

  /// No description provided for @appName.
  ///
  /// In fr, this message translates to:
  /// **'Chana9'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In fr, this message translates to:
  /// **'Le marché marocain du bétail'**
  String get tagline;

  /// No description provided for @login.
  ///
  /// In fr, this message translates to:
  /// **'Connexion'**
  String get login;

  /// No description provided for @register.
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get register;

  /// No description provided for @logout.
  ///
  /// In fr, this message translates to:
  /// **'Déconnexion'**
  String get logout;

  /// No description provided for @phone.
  ///
  /// In fr, this message translates to:
  /// **'Téléphone'**
  String get phone;

  /// No description provided for @password.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le mot de passe'**
  String get confirmPassword;

  /// No description provided for @fullName.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get fullName;

  /// No description provided for @loginButton.
  ///
  /// In fr, this message translates to:
  /// **'Se connecter'**
  String get loginButton;

  /// No description provided for @registerButton.
  ///
  /// In fr, this message translates to:
  /// **'Créer mon compte'**
  String get registerButton;

  /// No description provided for @noAccount.
  ///
  /// In fr, this message translates to:
  /// **'Vous n\'avez pas de compte ?'**
  String get noAccount;

  /// No description provided for @alreadyAccount.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez déjà un compte ?'**
  String get alreadyAccount;

  /// No description provided for @changePassword.
  ///
  /// In fr, this message translates to:
  /// **'Changer le mot de passe'**
  String get changePassword;

  /// No description provided for @annonces.
  ///
  /// In fr, this message translates to:
  /// **'Annonces'**
  String get annonces;

  /// No description provided for @publish.
  ///
  /// In fr, this message translates to:
  /// **'Publier'**
  String get publish;

  /// No description provided for @profile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @favorites.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get favorites;

  /// No description provided for @searchAnnonces.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher'**
  String get searchAnnonces;

  /// No description provided for @filterAnnonces.
  ///
  /// In fr, this message translates to:
  /// **'Filtres'**
  String get filterAnnonces;

  /// No description provided for @applyFilters.
  ///
  /// In fr, this message translates to:
  /// **'Appliquer les filtres'**
  String get applyFilters;

  /// No description provided for @resetFilters.
  ///
  /// In fr, this message translates to:
  /// **'Réinitialiser'**
  String get resetFilters;

  /// No description provided for @breed.
  ///
  /// In fr, this message translates to:
  /// **'Race'**
  String get breed;

  /// No description provided for @region.
  ///
  /// In fr, this message translates to:
  /// **'Région'**
  String get region;

  /// No description provided for @price.
  ///
  /// In fr, this message translates to:
  /// **'Prix'**
  String get price;

  /// No description provided for @weight.
  ///
  /// In fr, this message translates to:
  /// **'Poids'**
  String get weight;

  /// No description provided for @gender.
  ///
  /// In fr, this message translates to:
  /// **'Genre'**
  String get gender;

  /// No description provided for @age.
  ///
  /// In fr, this message translates to:
  /// **'Âge'**
  String get age;

  /// No description provided for @male.
  ///
  /// In fr, this message translates to:
  /// **'Mâle'**
  String get male;

  /// No description provided for @female.
  ///
  /// In fr, this message translates to:
  /// **'Femelle'**
  String get female;

  /// No description provided for @all.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get all;

  /// No description provided for @deliveryAvailable.
  ///
  /// In fr, this message translates to:
  /// **'Livraison disponible'**
  String get deliveryAvailable;

  /// No description provided for @priceNegotiable.
  ///
  /// In fr, this message translates to:
  /// **'Prix négociable'**
  String get priceNegotiable;

  /// No description provided for @eligibleForAid.
  ///
  /// In fr, this message translates to:
  /// **'Éligible aux aides'**
  String get eligibleForAid;

  /// No description provided for @topLotOnly.
  ///
  /// In fr, this message translates to:
  /// **'Top Lot uniquement'**
  String get topLotOnly;

  /// No description provided for @noAnnoncesFound.
  ///
  /// In fr, this message translates to:
  /// **'Aucune annonce trouvée'**
  String get noAnnoncesFound;

  /// No description provided for @retry.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get retry;

  /// No description provided for @description.
  ///
  /// In fr, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @noDescription.
  ///
  /// In fr, this message translates to:
  /// **'Aucune description fournie.'**
  String get noDescription;

  /// No description provided for @location.
  ///
  /// In fr, this message translates to:
  /// **'Localisation'**
  String get location;

  /// No description provided for @delivery.
  ///
  /// In fr, this message translates to:
  /// **'Livraison'**
  String get delivery;

  /// No description provided for @boarding.
  ///
  /// In fr, this message translates to:
  /// **'Pension'**
  String get boarding;

  /// No description provided for @markAsSold.
  ///
  /// In fr, this message translates to:
  /// **'Marquer vendu'**
  String get markAsSold;

  /// No description provided for @suspend.
  ///
  /// In fr, this message translates to:
  /// **'Suspendre'**
  String get suspend;

  /// No description provided for @reactivate.
  ///
  /// In fr, this message translates to:
  /// **'Réactiver'**
  String get reactivate;

  /// No description provided for @promote.
  ///
  /// In fr, this message translates to:
  /// **'Promouvoir'**
  String get promote;

  /// No description provided for @deleteAnnonce.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer l\'annonce'**
  String get deleteAnnonce;

  /// No description provided for @confirmDelete.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer la suppression'**
  String get confirmDelete;

  /// No description provided for @irreversible.
  ///
  /// In fr, this message translates to:
  /// **'Cette action est irréversible.'**
  String get irreversible;

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer'**
  String get confirm;

  /// No description provided for @report.
  ///
  /// In fr, this message translates to:
  /// **'Signaler'**
  String get report;

  /// No description provided for @reportReason.
  ///
  /// In fr, this message translates to:
  /// **'Raison du signalement'**
  String get reportReason;

  /// No description provided for @reportComment.
  ///
  /// In fr, this message translates to:
  /// **'Commentaire (optionnel)'**
  String get reportComment;

  /// No description provided for @sendReport.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer le signalement'**
  String get sendReport;

  /// No description provided for @addFavorite.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter aux favoris'**
  String get addFavorite;

  /// No description provided for @removeFavorite.
  ///
  /// In fr, this message translates to:
  /// **'Retirer des favoris'**
  String get removeFavorite;

  /// No description provided for @fraudOrScam.
  ///
  /// In fr, this message translates to:
  /// **'Arnaque / Fraude'**
  String get fraudOrScam;

  /// No description provided for @wrongInformation.
  ///
  /// In fr, this message translates to:
  /// **'Informations incorrectes'**
  String get wrongInformation;

  /// No description provided for @unhealthyAnimal.
  ///
  /// In fr, this message translates to:
  /// **'Animal en mauvaise santé'**
  String get unhealthyAnimal;

  /// No description provided for @duplicate.
  ///
  /// In fr, this message translates to:
  /// **'Annonce en double'**
  String get duplicate;

  /// No description provided for @inappropriateMedia.
  ///
  /// In fr, this message translates to:
  /// **'Photos inappropriées'**
  String get inappropriateMedia;

  /// No description provided for @other.
  ///
  /// In fr, this message translates to:
  /// **'Autre'**
  String get other;

  /// No description provided for @sardi.
  ///
  /// In fr, this message translates to:
  /// **'Sardi'**
  String get sardi;

  /// No description provided for @timahdite.
  ///
  /// In fr, this message translates to:
  /// **'Timahdite'**
  String get timahdite;

  /// No description provided for @beniGuil.
  ///
  /// In fr, this message translates to:
  /// **'Béni Guil'**
  String get beniGuil;

  /// No description provided for @dokkali.
  ///
  /// In fr, this message translates to:
  /// **'Dokkali'**
  String get dokkali;

  /// No description provided for @rehami.
  ///
  /// In fr, this message translates to:
  /// **'Rehami'**
  String get rehami;

  /// No description provided for @boujaad.
  ///
  /// In fr, this message translates to:
  /// **'Boujaad'**
  String get boujaad;

  /// No description provided for @oulmesZaer.
  ///
  /// In fr, this message translates to:
  /// **'Oulmès-Zaër'**
  String get oulmesZaer;

  /// No description provided for @beniAhsen.
  ///
  /// In fr, this message translates to:
  /// **'Béni Ahsen'**
  String get beniAhsen;

  /// No description provided for @daMan.
  ///
  /// In fr, this message translates to:
  /// **'Da\'Man'**
  String get daMan;

  /// No description provided for @draa.
  ///
  /// In fr, this message translates to:
  /// **'Drâa'**
  String get draa;

  /// No description provided for @naineDeMontagne.
  ///
  /// In fr, this message translates to:
  /// **'Naine de montagne'**
  String get naineDeMontagne;

  /// No description provided for @chevreduRiff.
  ///
  /// In fr, this message translates to:
  /// **'Chèvre du Rif'**
  String get chevreduRiff;

  /// No description provided for @chevreDeLaayoune.
  ///
  /// In fr, this message translates to:
  /// **'Chèvre de Laâyoune'**
  String get chevreDeLaayoune;

  /// No description provided for @blondeDAquitaine.
  ///
  /// In fr, this message translates to:
  /// **'Blonde d\'Aquitaine'**
  String get blondeDAquitaine;

  /// No description provided for @frisonnePieNoire.
  ///
  /// In fr, this message translates to:
  /// **'Frisonne Pie Noire'**
  String get frisonnePieNoire;

  /// No description provided for @montbeliarde.
  ///
  /// In fr, this message translates to:
  /// **'Montbéliarde'**
  String get montbeliarde;

  /// No description provided for @bruneAtlas.
  ///
  /// In fr, this message translates to:
  /// **'Brune Atlas'**
  String get bruneAtlas;

  /// No description provided for @ougda.
  ///
  /// In fr, this message translates to:
  /// **'Ougda'**
  String get ougda;

  /// No description provided for @dromadaireSahraouii.
  ///
  /// In fr, this message translates to:
  /// **'Dromadaire Sahraoui'**
  String get dromadaireSahraouii;

  /// No description provided for @dromadaireGuelmim.
  ///
  /// In fr, this message translates to:
  /// **'Dromadaire Guelmim'**
  String get dromadaireGuelmim;

  /// No description provided for @barbe.
  ///
  /// In fr, this message translates to:
  /// **'Barbe'**
  String get barbe;

  /// No description provided for @arabeBarbe.
  ///
  /// In fr, this message translates to:
  /// **'Arabe-Barbe'**
  String get arabeBarbe;

  /// No description provided for @aneBeldi.
  ///
  /// In fr, this message translates to:
  /// **'Âne Beldi'**
  String get aneBeldi;

  /// No description provided for @mulet.
  ///
  /// In fr, this message translates to:
  /// **'Mulet'**
  String get mulet;

  /// No description provided for @regionTangerTetouanAlHoceima.
  ///
  /// In fr, this message translates to:
  /// **'Tanger-Tétouan-Al Hoceïma'**
  String get regionTangerTetouanAlHoceima;

  /// No description provided for @regionOriental.
  ///
  /// In fr, this message translates to:
  /// **'Oriental'**
  String get regionOriental;

  /// No description provided for @regionFesMeknes.
  ///
  /// In fr, this message translates to:
  /// **'Fès-Meknès'**
  String get regionFesMeknes;

  /// No description provided for @regionRabatSaleKenitra.
  ///
  /// In fr, this message translates to:
  /// **'Rabat-Salé-Kénitra'**
  String get regionRabatSaleKenitra;

  /// No description provided for @regionBeniMellalKhenifra.
  ///
  /// In fr, this message translates to:
  /// **'Béni Mellal-Khénifra'**
  String get regionBeniMellalKhenifra;

  /// No description provided for @regionCasablancaSettat.
  ///
  /// In fr, this message translates to:
  /// **'Casablanca-Settat'**
  String get regionCasablancaSettat;

  /// No description provided for @regionMarrakechSafi.
  ///
  /// In fr, this message translates to:
  /// **'Marrakech-Safi'**
  String get regionMarrakechSafi;

  /// No description provided for @regionDraaTafilalet.
  ///
  /// In fr, this message translates to:
  /// **'Drâa-Tafilalet'**
  String get regionDraaTafilalet;

  /// No description provided for @regionSoussMassa.
  ///
  /// In fr, this message translates to:
  /// **'Souss-Massa'**
  String get regionSoussMassa;

  /// No description provided for @regionGuelmimOuedNoun.
  ///
  /// In fr, this message translates to:
  /// **'Guelmim-Oued Noun'**
  String get regionGuelmimOuedNoun;

  /// No description provided for @regionLaayouneSakiaElHamra.
  ///
  /// In fr, this message translates to:
  /// **'Laâyoune-Sakia El Hamra'**
  String get regionLaayouneSakiaElHamra;

  /// No description provided for @regionDakhlaOuedEdDahab.
  ///
  /// In fr, this message translates to:
  /// **'Dakhla-Oued Ed-Dahab'**
  String get regionDakhlaOuedEdDahab;

  /// No description provided for @myAnnonces.
  ///
  /// In fr, this message translates to:
  /// **'Mes annonces'**
  String get myAnnonces;

  /// No description provided for @myFavorites.
  ///
  /// In fr, this message translates to:
  /// **'Mes favoris'**
  String get myFavorites;

  /// No description provided for @saveChanges.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer'**
  String get saveChanges;

  /// No description provided for @role.
  ///
  /// In fr, this message translates to:
  /// **'Rôle'**
  String get role;

  /// No description provided for @seller.
  ///
  /// In fr, this message translates to:
  /// **'Vendeur'**
  String get seller;

  /// No description provided for @buyer.
  ///
  /// In fr, this message translates to:
  /// **'Acheteur'**
  String get buyer;

  /// No description provided for @loading.
  ///
  /// In fr, this message translates to:
  /// **'Chargement...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In fr, this message translates to:
  /// **'Erreur'**
  String get error;

  /// No description provided for @success.
  ///
  /// In fr, this message translates to:
  /// **'Succès'**
  String get success;

  /// No description provided for @share.
  ///
  /// In fr, this message translates to:
  /// **'Partager'**
  String get share;

  /// No description provided for @contact.
  ///
  /// In fr, this message translates to:
  /// **'Contacter'**
  String get contact;

  /// No description provided for @mad.
  ///
  /// In fr, this message translates to:
  /// **'MAD'**
  String get mad;

  /// No description provided for @months.
  ///
  /// In fr, this message translates to:
  /// **'mois'**
  String get months;

  /// No description provided for @km.
  ///
  /// In fr, this message translates to:
  /// **'km'**
  String get km;

  /// No description provided for @fullNameOptional.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet (optionnel)'**
  String get fullNameOptional;

  /// No description provided for @verifiedCheck.
  ///
  /// In fr, this message translates to:
  /// **'Vérifié ✓'**
  String get verifiedCheck;

  /// No description provided for @logoutConfirm.
  ///
  /// In fr, this message translates to:
  /// **'Êtes-vous sûr de vouloir vous déconnecter ?'**
  String get logoutConfirm;

  /// No description provided for @reportAnnonce.
  ///
  /// In fr, this message translates to:
  /// **'Signaler l\'annonce'**
  String get reportAnnonce;

  /// No description provided for @viewMore.
  ///
  /// In fr, this message translates to:
  /// **'Voir plus...'**
  String get viewMore;

  /// No description provided for @viewLess.
  ///
  /// In fr, this message translates to:
  /// **'Voir moins'**
  String get viewLess;

  /// No description provided for @message.
  ///
  /// In fr, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @call.
  ///
  /// In fr, this message translates to:
  /// **'Appeler'**
  String get call;

  /// No description provided for @services.
  ///
  /// In fr, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @features.
  ///
  /// In fr, this message translates to:
  /// **'Caractéristiques'**
  String get features;

  /// No description provided for @address.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get address;

  /// No description provided for @distance.
  ///
  /// In fr, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @headCount.
  ///
  /// In fr, this message translates to:
  /// **'Nombre de têtes'**
  String get headCount;

  /// No description provided for @views.
  ///
  /// In fr, this message translates to:
  /// **'Vues'**
  String get views;

  /// No description provided for @statusSold.
  ///
  /// In fr, this message translates to:
  /// **'VENDU'**
  String get statusSold;

  /// No description provided for @statusSuspended.
  ///
  /// In fr, this message translates to:
  /// **'SUSPENDU'**
  String get statusSuspended;

  /// No description provided for @available.
  ///
  /// In fr, this message translates to:
  /// **'Disponible'**
  String get available;

  /// No description provided for @noServiceAvailable.
  ///
  /// In fr, this message translates to:
  /// **'Aucun service disponible'**
  String get noServiceAvailable;

  /// No description provided for @newAnnonce.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle annonce'**
  String get newAnnonce;

  /// No description provided for @photos.
  ///
  /// In fr, this message translates to:
  /// **'Photos'**
  String get photos;

  /// No description provided for @animal.
  ///
  /// In fr, this message translates to:
  /// **'L\'animal'**
  String get animal;

  /// No description provided for @priceDetails.
  ///
  /// In fr, this message translates to:
  /// **'Prix & Détails'**
  String get priceDetails;

  /// No description provided for @next.
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get next;

  /// No description provided for @back.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get back;

  /// No description provided for @camera.
  ///
  /// In fr, this message translates to:
  /// **'Appareil photo'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In fr, this message translates to:
  /// **'Galerie'**
  String get gallery;

  /// No description provided for @breedRequired.
  ///
  /// In fr, this message translates to:
  /// **'Race requise'**
  String get breedRequired;

  /// No description provided for @unspecified.
  ///
  /// In fr, this message translates to:
  /// **'Non précisé'**
  String get unspecified;

  /// No description provided for @select.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner'**
  String get select;

  /// No description provided for @onssaTag.
  ///
  /// In fr, this message translates to:
  /// **'N° tag ONSSA (optionnel)'**
  String get onssaTag;

  /// No description provided for @agriAidEligible.
  ///
  /// In fr, this message translates to:
  /// **'Éligible aide agricole'**
  String get agriAidEligible;

  /// No description provided for @title.
  ///
  /// In fr, this message translates to:
  /// **'Titre'**
  String get title;

  /// No description provided for @required.
  ///
  /// In fr, this message translates to:
  /// **'Requis'**
  String get required;

  /// No description provided for @deliveryPossible.
  ///
  /// In fr, this message translates to:
  /// **'Livraison possible'**
  String get deliveryPossible;

  /// No description provided for @deliveryFees.
  ///
  /// In fr, this message translates to:
  /// **'Frais de livraison'**
  String get deliveryFees;

  /// No description provided for @city.
  ///
  /// In fr, this message translates to:
  /// **'Ville'**
  String get city;

  /// No description provided for @preciseAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse précise'**
  String get preciseAddress;

  /// No description provided for @locateMe.
  ///
  /// In fr, this message translates to:
  /// **'Me géolocaliser'**
  String get locateMe;

  /// No description provided for @locationOk.
  ///
  /// In fr, this message translates to:
  /// **'Position OK'**
  String get locationOk;

  /// No description provided for @locationError.
  ///
  /// In fr, this message translates to:
  /// **'Erreur de localisation'**
  String get locationError;

  /// No description provided for @addAtLeastOnePhoto.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez ajouter au moins une photo'**
  String get addAtLeastOnePhoto;

  /// No description provided for @actionSuccess.
  ///
  /// In fr, this message translates to:
  /// **'Action effectuée avec succès ✅'**
  String get actionSuccess;

  /// No description provided for @reportSent.
  ///
  /// In fr, this message translates to:
  /// **'Signalement envoyé'**
  String get reportSent;

  /// No description provided for @noFavorites.
  ///
  /// In fr, this message translates to:
  /// **'Aucun favori'**
  String get noFavorites;

  /// No description provided for @createAnnonce.
  ///
  /// In fr, this message translates to:
  /// **'Créer une annonce'**
  String get createAnnonce;

  /// No description provided for @sellerLabel.
  ///
  /// In fr, this message translates to:
  /// **'Vendeur'**
  String get sellerLabel;

  /// No description provided for @justNow.
  ///
  /// In fr, this message translates to:
  /// **'À l\'instant'**
  String get justNow;

  /// No description provided for @minutesAgo.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {count} min'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {count} h'**
  String hoursAgo(int count);

  /// No description provided for @daysAgo.
  ///
  /// In fr, this message translates to:
  /// **'Il y a {count} j'**
  String daysAgo(int count);

  /// No description provided for @language.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get language;

  /// No description provided for @french.
  ///
  /// In fr, this message translates to:
  /// **'Français'**
  String get french;

  /// No description provided for @arabic.
  ///
  /// In fr, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In fr, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @tamazight.
  ///
  /// In fr, this message translates to:
  /// **'Tamazight'**
  String get tamazight;

  /// No description provided for @fixedPrice.
  ///
  /// In fr, this message translates to:
  /// **'Prix fixe'**
  String get fixedPrice;

  /// No description provided for @perHead.
  ///
  /// In fr, this message translates to:
  /// **'Par tête'**
  String get perHead;

  /// No description provided for @perKg.
  ///
  /// In fr, this message translates to:
  /// **'Par kg'**
  String get perKg;

  /// No description provided for @milkTeeth.
  ///
  /// In fr, this message translates to:
  /// **'Dents de lait'**
  String get milkTeeth;

  /// No description provided for @twoTeeth.
  ///
  /// In fr, this message translates to:
  /// **'2 dents'**
  String get twoTeeth;

  /// No description provided for @fourTeeth.
  ///
  /// In fr, this message translates to:
  /// **'4 dents'**
  String get fourTeeth;

  /// No description provided for @sixTeeth.
  ///
  /// In fr, this message translates to:
  /// **'6 dents'**
  String get sixTeeth;

  /// No description provided for @fullMouth.
  ///
  /// In fr, this message translates to:
  /// **'Bouche complète'**
  String get fullMouth;

  /// No description provided for @phoneRequired.
  ///
  /// In fr, this message translates to:
  /// **'Le numéro de téléphone est requis'**
  String get phoneRequired;

  /// No description provided for @invalidPhone.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de téléphone invalide'**
  String get invalidPhone;

  /// No description provided for @passwordRequired.
  ///
  /// In fr, this message translates to:
  /// **'Le mot de passe est requis'**
  String get passwordRequired;

  /// No description provided for @deletionQuestion.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer l\'annonce ?'**
  String get deletionQuestion;

  /// No description provided for @promoteTopLot.
  ///
  /// In fr, this message translates to:
  /// **'Promouvoir (Top Lot)'**
  String get promoteTopLot;

  /// No description provided for @topLot.
  ///
  /// In fr, this message translates to:
  /// **'TOP LOT'**
  String get topLot;

  /// No description provided for @min.
  ///
  /// In fr, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @max.
  ///
  /// In fr, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @suspended.
  ///
  /// In fr, this message translates to:
  /// **'Suspendu'**
  String get suspended;

  /// No description provided for @sold.
  ///
  /// In fr, this message translates to:
  /// **'Vendu'**
  String get sold;

  /// No description provided for @edit_annonce.
  ///
  /// In fr, this message translates to:
  /// **'Modifier l\'annonce'**
  String get edit_annonce;

  /// No description provided for @characteristics.
  ///
  /// In fr, this message translates to:
  /// **'Caractéristiques'**
  String get characteristics;

  /// No description provided for @weight_kg.
  ///
  /// In fr, this message translates to:
  /// **'Poids (kg)'**
  String get weight_kg;

  /// No description provided for @dentition.
  ///
  /// In fr, this message translates to:
  /// **'Dentition'**
  String get dentition;

  /// No description provided for @onssa.
  ///
  /// In fr, this message translates to:
  /// **'ONSSA'**
  String get onssa;

  /// No description provided for @options.
  ///
  /// In fr, this message translates to:
  /// **'Options'**
  String get options;

  /// No description provided for @heads.
  ///
  /// In fr, this message translates to:
  /// **'têtes'**
  String get heads;

  /// No description provided for @kg.
  ///
  /// In fr, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @step_details.
  ///
  /// In fr, this message translates to:
  /// **'Prix & Détails'**
  String get step_details;

  /// No description provided for @see_less.
  ///
  /// In fr, this message translates to:
  /// **'Voir moins'**
  String get see_less;

  /// No description provided for @optional_comment.
  ///
  /// In fr, this message translates to:
  /// **'Commentaire (optionnel)'**
  String get optional_comment;

  /// No description provided for @step_animal.
  ///
  /// In fr, this message translates to:
  /// **'L\'animal'**
  String get step_animal;

  /// No description provided for @see_more.
  ///
  /// In fr, this message translates to:
  /// **'Voir plus'**
  String get see_more;

  /// No description provided for @step_photos.
  ///
  /// In fr, this message translates to:
  /// **'Photos'**
  String get step_photos;

  /// No description provided for @step_location.
  ///
  /// In fr, this message translates to:
  /// **'Localisation'**
  String get step_location;

  /// No description provided for @not_specified.
  ///
  /// In fr, this message translates to:
  /// **'Non spécifié'**
  String get not_specified;

  /// No description provided for @age_months.
  ///
  /// In fr, this message translates to:
  /// **'Âge (mois)'**
  String get age_months;

  /// No description provided for @position_ok.
  ///
  /// In fr, this message translates to:
  /// **'Position OK'**
  String get position_ok;

  /// No description provided for @geolocate_me.
  ///
  /// In fr, this message translates to:
  /// **'Me géolocaliser'**
  String get geolocate_me;

  /// No description provided for @connectToAccount.
  ///
  /// In fr, this message translates to:
  /// **'Connectez-vous à votre compte'**
  String get connectToAccount;

  /// No description provided for @passwordMismatch.
  ///
  /// In fr, this message translates to:
  /// **'Les mots de passe ne correspondent pas'**
  String get passwordMismatch;

  /// No description provided for @passwordMinLength.
  ///
  /// In fr, this message translates to:
  /// **'6 caractères minimum'**
  String get passwordMinLength;

  /// No description provided for @regionOptional.
  ///
  /// In fr, this message translates to:
  /// **'Région (optionnelle)'**
  String get regionOptional;

  /// No description provided for @noMyAnnonces.
  ///
  /// In fr, this message translates to:
  /// **'Vous n\'avez pas encore d\'annonces'**
  String get noMyAnnonces;

  /// No description provided for @user.
  ///
  /// In fr, this message translates to:
  /// **'Utilisateur'**
  String get user;

  /// No description provided for @notVerified.
  ///
  /// In fr, this message translates to:
  /// **'Non vérifié'**
  String get notVerified;

  /// No description provided for @myAlerts.
  ///
  /// In fr, this message translates to:
  /// **'Mes alertes'**
  String get myAlerts;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

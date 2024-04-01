class Api {
  // BASE URL
  static const baseUrlApi = "http://10.0.2.2:8000/api";
  static const baseUrl = "http://10.0.2.2:8000";

  // Security
  static const login = "/demarcheurs/login";
  static const register = "/demarcheurs/register";
  static const pays = "/pays/all";
  static const villeByPays = "/villes/all_by_pays";
  static const typeAnnonce = "/type_annonces/all";
  static const categories = "/categories/all";

  static const updateInformation = '/demarcheurs/updated_informations';
  static const updatePassword = '/demarcheurs/updated_password';
  static const deleteAccount = '/demarcheurs/delete_account';

  // Annonce
  static const totalPublicationByDemarcheur =
      '/annonces/total_publication_by_demarcheur';
  static const addAnnonce = "/annonces/add";
  static const recentsPublications =
      "/annonces/recent_publication_by_demarcheur";
  static const deleteAnnonce = "/annonces/delete_annonce";
  static const annonceByCategorie = "/annonces/annonces_by_categorie";
  static const annonceSimulaireByCategorie =
      "/annonces/annonce_simulaire_by_categorie";
  static const annoncesByDemarcheur = "/annonces/annonces_by_demarcheur";
  static const annonceByLimite = '/annonces/annonces_by_limite';
}

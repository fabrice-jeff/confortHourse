class Api {
  static const baseUrl = "http://10.0.2.2:8000/api";
  // Security
  static const login = "/demarcheurs/login";
  static const register = "/demarcheurs/register";
  static const pays = "/pays/all";
  static const villeByPays = "/villes/all_by_pays";
  static const typeAnnonce = "/type_annonces/all";
  static const categories = "/categories/all";
  static const villes = "/villes/all";
  static const addAnnonce = "/annonces/add";
  static const annonceByCategorie = "/annonces/annonces_by_categorie";
  static const otherAnnonceByCategorie =
      "/annonces/other_annonces_by_categorie";
  static const annonceByLimite = '/annonces/annonces_by_limite';
  static const updateInformation = '/demarcheurs/updated_informations';
  static const updatePassword = '/demarcheurs/updated_password';
  static const deleteAccount = '/demarcheurs/delete_account';
}

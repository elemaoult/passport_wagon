class Passport < ApplicationRecord
  belongs_to :user
  VACCINS = ["Pfizer", "Moderna", "Astrazeneca", "Johnson&Johnson", "Sinopharm", "Cuba Libre"]
  COUNTRIES = ["Albanie", "Andorre", "Islande", "Israël", "Liechtenstein", "Monaco", "Maroc", "Norvège", "Panama", "Suisse", "Turquie", "Ukraine", "Vatican", "Tchèque", "Suède", "Slovénie", "Slovaquie", "Roumanie", "Portugal", "Pologne", "Pays-Bas", "Malte", "Luxembourg", "Lituanie", "Lettonie", "Italie", "France", "Irlande", "Hongrie", "Grèce", "France", "Finlande", "Estonie", "Espagne", "Danemark", "Croatie", "Chypre", "Bulgarie", "Belgique", "Autriche", "Allemagne" ]
end



require 'rubygems'

require 'nokogiri'

require 'open-uri'


  def get_the_email # définition d'une méthode qui scrappe les emails 
  
    emails_mairie = {} # initialisation de la liste emails_mairie

    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")) #scrapping

    lien_url = page.css("a").select{|link| link['class'] == "lientxt"} # recuperation des données (avec css dela page)

    lien_url.each{|link|

    url = "http://annuaire-des-mairies.com#{link['href'] }" # l'objet parent duquel nous allons extraire l'objet child

    link.each {|adressemail|

    page = Nokogiri::HTML(open(url))   #meme procédé pour l'url)

    e_mail = page.css("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text   #bien vérifier la correspondance de l'élément avec son code css!!

    emails_mairie.merge!(lien: url, email: e_mail) # matcher les chaque url avec son email
    }

  puts emails_mairie # afficher la liste
  }
end

  get_the_email # appel de la methode



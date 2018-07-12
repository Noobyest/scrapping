require 'rubygems'

require 'nokogiri'

require 'open-uri'


  def get_the_email
  
    emails_mairie = {}

    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

    lien_url = page.css("a").select{|link| link['class'] == "lientxt"}

    lien_url.each{|link|

    url = "http://annuaire-des-mairies.com#{link['href'] }"

    link.each {|adressemail|

    page = Nokogiri::HTML(open(url))

    e_mail = page.css("/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]").text

    emails_mairie.merge!(lien: url, email: e_mail)
    }
  puts emails_mairie
  }
end

  get_the_email



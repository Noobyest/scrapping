require 'rubygems'

require 'nokogiri'

require 'open-uri'




      
      def get_the_email
         page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
         page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
         puts node.text
         end

      end

      get_the_email



      def get_all_the_urls
         page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
         page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
          puts node.text
         end

      end

      get_all_the_urls


      def liste_emails
        page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
        page.css('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
        puts node.text
        end
     end

      liste_emails
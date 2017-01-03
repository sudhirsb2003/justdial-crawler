require 'csv'
class Website < ApplicationRecord

	def self.justdial(url)
		50.times do |n|
			new_url = url+"?page=#{n+1}"
			page = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (Windows NT 6.0; rv:12.0) Gecko/20100101 Firefox/12.0 FirePHP/0.7.1"))
			rows = page.css("div.store-details")
			if rows.empty?
			else
				rows.each_with_index do |row, index| 
					title =  row.css("h4.store-name").text.strip
					contact = row.css("p.contact-info").children[1].text.strip if row.css("p.contact-info").children[1] 
					address = row.css("p.address-info").css('span.desk-add').children.css('span.mrehover').text.strip
					tags = row.css('span.addrinftxt').css('a').css('a').text.strip
					if self.client_exists?(contact)
					else
						w = Website.new
						w.name = title
						w.website_name = 'JustDial'
						w.contact = contact
						w.address = address
						w.tags = tags
						w.save
					end
				end
			end
		end
	end


	def self.client_exists?(contact)
		Website.where(contact: contact).first.present?
	end


  def self.to_csv
    attributes = %w{website_name name contact address tags}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end


end
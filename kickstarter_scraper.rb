require 'nokogiri'

def get_data
  #require 'nokogiri'
  html = File.read('fixtures/kickstarter.html')
  doc = Nokogiri::HTML(html)
  projects = doc.css(".project-card")
  projects
end

def create_project_hash
  :projects = {}
  get_data.each do |project|
    title = project.css(".bbcard_name a").text.strip
    image = project.css(".project-thumbnail img").attribute('src').value
    description = project.css(".bbcard_blurb").text.strip
    location = project.css(".project-meta a").attribute("data-location").value.scan(/\w+, \w\w/).first
    funded = project.css(".project-stats li:first-child").children.children.text.to_i

    :projects[title] = {
      :location => location,
      :image_link => image,
      :description => description,
      :location => location,
      :percent_funded => funded
    }
    end
    :projects
end


# title: titles point to a hash of info
#           first.css(".bbcard_name a").text.strip
# image: image link hosted on AmazonAWS
#           first.css(".project-thumbnail img").attribute('src').value
# description: a string
#           first.css(".bbcard_blurb").text.strip
# location: a string
#           first.css(".project-meta a").attribute("data-location").value.scan(/\w+, \w\w/).first
# percent funded: integer
#           first.css(".project-stats li:first-child").children.children.text.to_i
# collect this information for each project and build a hash for each project

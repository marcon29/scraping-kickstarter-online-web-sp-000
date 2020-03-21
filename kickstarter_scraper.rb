require 'nokogiri'

def create_project_hash

end

def get_data
  html = File.read('fixtures/kickstarter.html')
  doc = Nokogiri::HTML(html)
  projects = doc.css(".project-card")
  projects
end

# title: titles point to a hash of info
# image: image link hosted on AmazonAWS
# description: a string
# location: a string
# percent funded: integer

# collect this information for each project and build a hash for each project
puts get_data[0]

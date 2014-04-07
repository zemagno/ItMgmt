module Docable
  
  def docs_to_url(doc)
    @URLs = []
	   if doc != nil then 
	        doc.split(',').each do |d|
            tupla = []
	      	    d.split('|').each do |i|
                tupla << i
              end
            @URLs << tupla
          end
	   end
	@URLs
  end
end

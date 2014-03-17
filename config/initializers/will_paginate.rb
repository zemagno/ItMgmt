# acho que criei isso aqui para ter compatibilidade com um 
# modulo que é incompativel com WillPaginate
if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        alias_method :per, :per_page
        alias_method :num_pages, :total_pages
      end
    end
  end
end

module ActiveRecord
  class Relation
    alias_method :total_count, :count
  end
end
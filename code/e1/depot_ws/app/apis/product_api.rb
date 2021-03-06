#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class ProductApi < ActionWebService::API::Base
  api_method :find_all_products,
             :returns => [[:int]]
  api_method :find_product_by_id,
             :expects => [:int],
             :returns => [Product]
end

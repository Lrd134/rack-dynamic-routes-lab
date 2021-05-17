class Application

    @@items = [Item.new("Figs", 0.49), Item.new("Brussels", 1.45)]

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
    #   item_searched_for = req.params["lt"]
    if !req.path.include?("items")
      resp.write "Route not found"
      resp.status = 404
    end
      found = false
      found_item = nil
      searched = req.path.delete_prefix("/items/")
      searched = searched.delete_prefix("/")
      @@items.each do | m |
          
           if m.name == searched
            found = true
            found_item = m
           end
      end     
      if found
        resp.write found_item.price
      end
      if !found && req.path.include?("items")
      resp.write "Item not found"
      resp.status = 400
      end


    #   if @@item.include?(item_searched_for)
    #     if req.path.match(/items/)
    #         item_searched_for = req.params["lt"]
    #         resp.write 
    #     else
    #         resp.status = 404
    #         resp.write "Route not found"
    #     end
    #   end
      resp.finish
    end
  end 
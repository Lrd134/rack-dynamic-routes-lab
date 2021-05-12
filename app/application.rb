class Application


    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
      item_searched_for = req.params["lt"]
      if req.path.match(/items\/#{item_searched_for}/)
        item_searched_for = req.params["lt"]
  
      resp.finish
    end
  end 